{% if not settings.image_borders %}
.dest-gral,
.dest-gral:hover,
.dest-gral .bajada:hover,
.dest-gral:hover .bajada,
.dest,
.dest:hover,
.dest .bajada,
.dest .bajada:hover,
.dest:hover .bajada,
#product-listing .product,
#product-listing .product .bajada,
#shoppingCartPage .cart-contents .productrow .col-image img,
#single-product .productContainer .imagecol .imagecolContent,
#single-product .thumbnail-container .single-thumb,
#single-product .productContainer .imagecol .shareDiv{
	border-color:transparent;
}

.dest:hover,
.dest-gral:hover,
.product:hover .head{
	border-color:#d2d2d2;
}
{% endif %}

body{
	background-color: {{ settings.background_color }};
	{% if "default-background.jpg" | has_custom_image %}
		background-image: url( "{{ "default-background.jpg" | static_url }}" );
	{% else %}
		{% if settings.invert_pattern %}
			background-image: url( "{{ ("tramas/" ~ settings.background_pattern ~ ".png") | static_url }}" );
		{% else %}
			background-image: url( "{{ ("tramas/" ~ settings.background_pattern ~ "-inv.png") | static_url }}" );
		{% endif %}
	{% endif %}
}

#no-logo,
#auth a,
#header .infobox,
#header .infobox a,
#footer,
#footer a{
	color: {{ settings.footer_text }};
}

.sf-menu a, .sf-menu a:visited{
	color: {{ settings.nav_text }};
}

.sf-menu li:hover, .sf-menu li.sfHover,
.sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active{
	color: {{ settings.nav_text_hover }};
}

#header #navigation,
.sf-menu li{
	background-color: {{ settings.nav_background }};
}

#header #navigation,
.sf-menu ul{
	border-color: {{ settings.nav_border }};
}

#ls_cart_widget{
	background-color: {{ settings.nav_cart }};
}

.headerBox{
	color: {{ settings.title_color }};
	background-color: {{ settings.title_background }};
}

.headerBox,
.contentBox,
#fauxContainer,
.contentBox.contact .form{
	border-color: {{ settings.content_border }};
}

.headerBox h2 {
	color: {{ settings.title_color }};
	font-family: {{ settings.headings | raw }};
}

.sf-menu a {
	font-family: {{ settings.navigation | raw }};
}

*, .dest .bajada, .dest .bajada strong{
	font-family: {{ settings.rest | raw }};
}
