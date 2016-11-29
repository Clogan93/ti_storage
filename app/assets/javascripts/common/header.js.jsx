// section.locations
$(document).on('turbolinks:load', () => {
  const locations = $('header section.locations');

  const collapsedMenu = locations.find('.menu');
  const citiesSubmenu = collapsedMenu.find('ul.cities');
  // const placesSubmenu = citiesSubmenu.find('ul.places');

  citiesSubmenu.menu({
    // position inner menus so that their tops are at the top of their outer menus.
    focus: (event, ui) => {
      citiesSubmenu.menu('option', 'position', { 
        of: $(ui.item.parent()),
        my: 'left top',
        at: 'right top'
      });
    }
  });

  locations.find('.toggler').on('click', (e) => {
    e.preventDefault();
    collapsedMenu.collapse('toggle');
  });
});

// section.storage_solutions
$(document).on('turbolinks:load', () => {
  const storage_solutions = $('header section.storage_solutions');
  const collapsedMenu = storage_solutions.find('nav');

  storage_solutions.find('.toggler').on('mouseover', (e) => {
    collapsedMenu.collapse('toggle');
  });
})
