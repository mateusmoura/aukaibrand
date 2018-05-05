$back: {{ settings.background_color }};
$primary: {{ settings.brand_color }};
$secondary: {{ settings.background_color_secondary }};
$tertiary: {{ settings.brand_color_secondary }};
$txt: {{ settings.text_color }};

$fontlogo: {{ settings.font_logo | raw }};
$fonttxt: {{ settings.font_rest | raw }};
$fontnav: {{ settings.font_navigation | raw }};
$fonthead: {{ settings.font_headings | raw }};
$fontheadprod: {{ settings.font_headingsprods | raw }};
$fontbot: {{ settings.font_buttons | raw }};

$opac1: 0.1;
$opac2: 0.2;
$opac4: 0.4;
$opac6: 0.6;
$opac8: 0.8;

#wrapper-social {  background: rgba($secondary, $opac2); }
#wrapper-foot, .color-variants {  background: rgba($secondary, $opac1); }
#wrapper-pay {  background: $primary; }
#wrapper-legal { background: rgba($secondary, $opac8); color: rgba($back, $opac8) ; }
#wrapper-legal .top-page { border-color: $tertiary; color:$back; font-family: $fontbot; }
.powered-by, .powered-by a { color: rgba($back, $opac8) ; font-family: $fonttxt;  }
a.insta-variations { border: 2px solid rgba($txt, $opac1); float: left;}
a.insta-variations.selected { border: 2px solid $txt;}

body {
background: $back;
font-family: $fonttxt;
color: $txt;
}
#filters-column .size-filter{
color: $txt;
}
.sort-bar select {
    height: 39px;
}

.logo.text-only {
    font-family: $fontlogo;
    margin-top: 25px;
}

h1, h2, h3, h4, h5 {
    font-weight: bold;
}
p {
    font-weight: normal !important;
}
.badge {
    color: $txt;
    background: $back;
    font-size: 13px;
}
::selection {
background-color: $secondary;
color: $back;
}
pre {font-family: $fonttxt;}

a {  color: $txt; }

i.fa { color: $primary; }
.jThumbnailScroller i.fa { color: $txt; }
#wrapper-social a.soc-foot { border: 3px solid $primary; }

.searchbox input { color: $primary; background-color: $back; border: 2px solid $primary; }

input::-webkit-input-placeholder, textarea::-webkit-input-placeholder { color: $primary; }
input::-moz-placeholder, textarea::-moz-placeholder { color: $primary; }
input:-ms-input-placeholder, textarea:-ms-input-placeholder { color: $primary; }

#topper {  background-color: $secondary; }
#auth a, #auth span.divider {  color: rgba($back, $opac8); font-family: $fontnav; }
#auth a:hover {  color: $tertiary; }

.info-head a {  color: $primary; font-family: $fonthead; }

/*************** OFF VIEWPORT FILTER MENU ***************/
/********************************************************/

.mob-filter .filter-container {
    background-color: #fff;
    padding: 10px;
}

.mob-filter {
    width: 90%;
    float: left;
    height: 100%;
    position: fixed;
    overflow: hidden;
    top: 0;
    right: -100%;
    background: #f2f2f2;
    border-left: 1px solid #ccc;
    padding: 5%;
    z-index: 9999;
    -webkit-transition: 150ms ease-out all;
    transition: 150ms ease-out all;
}

.mob-filter .heading {
    position: absolute;
    top: 0;
    left: 0;
    width: 90%;
    height: 45px;
    border-bottom: 1px solid #ccc;
}

.mob-filter .heading span {
    position: absolute;
    top: 4px;
    right: 15px;
    width: 35px;
    height: 35px;
    border: 1px solid #ccc;
    cursor: pointer;
}

ul#filterMobOverlay {
    float: left;
    padding: 5%;
    width: 90%;
    margin: -19px 0 25px 0;
    background-color: #F2F2F2;
}

ul#filterMobOverlay li {
    height: 35px;
    border-bottom: 1px solid #ccc;
    line-height: 35px;
}

.filter-by-sort.mobile-sort,
.mob-filter-trigger {
    margin-right: 5px;
}




.product-details-overlay.overlay a.top {
    border: 3px solid $primary;
    font-family: $fonthead;
    color: $back !important;
    }
