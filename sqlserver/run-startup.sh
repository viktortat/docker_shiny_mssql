# Wait a little to ensure the server has booted up
sleep 10s

#run sql script to create database and load data
sqlcmd -S localhost -U sa -P MyPassword123! -d master -i /usr/src/app/load_data.sql