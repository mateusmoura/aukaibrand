//Background color
$bg-color: {{ settings.background_color }};

// Color primario
$primary-color: {{ settings.primary_color }};
// Variante clara color primario
$primary-light-color: lighten($primary-color, 40%);
// Variante oscura color primario
$primary-dark-color: darken($primary-color, 10%);

// Color secundario
$secondary-color: {{ settings.secondary_color }};
// Variante clara color secundario
$secondary-light-color: lighten($secondary-color, 40%);
// Variante oscura color secundario
$secondary-dark-color: darken($secondary-color, 5%);

// Color de texto por defecto
$text-primary-color: {{ settings.text_primary_color }};
// Variante clara de texto por defecto
$text-primary-light-color: lighten($text-primary-color, 62%);
$text-primary-lighter-color: lighten($text-primary-color, 65%);

// Color de texto secundario
$text-secondary-color: lighten($text-primary-color, 20%);

// Color de texto alternativo
$text-third-color: lighten($text-primary-color, 100%);

// Tipografia principal
$main-font: {{ settings.main_font | raw }};

// Tipografia secundaria
$secondary-font: {{ settings.secondary_font | raw }};

// Color de lineas
$line-color: {{ settings.line_color }};

// Color de social networks
$social-color: {{ settings.social_color }};

@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
       -o-border-radius: $radius;
          border-radius: $radius;
}
%default-text {
	color: $text-primary-color;
	font-family: $main-font;
	font-size: 16px;
	letter-spacing: 0px;
	text-transform: none;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
%cta-button {
	color: $primary-color;
	font-family: $main-font;
	font-weight: bold;
	font-size: 14px;
	text-transform: uppercase;
	background: none;
	border: 3px solid $primary-color;
	padding: 8px 25px;
}

%secondary-text {
	color: $text-secondary-color;
	font-family: $secondary-font;
	font-size: 14px;
	text-transform: none;
}

%small-text {
	@extend %secondary-text;
	font-size: 12px;
}

%very-small-text {
	@extend %secondary-text;
	font-size: 13px;
	color: $text-third-color;
}
%input-style-1 {
	background-color: $line-color;
	border: none;
	@include border-radius(0px);
	@extend %secondary-text;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}
%input-style-2 {
	@extend %secondary-text;
	border: 3px solid $text-secondary-color;
	@include border-radius(0px);
	font-size: 16px;
	font-weight: lighter;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-color: $bg-color;
}

html, 
body, 
h1,
h2,
h3,
h4,
h5,
h6,
a,
p,
span {
	@extend %default-text;
}

body{
	background-color: $bg-color;
}

a {
	@extend %default-text;
	&:hover {
		color: $primary-color;
		text-decoration: none;
	}
}
h1 {
	font-size: 30px;
	letter-spacing: 1px;
	font-weight: bold;
}
h2 {
	font-size: 18px;
	letter-spacing: 1px;
	font-weight: normal;
}
#no-logo{
	font-size: 36px;
	font-weight: bold;
	color: $primary-color;
}
#no-logo:hover{
	color: $primary-color;
}
#newsModal .modal-content{
	background-color: $bg-color;
}
#no-logo-news{
	font-size: 25px;
	font-weight: bold;
	color: $primary-color;
	text-transform:capitalize;
}
#no-logo-news:hover{
	color: $primary-color;
}
.header-bar-fixed #no-logo{
	font-size: 18px;
}
.normal-button{
	@extend %cta-button;
}
.normal-button:hover{
	background: $primary-color;
	color: $text-third-color;
}
#newsletter-popup input.normal-button.popup-news{
	@extend %cta-button;
}
#newsletter-popup input.normal-button.popup-news:hover{
	background-color: $primary-color;
	color: $text-third-color;
}
#newsletter-popup .loading-modal{ 
color: $primary-color;
}
.big-button{
	background: $primary-color;
	color: $text-third-color;
	font-size: 18px;
	padding: 15px 35px;
	border: 0;
}
.big-button:hover{
	background: rgba($primary-color, .2);
	color: $primary-color !important;
	border: 0;
}
#product_form .big-button{
	margin-top: 20px;
}