.product-details-overlay.overlay {
    background: rgba($txt, $opac8) !important;
    color: $back;
}
.product-details-overlay.overlay h3, .product-details-overlay.overlay h1 {
    font-family: $fonthead;
    color: $back;
    }
.product-details-overlay.overlay a.top:hover {
    color: $back !important;
    border: 3px solid $primary;
    color: $back !important;
    background-color: $primary !important;
}
.product-details-overlay.overlay a.top.just-link:hover {
    background-color: transparent !important;
    border-bottom: 3px solid $primary !important;
    color: $back !important;
}

.logo.text-only a {  color: $primary;   text-transform: capitalize; }

#wrap-welcome-message, .wrap-banner {
    background-color: $primary;
        p {
            color: $back;
            margin-bottom: 15px;}
        .headerBox h2 {
            color: $back;
            padding: 30px 5px 0 5px; }
        .headerBox a {
            background: $back; color: $primary; font-family: $fontnav; }
        .filter {
            background: $primary; }
        .filter.secondary {
            background: $tertiary; }
        .filter.none {
            background: transparent; }
}

.wrap-banner.default_font p, .wrap-banner.default_font h2 { color: $back; }
.wrap-banner.brand_font p, .wrap-banner.brand_font h2 { color: $primary; }
.wrap-banner.txt_font p, .wrap-banner.txt_font h2 { color: $txt; }

.wrap-banner.secondary {
            background: $tertiary; }
.wrap-banner.none {
            background: transparent; }
.cloud-zoom-big {
background-color: $back;
}

.fancybox-wrap {
background-color: $back;
border: 1px solid; border-color: rgba($secondary, $opac2);
}

#header .infobox,
#header .infobox a,
#footer,
#footer a{
color: $txt;
}

.sf-menu a, .sf-menu a:visited{
color: $secondary;
}

.sf-menu li:hover, .sf-menu li.sfHover,
.sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active{
color: rgba($secondary, $opac6);
}

.sf-menu li.selected a, .logo.text-only a, #header-slim .logo a {
color: $primary;
}
.logo.text-only a:focus {
    text-decoration: none;
}

#header, #header-slim { border-bottom: 1px solid; border-color: rgba($secondary, $opac2); background: $back; }

#navigation,
.sf-menu li{
background-color: $back;
}

#navigation,
.sf-menu ul{
}

.sf-menu li.selected ul li a, ul.foot-nav li a{
color: $secondary;
}

ul.foot-nav li a{
color: $txt;
}
ul.foot-nav li a:hover {
color: $secondary;
opacity: $opac6;
}

.productContainer .descriptioncol .attributeLine select option {
    color: $txt;
}

#ls_cart_widget {  border-color: $primary; }
#ls_cart_widget .cart-summary a, #ls_cart_widget .cart-summary, , #ls_cart_widget .cart-summary span, #ls_cart_widget .cart-summary small { color: $secondary;  font-family: $fonthead; }
#ls_cart_widget .cart-summary span.item-img{ background: $primary; }
#ls_cart_widget .fa.fa-shopping-cart { color: $back; }
#ls_cart_widget .cart-summary span.items { color: $primary; font-weight: bold;}

.crumbPaginationContainer .pagination, .crumbPaginationContainer .pagination a {
font-family: $fonthead;
color: $txt;
}

.crumbPaginationContainer .pagination .page-number.selected {
color: $secondary;
}


.sf-menu a, .col-foot a, ul.foot-nav li a {
font-family: $fontnav;
}

button, select, textarea {
font-family: $fontbot;
}

.social-title .header {
    line-height: 40px;
    font-family: $fonthead;
    font-size: 20px;
    font-weight: 300;
    text-transform: uppercase;
    color: $txt;
    border-bottom: 1px solid rgba($secondary, $opac2);
}

