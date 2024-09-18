/**
 * connect to DHL service and use it to create a new DHL tracking entity and set the new created ID to my trackingNumber
 * @Before(event = { "CREATE" }, entity = "trackingnumber_crSrv.Shipment")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/

module.exports = async function (req) {
	const { Shipment } = cds.entities;
  
	// Connect to the external DHL Tracking Service
	const DHL_Tracking_Service = await cds.connect.to('DHL_Tracking_Service');
	const { Tracking } = DHL_Tracking_Service.entities;
  
	// Create a new DHL tracking entity
	const newTrackingEntry = {
	  name: 'New Shipment',
	  description: 'Tracking for new shipment'
	};
  
	const createdTracking = await DHL_Tracking_Service.run(
	  INSERT.into(Tracking).entries(newTrackingEntry)
	);
  
	// Ensure the created tracking entity is not undefined
	if (createdTracking && createdTracking.ID) {
	  // Set the new tracking ID to the trackingNumber field of the Shipment entity
	  req.data.trackingNumber = createdTracking.ID;
	} else {
	  req.error(500, 'Failed to create a new tracking entry in DHL Tracking Service');
	}
  };