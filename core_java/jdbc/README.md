#JDBC App

# Introduction
The Java Database Connectivity  (JDBC) app is an API that allows a client have access to a database.
This access allows the client to manipulate PostgresSQL using the CRUD operations.
The Data Access Object (DAO) design pattern used in the app and a JDBC driver was used to create a connection that enables the execution of SQL queries.
Other technologies such as PSQL, maven, docker were used in developing the app.
# Implementation 
## ER Diagram
![Image](jarvis_data_eng_TomiAina/core_java/jdbc/assets/ER Diagram.png)

## Design Patterns
The DAO provides abstraction between JDBC and the code (business logic). It can be a true abstraction or a true object. It uses a Data Transfer Object (DTO) with DAO in most cases.
It leverages a common interface, and its implementation reacts on a single-data domain. It can support single or multiple tables. When it supports a single table, it is then known as the Repository Design pattern. For example, the ``CustomerDAO``, as shown on this app, is an example of a repository pattern since it focuses on a single-table access per class (Customer Data).
In the repository pattern, joining is done in the code, whereas DAO is done in the database. It was observed with the ``OrderDAO`` where multiple tables were joined in the database.

The repository pattern design is preferred if the application is database constrained and horizontally scalable, whereas the DAO is preferred when data is highly normalized and the atomic transaction is required across data tables.

# Test
The app was tested by comparing results obtained by manually running DAO on the IntelliJ IDE with results obtained by running SQL queries in the psql client (Postgres interactive terminal).
The Postgres database (provisioned by docker) was created by executing some SQL files ( as shown in ER Diagram above) using psql commands. 


