##### turn off save update mode accessible#####
SET SQL_SAFE_UPDATES=0;

USE RPConnectDB;

##### Create a temporary table for a run of MRI #####

DROP TABLE IF EXISTS CT_PROTOCOL;

CREATE TEMPORARY TABLE CT_PROTOCOL (
id smallint unsigned NOT NULL auto_increment,
name VARCHAR(200) NOT NULL DEFAULT ' ',
element VARCHAR(200) NOT NULL DEFAULT ' ',
PRIMARY KEY (id)
);

##### load xml file #####
LOAD XML LOW_PRIORITY LOCAL INFILE '/Users/jiawenchen/Desktop/test2.xml'
REPLACE
into table RPConnectDB.CT_PROTOCOL
ROWS IDENTIFIED BY '<element>';


# update the element value of every parameter(can be optimize with 'case')
INSERT INTO CT_TABLE (ProtocolName)
SELECT element
FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'ProtocolName';
update CT_TABLE set CT_TABLE.Manufacturer =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'Manufacturer') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.Modality =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'Modality') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.ScanOptions =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'ScanOptions') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.KVP =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'KVP') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.XRayTubeCurrent =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'XRayTubeCurrent') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.ExposureTime =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'ExposureTime') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.Exposure =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'Exposure') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.DataCollectionDiameter =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'DataCollectionDiameter') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.ReconstructionDiameter =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'ReconstructionDiameter') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.TableHeight =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'TableHeight') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.RotationDirection =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'RotationDirection') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.PatientPosition =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'PatientPosition') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.AcquisitionNumber =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'AcquisitionNumber') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.PatientOrientation =
(select element FROM RPConnectDB.CT_PROTOCOL
WHERE name = 'PatientOrientation') ORDER BY id DESC LIMIT 1;

DROP TABLE CT_PROTOCOL;