/* Header */
.header-bar-top {
	background: $secondary-color;
	@extend %very-small-text;
}
.header-bar-top a, .header-bar-top p, .header-bar-top span {
	@extend %very-small-text;
	font-size:14px;
}
.header-bar-top .languages .btn{
	@include border-radius(0px);
}
.header-bar-top .languages .btn:hover, .header-bar-top .languages .btn:active{
	background-color: $secondary-dark-color;
}
.header-bar-top .languages .dropdown-menu{
	@include border-radius(0px);
	background-color: $bg-color;
	border: 1px solid $line-color;
}
.header-bar-top .languages .dropdown-menu li{
	border-top: 1px solid $line-color;
}
.header-bar-top .languages .dropdown-menu li:first-child{
	border-top: none;
}
.header-bar-top .languages .dropdown-menu a span{
	color: $text-primary-color;
}
.header-bar-fixed {
	background: $bg-color;
}
.searchbox .text-input{
	color: $text-primary-color;
	background-color: $bg-color;
}

/* Menu */
.sf-menu ul li:hover {
	background: $text-primary-light-color;
}
.sf-menu ul li {
	background: $bg-color;
	border-bottom: 1px solid $line-color;
	border-left: 1px solid $line-color;
	border-right: 1px solid $line-color;
}
.sf-menu ul li.first {
	border-top: 1px solid $line-color;
}
ul.sf-menu > li.selected{
	border-bottom: 3px solid $primary-color;
}

/* Menu Mobile */
nav.mobile select{
	@extend %input-style-2;
	background-color: $bg-color;
}

/* Cart */
.name-mobile{
	background-color: $secondary-color;
}

.name-mobile h2 a, .name-mobile h2{
	color: $text-third-color;
}
.sf-menu .cart-summary:hover .cart-total {
	color: $primary-color;
}
.cart-summary .cart-circle {
	background: $primary-color;
	@extend %very-small-text;
	font-weight: bold;
	@include border-radius(10px);
}
.cart-table thead th {
	background-color: $secondary-color;
	@extend %very-small-text;
	font-size:14px;
	font-weight: bold;
	white-space: nowrap;
}
.cart-table tbody tr:nth-child(2n-1) {
	background-color: $text-primary-light-color;
	transition: all .125s ease-in-out;
}
.cart-table tbody tr {
	background-color: $text-primary-lighter-color;
	transition: all .125s ease-in-out;
}
.cart-table tbody tr:hover {
	background-color: $secondary-light-color;
}
.cart-table .title a:hover{
	color: $text-primary-color;
}
.cart-table input{
	@extend %input-style-2;
}
.cart-table .unit-price, .cart-table .subtotal{
	color: $text-secondary-color;
	text-align:center;
}
.cart-table .remove i{
	color: $primary-color;
}
.cart-detail-totals .total-price p{
	color: $text-secondary-color;
	text-transform: uppercase;
}
.cart-detail-totals .total-price p span{
	color: $primary-color;
	font-size: 30px;
}
.big-button.continue-buying:hover{
	
}
.cart-detail-shipping {
	border: 1px solid $line-color;
}
.cart-detail-shipping p{
	color: $text-secondary-color;
}
.cart-detail-shipping p.loading, .cart-detail-shipping p#invalid-zipcode{
	color:$secondary-color;
}
.cart-detail-shipping input{
	@extend %input-style-1;
}
 #shipping-calculator li .shipping-method:checked + label i{
  display: block;
  float: right;
  font-size: 18px;
  color: $primary-color;
  position: absolute;
  right: 10px;
  top: 10px;
}
 #shipping-calculator li .shipping-method:checked + label{
  border:2px solid $primary-color;
}
 #shipping-calculator li .shipping-option + i{
 display:none;
}
.shipping-list li label:hover{
	background-color: darken($bg-color, 8%);
}
@media (max-width: 480px){
	table.cart-table td.remove{
		background-color:$secondary-dark-color;
	}
	.cart-table .remove i{
	color: $text-third-color;
	}
}
/* Mensaje de Bienvenida */
.welcome-message hr{
	background-color: $primary-color;
}

