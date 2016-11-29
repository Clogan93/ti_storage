$(document).on('turbolinks:load', () => {
  const page = $('#locations_show_page');
  if (page.length == 0){ return }

  // mobile dropdown menu that controls tabs
  const mobileTabControlEls = {
    buttonToDropLinks: $('.mobile_tab_navigation .tab_chooser .dropdown-toggle'),
    anyTabControllingLink: $('.mobile_tab_navigation .tab_chooser a.dropdown-item')
  };
  mobileTabControlEls.anyTabControllingLink.on('click', (event) => {
    const currentTabTitle = $(event.currentTarget).text();
    mobileTabControlEls.buttonToDropLinks.text(currentTabTitle);
  });
});
