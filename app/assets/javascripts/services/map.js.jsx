class Map {
  constructor(mapEl){
    this.mapEl = mapEl;
  }

  displayMap(){
    this.map = new google.maps.Map(this.mapEl.get(0), { mapTypeId: 'roadmap' });
  }

  placeMarkersOnMap(buildings, events){
    // Loop through our array of markers & place each one on the map  
    const bounds = new google.maps.LatLngBounds();

    // one infowindow per map, so that on click (on pin) only one infowindow gets opened.
    const infoWindow = new google.maps.InfoWindow();

    buildings.forEach((building) => {
      const position = { lat: building.coordinates[0], lng: building.coordinates[1] }
      bounds.extend(position);

      const marker = new google.maps.Marker({
        position: position,
        map: this.map
      });

      // Automatically center the map fitting all markers on the screen
      this.map.fitBounds(bounds);

      if (events && events.onClick) {
        // Allow each marker to have an info window
        google.maps.event.addListener(marker, 'click', () => {
          events.onClick(infoWindow, building);
          infoWindow.open(this.map, marker);
        })
      }
    })
  }
}
