$(document).on('turbolinks:load', () => {
  const page = $('.reservations_controller.show_action');
  if (page.length == 0){ return }

  // if express_check_in, or reserve_room are chosen - show the whole form
  $('#reservation input[type="radio"]').click(() => {
    $('#reservationForm').show();
  })
});