.dest-list h2, .contact-dates h2 { color: $txt; font-family: $fonthead; border-color: rgba($secondary, $opac2);  }
.dest-list.line-sec { border-color: rgba($secondary, $opac2);  }
.max_installments { font-family: $fontheadprod; color: $tertiary; font-weight: normal;}
.dest-gral .bajada .title, .dest-gral .bajada .title a, .dest-gral .bajada .price, .cart-contents .name, .contact a, .contact_form .field label, .dest-sec .bajada .title, .dest-sec .bajada .title a, .dest-sec .bajada .price {
color: $txt;
font-family: $fontheadprod;
}
.installments {
    display: block;
    position: relative;
    float: left;
    width: 100%;
        li[id^="method"] {
            a {
            color: $txt;
            font-weight: bold;
            border-radius: 0;
            }
        }
        li[id^="method"].active {
            a {
                color: $primary;
            }
        }
        span[id^="installment"] {
            display: block;
            width: 100%;
            padding: 3px 0;
        }
}
.quick-content .installments span[id^="installment"], .quick-content .installments span#installments_number {
  display: inline-block;
  width: auto;
}

#wrapper-foot .subheader { font-size: 13px; font-weight: 700; letter-spacing: 1px; line-height: 22px; margin-bottom: 20px; text-transform: uppercase; font-family: $fonthead; color: $txt; }
.dest-list h2, .contact-dates h2 { border-color: rgba($secondary, $opac2); color: $txt; font-family: $fonthead; }
.dest-list h2 { line-height:normal; padding-bottom:5px; border-bottom: 1px solid; font-size: 16px; font-weight: 600; letter-spacing: 1px; text-transform: uppercase; }

.dest-list h2, .contact-dates h2 { color: $txt; font-family: $fonthead; border-color: rgba($secondary, $opac2);  }
.dest-list.line-sec { border-color: rgba($secondary, $opac2);  }

.dest-gral .bajada .title, .dest-gral .bajada .title a, .dest-gral .bajada .price, .cart-contents .name, .contact a, .contact_form .field label, .dest-sec .bajada .title, .dest-sec .bajada .title a, .dest-sec .bajada .price{ color: $txt; font-family: $fontheadprod;}

.dest-gral .bajada .category, .dest-sec .bajada .category { color: $tertiary; font-family: $fontnav; }

.dest-gral .bajada .price-compare span, .dest-sec .bajada .price-compare span { color: rgba($txt, $opac6); }
.dest-gral .bajada .price { color: $primary ;}

.product-details-overlay { background: rgba($secondary, $opac6); }
.product-details-overlay a, .product-details-overlay span { font-family: $fontnav; color: $back;}
.product-details-overlay a:hover {color: $primary;}
.product-details-overlay > div a { color: $back; }
.product-details-overlay > div:first-child, .product-details-overlay.landscape > div:first-child { border-bottom: 1px solid $back; }

.offer, .free-shipping { background: $primary }
.out-of-stock { background: rgba($secondary, $opac4) }
.offer p, .out-of-stock p, .offer p, .circle.free-shipping p { font-family: $fonthead; color: $back; }

/*
#wrapper-social a.soc-foot:hover { background-color: $primary; }
*/
#wrapper-foot h1 { font-family: $fonthead; color: $secondary; }
#wrapper-foot p { font-family: $fontnav; color: $primary; }
#newsletter input[type="news"], #newsletter input[type="text"], #newsletter input[type="email"],
#newsletter-popup input[type="news"], #newsletter-popup input[type="text"], #newsletter-popup input[type="email"],
.account-form-wrapper input[type="text"], .account-form-wrapper input[type="email"], .account-form-wrapper input[type="password"] { color: $primary; border-color: $primary; background-color: $back; }
input, button, select, textarea {  font-family: $fonttxt; }

#newsletter input.btn, #newsletter-popup input.btn, .account-form-wrapper input.btn { background: $primary; color: $back; font-family: $fontbot; }
button.btn i.fa { color: $back;  }
#newsletter input:hover.btn, #newsletter-popup input:hover.btn,.account-form-wrapper input:hover.btn, #category-page .button-filt:hover { background: rgba($secondary, $opac6);   }
#wrapper-foot a:hover.soc-foot { background-color: rgba($secondary, $opac4);}
ul#filterMobOverlay li:hover { background: rgba($secondary, $opac4); border: 0; color: $back; }
.mob-filter .filter-container h4, #mobFilterMenu .other-filter { color:  rgba($secondary, $opac4); font-family: $fontbot; }
#newsletter-popup .loading-modal{ color: $primary;}

div#newsModal{
    background: $back;
}

#breadcrumb, #breadcrumb a, .mob-filter .heading h4 { font-family: $fonthead; color:  rgba($secondary, $opac4); font-weight: normal; }

