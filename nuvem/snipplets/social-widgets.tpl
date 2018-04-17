{# Mobile Sharing #}
<div class="social-widgets-mobile clear-both p-top-half p-bottom-half">
	<h5 class="p-top-quarter">{{ "Compartir" | translate }}:</h5>
	{# 	Whatsapp button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_whatsapp product-share-button bg-whatsapp d-inline-block-xs m-right-half" data-network="whatsapp" target="_blank"
	 href="whatsapp://send?text={{ product.social_url }}">
		<i class="fa fa-lg fa-whatsapp"></i>
	</a>
	{#  Facebook button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_facebook product-share-button bg-facebook d-inline-block m-right-half" data-network="facebook" target="_blank"
	 href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
	 title="Share on Facebook">
		<i class="fa fa-lg fa-facebook"></i>
	</a>
	{# Twitter button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_twitter product-share-button bg-twitter d-inline-block m-right-half" data-network="twitter" target="_blank"
	 href="https://twitter.com/share?url={{ product.social_url }}"
	 title="Share on Twitter">
		<i class="fa fa-lg fa-twitter"></i>
	</a>
	{# Google+ button #}
	<a class="js-mobile-social-share btn-social-mobile btn-social-mobile_googleplus product-share-button bg-google d-inline-block m-right-half" data-network="gplus" target="_blank"
	 href="https://plus.google.com/share?url={{ product.social_url }}"
	 title="Share on Google+">
		<i class="fa fa-lg fa-google-plus"></i>
	</a>
</div>
