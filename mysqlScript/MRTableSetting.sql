USE RPConnectDB;
##### creat MRI protocols table #####
DROP TABLE IF EXISTS MR_TABLE;
#specify every parameters
CREATE TABLE MR_TABLE (
id smallint unsigned NOT NULL auto_increment,
ProtocolName VARCHAR(50)  NULL DEFAULT ' ',
Manufacturer VARCHAR(20)  NULL DEFAULT ' ',
Modality VARCHAR(20)  NULL DEFAULT ' ',
MagneticFieldStrength VARCHAR(10)  NULL DEFAULT ' ',
RepetitionTime int(10) NULL DEFAULT '0',
EchoTime time(3)  NULL,
SpacingBetweenSlices double(4,2)  NULL DEFAULT '0.0',
PixelBandwidth int(10)  NULL DEFAULT '0',
FlipAngle int(10)  NULL DEFAULT '0',
EchoNumbers int(10)  NULL DEFAULT '0',
InversionTime int (10) NUll DEFAULT '0',
SliceThickness int(10)  NULL DEFAULT '0',
ImagingFrequency double(10,6)  NULL DEFAULT '0.0',
InPlanePhaseEncodingDirection VARCHAR(10)  NULL DEFAULT ' ',
NumberofAverages int(10)  NULL DEFAULT '0',
NumberOfPhaseEncodingSteps int(10)  NULL DEFAULT '0',
PercentPhaseFieldofView int(10)  NULL DEFAULT '0',
MRAcquisitionType VARCHAR(5) NULL DEFAULT ' ',
AcquisitionTime time(6)  NULL,
SliceLocation double(20,14)  NULL DEFAULT '0.0',
PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;