#breadcrumb span.last { color: $secondary; }
#prod-page .title h2 {font-family: $fontheadprod; color: $txt; word-break: break-word;  }
#prod-page .title h1 {font-family: $fontheadprod; color: $txt;  }
.title h1, .title h2 {font-family: $fontheadprod; color: $txt;  }
.title h1 { font-family: $fonthead; font-size: 34px; font-weight: 400; margin-bottom: 15px; line-height: 40px; }
.title h2 {font-family: $fontheadprod; color: $txt;  }

.productContainer .descriptioncol .price-holder{ }
.productContainer .descriptioncol .price { font-family: $fonthead; color:  $primary ; }
.productContainer .descriptioncol .price-compare span{ color:  rgba($txt, $opac4); }
.user-content .quick a, .installments p.price-compare-txt a { color:  $tertiary; font-family: $fontbot; }

.shareLinks { border-top: 1px solid rgba($secondary, $opac2); border-bottom: 1px solid rgba($secondary, $opac2); }

.button, .submit_button { color: $back; background: $primary;  font-family: $fontbot; border: 3px solid $primary;  }

.button:hover,.submit_button:hover { color: $back; background: $primary; }
.nostock:hover{opcaity:0.8;}
.button#change-quantities, #shipping-calculator-form .button, a.secondary, .button.secondary, .product-details-overlay.overlay a.top.secondary, .addresses-btn a { color: $tertiary; background: $back;  border: 3px solid $tertiary;  }
.button#change-quantities:hover, #shipping-calculator-form .button:hover, .button.secondary:hover, a.secondary:hover, .product-details-overlay.overlay a.top.secondary:hover { color: $back; background: $tertiary !important; }
#shipping-calculator-form { margin-top: 40px;}
.button, .submit_button { color: $primary; background: $back;  font-family: $fontbot; border: 3px solid $primary;  }
.button:hover,.submit_button:hover { color: $back; background: $primary; }
.button#change-quantities, #shipping-calculator-form .button, a.secondary, .button.secondary, .product-details-overlay.overlay a.top.secondary { color: $tertiary; background: $back;  border: 3px solid $tertiary;  }
#button-installments:hover {
background: none !important;
color: $tertiary;
opacity: 0.8;
}

 #shipping-calculator li .shipping-option i{
 display:none;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option {
    border:2px solid $primary;
 }
 #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: $primary;
}
 #shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: $primary;
  position: absolute;
  right: 10px;
  top: 10px;
}

#button-installments:focus {
    outline: none;
}
.button#change-quantities:hover, #shipping-calculator-form .button:hover, .button.secondary:hover, .button.secondary i.fa a.secondary:hover, .product-details-overlay.overlay a.top.secondary:hover, .addresses-btn a:hover { color: $back; background: $tertiary !important; }

.user-content { color: rgba($txt, $opac8); }
.user-content a {  color: $primary; }
.user-content a:hover { color: $primary; }
.user-content a:active { color: $primary; }

.headerBox { border-color: rgba($secondary, $opac2); color: $txt; }
.headerBox-List h1, .headerBox-Page h1 { font-size: 34px; font-weight: 300; letter-spacing: 1px; padding: 40px 0 20px 5px; font-family: $fonthead; }

.productContainer .descriptioncol .attributeLine label, .productContainer .descriptioncol .attributeLineQuickshop label{ color: rgba($secondary, $opac8); font-family: $fonttxt; }
label .number { color: rgba($secondary, $opac8); font-family: $fonttxt; background-color: rgba($secondary, $opac1); }
.productContainer .descriptioncol .attributeLine label span,.productContainer .descriptioncol .attributeLineQuickshop label span {color: rgba($txt, $opac6)}
.productContainer .descriptioncol .attributeLine select, .sort-bar select, .productContainer .descriptioncol .attributeLine input, .productContainer .descriptioncol .attributeLineQuickshop input, .productContainer .descriptioncol .attributeLineQuickshop select { color: $txt; border: 3px solid rgba($secondary, $opac1); font-family: $fontbot; background: none; }

.productContainer .descriptioncol .quantity input { color: rgba($txt, $opac8); border: 3px solid rgba($secondary, $opac1); font-family: $fontbot; background: $back; }
.productContainer .descriptioncol .ui-icon-triangle-1-s, .productContainer .descriptioncol .ui-icon-triangle-1-n { background-color: rgba($secondary, $opac1); }


