##### turn off save update mode accessible#####
SET SQL_SAFE_UPDATES=0;

USE RPConnectDB;

##### Create a temporary table for a run of MRI #####

DROP TABLE IF EXISTS UPLOADED_PROTOCOL;

CREATE TEMPORARY TABLE UPLOADED_PROTOCOL (
id smallint unsigned NOT NULL auto_increment,
name VARCHAR(200) NOT NULL DEFAULT ' ',
element VARCHAR(200) NOT NULL DEFAULT ' ',
PRIMARY KEY (id)
);

##### load xml file #####
LOAD XML LOW_PRIORITY LOCAL INFILE '/Users/jiawenchen/Desktop/2-1.xml'
REPLACE
into table RPConnectDB.UPLOADED_PROTOCOL
ROWS IDENTIFIED BY '<element>';
Call RPConnectDB.ProtocolCompare();