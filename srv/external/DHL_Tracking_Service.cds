/* checksum : 7e33d6602f005a0ddd0cfdd33657772a */
@cds.external : true
@cds.persistence.skip : true
entity DHL_Tracking_Service.Tracking {
  @Core.ComputedDefaultValue : true
  key ID : UUID not null;
  name : String(100);
  description : String(100);
};

@cds.external : true
service DHL_Tracking_Service {};

