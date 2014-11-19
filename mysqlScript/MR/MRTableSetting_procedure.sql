#Drop procedure if exists MRTableSetting;
#DELIMITER //
#CREATE procedure MRTableSetting()
# Begin

USE RPConnectDB;
##### creat MRI protocols table #####
DROP TABLE IF EXISTS MR_TABLE;

#specify every parameters
CREATE TABLE MR_TABLE (
id smallint unsigned NOT NULL auto_increment,
ProtocolId int(10)  NULL DEFAULT '1',
RunId int(10)  NULL DEFAULT '1',
StudyInstanceUID VARCHAR(80)  NULL DEFAULT ' ',
SeriesInstanceUID VARCHAR(80)  NULL DEFAULT ' ',
PatientName VARCHAR(60)  NULL DEFAULT ' ',
ProtocolName VARCHAR(50)  NULL DEFAULT ' ',
Manufacturer VARCHAR(20)  NULL DEFAULT ' ',
Modality VARCHAR(20)  NULL DEFAULT ' ',
MagneticFieldStrength VARCHAR(10)  NULL DEFAULT ' ',
RepetitionTime VARCHAR(10) NULL DEFAULT ' ',
EchoTime VARCHAR(10)  NULL,
SpacingBetweenSlices double(4,2)  NULL DEFAULT '0.0',
PixelBandwidth int(10)  NULL DEFAULT '0',
FlipAngle int(10)  NULL DEFAULT '0',
EchoNumbers int(10)  NULL DEFAULT '0',
InversionTime VARCHAR (10) NUll DEFAULT ' ',
SliceThickness int(10)  NULL DEFAULT '0',
ImagingFrequency double(10,6)  NULL DEFAULT '0.0',
InPlanePhaseEncodingDirection VARCHAR(10)  NULL DEFAULT ' ',
NumberofAverages int(10)  NULL DEFAULT '0',
NumberOfPhaseEncodingSteps int(10)  NULL DEFAULT '0',
PercentPhaseFieldofView int(10)  NULL DEFAULT '0',
MRAcquisitionType VARCHAR(5) NULL DEFAULT ' ',
AcquisitionTime VARCHAR(15)  NULL DEFAULT ' ',
SliceLocation double(20,14)  NULL DEFAULT '0.0',
PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
#end; //
#DELIMITER ;