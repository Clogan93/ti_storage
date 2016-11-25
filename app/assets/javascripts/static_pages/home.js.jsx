$(document).on('turbolinks:load', () => {
  const page = $('main#home_page');

  const anyBenefitEl = page.find('section.ti_storage_benefits .benefit');

  // anyBenefitEl.hover(
  //   (e) => {
  //     console.log('hover')
  //     // $(e.target).find('p.popover').css()
  //     page.find('p.popover').hide(); // because http://stackoverflow.com/a/2253717/3192470
  //     $(e.target).find('p.popover').show();
  //   },
  //   // (e) => {
  //   //   $(e.target).find('p.popover').hide();
  //   // }
  // )
})
