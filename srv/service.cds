using { DHL_Tracking_Service } from './external/DHL_Tracking_Service.cds'; 
using { trackingnumber_cr as my } from '../db/schema.cds';

@path: '/service/trackingnumber_cr'
@requires: 'authenticated-user'
service trackingnumber_crSrv {
  @odata.draft.enabled
  entity Shipment as projection on my.Shipment;
}