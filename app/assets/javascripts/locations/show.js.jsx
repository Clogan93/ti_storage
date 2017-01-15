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

  // /brooklyn/red-hook#reviews
  // opens reviews tab
  if (location.hash){
    const tabToOpen = $('section.extensive_information a[href="' + location.hash + '"]');
    tabToOpen.tab('show');
    window.a = tabToOpen;

    // TODO doesn't work here, only works after everything is loaded
    // tabToOpen[0].scrollIntoView();
  }

  // clicking on some tab changes our url to eg /brooklyn/red-hook#features
  $('section.extensive_information .nav-tabs a').on('shown.bs.tab', (e) => {
    const hash = e.target.href.split('#')[1];
    // pushState instead of location.hash = to avoid page jump.
    history.pushState(null, null, '#' + hash);
  });

  $('#size_options a').click(function (e) {
    e.preventDefault();
    $('#size_options a.active').removeClass('active');
    $(this).tab('show');
  })
});
