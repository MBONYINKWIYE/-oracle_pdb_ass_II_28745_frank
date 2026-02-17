
--Task 1: Create a New Pluggable Database

-- Create Pluggable Database
CREATE PLUGGABLE DATABASE gh_pdb_29388
ADMIN USER pdbadmin IDENTIFIED BY m2027
FILE_NAME_CONVERT = ('pdbseed', 'gh_pdb_29388');

-- Open Pluggable Database

ALTER PLUGGABLE DATABASE gh_pdb_29388 OPEN;

-- check status
SHOW PDBS;

-- Switch to pdb
ALTER SESSION SET CONTAINER = gh_pdb_29388;

-- check current container
SHOW CON_NAME;

--Create user in PDB
CREATE USER ghislaine_plsqlauca_29388
IDENTIFIED BY m2027;

-- Grant privileges to user
GRANT CONNECT, RESOURCE TO ghislaine_plsqlauca_29388;

-- Check if user is created
SELECT username FROM dba_users WHERE username = 'GHISLAINE_PLSQLAUCA_29388';

--Connect to PDB using SQL*Plus
sqlplus ghislaine_plsqlauca_29388/m2027@gh_pdb_29388

--Task 2: Create and Delete a PDB

CREATE PLUGGABLE DATABASE gh_to_delete_pdb_29388
ADMIN USER admin IDENTIFIED BY m2027 
FILE_NAME_CONVERT = ('pdbseed', 'gh_to_delete_pdb_29388');

-- Close the PDB before dropping it
ALTER PLUGGABLE DATABASE gh_to_delete_pdb_29388 CLOSE IMMEDIATE;

-- Drop the PDB
DROP PLUGGABLE DATABASE gh_to_delete_pdb_29388 INCLUDING DATAFILES;

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

DROP PLUGGABLE DATABASE GA_PDB_28810 INCLUDING DATAFILES;