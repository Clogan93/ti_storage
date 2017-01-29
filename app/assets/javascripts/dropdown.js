var dropdown_select = (function($) {

    return {
        init: function() {
            $('.dropdown-content a').on('click', function() {
                // $('.dropdown-content a').removeClass('active')
                // $(this).addClass('active')
                var text = $(this).children()[0].innerText;
                $('.dropbtn')[0].innerText = text;
            });
        },
    };
})(jQuery);


jQuery(document).ready(function($) {
    dropdown_select.init();
});