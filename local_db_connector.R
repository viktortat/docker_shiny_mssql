#load odbc package
library(odbc)

#create connection to master database
con <- dbConnect(odbc(), Driver="SQL Server", Server="localhost", UID="SA", PWD="MyPassword123!", Database="master", port=1434)

#print out connection
print(con)

#check databases in existence 
dbGetQuery(con, "SELECT name, database_id, create_date FROM sys.databases")

#create new database
dbGetQuery(con, "CREATE DATABASE test_db")