.headerBox-List, .headerBox-Page, #content-page { border-color:  rgba($secondary, $opac6); color: $txt; }
.headerBox h2, .headerBox-Page h2, .headerBox-List h2, .headerBox-List h1 {
color: $txt;
font-family: $fonthead;
}

.headerBox-Error { border-color: $primary; }
.headerBox-Error h1 { color: $primary; font-family: $fonthead; }
.headerBox-Error h2 { color: $secondary; font-family: $fonthead; border-color: $primary; }
.headerBox-Error p, .btn.btn-link { color: $txt; font-family: $fonttxt; }

/*** password Page ***/

.password-page .password-container.password-message h2{
    font-family: $fonthead;
    border-color: $primary;
    color: $secondary;
    border:3px solid $primary;
}
.password-page .password-container.password-icon .password-svg{
    fill:$primary;
}
.password-page .password-container #wrapper-foot ul.foot-nav li{
    border-right:2px solid $primary;
}
.sf-menu ul { background: $back; border: 1px solid; border-color: rgba($secondary, $opac2); }

#contact-page  { background: rgba($secondary, $opac8); font-family: $fonthead; }
#contact-page h1, #contact-page h2 { color: $back; font-family: $fonthead; }
#contact-page p { color: rgba($back, $opac6); font-family: $fonttxt; }

.contact-dates li, .contact-dates li a { color: $secondary; }

.contact_form .field label{ color: rgba($txt, $opac6) }

#checkoutForm .form-field input,.contact_form .field input,.contact_form .field textarea, .prod-consult label, .prod-consult label a{ border-color: rgba($back, $opac6); font-family: $fonttxt; color: $back; }
#checkoutForm .form-field input::-webkit-input-placeholder,.contact_form .field input::-webkit-input-placeholder,.contact_form .field textarea::-webkit-input-placeholder { color: $back; }
#checkoutForm .form-field input::-moz-placeholder,.contact_form .field input::-moz-placeholder,.contact_form .field textarea::-moz-placeholder { color: $back; }
#checkoutForm .form-field input:-ms-input-placeholder,.contact_form .field input:-ms-input-placeholder,.contact_form .field textarea:-ms-input-placeholder { color: $back; }

.contact_form .field input.submit_button { background-color: rgba($back, $opac6); color: $back;  font-family: $fontbot;   }
.contact_form .field input.submit_button:hover { background: $primary; }

#shoppingCartPage .cart-contents .firstrow {
    color: $secondary;
    font-family: $fonthead;
    padding-bottom: 36px;
    border-bottom: 1px solid rgba($secondary, $opac6);
}
#cart-form .shipping-calculator li input[type="radio"]:checked + .shipping-option, #ajax-cart-shipping .shipping-calculator li input[type="radio"]:checked + .shipping-option {
    border: 2px solid $primary;
}
#shoppingCartPage .cart-contents .total-price { border-color: rgba($txt, $opac2);  color: $primary; font-family: $fonthead; }
#shoppingCartPage .cart-contents .productrow .name {  font-family: $fontheadprod; }
#shoppingCartPage .cart-contents .productrow li { font-family: $fonthead; }
#shoppingCartPage .cart-contents .productrow li.col-subtotal { font-family: $fonthead; color: $primary; }

#shoppingCartPage .cart-contents .productrow .col-quantity input, #shipping-calculator input {	font-family: $fonttxt; border: 3px solid rgba($secondary, $opac1); color: $txt; height: 40px; background: none; }
#shoppingCartPage .emptyCart a{	color:$txt; }

@media (max-width: 769px) {
#shoppingCartPage .cart-contents .productrow { border-bottom: 1px solid rgba($secondary, $opac2); position:relative;}

}

#checkoutForm .notice {	color: $txt; }
.error { color: $secondary; }
.success { 	color: $primary; }
#checkoutForm .form-field .validation-error { color: $primary; }

.contact-ok { font-family: $fonthead; color: $primary; }
.contact-error{	font-family: $fonthead; color: $tertiary; }
.alert{font-family: $fonthead;}
.social-title h1 { 	color: $txt; }
.social-title h1 { 	border-bottom: 1px solid; border-color: rgba($secondary, $opac2); }