/* Section Title */
.headerBox-Page h1{
	font-size: 24px;
}
.section-header h1{
	color: $text-third-color;
}

/* Section Title */
.section-title .title {
	border-color: $line-color;
	background-color:$bg-color;
}
.section-title .line {
	border-top: 1px solid $line-color;
}

/* Product Box */
.grid figure {
	border-color: $line-color;
}
.grid figure:hover{
	outline: $line-color solid 2px;
}
.grid figcaption h4, .grid figcaption h4 a{
	@extend %secondary-text;
	text-transform: uppercase;
	font-size: 12px;
	font-weight: bold;
	color: $primary-color;
}
.grid figcaption h4 a:hover{
	text-decoration:underline
}
.grid figcaption .price-container a:hover p{
	color: $primary-color;
}

/* Offer bag */
.offer {
	background: $primary-color;
}
.product-related-button {
	background: $line-color;
}

.free-shipping {
    background: $secondary-color;
}

.offer p, .free-shipping p{
	color: $text-third-color;
}
.product-boxes .offer, .product-boxes .product-related-button, .product-boxes .free-shipping{
	box-shadow: 0px 3px rgba(0,0,0,0.3);
	-moz-box-shadow: 0px 3px rgba(0,0,0,0.3);
	-webkit-box-shadow: 0px 3px rgba(0,0,0,0.3);
	-ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=0, Direction=90, Color='#000000')";
}

/* Seccion productos con columna */
.category-col .category-list {
	background: $line-color;
}
.category-col h2{
	color: $primary-color;
}
.category-title.selected a{
	color: $secondary-color;
}
.subcategory-title.selected a{
	color: $text-third-color;
	background: $secondary-color;
	padding: 3px 5px;
	@include border-radius(5px);
}

/* Precios */
.big-price {
	color: $primary-color;
}
.big-old-price {
	color: $text-secondary-color;
}

/* Inputs */
.input, textarea {
	@extend %input-style-2;
}

/* Social networks */
.social-networks a:hover {
	border-color: $primary-color;
	background: $primary-color;
	color: $text-third-color;
}

.social-networks .section-title .title {
	color: $social-color;
	-webkit-text-shadow: 0px 3px rgba(0, 0, 0, 0.30);
	-moz-text-shadow:    0px 3px rgba(0, 0, 0, 0.30);
	text-shadow:         0px 3px rgba(0, 0, 0, 0.30);
	background:none;
}
.social-networks a{
	color: $social_color;
	border: 3px solid $social-color;
	-webkit-box-shadow: 0px 3px rgba(0, 0, 0, 0.30);
	-moz-box-shadow:    0px 3px rgba(0, 0, 0, 0.30);
	box-shadow:         0px 3px rgba(0, 0, 0, 0.30);	
	-webkit-text-shadow: 0px 3px rgba(0, 0, 0, 0.30);
	-moz-text-shadow:    0px 3px rgba(0, 0, 0, 0.30);
	text-shadow:         0px 3px rgba(0, 0, 0, 0.30);	
}

/* Newsletter */
#newsletter{
	border-color: $line-color;
}
#newsletter input{
	@extend %input-style-1;
	  height: 41px;
}
.newsletter-text p.line-1{
	color: $secondary-color;
}

#newsModal input{
	@extend %input-style-1;
	  height: 41px;
}
.newsletter-text p.line-1{
	color: $secondary-color;
}
input.normal-button{
	background-color: $secondary-color;
}
/* Footer */
.footer-main ul li a{
	@extend %secondary-text;
	text-decoration: underline;
}
.footer-main ul li a:hover{
	color: $text-primary-color;
}
.footer-bottom  p {
	@extend %small-text;
}
.footer-bottom  a {
	@extend %small-text;
	text-decoration: underline;
    text-align: center;
    width: 100%;
}

/* Product */
.description p{
	@extend %secondary-text;
}
.variant p{
	@extend %secondary-text;
	font-size:16px;
}
.max_installments {
	color: $secondary-color;
}
.installments {
    display: block;
    width: 100%;
        li[id^="method"] {
            a {
            color: $primary-color;
            font-weight: bold;
            border-radius: 0;
            }
        }
        span[id^="installment"] {
            display: block;
            width: 100%;
            padding: 2px 0;
        }
}
#button-installments {
	color: $primary-color;
}
#button-installments:focus {
	outline: none;
}

