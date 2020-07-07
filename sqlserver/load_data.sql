CREATE DATABASE app_db;
GO
USE app_db;
GO

CREATE TABLE iris (
Sepal_Length numeric(10,5), 
Sepal_Width numeric(10,5), 
Petal_Length numeric(10,5), 
Petal_Width numeric(10,5), 
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

UPDATE iris
SET Species = REPLACE(Species, CHAR(34), '')
