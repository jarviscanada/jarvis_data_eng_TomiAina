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
hostname=$(hostname -f)
lscpu_out=$(lscpu)

#Retrieve hardware specification variables
#xargs is a trick to trim leading and trailing white spaces
hostname=$(hostname -f)
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out"  | egrep "Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(lscpu  | egrep "Model:" | awk '{print $2}'| xargs)
cpu_mhz=$(echo "$lscpu_out"  | egrep "CPU MHz:" | awk '{print $3}'|xargs)
l2_cache=$(echo "$lscpu_out"  | egrep "L2 cache:" | awk '{print $3+0}'|xargs)
timestamp=$(date +%Y-%m-%d\ %H\:%M\:%S\.%3N)
total_mem=$(cat /proc/meminfo | head -1 |awk '{print $2}')

#Subquery to find matching id in host_info table
host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";

#PSQL command: Inserts server usage data into host_usage table
#Note: be careful with double and single quotes
set_insert_data=$(cat <<-END
INSERT into host_info (hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, L2_cache, "timestamp", total_mem)  values  ( '${hostname}', ${cpu_number}, '${cpu_architecture}', '${cpu_model}', ${cpu_mhz}, ${l2_cache}, '${timestamp}', ${total_mem} );
END
)
#set up env var for pql cmd
export PGPASSWORD=$psql_password
#Insert date into a database
psql -h localhost -p 5432 -U postgres -d host_agent -c "$set_insert_data"
exit $?
