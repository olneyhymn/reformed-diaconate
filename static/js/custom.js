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

    var $grid = $('#card-container').masonry({
      itemSelector: '.grid-item:not(.filtered)',
      gutter: 0
    });

    $grid.imagesLoaded().progress( function() {
      $grid.masonry('layout');
    });


    $('#filter-works a').click(function(e) {
        e.preventDefault();

        $(this).addClass('active').siblings().removeClass('active');

        var category = $(this).attr('data-filter');

        $('#card-container .grid-item').each(function() {
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