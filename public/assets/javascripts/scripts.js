$(document).ready(function() {
  $( window ).scroll(function(){
    var scroll_top = $( window ).scrollTop();
    if( scroll_top === 0 ) {
      $( '#header' ).removeClass( 'sticky' );
    } else {
      $( '#header' ).addClass( 'sticky' );
    }
  });
  /* Scroll Positions END */

  /* Resize START */
  $( window ).resize(function(){
    window_width = $( window ).width();
    window_height = $( window ).height();

    if( $( 'ul.forums-icons' ).width() < $( 'ul.forums-icons' ).get(0).scrollWidth ) {
      $( 'ul.forums-icons' ).scrollLeft( ( $( 'ul.forums-icons' ).get(0).scrollWidth - $( 'ul.forums-icons' ).width() ) / 2 );
    }
    else {
      $( 'ul.forums-icons' ).scrollLeft( 0 );
    }

    $( window ).scroll();
  });
  /* Resize END */

});
