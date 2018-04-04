$back: {{ settings.background_color }};
$primary: {{ settings.brand_color }};
$secondary: {{ settings.background_color_secondary }};
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
$opac9: 0.9;

.mobile-dropdown i{
    color: $primary;
}

#wrapper-foot {
    background: rgba($secondary, $opac2)
}

#wrapper-legal {
    background: rgba($secondary, $opac8);
    color: $back;
}

#wrapper-legal a {
    color: $back
}

body {
    background: $back;
    font-family: $fonttxt;
    color: $txt;
}

::selection {
    background-color: $secondary;
    color: $back;
}

pre {
    font-family: $fonttxt
}

a {
    color: $txt
}
.badge {
    color: $txt;
    background: $back;
    font-size: 13px;
}

.searchbox input, .infinite-scroll-loading {
    color: $txt;
}
.searchbox {
    background-color: rgba($back, $opac4);
}

#topper {
    background-color: $secondary
}

#auth a, .searchbox .text-input, .searchbox i.fa.fa-search, .searchbox input::-webkit-input-placeholder {
    color: $back
}

#wrap-welcome-message {
    background-color: $secondary
}

#wrap-welcome-message  .headerBox h2 {
    color: $back
}
/*Password page*/
.password-page .password-container.password-icon .password-svg{
    fill:rgba($secondary, $opac8);
}
.cloud-zoom-big {
    background-color: $back
}

#fancybox-wrap {
    background-color: $back;
    border: 1px solid;
    border-color: rgba($secondary, $opac2);
}

#header .infobox, #header .infobox a, #footer, #footer a {
    color: $txt
}
#no-logo, .no-logo.news a{
    color: $primary;
    font-family: $fontlogo;
}

.sf-menu a, .sf-menu a:visited {
    color: $txt
}

.sf-menu li:hover, .sf-menu li.sfHover, .sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active {
    color: $txt;
    opacity: 0.98;
}

.sf-menu li.selected a {
    color: $txt
}
ul li ul li.sfHover {
    width: 94% !important;
}

.sf-menu ul {
    background: $back
}

#header {
    border-bottom: 1px solid;
    border-color: rgba($secondary, $opac2);
}

#navigation, .sf-menu li {
    background-color: $back
}

#navigation, .sf-menu ul {

}

.sf-menu li.selected ul li a, ul.foot-nav li a {
    color: $txt
}

ul.foot-nav li a {
    color: $secondary
}

ul.foot-nav li a:hover {
    color: $secondary;
    opacity: $opac8;
}

.sf-menu li.selected ul li a:hover {

}

#ls_cart_widget {

}

#ls_cart_widget .cart-summary {
    background-color: $primary
}

#ls_cart_widget .cart-summary:hover {
    opacity: $opac8
}

#ls_cart_widget .cart-summary a, #ls_cart_widget .cart-summary, #ls_cart_widget .cart-summary span {
    color: $back;
    font-family: $fontnav;
}

.crumbPaginationContainer .pagination, .crumbPaginationContainer .pagination a {
    font-family: $fonthead;
    color: $txt;
    font-size:22px;
}

.crumbPaginationContainer .pagination .page-number.selected {
    color: $secondary
}

.headerBox h2, .headerBox-Page h2, .headerBox-List h2, .password-page .password-container.password-message h2 {
    color: $txt;
    font-family: $fonthead;
}

.sf-menu a, .col-foot a, ul.foot-nav li a {
    font-family: $fontnav
}

button, select, textarea {
    font-family: $fontbot
}

.dest-gral .bajada .title, .dest-gral .bajada .title a, .dest-gral .bajada .price, .cart-contents .name, .contact a, .contact_form .field label {
    color: $txt;
    font-family: $fontheadprod;
}

.prod-sel p {
    color: $txt;
    font-family: $fontheadprod;
}

.prod-sel p a {
    color: $primary;
    font-family: $fontheadprod;
}

.dest-gral .bajada .price-compare span {
    color: rgba($txt, $opac6);
    border-right: 1px solid rgba($txt, $opac6);
}

.dest-gral .bajada .price {
    color: $primary
}

.product-details-overlay {
    background: rgba($primary, $opac9)
}

.product-details-overlay a, .product-details-overlay span {
    font-family: $fontnav;
    color: $back;
}

.product-details-overlay > div a {
    color: $back
}