/* Product variants */
.variant-container{
	border-color: $line-color;
}
.variant-container{
	border-color: $line-color;
}
.custom-select select {
	@extend %input-style-2;
}

/* Product Share links */
.shareLinks {
	border-color: $line-color;
}

/* Pagination */
.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover, .pagination>.active>span:hover, .pagination>.active>a:focus, .pagination>.active>span:focus{
	background-color: $primary-color;
	border-color: $primary-color;
}
.pagination>li>a, .pagination>li>span{
	color: $primary-color;
	border-color: $line-color;
}
.pagination>li>a:hover{
	color: $primary-color;
}
.pagination-container .line{
	border-top: 1px solid $line-color;
}

/* Contact */
.contact-info h2 {
	color: $primary-color;
}
.contact-form input, .contact-form textarea{
	@extend %input-style-2;
}
.bg-contact-product{
	background: $secondary-light-color;
}

.cloud-zoom-loading {
	color:$text-third-color;
}
#google-map {
	border-color: $line-color;
}

input.normal-button{
	@extend %cta-button;
}
input.normal-button:hover{
	background: $primary-color;
	color: $text-third-color;
}

.pattern-background{
    background-image: url( "{{ ("img/tramas/" ~ settings.background_pattern ~ ".png") | static_url }}" );
}
.user-background{
    background-image: url( "{{ ("default-background.jpg") | static_url }}" );
}

/************************************************************************************
Account
*************************************************************************************/

.page-account {
    input.btn.btn-primary.btn-lg.facebook {
        width: 100%;
        border-color: #3B5998;
        border-bottom-color: #263a63;
        background-color: #3B5998;
        color: #fff;
        margin: 10px 0;
    }
    input.big-button.big-product-related-button.facebook {
        width: 100%;
        border-color: #3B5998;
        border-bottom-color: #263a63;
        background-color: #3B5998;
        color: #fff;
        margin: 10px 0;
    }
    i.fa.fa-facebook {
        color: #fff;
        top: 30px;
        left: 37px;
        position: absolute;
        font-size: 25px;
        z-index: 9;
    }
    .featurette-or-divider {
        margin: -9px 0 24px 0;
    }
    .badge {
        color: $text-primary-color;
        background: $bg-color;
        font-size: 13px;
    }
    .help-block {
        margin-top:20px;
    }

    .bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger {
        padding: 15px;
        margin: 10px 0;
    }
    .addresses {
        

        li {
            margin: 10px 0;
        }
    }

    .new-address {
        margin-top: 10px;
        clear: left;
    }

    .order-box img {
        vertical-align: middle;
        margin-right: 4px;
        max-width: 50px;
        max-height: 50px;
    }

    .order-actions{
        margin:10px 0;
    }
}

.form-horizontal .form-control{
	@extend %input-style-2;
}
#slider {
    position:relative;
    background-color:$bg-color;
    visibility:hidden;
}

/**
* BxSlider v4.1.2 - Fully loaded, responsive content slider
* http://bxslider.com
*
* Written by: Steven Wanderski, 2014
* http://stevenwanderski.com
* (while drinking Belgian ales and listening to jazz)
*
* CEO and founder of bxCreative, LTD
* http://bxcreative.com
*/


/*** Password page **/

.password-page .password-container.password-icon .password-svg{
	fill: $primary-color;
}

/** RESET AND LAYOUT
===================================*/

.bx-wrapper {
    position: relative;
    margin: 0 auto 60px;
    padding: 0;
    *zoom: 1;
}

.bx-wrapper img {
    max-width: 100%;
    display: block;
}
.homeslider img{
    visibility:hidden;	
}
.slider-wrapper .fa-circle-o-notch{
    position: absolute;
    top: 140px;
    margin-left:-25px;
    left: 50%;
    z-index: 99999;
    font-size: 40px;
    color: $primary-color;
}

/** THEME
===================================*/