.cloud-zoom-big { background-color:$back; }
.cloud-zoom-loading { color:$back; border: 1px solid; border-color: rgba($secondary, $opac2); background:$txt; }
.siteBarContainer { border: 1px solid; border-color: rgba($secondary, $opac2); color:$txt; }

.user-content h1 { font-family: $fonthead; color:$primary; }

.user-content h2, .user-content h3, .user-content h4, .user-content h5 { font-family: $fonthead; color:$secondary; }

.no-products-txt p { color:$txt; }
.no-products-txt a { color:$secondary; }

.no-products-overlay { background: $back; }

#shipping-calculator { }
#shipping-calculator input:checked ~ label { background: $back; color: $txt; }
#invalid-zipcode { color: $txt; }

.fancybox-overlay { background: rgba($secondary, $opac8); }
#fancybox-error { color: $txt; font: normal 12px/20px $fonttxt; }
.fancybox-title-inside { color: $txt; }
.fancybox-title-outside, .fancybox-title-over, #fancybox-title-float-main { color: $back; }
#fancybox-wrap, .fancybox-title-inside { background: $back; }
.fancybox-title-outside-wrap { color: $back; }
.fancybox-title-float-wrap .child, .fancybox-title-over-wrap { color: $back; background: $secondary; }

.jThumbnailScroller .jTscrollerNextButton, .jThumbnailScroller .jTscrollerPrevButton { background-color: $back; }

#checkoutForm .form-field input:focus,.contact_form .field input:focus,.contact_form .field textarea:focus{ border-color: $back; }

#ls_cart_notification .content, #ls_cart_notification .loading{ background: $back; border: 1px solid $secondary; }

.magnifying-glass
{
font-size: 10em; // This controls the size
display: inline-block;
width: 0.4em;
height: 0.4em;
border: 0.1em solid $primary;
position: relative;
border-radius: 0.35em;
}
.magnifying-glass::before
{
content: "";
display: inline-block;
position: absolute;
right: -0.25em;
bottom: -0.1em;
border-width: 0;
background: $primary;
width: 0.35em;
height: 0.08em;
-webkit-transform: rotate(45deg);
-moz-transform: rotate(45deg);
-ms-transform: rotate(45deg);
-o-transform: rotate(45deg);
}
p .newsletter{color:$txt;}
/**
* BxSlider v4.0 - Fully loaded, responsive content slider
* http://bxslider.com
*
* Written by: Steven Wanderski, 2012
* http://stevenwanderski.com
* (while drinking Belgian ales and listening to jazz)
*
* CEO and founder of bxCreative, LTD
* http://bxcreative.com
*/


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

/** THEME
===================================*/
.bx-wrapper .bx-viewport {
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    background: $back;
}
.bx-viewport {
    height: auto !important;
    max-height: 500px !important;
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
    background: url({{ 'js/bxslider/images/bx_loader.gif' | static_url }}) center center no-repeat $back;
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2000;
}
.slider-wrapper .fa-circle-o-notch{
    position: absolute;
    top: 50%;
    margin-left:-25px;
    margin-top:-45px;
    left: 50%;
    z-index: 99999;
    font-size: 40px;
    color: $primary;
}
/* PAGER */

.bx-wrapper .bx-pager {
    text-align: center;
    font-size: .85em;
    font-family: Arial;
    font-weight: bold;
    color: $txt;
    padding-top: 20px;
}

.bx-wrapper .bx-pager .bx-pager-item,
.bx-wrapper .bx-controls-auto .bx-controls-auto-item {
    display: inline-block;
    *zoom: 1;
    *display: inline;
}

.bx-wrapper .bx-pager.bx-default-pager a {
    background: $secondary;
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
    background: $primary;
}

/* DIRECTION CONTROLS (NEXT / PREV) */
.bx-controls-direction{
  font-size: 24px;
}
.bx-controls-direction i.fa{
 padding: 10px 10px 9px 6px;
 background-color:rgba($primary, $opac8);
 color:white;
}
.bx-controls-direction i.fa:hover{
 background-color:rgba($primary, $opac6);
}
.bx-controls-direction .fa-chevron-right{
    padding-left:10px!important;
}
.bx-wrapper .bx-prev {
    left: 10px;
    background: none;
}

