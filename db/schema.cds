using { DHL_Tracking_Service } from '../srv/external/DHL_Tracking_Service.cds'; 
namespace trackingnumber_cr;
using { cuid } from '@sap/cds/common';

entity Shipment : cuid {
  documentNumber: String(10);
  senderAddress: String(200);
  recipientAddress: String(200);
  deliveryOption: String(50);
  trackingNumber: String(50);
}

