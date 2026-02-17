
--Task 1: Create a New Pluggable Database

-- Create Pluggable Database
CREATE PLUGGABLE DATABASE fr_pdb_28745
ADMIN USER pdbadmin IDENTIFIED BY m2027
FILE_NAME_CONVERT = ('pdbseed', 'fr_pdb_28745');

-- Open Pluggable Database

ALTER PLUGGABLE DATABASE fr_pdb_28745 OPEN;

-- check status
SHOW PDBS;

-- Switch to pdb
ALTER SESSION SET CONTAINER = fr_pdb_28745;

-- check current container
SHOW CON_NAME;

--Create user in PDB
CREATE USER frank_plsqlauca_28745
IDENTIFIED BY m2027;

-- Grant privileges to user
GRANT CONNECT, RESOURCE TO frank_plsqlauca_28745;
-- Check if user is created
SELECT username FROM dba_users WHERE username = 'FRANK_PLSQLAUCA_28745';

--Connect to PDB using SQL*Plus
sqlplus frank_plsqlauca_28745/m2027@fr_pdb_28745

--Task 2: Create and Delete a PDB

CREATE PLUGGABLE DATABASE fr_to_delete_pdb_28745
ADMIN USER admin IDENTIFIED BY m2027 
FILE_NAME_CONVERT = ('pdbseed', 'fr_to_delete_pdb_28745');

-- Close the PDB before dropping it
ALTER PLUGGABLE DATABASE fr_to_delete_pdb_28745 CLOSE IMMEDIATE;

-- Drop the PDB
DROP PLUGGABLE DATABASE fr_to_delete_pdb_28745 INCLUDING DATAFILES;

-- list all PDBs to confirm deletion
COLUMN name FORMAT A30
SELECT name, open_mode FROM v$pdbs;

--Task 3: Oracle Enterprise Manager (OEM)
-- open sqlplus as sysdba to start the database and access OEM
sqlplus / as sysdba

--Check if a port is already set:
SELECT DBMS_XDB_CONFIG.GETHTTPSPORT() FROM DUAL;
--open port if needed
EXEC DBMS_XDB_CONFIG.SETHTTPSPORT(5500);



-- 

DROP PLUGGABLE DATABASE FR_TO_DELETE_PDB_28745 INCLUDING DATAFILES;
