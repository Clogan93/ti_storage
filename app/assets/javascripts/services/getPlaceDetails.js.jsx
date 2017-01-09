const getPlaceDetails = (placeId, onSuccess, onError) => {
  // PlacesService needs random div as an argument, yes.
  const placesService = new google.maps.places.PlacesService(document.createElement('div'));

  placesService.getDetails({ placeId }, (place, status) => {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      onSuccess(place);
    } else {
      onError(status);
    }
  });
}
