$(document).on('turbolinks:load', () => {
  const page = $('#search_index_page');
  if (page.length == 0){ return }

  const mobileMapEl = page.find('section.mobile_map');
  const mapEl = page.find('section.map');

  if ($(window).width() > 1314){
    mapEl.css({ "height": $(window).height() })
    mapEl.stick_in_parent();

    const map = displayMap(mapEl)
    placeStoragesOnMap(storages, map);
  } else if ($(window).width() > 576){
    const map = displayMap(mapEl)
    placeStoragesOnMap(storages, map);
  } else{
    $('a[href="#map"]').one('shown.bs.tab', (e) => {
      const map = displayMap(mobileMapEl);
      placeStoragesOnMap(storages, map);
    })
  }
})

const displayMap = (mapEl) => {
  return new google.maps.Map(mapEl.get(0), { mapTypeId: 'roadmap' })
}

const placeStoragesOnMap = (storages, map) => {
  // Loop through our array of markers & place each one on the map  
  const bounds = new google.maps.LatLngBounds();
  storages.forEach((storage) => {
    const position = { lat: storage.coordinates[0], lng: storage.coordinates[1] }
    bounds.extend(position);

    const marker = new google.maps.Marker({
      position: position,
      map: map,
      title: storage.title
    });

    const infoWindow = new google.maps.InfoWindow();
    // Allow each marker to have an info window
    google.maps.event.addListener(marker, 'click', () => {
      infoWindow.setContent(storage.title);
      infoWindow.open(map, marker);
    })

    // Automatically center the map fitting all markers on the screen
    map.fitBounds(bounds);
  })
}
