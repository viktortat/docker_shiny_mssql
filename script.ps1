#get docker version
docker --version

#get docker-compose version
docker-compose --version

#pull the r base image from docker hub
docker pull rocker/r-base

#running the container in interactive mode through the terminal
docker run --rm -t -i rocker/r-base 

#getting an R shiny image
docker pull rocker/shiny-verse

#running the shiny server
docker run --name shiny_container --rm -d -p 3838:3838 rocker/shiny-verse

#check which containers are running
docker container ls  

#build image from Dockerfile - Shiny server plus app
docker build -t shiny_app .

#run image with app
docker run --name shiny_container --rm -d -p 3838:3838 shiny_app


#pull image for SQL Server
docker pull mcr.microsoft.com/mssql/server:2017-latest-ubuntu

#do a test run of the image
docker run --rm --name sql-server -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=MyPassword123!' -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu

#build sql image
docker build -t sql-server -f Dockerfile_sql .

#run sql image
docker run --rm --name sql-server -d -p 1433:1433 sql-server

#shell into sql container
docker exec -it sql-server bash

#log on to database
sqlcmd -S localhost -U sa -P MyPassword123! -d master

#build R/Shiny image
docker build -t shiny_app -f Dockerfile_R .

#run R/Shiny image
docker run --rm --name R-container -d -p 3838:3838 shiny_app

#check R is running
docker exec -it R-container R

#run compose script to spin up all containers
docker-compose up -d

#read out logs
docker logs R-container -f

#finish off by bringing down the containers
docker-compose down