USE RPConnectDB;
##### creat MRI protocols table #####
DROP TABLE IF EXISTS CT_TABLE;
#specify every parameters
CREATE TABLE CT_TABLE (
id smallint unsigned NOT NULL auto_increment,
ProtocolName VARCHAR(50)  NULL DEFAULT ' ',
Manufacturer VARCHAR(20)  NULL DEFAULT ' ',
Modality VARCHAR(20)  NULL DEFAULT ' ',
ScanOptions VARCHAR(20)  NULL DEFAULT ' ',
KVP int(10) NULL DEFAULT '0',
XRayTubeCurrent int(10) NULL DEFAULT '0',
ExposureTime int(10) NULL DEFAULT '0',
Exposure int(10) NULL DEFAULT '0',
DataCollectionDiameter double(6,2)  NULL DEFAULT '0.0',
ReconstructionDiameter double(7,3)  NULL DEFAULT '0.0',
TableHeight double(6,2)  NULL DEFAULT '0.0',
RotationDirection VARCHAR(5) NULL DEFAULT ' ',
PatientPosition VARCHAR(5) NULL DEFAULT ' ',
AcquisitionNumber int(6)  NULL,
PatientOrientation VARCHAR(6) NULL DEFAULT ' ',

PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;