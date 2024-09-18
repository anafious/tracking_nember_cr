using { trackingnumber_crSrv } from '../srv/service.cds';

annotate trackingnumber_crSrv.Shipment with @UI.HeaderInfo: { TypeName: 'Shipment', TypeNamePlural: 'Shipments' };
annotate trackingnumber_crSrv.Shipment with @UI.DataPoint #documentNumber: {
  Value: documentNumber,
  Title: 'Document Number',
};
annotate trackingnumber_crSrv.Shipment with @UI.DataPoint #senderAddress: {
  Value: senderAddress,
  Title: 'Sender Address',
};
annotate trackingnumber_crSrv.Shipment with @UI.DataPoint #recipientAddress: {
  Value: recipientAddress,
  Title: 'Recipient Address',
};
annotate trackingnumber_crSrv.Shipment with {
  documentNumber @title: 'Document Number';
  senderAddress @title: 'Sender Address';
  recipientAddress @title: 'Recipient Address';
  deliveryOption @title: 'Delivery Option';
  trackingNumber @title: 'Tracking Number'
};

annotate trackingnumber_crSrv.Shipment with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: documentNumber },
    { $Type: 'UI.DataField', Value: senderAddress },
    { $Type: 'UI.DataField', Value: recipientAddress },
    { $Type: 'UI.DataField', Value: deliveryOption },
    { $Type: 'UI.DataField', Value: trackingNumber }
];

annotate trackingnumber_crSrv.Shipment with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: documentNumber },
    { $Type: 'UI.DataField', Value: senderAddress },
    { $Type: 'UI.DataField', Value: recipientAddress },
    { $Type: 'UI.DataField', Value: deliveryOption },
    { $Type: 'UI.DataField', Value: trackingNumber }
  ]
};

annotate trackingnumber_crSrv.Shipment with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#documentNumber' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#senderAddress' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#recipientAddress' }
];

annotate trackingnumber_crSrv.Shipment with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

