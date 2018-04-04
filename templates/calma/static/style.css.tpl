/* General Styles */

body { background: {{ settings.bg_color }} {% if "background.jpg" | has_custom_image %}url("{{ "background.jpg" | static_url}}"){% else %}none{% endif %} top left repeat; line-height: 2em; color: {{ settings.text_color }}; font-family: {{settings.rest | raw }}; font-size:13px; }
h1,h2,h3,h4,h5 { font-family: {{settings.headings | raw }};}
h2 { color: {{ settings.text_color }}; }
h2.light { font-size: 16px; border-bottom: 1px dashed {{ settings.text_color }}; color: {{ settings.text_color }}; margin: 0.9em 0 2em 0; }
h3 { color: {{ settings.text_color }}; }
a { color: {{ settings.link_color }}; }
a:hover { color: {{ settings.link_hover_color }}; }
form select { font-size: 13px; position: relative; top: 1px; }
#logo img{max-height: 400px;max-width: 800px;}

/* Utility Styles */

a.alt-link, .alt-link a { color: {{ settings.text_color }}; text-decoration: none; }
a.alt-link:hover, .alt-link a:hover { color: {{ settings.link_hover_color }} !important; text-decoration: none; }
.light a { color: {{ settings.text_color }} !important; }
.light a:hover { color: #bbb !important; text-decoration: underline !important; }
.bold { font-weight: bold; }
.note { color: {{ settings.text_color }}; font-size: 12px; }
.no-bull { list-style-type: none; margin-left: 0; }
.sidebar-box { background: #ffffff; border: 1px solid; border-color: {{ settings.border_color }}; padding: 1px; margin: 20px; }
.sidebar-box div.inner { background: {{ settings.nav_main_color }} top left repeat-x; padding: 14px; }
.sidebar-box p { margin-bottom: 0; }
.disabled { color: {{ settings.text_color }}; }
.cl { clear: left; }
.pagination a { color: {{ settings.text_color }}; text-decoration: none; }
.pagination a:hover { color: {{ settings.text_color }}; }
.pagination { color: {{ settings.text_color }}; position: relative; border-top: 1px solid {{ settings.border_color }}; margin: 1em 1em 1em 0; padding-top: 0.75em; height: 22px; text-transform: uppercase; text-align: center; font-weight: bold; }
.pagination span{ position: relative; padding: 0 3px; display: inline; }
.pagination span.next { position: absolute; top: 0.75em; right: 0; }
.pagination span.prev { position: absolute; top: 0.75em; left: 0; }
.current { font-size: 15px; font-weight: bold; margin: 0 4px; color: #ccc; }
.r { text-align: right; }
.box, .notice { color: {{ settings.text_color }}; border: 1px solid; border-color: {{ settings.border_color }}; background: {{ settings.nav_main_color }} top left repeat-x; }
.box h3 { color: {{ settings.text_color }}; }
.small-image { margin-right: 5px; }
.small-image a { display: block; }
.small-image img { max-width:75px; max-height:75px; }

/* Layout */

.container { background: {{ settings.bg_bottom }} url("{{ 'bg.svg' | static_url }}") top left repeat-x; border-left: 1px solid {{ settings.border_color }}; border-right: 1px solid {{ settings.border_color }}; }

#header { margin-top: 10px; }
#logo { margin: 0px 20px; }
#logo a { color: {{ settings.text_color }}; text-decoration: none; }
#logo h1 { font-size: 40px; margin: 20px 0;}
ul#top-right-list { text-align: right; list-style-type: none; }
ul#top-right-list a { font-size: 11px; color: {{ settings.text_color }}; text-decoration:none; }
ul#top-right-list a:hover { color: {{ settings.text_color }}; }
ul#top-right-list li { border-bottom: 1px solid {{ settings.border_color }}; line-height: 15px; margin-top: 7px; }

#subheaderbar { margin: 10px 0 20px 0;}
#subheaderbar a { color: {{ settings.text_color }}; }
#subheaderbar-content { border: 1px solid; border-color: {{ settings.border_color }}; margin: 0 20px; padding: 1px; background: #ffffff; }
#subheaderbar-content div.inner { background:{{ settings.nav_main_color }} top left repeat-x; padding: 5px 15px; }
#shopping-cart { position: relative; float: right; background: url({{"cart.png" | static_url}}) center left no-repeat; padding-left: 23px; font-weight: normal; }
#home-btn { float: left; margin-right: 10px; position: relative; top: 5px; }
#breadcrumb { color: {{ settings.text_color }}; }
#breadcrumb a { color: {{ settings.text_color }}; margin: 0 5px 0 3px; }
#breadcrumb a:hover { color: {{ settings.link_hover_color }}; }
#breadcrumb strong { margin-left: 3px; }

#sidebar a { color: {{ settings.text_color }}; text-decoration: none; }
#search-box { padding: 3px 0 3px 11px; margin: 0 20px; background: {{ settings.border_color }}; border-color:{{ settings.border_color }}; border-style:solid; border-width:1px; }
#search-box #q { width: 170px; color: {{ settings.text_color }}; }
#search { position: relative; top: 6px; left: 5px; }
#navigation { margin: 0 20px; background: #ffffff; border-left: 1px solid {{ settings.border_color }}; border-right: 1px solid {{ settings.border_color }}; font-family: {{settings.navigation | raw }};}
#navigation ul { margin-bottom: 0; margin:0;}
#navigation li a { display:block; background: {{ settings.nav_main_color }}; padding: 3px 3px 2px 15px; border-top: 1px solid #ffffff; border-bottom: 1px solid {{ settings.border_color }}; font-weight:bold;}
#navigation li a:hover { background: {{ settings.nav_hover_color }}; color: {{ settings.text_color }};}
#navigation li a.selected {color:{{ settings.nav_active_text_color }};font-weight:bold;}

#navigation ul ul a{padding-left:25px; background:{{ settings.nav_secondary_color }}; font-size:11px;}
#navigation ul ul ul a{padding-left:40px; font-weight:normal;}
#navigation ul ul ul ul a{padding-left:50px;}

#auth{
	text-align:right;
	margin-right:20px;
	font-size:12px;
}

#auth a{
    margin-left:6px;
}

#content { margin: 0px 20px 15px 12px; overflow:hidden;}

.contact-details {text-align:center;}

.contact-details ul {list-style:none; overflow:hidden;margin:0 auto;display:inline-block;zoom:1; padding:10px;}

.contact-details ul li {float:left;margin-left:10px;}

#footer { padding: 15px; background: {{ settings.nav_main_color }} top left repeat-x; margin: 2em 0 0 0; text-align: center; border-top: 1px solid {{ settings.border_color }}; border-bottom: 1px solid #bbbbbb; }
#footer .tiendanube, #footer .tiendanube a { color: {{ settings.text_color }}; }


/* Product */

#main-product-image { margin: 1em 2em 1em 1em; float: right; text-align: center; border: 3px solid {{ settings.border_color }};}
#main-product-image * { margin: 0 auto; }
#main-product-image a { display:block;}
#main-product-image img {  max-width:320px;}
#product-title { margin: 1em 0 0.25em 0; }
#product-purchase .price del{ color: red; font-size: 20px; }
#product-purchase .price { color: {{ settings.text_color }}; font-size: 20px; }
#product-purchase .compare-at-price { color: {{ settings.text_color }}; font-size: 11px; }
#product-purchase { margin-right: 2em; }
#product-variants { margin-top: 2em; }
#product-description { clear: both; padding-top: 2em; margin: 1em 2em 0 0; border-top: 1px dotted {{ settings.text_color }}; }
#add-to-cart { margin-top: 0.75em; position: relative; right: 2px; width: 146px; height: 35px; }
#product-images { border-top: 1px dotted {{ settings.text_color }}; margin: 2em 2em 0 0; padding-top: 2em; text-align:right; clear:both;}
#product-images .small-image { display:inline-block; vertical-align:middle; width: 75px; height: 75px; border: 3px solid {{ settings.border_color }}; text-align: center; margin: 0 6px 6px 0; }
#product-more { border-top: 1px dotted {{ settings.text_color }}; margin: 2em 2em 0 0; padding-top: 1em; }
#product-variants label { font-size:11px; font-weight:bold; margin-top:0.5em; text-transform:uppercase; }

/* Category */

.big-product { height: 280px; overflow: hidden; margin-bottom: 2em; }
.big-product .product-image { height: 240px; width: 240px; text-align: center; float: left; }
.big-product .product-image img {max-width:240px; max-height:240px;}
.big-product .product-info { float: left; margin-left: 20px; width: 365px; }
.big-product .title { margin-bottom: 0.5em; }
.big-product .title a { text-decoration: none; color: {{ settings.text_color }}; }
.big-product .price { margin-bottom: 0.5em; color: {{ settings.text_color }}; }
.big-product .description { }
.big-product form { margin-bottom: 1em; }

table#collection { position: relative; right: 0px; border-collapse: collapse; }
table#collection td { text-align: center; border: 1px solid {{ settings.border_color }}; width: 300px; padding: 10px 0 10px 10px; }
table#collection td a{display:block;overflow:hidden;}

#collection .product-image { float: left; padding: 1px; width:100px;}
#collection .product-image a {display:block;}
#collection .product-info { text-align: left; float: left; margin-left: 10px; width: 180px; }
#collection .product-info a { text-decoration: none; }
#collection .title { margin-bottom: 0; font-weight: bold; font-size: 13px; }
#collection .title a { color: {{ settings.text_color }}; }
#collection .price { font-size: 12px; margin-bottom: 10px; color: {{ settings.text_color }}; }


/* Page */

.article, .page { margin: 0em; padding: 0px; margin-bottom: 3em; }
.article div:first-child { padding: 10px; }
.article h2 a { font-size: 18px; text-decoration: none; }
.article h2 { margin-bottom: 0em; }
.article p.note { margin-bottom: 1em; }
.article .user { width: 48px; height: 48px; border: 1px solid {{ settings.border_color }}; background: url(user-onyx.gif) top left no-repeat; float: right; }
.article img, .page img { border: 4px solid #ccc; float: left; margin: 10px 10px 10px 0; padding: 1px; }
.blog-details .comments { float: right;  }
.blog-details { background: #f5f5f5; padding: 0 10px; border-top: 1px solid {{ settings.border_color }}; }
.first { color: {{ settings.text_color }}; border: 1px solid {{ settings.border_color }}; background: #e5f8ff bottom left repeat-x; }
.first h2 a { color: {{ settings.text_color }}; }
.first .note { color: {{ settings.text_color }}; }
.first .blog-details { border-top: 1px solid {{ settings.border_color }}; background: {{ settings.border_color }}; }


#comments dl { margin-bottom: 0;}
#comments dt label { font-weight: normal; }
#comments dd { margin: 0 0 1em 0; }
#comments td { width: 50%; vertical-align: top; }
#comments table { width: 100%; margin-bottom: 0; }
#comments input, #comments textarea { margin-top: 0.25em; }
#comments textarea { height: 140px; }
#comments .hint { text-align: right; margin: 0 10px 5px 0; }
#comments #submit { text-align: right; padding-right: 10px;}

/* Cart */

#cart { width: 100%; margin-bottom: 0; }
#cart td:first-child { width: 100px; }
#cart .product-image-cell { height: 100px; width: 100px }
#cart input { text-align: right; }
#cart th { border-bottom: 1px dashed {{ settings.text_color }}; }
#cart .product-image { height: 100px; width: 100px; float: left; text-align: center; }
#cart .action-col { width: 16px; }
#cart #subtotal td { font-size: 16px; background: {{ settings.nav_main_color }}; }
#cart .product-image-cell img { width: 50px }
#checkout { padding-top: 1em; text-align: right;   }

/* Search */

#searchresults .box { padding: 0.5em 1.5em; background: #e5f8ff top left repeat-x; border-color:{{ settings.border_color }}; border-style:solid; border-width:1px; }
#searchresults .product-info { width: 425px; }

/* 404 */

#dialog { text-align: center; }
#dialog h1 { margin-top: 1em; color: #333; font-size: 28px; }
#dialog h1 span { font-size: 40px; color: {{ settings.text_color }}; }
#dialog .actions { border-top: 1px dotted {{ settings.border_color }}; padding-top: 1em; margin-top: 2em; }

/* Buttons */

.button, .btn { vertical-align: middle; cursor: pointer; font-family: Helvetica, Arial, sans-serif; margin: 0 5px 0 0; padding: 2px 5px; text-decoration: none; line-height: 24px; font-size: 11px; color: {{ settings.text_color }}; background: #f5f5f5 repeat-x 0 0; border-left: 1px solid {{ settings.border_color }}; border-right: 1px solid {{ settings.border_color }}; border-top: 1px solid {{ settings.border_color }}; border-bottom: 1px solid {{ settings.border_color }}; }
a.button { padding: 3px 6px; }
.btn:hover, .button:hover { color: {{ settings.link_hover_color }}; }

/* Reflections */

img.reflected {
  margin-bottom: 1px;
}


.hidden{display:none;}

/* Misc */
#return_to_store{display:none;}
.flash{color:#ff0000;margin-bottom:20px;}
.title{margin-bottom:1em; font-size: 1.5em;color: {{ settings.text_color }};}
.order_section_title{color: {{ settings.text_color }}; margin-bottom:5px;}
.name{font-weight:bold; font-size:15px; margin-bottom:5px;}
.clearfix:after { content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0;}
.clearfix {    display: inline-block;}
html[xmlns] .clearfix { display: block;}
* html .clearfix {height: 1%;}

  
.alt { 
  font-family: "Helvetica Neue", Arial, Helvetica, sans-serif; 
  font-style: italic;
  font-weight: normal;
  font-size: 12px;
}

#idioma{
	line-height: 12px;
	margin-right: 20px;
	margin-top: 20px;
	text-align: right;
}

#idioma img{
	-moz-opacity:.7;
	filter:alpha(opacity=70);
	opacity:.7;
}

#idioma .selected img,
#idioma a:hover img{
	-moz-opacity:1;
	filter:alpha(opacity=100);
	opacity:1;
}

.product-listed-on-collection img {
	max-width: 100px;
	max-height: 100px;	
	border: 3px solid {{ settings.border_color }};
}

.product-listed-on-collection:hover{
	background: {{ settings.nav_main_color }};	
}

#product-images div:hover  {
	cursor: pointer;	
}

.contact-product-form input {
    margin-top: 15px;	
}

.button {
	font-size: 18px;
    font-weight: bold;	
}

.bold-red {
	font-weight: bold;
	color: red;	
}

.variation-holder label {
	display: inline-block;
	width: 70px;
}

.variation-holder select {
	width: 80px;
}

.paginate {
	margin-bottom: 15px;	
}

.contact_form .field {
	overflow: hidden;
	margin-bottom: 12px;	
}

.contact_form .field label {
	width: 130px;
	display: inline-block;
	float: left;
}

.contact_form .field input, .contact_form .field textarea {
	width: 320px;
    height: 25px;
	display: inline-block;
	float: left;
	border: 1px solid {{ settings.border_color }};
	padding: 0px;
}

.contact_form .field.err input{
    background: none repeat scroll 0 0 #FFEFEF;
    border-color: #A00000;
}

.contact_form .field textarea {
	height: 100px;	
}

.contact_form .field.winnie-pooh {
    display: none;
}

.contact_form .submit{
	text-align: right;
    width: 457px;
}

.mini-text {
	font-size: 10px;	
}

.store_social_buttons {
	width: 300px;	
}

.shareDiv {
	width: 300px;
	margin-top: 45px;	
}

.shareDiv .shareItem {
	float: left;
	width: 80px;
	overflow: hidden;	
}

.seals a {
	display: inline-block !important;
}
.seals {
	text-align: center;
	overflow: hidden;
	margin-top: 20px;
	margin-bottom: 20px;	
}

.infinite-scroll-loading {
    height: 80px;
}

.infinite-scroll-loading td {
    background: url("{{ "loading-infinite-scroll.gif" | static_url}}") no-repeat center;
    display: block;
    height: 80px;
    border: none!important;
}

.banner {
    margin:10px auto;
    text-align: center;
}

.banner img {
    max-width: 638px;
}

.banner-sidebar {
	margin: 20px;
	text-align: center;
}

.banner-sidebar img {
    max-width: 200px;
}

#shipping-calculator {
    margin-top: 20px;
    text-align: center;
}

#calculate-shipping-button {
    font-size: 14px;
    padding: 0 2px;
}

#shipping-calculator input {
    margin-left: 10px;
    margin-right: 20px;
    width: 90px;
}

#shipping-calculator input[type="radio"] {
	width: 15px;
}

#shipping-calculator .loading {
	background: url("{{"loading.gif" | static_url}}") no-repeat center;
    display: inline-block;
    height: 32px;
    width: 32px;
    vertical-align: middle;
    margin-left: 20px;
}

.cloud-zoom-big{
    background-color:#fff;
}

#invalid-zipcode {
	color: #f00;
	margin-left: 10px;
}

#shipping-calculator ul.shipping-list li {
	display: block;
	float: none;
	text-align: left;
	margin-bottom: 10px;
}

#shipping-calculator ul.shipping-list {
    display: block;
    margin: auto;
    padding: 20px 0 0;
    width: 540px;
    border-bottom: none;
}

#shipping-calculator ul.shipping-list img {
	vertical-align: middle;
	margin-right: 20px;
}

.afip img {
	max-height: 80px;
	vertical-align: middle;
}

.fb-like-box {
    background-color: #fff;
}
