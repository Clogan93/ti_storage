$(document).on('turbolinks:load', () => {
  const page = $('main#home_page');
  if (page.length == 0){ return }

  // opens mailchimp subscription form
  // (it's pretty slow, wait some for it to open)
  $("section.sign_up_for_emails a.button").click(() => {
    // otherwise it will remember user closed it, and won't open it again
    document.cookie = "MCEvilPopupClosed=; expires=Thu, 01 Jan 1970 00:00:00 UTC";

    require(
      ["mojo/signup-forms/Loader"],
      (loader) => {
        loader.start({
          "baseUrl": "mc.us11.list-manage.com",
          "uuid": "509c33784a61cbd5fb3e73347",
          "lid": "002f86e4f3"
        })
      }
    )
  })

})
