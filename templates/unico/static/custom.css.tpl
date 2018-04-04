/* Color Settings */

a, div#header h2 a:hover, div.entry h2.title a:hover, div#comments p#posted, div#comments p#error, div#hello .email, #contact .success {
	color: {{ settings.main_color }};
}

div#finder input.submit {
	background-color: {{ settings.button_color_from }} ;
}

div#finder input.submit:hover {
	background-color: {{ settings.button_color_hover }};
}

#buy-this, #checkout input.checkout, #add, input.comment, #contact input.button, #contact-product, .green-gradient  {
	background-color: {{ settings.button_color_from }};
	background: -moz-linear-gradient(top, {{ settings.button_color_from }}, {{ settings.button_color_to }} );
	background: -webkit-gradient(linear, center top, center bottom, from({{ settings.button_color_from }}), to({{ settings.button_color_to }}));
}

/* This are not configurable so far */
#buy-this:hover, #checkout input.checkout:hover, #add:hover, input.comment:hover, #contact input.button:hover, #contact-product:hover, .green-gradient:hover {
	background: -moz-linear-gradient(top, {{ settings.button_color_hover }}, {{ settings.button_color_hover }});
	background: -webkit-gradient(linear, center top, center bottom, from({{ settings.button_color_hover }}), to({{ settings.button_color_hover }}));
}

.gray-gradient {
	background: -moz-linear-gradient(top, #bfbfbf, #7c7c7c) !important;
	background: -webkit-gradient(linear, center top, center bottom, from(#bfbfbf), to(#7c7c7c)) !important;
}

body {
	font-family: {{settings.rest | raw }};
}

#navigate {
	font-family: {{settings.navigation | raw }};
}

h1,h2,h3,h4,h5,h6 {
	font-family: {{settings.headings | raw }};
}