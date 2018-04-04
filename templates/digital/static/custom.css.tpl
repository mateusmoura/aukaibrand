#gradient,
.phone
{
	background-color: {{ settings.navBackground }} !important;
}

#wrapper, #content {
    background: {{ settings.innerBackground }} !important;
}

#iniciar a,
#navigation > li > a,
#navigation > li > .a {
	color: {{ settings.navText }} !important;
}


#no-logo, .logo-container h2 {
	color: {{ settings.logoText }} !important;
}

.header-contact-info {
	color: {{ settings.textHeaderInfo }} !important;
}

#compra {
	background-color: {{ settings.backgroundCart }} !important;
}

#footer h4{
	color: {{ settings.footerTitle }} !important;
}

#sidebar li a{
	color: {{ settings.linkSidebar }} !important;
}
#sidebar li ul li a{
	color: {{ settings.sublinkSidebar }} !important;
}

.header-contact-info, .header-contact-info a {
	color: {{ settings.textHeaderInfo }} !important;
}


body{
	{% if "custom_background.jpg" | has_custom_image %}
		background-image: url( "{{ "custom_background.jpg" | static_url }}" );
	{% else %}
		background: #ebe9ea url( "{{ ("images/" ~ settings.background) | static_url }}" ) repeat-x;
	{% endif %}
	font-family: {{settings.rest | raw }};
}


#navigation {
	font-family: {{settings.navigationBar | raw }};
}

#categorias {
	font-family: {{settings.navigationCategories | raw }};
}

#content h2 {
	font-family: {{settings.headings | raw }};
}

/*Banner services*/

#banner-services .service-icon{
    color: {{ settings.linkSidebar }};
}
#banner-services .service-text h4{
    color: {{ settings.linkSidebar }};
}
#banner-services{
    border-top: 1px solid;
    border-color: {{ settings.backgroundCart }};
    border-bottom: 1px solid;
    border-color: {{ settings.backgroundCart }};
}
.banner-services-footer{
	background: {{ settings.innerBackground }};
	border-top: 1px solid;
    border-color: {{ settings.backgroundCart }};
}
