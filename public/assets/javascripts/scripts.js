$(document).ready(function() {
	/* Scroll Positions START */
	var window_width = $( window ).width();
	var window_height = $( window ).height();
	var scroll_top = $( window ).scrollTop();
	var scroll_bottom = scroll_top + window_height;
	var scroll_quarter = scroll_top + ( window_height / 4 );
	var scroll_half = scroll_top + ( window_height * 1 / 2 );
	var scroll_three_quarter = scroll_top + ( window_height * 3 / 4 );
	var scroll_direction = -1;

	$( window ).scroll(function(){
		scroll_direction = scroll_top - $( window ).scrollTop();
		scroll_top = $( window ).scrollTop();
		scroll_bottom = scroll_top + window_height;
		scroll_quarter = scroll_top + ( window_height / 4 );
		scroll_half = scroll_top + ( window_height * 1 / 2 );
		scroll_three_quarter = scroll_top + ( window_height * 3 / 4 );

		if( scroll_top == 0 ) {
			$( '#header' ).removeClass( 'sticky' );
		}
		else {
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

	$( 'img' ).last().one('load', function() {
		$( window ).resize();
	}).each(function() {
		if( this.complete ) $( this ).load();
	});
	/* Resize END */
});