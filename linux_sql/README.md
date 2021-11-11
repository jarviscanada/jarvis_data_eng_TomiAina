# Design and Implementation of an MVP for a Linux Cluster Team 

# Introduction
The project aims to design and implement a Minimum Viable Product (MVP) to help the Jarvis Linux Cluster Administration (LCA) team meet their requirements. The LCA team manages the Linux cluster of 10 servers running on CentOS 7.  
The team needs to store hardware specifications of each server/node and monitor resource usage (e.g. CPU usage) in real-time. The data should be stored in an RDBMS database (PostgreSQL) which can be used for reporting and, in the future, resource planning.

The goal is achieved by incorporating the following technologies:
1. **Git**:  To set up the project directory, manage the source codes and ensure collaboration.
2. **docker**:  To provision or set up the PSQL.
3. **Bash**:  To obtain hardware information and resource usage from the server using command lines and scripts.  In addition, bash scripts are also used to automate the initialization of the PSQL database and collection of data (using monitoring agent programs).

# Quick Start
This section gives a quick step-by-step overview of how the project works. The following prerequisites are necessary to complete the project:

- [ ] Create a VM instance on Google Cloud Platform or any other platform of your choice
- [ ] Install docker

Then you are good to go!

1. Start a PSQL instance using psql_docker.sh:

Create the psql_docker.sh script that can set up the PSQLinstance using docker. The script should be able to start, stop or create a container with a username and password.
The script can be used by using the code below:
````
./scripts/psql_docker.sh start|stop|create [db_username][db_password]
````
2. Create tables using ddl.sql:

The ddl.sql should automate the initialization of the database using the code:
````
psql -h localhost -U postgres -d host_agent -f sql/ddl.sql
````

3. Insert hardware specs data into the DB using host_info.sh
````
./scripts/host_info.sh psql_host psql_port db_name psql_user psql_password
````

4. Insert hardware usage data into the DB using host_usage.sh
````
./scripts/host_usage.sh psql_host psql_port db_name psql_user psql_password
````

5. Crontab setup
````
crontab -e

#add this to crontab
* * * * * bash <path of dierectory>/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log

#list crontab jobs
crontab -l
````

# Implemenation
In implementing this project, the PSQL instance is set up using docker. It is done by creating a PSQL docker container with a username and password. The script used to create this instance should start, stop or create the PSQL docker container.
Once this is done, it is essential to automate the initialization of the database where data of hardware specifications and resource usage will be stored.
After this, a monitoring agent program (contains host_usage and host_info scripts) collects the data stored in the database.
Now that the database contains all the necessary data, SQL queries can then be used to get the LCA team's in-depth information (answer the business questions).

## Architecture
![This is an image](C:\Users\User\Downloads\Architecture.drawio.png)

##Scripts
This section gives a brief description of the scripts and code for usage:
1. **psql_docker.sh**: This script can automatically perform three main functions:

    - Create a PSQL docker with a given username and password
    ````
    ./scripts/psql_docker.sh create [db_username] [db_password]
    ```` 
    - start the PSQL container
    ```
    ./scripts/psql_docker.sh start <name of container>
    ```` 
    - Stop the PSQL container
    ```
    ./scripts/psql_docker.sh stop <name of container>
    ```` 
It prints error messages if the container is already created or not.

2. **host_info.sh**: This script uses commands to obtain hardware specification data and stores it in the PSQL instance. The script can be used:
    ````
   ./scripts/host_info.sh psql_host psql_port db_name psql_user psql_password
    ```` 
3. **host_usage.sh**: This scripts collect server usage data and store it in the PSQL instance. The script can be used:
    ````
   ./scripts/host_usage.sh psql_host psql_port db_name psql_user psql_password
    ````
4. **crontab**: It automates the execution of host_usage.sh every minute to collect data continuously.
    ````
    crontab -e
    #add this to crontab script
    * * * * * bash <path of dierectory>/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log
    #list crontab jobs
    crontab -l
    ````
5. **queries.sql**: This script contains SQL queries used to solve the LCA team's questions to ensure the cluster is managed efficiently and plans for the future.
   The team's first information is to group the hosts in the clusters by cpu_number, host identification, and total memory. The grouping should be done in descending order.
   The second information required is the average used memory in percentage over a 5-minute interval for each host. However, it was discovered that the crontab might fail to insert a new entry every minute. Therefore, the LCA team was required to detect host failures with less than three data points within the 5-minute interval.

## Database Modeling
In this section, the schema of the host_info and the host_info is described.

**Table: host_info**

| Column | Type| Description |
| :---: |  :---:|:---:|
| id   | `SERIAL`     | It identifies the host in the cluster    |
| host_name     | `VARCHAR`       | It is the name of the host       |
| cpu_number   | `INT`     | It shows the number of CPU's     |
| cpu_architecture    |  `VARCHAR`      | It is the basic instruction set. It describes the capabilities of the CPPU       |
| cpu_model   | `INT`     | It shows the model of the CPU    |
| cpu_mhz | `INT`     | It shows the speed of the CPU     |
| L2_cache     | `VARCHAR`       | It is a Level 2 CPU cache memory      |
| total_mem   | `INT`     | It is the total installed memory in KB   |
| "timestamp"     | `TIMESTAMP`      | It is the current time in UTC zone |

**Table: host_usage**

| Column (Parameter) | Type| Description |
| :---: |  :---:|:---:|
| "timestamp"     | `TIMESTAMP`      | It is the current time in the UTC zone that the data was collected|
| id   | `SERIAL`     | It identifies the host in the cluster   |
| host_name     | `VARCHAR`       | It is the name of the host       |
| memory_free   | `INT`     |It shows the memory that is currently not used in MB    |
| cpu_idle    |  `INT`      | It is the percentage of kernel not in use     |
| cpu_kernel   | `INT`     | It is the percentage of the CPU kernel    |
| disk_io     | `INT`       | It shows the number of disk I/O     |
| disk_available    | `INT`     | It is the root directory available.    |

# Test
The bash scripts were tested manually  running the commands described in the Scripts section to perform the required task and display error messages.
The SQL Queries were tested by observing the result obtained if it corresponds with the required or target output.

# Deployment
The codes used in this project were pushed to Github for review and collaboration.
The monitoring agent was scheduled using <crontab> while the Database was provisioned using Docker. 

# Improvements
The following are parts of the projects to be improved.
- Write a script to ensure that the
- blah
- blah