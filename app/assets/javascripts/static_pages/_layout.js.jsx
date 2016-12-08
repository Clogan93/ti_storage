$(document).on('turbolinks:load', () => {
  const page = $('main#static_pages_layout');
  if (page.length == 0){ return }
  
  // if we're on a page with main#static_pages_layout - let's place logo above it prettily.
  // ___why not put this in css? 
  // because then we'll need to wrap everything in page-specific id. it's not bad, but it's not the convention I chose from the beginning. maybe worth changing later.
  // also http://apidock.com/rails/ActionView/Helpers/UrlHelper/current_page%3F with conditional header class may be a good alternative.
  if ($(window).width() > 992){
    $('header .logo img').css({ 'left': 60 });
  } else if ($(window).width() > 769){
    $('header .logo img').css({ 'left': 45 });
  } else {
    $('header .logo img').css({ 'left': 'initial' });
  }
})