.bx-wrapper .bx-viewport {
    border: 5px solid transparent;
    left: -5px;

    /*fix other elements on the page moving (on Chrome)*/
    -webkit-transform: translatez(0);
    -moz-transform: translatez(0);
    -ms-transform: translatez(0);
    -o-transform: translatez(0);
    transform: translatez(0);
}

.bx-wrapper .bx-pager,
.bx-wrapper .bx-controls-auto {
    position: absolute;
    bottom: -30px;
    width: 100%;
}

/* LOADER */

.bx-wrapper .bx-loading {
    min-height: 50px;
    background: url(images/bx_loader.gif) center center no-repeat #fff;
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2000;
}

/* PAGER */

.bx-wrapper .bx-pager {
    text-align: center;
    font-size: .85em;
    font-family: Arial;
    font-weight: bold;
    color: #666;
    padding-top: 20px;
}

.bx-wrapper .bx-pager .bx-pager-item,
.bx-wrapper .bx-controls-auto .bx-controls-auto-item {
    display: inline-block;
    *zoom: 1;
    *display: inline;
}

.bx-wrapper .bx-pager.bx-default-pager a {
    background: #666;
    text-indent: -9999px;
    display: block;
    width: 10px;
    height: 10px;
    margin: 0 5px;
    outline: 0;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
}

.bx-wrapper .bx-pager.bx-default-pager a:hover,
.bx-wrapper .bx-pager.bx-default-pager a.active {
    background: #000;
}

/* DIRECTION CONTROLS (NEXT / PREV) */

.bx-wrapper .bx-prev {
    left: 10px;
    background: url(images/controls.png) no-repeat 0 -32px;
}

.bx-wrapper .bx-next {
    right: 10px;
    background: url(images/controls.png) no-repeat -43px -32px;
}

.bx-wrapper .bx-prev:hover {
    background-position: 0 0;
}

.bx-wrapper .bx-next:hover {
    background-position: -43px 0;
}

.bx-wrapper .bx-controls-direction a {
    position: absolute;
    top: 50%;
    margin-top: -16px;
    outline: 0;
    width: 32px;
    height: 32px;
    z-index: 9999;
    opacity:0;
}

.bx-wrapper .bx-controls-direction a.shown {
    opacity: 1;
}

.bx-wrapper .bx-controls-direction a.disabled {
    display: none;
}

/* AUTO CONTROLS (START / STOP) */

.bx-wrapper .bx-controls-auto {
    text-align: center;
}

