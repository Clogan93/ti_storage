const findCoordinatesByAddress = (address) => {
  return new Promise((resolve, reject) => {
    const geocoder = new google.maps.Geocoder;
    geocoder.geocode({ address: address }, (results, status) => {
      if (status === 'OK') {
        const location = results[0].geometry.location;
        resolve({ lat: location.lat(), lng: location.lng() })
      } else {
        reject(status)
      }
    });
  })
}