.product-details-overlay > div:first-child, .product-details-overlay.landscape > div:first-child {
    border-bottom: 1px solid $back
}

.offer-product, .free-shipping-product, .out-of-stock-product {
    font-family: $fontnav;
    color: $back;
    background: $secondary;
    text-align: center;
    font-size: 13px;
}

#wrapper-foot h4 {
    font-family: $fontnav;
    color: $secondary;
}

#newsletter input[type="news"], #newsletter input[type="text"], #newsletter-popup input[type="news"], #newsletter-popup input[type="text"], .password-password input[type="password"] {
    background: rgba($back, $opac6);
    color: $secondary;
}
#newsModal{
    background: $back;
}
input, button, select, textarea {
    font-family: $fonttxt
}

#newsletter input.btn, #newsletter-popup input.btn, .password-password .btn {
    background: $secondary;
    color: $back;
}

#newsletter input:hover.btn, #newsletter-popup input:hover.btn {
    background: rgba($secondary, $opac6)
}

#wrapper-foot a.soc-foot, .span6.contact-social i.fa, .password-page .password-container.password-social a.soc-foot i {
    background-color: rgba($secondary, $opac2)
}

#wrapper-foot a.soc-foot i.fa, .span6.contact-social i.fa, .password-page .password-container.password-social a.soc-foot i {
    color: $secondary;
}

#wrapper-foot a:hover.soc-foot {
    background-color: rgba($secondary, $opac4)
}

ul.foot-contact {
    border-top: 1px solid $secondary;
    border-bottom: 1px solid $secondary;
}

ul.foot-contact li, .foot-contact a.email {
    border-color: $secondary;
    color: $secondary;
}

#breadcrumb, #breadcrumb a {
    font-family: $fontnav;
    color: $secondary;
}

#prod-page .title h1 {
    font-family: $fontheadprod;
    color: $txt;
}

.title h1 {
    font-family: $fonttxt;
    color: $txt;
}

#shop_bar .price-display {
    font-family: $fonttxt
}

#shop_bar .price-display .price {
    color: $primary
}

#shop_bar .price-display .price-compare {
    color: rgba($txt, $opac4)
}

.productContainer .descriptioncol .price {
    color: $primary
}

.productContainer .descriptioncol .price-compare span {
    color: rgba($txt, $opac4)
}

.user-content a.quick {
    color: $secondary;
    font-family: $fontbot;
}

.user-content a.quick:hover {
    color: $primary;
    font-family: $fontbot;
}

.button, .submit_button, .addresses-btn a {
    color: $back;
    background: $primary;
    font-family: $fontbot;
}

.button:hover, .submit_button:hover {
    opacity: $opac6
}
input[disabled] {
    background: $primary;
    opacity: 0.6;
    cursor: initial;
}

.user-content {
    color: rgba($txt, $opac6)
}

.user-content a {
    color: $primary
}

.user-content a:hover {
    color: $primary
}

.user-content a:active {
    color: $primary
}

.headerBox {
    border-color: rgba($secondary, $opac2);
    color: $txt;
}

#shop_bar .attributeLine label, .attributeLineQuickshop label{
    color: rgba($secondary, $opac8)
}

.productContainer .descriptioncol .attributeLine label, .productContainer .descriptioncol .attributeLineQuickshop label {
    color: rgba($secondary, $opac8)
}

.headerBox-List, .headerBox-Page {
    border-color: rgba($secondary, $opac2);
    color: $txt;
}

.sf-menu ul {
    background: $back;
    border: 1px solid;
    border-color: rgba($secondary, $opac2);
}

.contact-dates, .contact-social {
    border-color: rgba($secondary, $opac4)
}

#contact-page h2, .contact-dates h3, .contact-social h3 {
    color: $secondary;
    font-family: $fonthead;
}

.contact-dates li, .contact-social li {
    color: $secondary
}

.contact-dates li span, .contact-social li span {
    color: rgba($txt, $opac6)
}

.contact-dates li span a {
    color: $txt
}

.contact-social li a {
    color: rgba($txt, $opac6)
}
.contact-social li a:hover {
    color: $secondary;
    text-decoration: none;
}
.contact-social li a .icon {
    background-color: $secondary
}

.contact-social li a:hover .icon {
    background-color: rgba($secondary, $opac6)
}

