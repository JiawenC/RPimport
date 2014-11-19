#already stored in database
DELIMITER $$
USE RPConnectDB$$
Drop procedure if exists RPConnectDB.CTProtocolCompare $$
CREATE procedure RPConnectDB.CTProtocolCompare()

BEGIN
		declare StudyInstanceUID_Upload varchar(80);
		declare StudyInstanceUID_Table varchar(80);
		declare SeriesInstanceUID_Upload varchar(80);
		declare SeriesInstanceUID_Table varchar(80);

		declare ProtocolId_set varchar(80) default '1';
		declare ProtocolId_max varchar(80) default '0';
		declare id_max int default '1';
		declare RunId_max varchar(80);
		declare count int default '0';
		#choose from upload image
		SELECT element into StudyInstanceUID_Upload FROM UPLOADED_PROTOCOL WHERE name = 'StudyInstanceUID';
        SELECT element into SeriesInstanceUID_Upload FROM UPLOADED_PROTOCOL WHERE name = 'SeriesInstanceUID';
		#choose protocolId
		SELECT ProtocolId into ProtocolId_max FROM CT_TABLE ORDER BY id DESC LIMIT 1;
		SELECT id into id_max FROM CT_TABLE ORDER BY id DESC LIMIT 1;	
		#check StudyInstanceUID(check if same protocol exist)
		set count = 0;
		CompareProtocol:begin
		  while count < id_max do
			set count = count + 1;
			SELECT StudyInstanceUID into StudyInstanceUID_Table FROM CT_TABLE where id = count;
			
			studyID:begin
				if (StudyInstanceUID_Table = StudyInstanceUID_Upload) then
				  select concat ("same study");
				  SELECT SeriesInstanceUID into SeriesInstanceUID_Table FROM CT_TABLE where id = count;
	
				  series:begin
					if (SeriesInstanceUID_Upload != SeriesInstanceUID_Table) then 
					  
					 checkseries:begin
					   while count < id_max do
						set count = count + 1;
						SELECT SeriesInstanceUID into SeriesInstanceUID_Table FROM CT_TABLE where id = count;
						 if (SeriesInstanceUID_Upload = SeriesInstanceUID_Table) then 
						    select concat ("same series");
						    leave CompareProtocol;
						 end if;
					   end while;
					  end checkseries;
	         
					  select concat ("different series", count);
                      SELECT ProtocolId into ProtocolId_set FROM CT_TABLE WHERE StudyInstanceUID = StudyInstanceUID_Upload;
					  SELECT RunId into RunId_max FROM CT_TABLE group by StudyInstanceUID having StudyInstanceUID= StudyInstanceUID_Upload ORDER BY id DESC LIMIT 1;
					  CALL CTImportElement();
					  update CT_TABLE set CT_TABLE.ProtocolId = ProtocolId_set ORDER BY id DESC LIMIT 1;
					  update CT_TABLE set CT_TABLE.RunId = RunId_max + 1 ORDER BY id DESC LIMIT 1;
					  leave CompareProtocol;
					
					elseif (SeriesInstanceUID_Upload = SeriesInstanceUID_Table) then 
						select concat ("same series");
						leave CompareProtocol;
					end if;
				   
				  end series;   
				end if;
			end studyID;
		  end while;
		  
			differentrun:begin
			  select concat ("different study import");
			  CALL CTImportElement();
			  update CT_TABLE set CT_TABLE.ProtocolId = ProtocolId_max + 1 ORDER BY id DESC LIMIT 1;
			  update CT_TABLE set CT_TABLE.RunId = '1' ORDER BY id DESC LIMIT 1;
			  leave CompareProtocol;
			end differentrun;
		
		end CompareProtocol;
end;



