{% if settings.rounded_borders %}
#slider,
#slider li .picture img,
#newsletter,
#box-facebook,
.banner-sidebar img,
.product,
.product img,
.banner img,
.thumbnail-container .single-thumb img,
.productContainer .imagecol .imagecolContent img,
.nivoSlider img,
#cloud-zoom-big,
.banner-sidebar img {
border-radius: 15px !important; 
-ms-border-radius: 15px !important; 
-moz-border-radius: 15px !important; 
-webkit-border-radius: 15px !important; 
-khtml-border-radius: 15px !important; 

}
{% endif %}

#iniciar a,
#navigation > li > a,
#navigation > li > .a {
	color: {{ settings.navText }} !important;
}
#navigation li.selected a, #navigation li.selected .a, #navigation li a:hover {
	background:  {{ settings.selectedSection }} !important; 
}

#no-logo{
	color: {{ settings.logoText }} !important;
}

.header-contact-info {
	color: {{ settings.textHeaderInfo }} !important;
}

#footer h4{
	color: {{ settings.footerTitle }} !important;
}

#sidebar li a, #ver a{
	color: {{ settings.linkSidebar }} !important;
}
#sidebar li ul li a{
	color: {{ settings.sublinkSidebar }} !important;
}

.data .title {
	color: {{ settings.textTitleProduct }} !important;
}
.header-contact-info, .header-contact-info a {
	color: {{ settings.textHeaderInfo }} !important;
}

#bar {
background: {{ 
	settings.navBackground }} !important;
}
.title { 
	color: {{ settings.colorTitles }} !important; 
}

.button {
	background: {{ settings.colorButtons }};
}
.button, .button a {
	color: {{ settings.textButtons }};
}

#content.carrito ul.productos li .subtotal,
#content.carrito .total,
.description .price,
#content.single .data .price {
	color: {{ settings.textPrices }};
}


body{
	{% if "custom_background.jpg" | has_custom_image %}
		background-image: url( "{{ "custom_background.jpg" | static_url }}" );
	{% else %}
		background-image: url( "{{ ("bg/" ~ settings.background_pattern ~ ".jpg") | static_url }}" );
	{% endif %}
    font-family: {{settings.rest | raw }};
}

.title {
	font-family: {{ settings.headings | raw }} !important;
}

.sf-menu a {
	font-family: {{ settings.navigationBar | raw }} !important;
}

#sidebar .title { 
	font-family: {{ settings.titleSidebarCategorie | raw }} !important;
}

#sidebar #categorias a {
    font-family: {{ settings.navigationCategories | raw }} !important;
}

* {
	font-family: {{ settings.rest | raw }};
}

#content.carrito ul.productos li a.delete {
	color: {{ settings.navText }};
}
/*Banner services*/

#banner-services .service-icon{
    color: {{ settings.linkSidebar }};
}
#banner-services .service-text h4{
    color: {{ settings.linkSidebar }};
}
#banner-services .col-md-4:not(:last-child), .col-md-6:not(:last-child){
    border-right: 1px solid;
    border-color: {{ settings.linkSidebar }};
}