.bx-wrapper .bx-next {
    right: 10px;
    background: none;
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
    width: 40px;
    height: 50px;
    z-index: 9997;
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
    background: url({{ 'js/bxslider/images/controls.png' | static_url }}) -86px -11px no-repeat;
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
    background: url({{ 'js/bxslider/images/controls.png' | static_url }}) -86px -44px no-repeat;
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
    background: $txt;
    background: rgba(80, 80, 80, 0.75);
    width: 100%;
}

.bx-wrapper .bx-caption span {
    color: $back;
    font-family: Arial;
    display: block;
    font-size: .85em;
    padding: 10px;
}

/* CART */
$base-text-color: {{ settings.text_color }};

#shoppingCartPage .cart-contents .productrow {
    border-bottom: 1px solid;
    border-color: rgba($base-text-color, .2 );
}

/* SERVICES BANNER */
#banner-services{  background: rgba($secondary, $opac1);}
#banner-services h4{font-family: $fontheadprod;}
#banner-services .span4:not(:last-child) {
    border-right: 1px solid;
    border-color:rgba($secondary, $opac1);
}
#loadMoreBtn .fa.fa-circle-o-notch.fa-spin.loadingSpin {
    color: $tertiary;
}
#loadMoreBtn:hover .fa.fa-circle-o-notch.fa-spin.loadingSpin {
    color: $back;
}
.menu-btn i{
  font-size: 24px;
  padding: 5px 7px;
  color: white;
  border: 1px solid rgba(255, 255, 255, 0.44);
}
/*Hamburguer Navigation*/
.pushy a:hover{
    background:$primary;
    text-decoration:none;
}
.mobile-dropdown i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.mobile-dropdown.dropdown-selected > i{
    background:$primary;
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
/*Hamburguer Navigation end*/
/******MOBILE BREAKPOINTS*********/
@media (max-width: 769px) {
    .homeslider{
        float: left;
    }
    .bx-wrapper{
      margin: 0 auto 0px;
    }
    .slider-wrapper .fa-circle-o-notch{
        margin-top: -15px;
    }
    #wrapper-social a.soc-foot, .password-page .password-container #wrapper-social a.soc-foot{
     border: 2px solid $primary;
    }
    .title h1{
        font-size: 24px;
        text-align:center;
        margin-bottom:5px;
    }
    .headerBox-List h1, .headerBox-Page h1, .headerBox h2, .headerBox-Page h2, .headerBox-List h2{
        font-size: 22px;
        text-align:center;
    }
    #wrapper-legal .top-page{
        background-color:$tertiary;
    }
    .bx-controls-direction {
      font-size: 16px;
    }
    .bx-wrapper .bx-controls-direction a{
      width: 23px;
    }
    .bx-controls-direction i.fa{
      padding: 10px 7px 9px 4px;
    }
    .bx-controls-direction .fa-chevron-right {
      padding-left: 6px !important;
      padding-right: 5px!important;
    }
    #ls_cart_widget{
        margin-left: auto;
        margin-right: auto;
        display: block;
        background:none;
    }
    #ls_cart_widget .cart-summary span.items{
      width: auto;
      margin-right:10px;
    }
}
@media (max-width: 500px){
    #wrapper-legal .top-page{
        background-color:$tertiary;
    }
    .slider-wrapper .fa-circle-o-notch{
        margin-bottom: -8px;
        font-size: 30px;
    }
    .password-page .password-container #wrapper-foot ul.foot-nav li{
        border-right:0px;
    }
}
/**Account Orders**/
.customer-box .personal-data a, .customer-box .addresses a{
    color:$primary;
    font-weight:bold;
}
#orderBoxMobile.dos .wrapper .row .fa{
    background-color:$primary;
}

/* FILTERS & CATEGORIES */
a.category-back {
    color: $primary;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}
.sort-bar span.mobile-sort,
#category-page .button-filt {
    background: $tertiary;
    color: $back;
}
.sort-bar span.mobile-sort i.fa {
    color: $back;
}
.sort-bar span.mobile-sort:hover,
#category-page .button-filt:hover {
    background: rgba($secondary, $opac6);
}
.sort-bar span.mobile-sort:focus,
#category-page .button-filt:focus {
    background: $tertiary;
    color: $back;
}
/* new copyright */
#svg_brand .st0 { fill: $back; }
#svg_brand .st1 { fill: rgba($back, $opac8); }