.contact_form .field label {
    color: rgba($txt, $opac8)
}

#checkoutForm .form-field input, .contact_form .field input, .contact_form .field textarea {
    border-color: rgba($secondary, $opac4)
}

.contact_form .submit_button, .contact_form .field input.submit_button {
    background-color: $secondary;
    color: $back;
    font-family: $fontbot;
}
.continue-buying, #change-quantities {
    background-color: $secondary;
    color: $back;
    font-family: $fontbot;
}
.continue-buying:hover, #change-quantities:hover {
    color: $back;
}

#shoppingCartPage .cart-contents .firstrow {
    border-color: rgba($txt, $opac2);
    color: $secondary;
}

#shoppingCartPage .cart-contents .subtotal-price {
    color: $primary;
    font-family: $fonthead;
    background: rgba($txt, .1);
}

#shoppingCartPage .cart-contents .total-price {
    border-color: rgba($txt, $opac2);
    color: $primary;
    font-family: $fonthead;
    background: rgba($txt, .1);
}

#shoppingCartPage .cart-contents .productrow {
    border-color: rgba($txt, $opac2);
}

#shoppingCartPage .cart-contents .productrow .name {
    font-family: $fontheadprod
}

#shoppingCartPage .cart-contents .productrow li span {
    font-family: $fonthead
}

#cart-page #shoppingCartPage form#cart-form .productrow .col-quantity .span6.qty button{
    color: $secondary;
}
#cart-page #shoppingCartPage form#cart-form .productrow .col-quantity .span6.qty button i {
    color: $secondary;
}
#cart-page #shoppingCartPage form#cart-form .productrow .col-quantity .span6.input-qty input{
    color: $txt;
    border:1px solid $secondary;
}
#shoppingCartPage .cart-contents .productrow .col-quantity input, #shipping-cep, #newsletter input[type="news"], #newsletter input[type="text"], #newsletter-popup input[type="news"], #newsletter-popup input[type="text"],#shop_bar .attributeLine select, .productContainer .descriptioncol .attributeLine select, .productContainer .descriptioncol .attributeLineQuickshop select, .productContainer .descriptioncol .attributeLineQuickshop input, .password-password input[type="password"] {
    font-family: $fonthead;
    border: 1px solid;
    border-color: rgba($secondary, $opac8);
    color: $secondary;
    background: rgba($secondary, $opac1);
}
#shop_bar .attributeLine select option, .productContainer .descriptioncol .attributeLine select, .productContainer .descriptioncol .attributeLineQuickshop select, .productContainer .descriptioncol .attributeLineQuickshop input{
    color: #999;
}
.productContainer .descriptioncol .attributeLineQuickshop label .number {
background: rgba($secondary, $opac2);
}

#shoppingCartPage .emptyCart a {
    color: $primary;
    text-decoration:underline;
}

#checkoutForm .notice {
    color: $txt
}

.error {
    color: $secondary
}

.success {
    color: $primary
}

#checkoutForm .form-field .validation-error {
    color: $primary
}

.contact-ok {
    color: $primary
}

.contact-error {
    color: $secondary
}

.social-title h2 {
    color: $txt
}

.social-title h2 {
    border-bottom: 1px solid;
    border-color: rgba($secondary, $opac2);
}

.cloud-zoom-big {
    background-color: $back
}

.cloud-zoom-loading {
    color: $back;
    border: 1px solid;
    border-color: rgba($secondary, $opac2);
    background: $txt;
}

.siteBarContainer {
    border: 1px solid;
    border-color: rgba($secondary, $opac2);
    color: $txt;
}

.user-content h1, .user-content h2, .user-content h3, .user-content h4, .user-content h5 {
    font-family: $fonthead;
    color: $primary;
}

#shipping-calculator {
    border-bottom: 1px solid rgba($secondary, $opac2)
}

#shipping-calculator li .shipping-option i{
 display:none;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border:2px solid $secondary;
    width: 100%;
 }
 #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: $txt;
}
 #shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: $secondary;
  margin-top: 8px;
  margin-right: 0px;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option img{
  -webkit-filter: initial;
  filter:initial;
}

#shipping-calculator input:checked ~ label {
    background: $back;
    color: $txt;
}

#shipping-calculator i.fa {
    font-size: 1em;
    margin-right: 8px;
    width: 24px;
}

