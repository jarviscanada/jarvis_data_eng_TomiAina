#Setup and validate arguments (again, don't copy comments)
psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

#Check # of args
if [ $# -ne 5]; then
  echo 'Please check that all arguments are correct'
  exit 1
fi

#Save machine statistics in MB and current machine hostname to variables
vmstat_mb=$(vmstat --unit M)
hostname=$(hostname -f)
lscpu_out=$(lscpu)

#Retrieve hardware specification variables
#xargs is a trick to trim leading and trailing white spaces
hostname=$(hostname -f)
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out"  | egrep "Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out"  | egrep "Model name:" | awk '{print $3}''{print $4}''{print $5}''{print $6}''{print $7}''{print $8}' | xargs)cleac
cpu_mhz=$(echo "$lscpu_out"  | egrep "CPU MHz:" | awk '{print $3}'|xargs)
l2_cache=$(echo "$lscpu_out"  | egrep "L2 cache:" | awk '{print $3}'|xargs)
total_mem= $(cat /proc/meminfo | grep MemTotal|awk '{print $2}'|xargs)

#Current time in `2019-11-26 14:40:19` UTC format
timestamp=  $(vmstat -t|awk '{print $18}'|tail -n1| xargs)

#Subquery to find matching id in host_info table
host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";
cpu_number= "(SELECT cpu_number FROM host_info WHERE cpu_number= '$cpu_number')";
cpu_architecture= "(SELECT cpu_architecture FROM host_info WHERE cpu_number = '$cpu_architecture')";
cpu_model= "(SELECT cpu_model FROM host_info WHERE cpu_model= '$cpu_model')";
cpu_mhz= "(SELECT cpu_mhz FROM host_info WHERE cpu_mhz = '$cpu_mhz')";
l2_cache= "(SELECT l2_cache FROM host_info WHERE l2_cache = '$l2_cache')";
total_mem= "(SELECT total_mem FROM host_info WHERE total_mem = '$total_mem')";

#PSQL command: Inserts server usage data into host_usage table
#Note: be careful with double and single quotes
insert_stmt="INSERT INTO host_usage(timestamp, cpu_number,cpu_model,cpu_mhz,l2_cache,total_mem) VALUES('$timestamp', '$cpu_number','$cpu_model','$cpu_mhz','$l2_cache','$total_mem')"

#set up env var for pql cmd
export PGPASSWORD=$psql_password
#Insert date into a database
psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"
exit $?
