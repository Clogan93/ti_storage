const findAddressByCoordinates = (lat, lng, onSuccess) =>{
  const geocoder = new google.maps.Geocoder;
  geocoder.geocode({ location: { lat, lng } }, (results, status) => {
    if (status === 'OK') {
      if (results.length > 0) {
        onSuccess(results[0].formatted_address);
      } else {
        console.log('No results found');
      }
    } else {
      console.log('Geocoder failed due to: ' + status);
    }
  });
}