#invalid-zipcode {
    color: $txt
}

#fancybox-error {
    color: $txt;
    font: normal 12px/20px $fonttxt;
}

.fancybox-title-inside {
    color: $txt
}

.fancybox-title-outside, .fancybox-title-over, #fancybox-title-float-main {
    color: $back
}

.fancybox-wrap, .fancybox-title-inside, .fancybox-skin {
    background: $back
}
textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {
    background: rgba($secondary, $opac1);
    color: $txt; 
    border-radius: 0;
}
#checkoutForm .form-field input:focus, .contact_form .field input:focus, .contact_form .field textarea:focus {
    background: rgba($back, $opac6);
    color: $secondary;
}

#ls_cart_notification .content, #ls_cart_notification .loading {
    background: $back;
    border: 1px solid $secondary;
}

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
.slider-wrapper .bx-wrapper {
    margin: 0 auto 20px;
}
.bx-wrapper img {
    max-width: 100%;
    display: block;
}

/** THEME
===================================*/

.bx-wrapper .bx-viewport {
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
    margin-top: -55px;
    left: 50%;
    z-index: 99999;
    font-size: 40px;
    color: $secondary;
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
.bx-wrapper .bx-pager.bx-default-pager a.active, bx-next i.fa:hover {
    background: $primary;
    opacity: 0.8;
}

/* DIRECTION CONTROLS (NEXT / PREV) */

.bx-wrapper .bx-prev {
    left: 20px;
}

.bx-wrapper .bx-next {
    right: 20px;
    display: inline-block;
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
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
    z-index: 999;
    font-size: 35px;
    color: $secondary;
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

button#calculate-shipping-button, .addresses-btn a{
    background: $secondary;
}
#button-installments {
    color: $secondary;
    text-decoration: underline;
}
a#button-installments:hover, a#button-installments:focus { color: $secondary;  }
.installments {
    color: $txt;
    opacity: 0.8;
}
.max_installments {
    color: $txt;
}
.max_installments strong{
    color: $secondary;
}
.installments {
    display: block;
    position: relative;
    float: left;
    width: 100%;
        li[id^="method"] {
            a {
            color: $primary;
            font-weight: bold;
            border-radius: 0;
            }
        }
        span[id^="installment"] {
            display: block;
            width: 100%;
            padding: 2px 0;
            color: $txt;
        }
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
/* SERVICES BANNER */
#banner-services{
    background: rgba($secondary, $opac1);
    color: $secondary;
}
#banner-services h4{
    font-family: $fontheadprod;
}
#banner-services .span4:not(:last-child), .span6:not(:last-child){
    border-right: 1px solid;
    border-color:rgba($secondary, $opac1);
}

/* FILTERS & CATEGORIES */
a.category-back {
    color: $primary;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}
.menu-btn i{
    color:$back;
    font-size: 21px;
}
.pushy a:hover{
    background:$primary;
    text-decoration:none;
}
.pushy .mobile-subitems-container a{
    padding: 13px 50px 13px 20px;
}
.subitems .mobile-dropdown{
    background:rgba(131, 131, 131, 0.4);
}
.mobile-dropdown.dropdown-selected{
    background:$primary;
}
.mobile-dropdown i{
    color:white;
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
@media (max-width: 769px) {
    #cart-page #shoppingCartPage form#cart-form .productrow .col-quantity .span6.qty button{
        border:1px solid $secondary;
    }
    #cart-page #shoppingCartPage form#cart-form .productrow .col-quantity .span6.input-qty input{
        border-right:0px;
        border-left:0px;
    }   
}

/* new copyright */
#svg_brand .st0 { fill: $back; }
#svg_brand .st1 { fill: rgba($back, $opac8); }
/* /new copyright */

/* Mobile Filters */
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
    background:$primary;
    color:$back;
}
.mobile-filters.dropdown-selected > .fa-chevron-down:before{
    content: "\f077";   
 }
 #show-filters:hover, #show-filters:hover i { color: $txt } 

@media(max-width: 767px){
    #filters-container {
        background: rgba(131, 131, 131, 0.1);
        padding: 15px 0;
    }
    #toggle-filters { margin: 0 15px; }
    #show-filters { display: block; text-align: center }
}
@media(min-width: 768px){
    #show-filters { display: none; }
    #toggle-filters { display: block !important; }
}