const findNearestStorages = (origin, storages, onSuccess, onError) => {
  const destinations = storages.map((storage) => 
    new google.maps.LatLng(...storage.coordinates)
  );

  const service = new google.maps.DistanceMatrixService();
  service.getDistanceMatrix({
      origins: [origin],
      destinations: destinations,
      travelMode: 'DRIVING'
    },
    (result, status) => {
      if (status === "OK"){
        // result.rows[0].elements: array of { distance: { text, value }, duration: { text, value }, status }
        const closestStorages = result.rows[0].elements
          .map((distanceToOriginObject, index) => ({ ...storages[index], distanceToOriginObject: distanceToOriginObject }))
          .filter((destination) => destination.distanceToOriginObject.status === 'OK')
          .sort((a, b) => a.distanceToOriginObject.distance.value - b.distanceToOriginObject.distance.value);

        onSuccess(closestStorages);
      } else {
        onError(status);
      }
    }
  );
}
