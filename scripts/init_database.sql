/*
===================================================================================
- Check for duplicate Database
- Create New Database (if it does not exist yet)
- Create Schemas
===================================================================================
Script Purpose:
    The script creates a new database after checking if it already exists. If it does exist, the old database will be dropped and replaces by the new one.
    After that, three Schemas will be created: 'bronze', 'silver', 'gold'.

WARNING:
    Running the script will dropped the entire 'DataWarehouse^ database, if it already exists.
    All the data in the database will be permanently deleted.
    Proceed with caution and make sure you have a backuo script.
*/


USE master;
GO

-- Drop and recreate the "DataWarehouse" database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
