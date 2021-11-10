#!/bin/bash
#Setup and validate arguments (again, don't copy comments)
psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5
#Check # of args
if [ $# -ne 5 ]; then
  echo 'Please check that all arguments are correct'
  exit 1
fi

#Save machine statistics in MB and current machine hostname to variables
vmstat_mb=$(vmstat --unit M)
hostname=$(hostname -f)

#Retrieve hardware specification variables
#xargs is a trick to trim leading and trailing white spaces
hostname=$(hostname -f)
timestamp=$(date +%Y-%m-%d\ %H\:%M\:%S\.%3N)
memory_free=$(echo "$vmstat_mb" | awk '{print $4}'| tail -n1 | xargs)
cpu_idle=$(echo "$vmstat_mb" | awk '{print $15}'| tail -n1 | xargs)
cpu_kernel=$(echo "$vmstat_mb" | awk '{print $12}'| tail -n1 | xargs)
disk_io=$(vmstat -d | awk '{print $10}'|tail -n1|xargs)
disk_available1=$(df -BM / |awk '{for(i=NF;i>0;i--)if($i=="Available"){x=i;break}}END{print $x}' | xargs)
disk_available=${disk_available1//[^[:digit:].-]/}

#Subquery to find matching id in host_info table
host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";

#PSQL command: Inserts server usage data into host_usage table
#Note: be careful with double and single quotes
set_insert_data=$(cat <<-END
INSERT into host_usage (timestamp, host_id,memory_free,cpu_idle,cpu_kernel,disk_io,disk_available ) VALUES ('$timestamp',(SELECT id FROM host_info WHERE hostname='$hostname'), $memory_free,  $cpu_idle,  $cpu_kernel, $disk_io, $disk_available) ;
END
)
#set up env var for pql cmd
export PGPASSWORD=$psql_password
#Insert date into a database
psql -h localhost -p 5432 -U postgres -d host_agent -c "$set_insert_data"
exit $?
