CREATE DATABASE app_db;
GO
USE app_db;
GO

CREATE TABLE iris (Sepal_Length NCHAR(3), 
Sepal_Width NCHAR(3),
Petal_Length NCHAR(3),
Petal_Width NCHAR(3),
Species VARCHAR(20));
GO

BULK INSERT iris
FROM '/usr/src/app/iris.csv'
WITH
(  FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',  
    TABLOCK
)
GO