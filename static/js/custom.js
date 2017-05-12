$(document).ready(function() {
    $('.navbar').hide();
    var jumboHeight = $('.jumbotron').outerHeight();
    function parallax(){
        var scrolled = $(window).scrollTop();
        $('.bg').css('height', (jumboHeight-scrolled) + 'px');
        $('.navbar').fadeIn(1000);
    }

    $(window).scroll(function(e){
        parallax();
    });

    $('#card-container').masonry({
      // set itemSelector so .grid-sizer is not used in layout
      itemSelector: '.grid-item:not(.filtered)',
      // use element for option
      columnWidth: '.grid-sizer',
      isResizable: true,
      isAnimated: !Modernizr.csstransitions,
      gutter: 20
    });


    $('#filter-works a').click(function(e) {
        e.preventDefault();

        $(this).addClass('active').siblings().removeClass('active');

        var category = $(this).attr('data-filter');

        $('#card-container .card').each(function() {
            if ($(this).is(category)) {
                $(this).removeClass('filtered');
            } else {
                $(this).addClass('filtered');
            }
        });
        $('#card-container').masonry('reloadItems');
        $('#card-container').masonry('layout');
    });
});