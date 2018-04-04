$(document).ready(function(){
		
	$(function() {
        //If Javascript is running, change css on product-description to display:block
        //then hide the div, ready to animate
        $('div#cart-summary').css({'display':'block','right':'-70'})

        $('div#ls_cart_widget').hover(
          function () {
            $(this).children('div#cart-summary').stop().animate({
              right: 0
            }, 800);
          },
          function () {
            $(this).children('div#cart-summary').stop().animate({
             right: -70
            }, 1000);
          }
        )
      });
	 
		
});

