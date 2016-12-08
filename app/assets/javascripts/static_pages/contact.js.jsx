$(document).on('turbolinks:load', () => {
  const page = $('main#contact_page');
  if (page.length == 0){ return }

  const yes = $('fieldset.is_current_customer_yes');
  const no = $('fieldset.is_current_customer_no');

  page.find($('input[name=is_current_customer]')).on('change', (e) => {
    switch (e.target.value){
      case 'no':
        yes.hide();
        no.show();
        break;
      case 'yes':
        yes.show();
        no.hide();
        break;
    }
  })
})