.bx-wrapper .bx-controls-auto .bx-start {
    display: block;
    text-indent: -9999px;
    width: 10px;
    height: 11px;
    outline: 0;
    background: url(images/controls.png) -86px -11px no-repeat;
    margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-start:hover,
.bx-wrapper .bx-controls-auto .bx-start.active {
    background-position: -86px 0;
}

.bx-wrapper .bx-controls-auto .bx-stop {
    display: block;
    text-indent: -9999px;
    width: 9px;
    height: 11px;
    outline: 0;
    background: url(images/controls.png) -86px -44px no-repeat;
    margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-stop:hover,
.bx-wrapper .bx-controls-auto .bx-stop.active {
    background-position: -86px -33px;
}

/* PAGER WITH AUTO-CONTROLS HYBRID LAYOUT */

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-pager {
    text-align: left;
    width: 80%;
}

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-controls-auto {
    right: 0;
    width: 35px;
}

/* IMAGE CAPTIONS */

.bx-wrapper .bx-caption {
    position: absolute;
    bottom: 0;
    left: 0;
    background: #666\9;
    background: rgba(80, 80, 80, 0.75);
    width: 100%;
}

.bx-wrapper .bx-caption span {
    color: #fff;
    font-family: Arial;
    display: block;
    font-size: .85em;
    padding: 10px;
}

.bx-wrapper .bx-controls-direction a {
    position:absolute;
    width: 60px;
    height: 60px;
    cursor:pointer;
    margin-top: -30px;
    top: 50%;
}

.bx-wrapper .bx-prev {
    margin-left: 20px;
    left:0;
}
.bx-wrapper .bx-next {
    right: 0;
    margin-right: 20px
}

.bx-wrapper .bx-controls-direction a {
    background: $primary-color;
    color: $text-third-color;
}
.bx-wrapper .bx-controls-direction a:hover {
    background: $primary-dark-color;
}

.bx-wrapper .bx-controls-direction a {
    border:0;
    text-align: center;
    -webkit-transition: all 200ms ease-in-out;
    -moz-transition: all 200ms ease-in-out;
    -o-transition: all 200ms ease-in-out;
    transition: all 200ms ease-in-out;
}

.bx-wrapper .bx-controls-direction a i{
    margin-top: 6px;
}

/*Banner Services*/

.banner-services-footer{
	background-color:$bg-color;
}
.banner-services-footer{
	border-color:$line-color;
}
#banner-services{
	border-color:$line-color;
}
.loadMoreContainer {
	text-align: center;
	margin: 30px 0;
}
.loadMoreBtn {
	display: inline-block;
	padding: 8px;
	border: 3px solid $primary-color;
	cursor: pointer;
	color: $primary-color;
	width: 260px;
}
.loadingSpin {
	display: none;
	float: left;
    font-size: 1.1em;
    transform-origin: 50% 50% 0;
    -webkit-transform-origin: 50% 50% 0;
    -ms-transform-origin: 50% 50% 0;
    position: relative;
    left: 0;
    top: 2px;
    color: $primary-color;
}

.loadMoreBtn:hover {
	border: 3px solid $primary-color;
	background: $primary-color;
	color: #FFF;
}
.loadMoreBtn:hover .loadingSpin {
	color: #FFF;
}

.normal-button, input.normal-button{
	width:100%;
}
/*Hamburguer Navigation*/
.pushy a:hover{
    background:$primary-color;
    text-decoration:none;
}
.mobile-dropdown i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.mobile-dropdown.dropdown-selected > i{
    background:$primary-color;
}

.subitems > ul#accordion > .subitems > .mobile-dropdown.dropdown-selected > i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.subitems > ul#accordion > .subitems > ul#accordion > .subitems > .mobile-dropdown.dropdown-selected > i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.subitems > ul#accordion > .subitems > ul#accordion > .subitems >  ul#accordion > .subitems .mobile-dropdown.dropdown-selected > i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.mobile-dropdown.dropdown-selected > .fa-chevron-down:before{
 content: "\f077";   
}
.header-bar-fixed .searchbox .text-input{
	border:2px solid $primary-color;
	  width: 100%;
	 font-size:14px;
}

/*Hamburguer Navigation end*/
.contact-data a{
	color:$primary-color;
}
#orderBoxMobile.dos .wrapper .row .fa{
	color:$primary-color;
}
#orderBoxMobile .checkout-link{
	background: $primary-color;
	color: $text-third-color;
	font-size: 18px;
	padding: 15px 35px;
	border: 0;
}
#orderBoxMobile .checkout-link:hover{
	background: rgba($primary-color, .2);
	color: $primary-color !important;
	border: 0;
}

/* FILTERS & CATEGORIES */
a.category-back {
    color: $primary-color;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}

/* new copyright */
.powered-by-text { color: $text-secondary-color; font-family: $secondary-font;}
#svg_brand .st0 { fill: $text-secondary-color; }
#svg_brand .st1 { fill: rgba($text-secondary-color, .8); }

/* MOBILE FILTERS */
#filters-column .filter-container {
	border-bottom: 1px solid $line-color;
}
#filters-column button {
	border: 1px solid $line-color;
}
.mobile-filters{
    position: relative;
    top: 0px;
    right: 0px;
    margin: 0 15px;
    font-weight: bold;
}
.mobile-filters i{
    font-size: 15px;
    padding: 8px;
    margin: 0px 6px 0px 0px;
    font-weight: normal;
    background:$primary-color;
    color:white;
}
.mobile-filters.dropdown-selected > .fa-chevron-down:before{
    content: "\f077";   
 }

@media(max-width: 991px){
    #filters-container {
        background: rgba(131, 131, 131, 0.1);
        padding: 15px 0;
        margin: 10px 15px 0 15px;
    }
    #toggle-filters { margin: 0 15px; }
}
@media(min-width: 992px){
    #show-filters { display: none; }
    #toggle-filters { display: block !important; }
}
