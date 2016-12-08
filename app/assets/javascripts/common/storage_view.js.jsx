$(document).on('turbolinks:load', () => {
  const el = $('section.storage_view');
  if (el.length == 0){ return }

  // mobile dropdown menu that controls tabs
  const mobileTabControlEls = {
    buttonToDropLinks: $('.mobile_tab_navigation .tab_chooser .dropdown-toggle'),
    anyTabControllingLink: $('.mobile_tab_navigation .tab_chooser a.dropdown-item')
  };
  mobileTabControlEls.anyTabControllingLink.on('click', (event) => {
    const currentTabTitle = $(event.currentTarget).text();
    mobileTabControlEls.buttonToDropLinks.text(currentTabTitle);
  });

  $('.additional_photos img').on('click', (event) => {
    const imgClicked = $(event.target);
    const mainImgEl = imgClicked.closest('.photos').find('.main_photo img');
    mainImgEl.attr('src', imgClicked.attr('src'))
  })
});