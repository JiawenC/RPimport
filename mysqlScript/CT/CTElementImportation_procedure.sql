#element importation procedure
#already stored in database

DELIMITER //
#Drop procedure if exists RPConnectDB.CTImportElement //
CREATE procedure CTImportElement()
 Begin
INSERT INTO CT_TABLE (ProtocolName)
SELECT element
FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'ProtocolName';
update CT_TABLE set CT_TABLE.StudyInstanceUID =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'StudyInstanceUID') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.SeriesInstanceUID =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'SeriesInstanceUID') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.PatientName =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'PatientName') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.Manufacturer =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'Manufacturer') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.Modality =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'Modality') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.ScanOptions =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'ScanOptions') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.KVP =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'KVP') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.XRayTubeCurrent =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'XRayTubeCurrent') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.ExposureTime =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'ExposureTime') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.Exposure =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'Exposure') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.DataCollectionDiameter =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'DataCollectionDiameter') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.ReconstructionDiameter =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'ReconstructionDiameter') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.TableHeight =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'TableHeight') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.RotationDirection =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'RotationDirection') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.PatientPosition =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'PatientPosition') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.AcquisitionNumber =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'AcquisitionNumber') ORDER BY id DESC LIMIT 1;
update CT_TABLE set CT_TABLE.PatientOrientation =
(select element FROM RPConnectDB.UPLOADED_PROTOCOL
WHERE name = 'PatientOrientation') ORDER BY id DESC LIMIT 1;
end; //
DELIMITER ;

DROP TABLE UPLOADED_PROTOCOL;