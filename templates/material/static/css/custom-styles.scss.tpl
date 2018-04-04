{# You should keep all settings in SASS variables for reuse #}
{# Color Variables #}
$primary-brand-color: {{ settings.primary_brand_color }};
$accent-brand-color: {{ settings.accent_brand_color }};
$foreground-color: {{ settings.text_color }};
$background-color: {{ settings.background_color }};

{# Color Mixins #}
$footer-background-color: darken($primary-brand-color, 18%);
$legal-background-color: darken($primary-brand-color, 30%);
$banners-background-color: lighten($background-color, 10%);
$newsletter-background-color: darken($background-color, 2%);
$background-color-dark:darken($background-color, 5%);
$background-color-lightest:lighten($background-color, 5%);
$background-color-light:lighten($background-color, 4%);
$foreground-color-light: lighten($foreground-color, 40%);
$foreground-color-lightest: lighten($background-color, 30%);
$foreground-btn: lighten($background-color, 10%);
$foreground-footer: lighten($background-color, 40%);

{# Font Family #}
$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};
$logo-font: {{ settings.font_logo | raw }};

{# Body and Footer #}
body{
    color: $foreground-color;
    font-family: $body-font;
    {% if settings.background_pattern %}
        background-image: url( "{{ ("images/patterns/" ~ settings.background_pattern ~ ".png") | static_url }}" );
    {% else %}
        background:$background-color;
    {% endif %}
}
footer{
    background-color:$footer-background-color;
}
#footer-legal{
    background-color:$legal-background-color;
}
footer p, footer h4, footer a, footer a:hover, footer li, footer div, footer .no-link, footer i.material-icons{
  color:$foreground-footer;
}
.newsletter-footer{
    background-color: $newsletter-background-color;
}

{# ******** CONTROLS HELPERS: btns, selects, inputs, etc ******* #}

{# Text Logo #}
#no-logo, .no-logo a, #newsModal .no-logo{
	color: $primary-brand-color;
}
.navbar-header .nav-store-name, .navbar-header .nav-store-name a, #no-logo, .no-logo a, #newsModal .no-logo, .pushy a.no-logo{
    font-family: $logo-font;
}
#navigation .dropdown-menu li.with-subitems > a{
    border-right: 2px solid $primary-brand-color;
}
#navigation .dropdown-menu.open-to-left li.with-subitems > a{
    border-left: 2px solid $primary-brand-color;
    border-right:0;
}
{# Texts and Headers #}
h1, h2, h3, h4, h5, h6{
    font-family: $heading-font;
    color: $foreground-color;
}
h1{
    color: $primary-brand-color;
}
h2.price{
    color: $primary-brand-color;
}

{# Buttons, links, pills, labels #}
.btn-primary, .btn-info,  
.btn-circle, .btn-circle:hover, 
.btn-circle i, .navbar-inverse 
.navbar-nav>li>a,
.secondary-navbar-mobile span,
.secondary-navbar-mobile a{
    color:$foreground-btn;
}
.navbar-inverse .navbar-nav>li>a:focus, .navbar-inverse .navbar-nav>li>a:hover{
    color:$foreground-btn;
    opacity: 0.7;
}
.no-link.contrast{
    color: $foreground-footer;
}
.label.pill-container{
    background-color:$newsletter-background-color;
}
a.pill{
    color:$foreground-color;
}
a.pill.contrast{
    color:$foreground-btn;
}
.btn-info, .btn-quickshop a{
	background-color: $primary-brand-color;
    border-color: $primary-brand-color;
}
.btn-info:hover, .btn-info:focus, .btn-info:active, .btn-info:active:focus{
	background-color: $primary-brand-color;
    border-color: $primary-brand-color;
	opacity:0.8;
}
.btn-primary{
	background-color: $accent-brand-color;
    border-color: $accent-brand-color;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .btn-primary:active:focus, .btn-primary[disabled]:hover, .btn-primary.disabled:hover{
	background-color: $accent-brand-color;
    border-color: $accent-brand-color;
	opacity:0.8;
}
.btn-quickshop a:hover, .btn-quickshop a:focus, .btn-quickshop a:active, .btn-quickshop a:active:focus,
.btn-quickshop .label-default[href]:focus, .btn-quickshop .label-default[href]:hover{
	background-color: $primary-brand-color;
}
.btn-circle-primary{
    background-color: $accent-brand-color;
}
.btn-default, .btn-default span, .btn-close i, .btn-default i{
    color:$accent-brand-color;
}
.no-link, .mail-to a{
    color: $foreground-color;
}

{# Modals #}
.modal-content{
    background-color:$banners-background-color;
}
{# Labels #}
.label-primary, .label-primary[href]:hover{
    background-color: $accent-brand-color;
}
.label-primary[href]:focus{
    background-color: $primary-brand-color;
}

{# Cards and Snackbars #}
.snackbar{
    color:$foreground-color-lightest;
}
.material-card{
    background-color:$background-color;
}
{# Material Icons #}
.material-icons{
    color:$foreground-btn;
}
.cart-amount, .secondary-navbar-mobile .cart-amount{
    background-color:$foreground-btn;
    color:$primary-brand-color;
}

{# Navigation #}
.navbar-inverse{
    background-color: $primary-brand-color;
}
.navbar-header .nav-store-name, .navbar-header .nav-store-name a, .bx-prev i.material-icons, .bx-next i.material-icons, .btn-info, .btn-quickshop a{
    color:$foreground-btn;
}
.navbar-header.contrast .material-input{
    color:$primary-brand-color;
}
.navbar-header.contrast .btn{
    background:transparent;
    border:0;
}
.navbar-header.contrast .btn i{
    color:$primary-brand-color;
}
.navbar-header.contrast .material-input::-webkit-input-placeholder, .navbar-header.contrast .material-input:-moz-placeholder, .navbar-header.contrast .material-input::-moz-placeholder, .navbar-header.contrast .material-input:-ms-input-placeholder{
    color:$primary-brand-color;
}
.navbar li.selected, .navbar a.selected, .navbar .selected{
    border-bottom: 3px solid $foreground-btn;
}
#account-header{
    background-color:$legal-background-color;
}
.mobile-logo, .mobile-dropdown-arrow{
    background-color:$background-color; 
}
li.mobile-subitems-container .dropdown-selected{
    border-left:3px solid $primary-brand-color;
    color:$primary-brand-color;
}
.mobile-see-all-category{
    background-color:$background-color; 
}
.pushy a, .item-with-subitems li span.mobile-dropdown-arrow i{
    color:$foreground-color;
}
.pushy, #categories-mobile-container{
    background-color:$banners-background-color; 
    box-shadow: 2px 0px 1px 1px rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
}
#categories-mobile-container li a:active, #categories-mobile-container li .mobile-category-dropdown:active, .pushy #mobile-navigation li a:active{
    background-color:$primary-brand-color;
    color:$foreground-btn;
}
.pushy a.no-link:focus, 
.pushy a.no-link:hover, 
#categories-mobile-container a.no-link:focus, 
#categories-mobile-container a.no-link:hover{
  color: $foreground-color;  
}
.item-with-subitems li span.mobile-dropdown-arrow i{
    transition: all 0.15s 0.15s;
}
a.dropdown-toggle {
    border: 0; padding: 0; margin: 15px; color: #fff;
}
.dropdown-selected .mobile-dropdown-arrow{
    background-color:$primary-brand-color; 
}
.item-with-subitems li .dropdown-selected span.mobile-dropdown-arrow i{
    color:$background-color;
}

{# Breadcrumbs #}
.breadcrumb{
  background: $background-color-dark;
}

{# Forms #}
.form-control {
    border: 1px solid #ccc;
    box-shadow: none;
    -webkit-transition: none;
}
.form-control:focus {
    border: 1px solid $primary-brand-color;
    -webkit-box-shadow: none;
    box-shadow: none;
    -webkit-transition: none;
}
.material-input{
    color:$foreground-color-lightest;
    border-bottom: 1px solid $foreground-color-lightest;
}
.label-offer{
    background-color:$accent-brand-color;
}
.label-shipping{
    background-color:$primary-brand-color;
}
.label-offer, .label-shipping{
    color: $foreground-btn;
}
{# Banners #}
#home-categories, .banner-services-container{
   background-color:$banners-background-color; 
}
.banner-services-icon i{
    background:$newsletter-background-color;
}

{# AJAX cart widget #}
#ajax-cart-details{
    background: $background-color;
}
#ajax-cart-details .ajax-total-row #cart-table-total h3, #ajax-cart-details .ajax-total-row #cart-table-total, #ajax-cart-totalwshipping{
    color:$primary-brand-color;
}
{# Grid #}
.product-grid-single-product .material-card .single-product-info h4.price{
  color:$primary-brand-color;
}
.product-grid-single-product .material-card h5 a{
    color: $foreground-color;
}
.product-grid-single-product .title-price-container{
    background-color:$background-color-light;
}
.product-grid-single-product .max_installments strong{
    color:$primary-brand-color;
}
{# Slider #}
.bx-wrapper h2 i{
    color:$primary-brand-color;
}
.bx-prev i.material-icons, .bx-next i.material-icons { 
    font-size: 1.6em; 
    color: $background-color;
}
.bx-pager a.active{
    border:2px solid $primary-brand-color;
}
a.bx-prev, a.bx-next {
    background: $primary-brand-color;
}
#home-slider-products, #home-slider-products li{
    background-color: $banners-background-color;
}
#home-slider-products a.bx-prev, #home-slider-products a.bx-next{
    background: $accent-brand-color;
}
{# Paginator #}
.pagination>li>a, .pagination>li>span, .pagination .material-icons{
    color:$foreground-color;
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover{
    background-color:$primary-brand-color;
    border-color:$primary-brand-color;
}

{# Spinner #}
.spinner{
    color:$foreground-color-lightest;
}
.spinner.contrast{
    color:$primary-brand-color;
}

{# Shipping Calculator #}
.shipping-calculator li input[type="radio"]:checked + .shipping-option{
  border:2px solid $accent-brand-color;
}
.shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  color:$accent-brand-color;
}

{# insta-variants #}

a.insta-variations span.custom-variants{
    color:$foreground-color;
}
a.insta-variations.selected{
background-color:$foreground-color;
}
a.insta-variations.selected span{
    color:$background-color;
}
a.insta-variations { border: 2px solid rgba($foreground-color, 0.8);}
a.insta-variations.selected { border: 2px solid $foreground-color;}

{# *** FOOTER *** #}
#social-newtworks-container a{
    background:$background-color;
    color: $footer-background-color;
}
{# **** HOME PAGE ****#}
#home-categories h3{
    color:$primary-brand-color;
}

{# **** PRODUCT PAGE ****#}
.bx-pager a{
    border:1px solid $foreground-color;
    opactiy:0.8;
}
.installments-in-product-container h4{
    color:$primary-brand-color;
}
{# **** CONTACT PAGE ****#}
.contact-information i{
    color:$primary-brand-color;
    font-size:24px;
}

{# **** 404 PAGE ****#}
.material-icons.icon-404{
    color:$foreground-color;
    opacity:0.3;
}

{# **** CART PAGE ****#}

.cart-contents .header-row{
    background-color:$background-color;
}
.cart-contents .productrow{
    background-color:$background-color-lightest;
}
.cart-contents .product-price-xs{
    color: $primary-brand-color;
}
#shoppingCartPage .total-price{
    color: $primary-brand-color;
}
{# Properties helpers #}
.border-top-contrast{
  border-top: 1px solid $background-color;
}
.border-bottom-contrast{
  border-bottom: 1px solid $background-color;
}
.border-top{
  border-top: 1px solid $foreground-color-light;
}
.border-bottom{
  border-bottom: 1px solid $foreground-color-light;
}
.border-left{
  border-left: 1px solid $foreground-color-light;
}
.border-left-dark{
  border-left: 1px solid $foreground-color;
}
{# **** INSTALLMENTS MODAL ****#}

#installments-modal strong{
    color:$primary-brand-color;
}
.installments-column span{
  background-color:rgba($background-color-dark, .2);
}
.installments-column span:nth-child(even){
  background-color:$background-color-lightest;
}

{# ***** Media Queries ****** #}

{# Boootstrap XS #}
@media (max-width: 767px){
    /* Horizontal Mobile Scrolling Products */
    .horizontal-products-container .product-grid-single-product .single-product-info{
        background-color:$background-color-light;
    }
}
@media screen and (max-width: 767px) and (orientation:portrait){
    .ajax-cart-submit{
        background-color: $background-color-dark;
    }
}