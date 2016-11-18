$(document).ready(() => {
  const collapsibleLocationsEl = $("#collapsible_locations_in_header ul.cities");

  collapsibleLocationsEl.menu({
    // position inner menus so that their tops are at the top of their outer menus.
    focus: function(event, ui){
      collapsibleLocationsEl.menu("option", "position", { 
        of: $(ui.item.parent()), 
        my: "left top", 
        at: "right top" 
      });
    },
  });
});

console.log(() => '.es6 works?')