class Map {
  constructor(mapEl){
    this.mapEl = mapEl;
  }

  displayMap(){
    this.map = new google.maps.Map(this.mapEl.get(0), { mapTypeId: 'roadmap' });
  }

  placeMarkersOnMap(buildings){
    // Loop through our array of markers & place each one on the map  
    const bounds = new google.maps.LatLngBounds();
    buildings.forEach((building) => {
      const position = { lat: building.coordinates[0], lng: building.coordinates[1] }
      bounds.extend(position);

      const marker = new google.maps.Marker({
        position: position,
        map: this.map,
        title: building.title
      });

      // Automatically center the map fitting all markers on the screen
      this.map.fitBounds(bounds);

      const infoWindow = new google.maps.InfoWindow();
      // Allow each marker to have an info window
      google.maps.event.addListener(marker, 'click', () => {
        infoWindow.setContent(building.title);
        infoWindow.open(this.map, marker);
      })

    })
  }
}
