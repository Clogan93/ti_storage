$(document).on('turbolinks:load', () => {
  const page = $('#search_index_page');
  if (page.length == 0){ return }

  const mobileMapEl = page.find('section.mobile_map');
  const mapEl = page.find('section.map');

  if ($(window).width() > 1314){
    mapEl.css({ "height": $(window).height() })
    mapEl.stick_in_parent();

    const map = new Map(mapEl);
    map.displayMap();
    map.placeBuildingsOnMap(storages);
  } else if ($(window).width() > 576){
    const map = new Map(mapEl);
    map.displayMap();
    map.placeBuildingsOnMap(storages);
  } else{
    $('a[href="#map"]').one('shown.bs.tab', (e) => {
      const map = new Map(mobileMapEl);
      map.displayMap();
      map.placeBuildingsOnMap(storages);
    })
  }
})
