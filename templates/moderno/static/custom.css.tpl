#gradient,
#iniciar,
#iniciar a,
#navigation > li,
#navigation > li > a,
#navigation > li > .a{
	background-color: {{ settings.navBackground }} !important;
}

#iniciar a,
#navigation > li > a,
#navigation > li > .a {
	color: {{ settings.navText }} !important;
}

#footer,
#footer a,
#no-logo,
.header-contact-info,
#auth a { 
	color: {{ settings.logoFooterText }} !important;
}

body{
	{% if "custom_background.jpg" | has_custom_image %}
		background-image: url( "{{ "custom_background.jpg" | static_url }}" );
	{% else %}
		background-image: url( "{{ ("images/" ~ settings.background) | static_url }}" );
	{% endif %}
	font-family: {{settings.rest | raw }};
}

h1.title {
	font-family: {{settings.headings | raw }};
}

#navigation {
	font-family: {{settings.navigation | raw }};
}
