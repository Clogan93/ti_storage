$(document).ready(function(){
  if ($(window).width() > 1314){
    var map = $('#search_index_page .map_and_sizing_guide_preview .fixates_on_scrolldown');
    map.find('.map iframe').css({ "height": $(window).height() })
    map.stick_in_parent();
  }
})