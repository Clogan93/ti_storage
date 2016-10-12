$(document).ready(() => {
  // mobile dropdown menu that controls tabs
  mobileTabControlEls = {
    buttonToDropLinks: $('.mobile_tab_navigation .tab_chooser .dropdown-toggle'),
    anyTabControllingLink: $('.mobile_tab_navigation .tab_chooser a.dropdown-item')
  }
  mobileTabControlEls.anyTabControllingLink.on('click', (event) => {
    const currentTabTitle = $(event.currentTarget).text();
    mobileTabControlEls.buttonToDropLinks.text(currentTabTitle);
  })
});