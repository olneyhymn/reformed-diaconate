$(document).ready(function() {
    $('.grid').masonry({
      // set itemSelector so .grid-sizer is not used in layout
      itemSelector: '.grid-item:not(.filtered)',
      // use element for option
      columnWidth: '.grid-sizer',
      percentPosition: true,
      isFitWidth: true,
      isResizable: true,
      isAnimated: !Modernizr.csstransitions,
      gutterWidth: 25
    });


    $('#filter-works a').click(function(e) {
        e.preventDefault();

        $('#filter-works li').removeClass('active');
        $(this).parent('li').addClass('active');

        var category = $(this).attr('data-filter');

        $('.item').each(function() {
            if ($(this).is(category)) {
                $(this).removeClass('filtered');
            } else {
                $(this).addClass('filtered');
            }
        });
    });
});