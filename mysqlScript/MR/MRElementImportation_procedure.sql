#element importation procedure
#already stored in database

DELIMITER //
CREATE procedure ImportElement()
 Begin
INSERT INTO MR_TABLE (ProtocolName)
SELECT element
FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'ProtocolName';
update MR_TABLE set MR_TABLE.StudyInstanceUID =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'StudyInstanceUID') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.SeriesInstanceUID =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'SeriesInstanceUID') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.PatientName =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'PatientName') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.Manufacturer =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'Manufacturer') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.Modality =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'Modality') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.MagneticFieldStrength =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'MagneticFieldStrength') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.RepetitionTime =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'RepetitionTime') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.EchoTime =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'EchoTime') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.SpacingBetweenSlices =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'SpacingBetweenSlices') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.PixelBandwidth =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'PixelBandwidth') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.FlipAngle =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'FlipAngle') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.EchoNumbers =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'EchoNumbers') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.InversionTime =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'InversionTime') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.SliceThickness =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'SliceThickness') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.ImagingFrequency =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'ImagingFrequency') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.InPlanePhaseEncodingDirection =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'InPlanePhaseEncodingDirection') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.NumberofAverages =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'NumberofAverages') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.NumberOfPhaseEncodingSteps =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'NumberOfPhaseEncodingSteps') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.PercentPhaseFieldofView =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'PercentPhaseFieldofView') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.MRAcquisitionType =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'MRAcquisitionType') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.AcquisitionTime =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'AcquisitionTime') ORDER BY id DESC LIMIT 1;
update MR_TABLE set MR_TABLE.SliceLocation =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'SliceLocation') ORDER BY id DESC LIMIT 1;
end; //
DELIMITER ;

DROP TABLE UPLOADED_PROTOCOL;