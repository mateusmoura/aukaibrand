{% if not settings.image_borders %}
.dest-gral,
.dest-gral:hover,
.dest-gral .bajada:hover,
.dest-gral:hover .bajada,
#product-listing .product,
#product-listing .product .bajada,
#shoppingCartPage .cart-contents .productrow .col-image img,
#single-product .productContainer .imagecol .imagecolContent,
#single-product .thumbnail-container .single-thumb,
#single-product .productContainer .imagecol .shareDiv{
    border-color:transparent;
}


.dest-gral:hover,
.product:hover .head{
    border-color:#d2d2d2;
}
{% endif %}

body{
    background-color: {{ settings.background_color }};
{% if "default-background.jpg" | has_custom_image %}
    background-image: url( "{{ "default-background.jpg" | static_url }}" );
{% endif %}
}

.cloud-zoom-big {
	background-color: {{ settings.background_color }};
}

#fancybox-wrap {
	background-color: {{ settings.background_color }};
}

#no-logo,
#auth a,
#header .infobox,
#header .infobox a,
#footer,
#footer a{
    color: {{ settings.footer_text }};
}
#no-logo {
    text-transform: capitalize;
    font-weight: bold;
    
}
.sf-menu a, .sf-menu a:visited{
    color: {{ settings.nav_text }};
}

.sf-menu li:hover, .sf-menu li.sfHover,
.sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active{
    color: {{ settings.nav_text_hover }};
}

.sf-menu li.selected a{
    color: {{ settings.nav_text_hover }};
    border-top: 1px solid {{ settings.nav_text_hover }};
    border-bottom: 1px solid {{ settings.nav_text_hover }};
}

.button:hover, .submit_button:hover, #ls_cart_widget .cart-summary:hover, .button:hover, .submit_button:hover, #newsletter input.btn:hover, button#calculate-shipping-button:hover, .button.continue-buying:hover, .submit_button.contact:hover, .btn:hover, input.btn.news:hover {
    opacity: 0.8;
}
#newsModal{
   background-color: {{ settings.background_color }};  
}
#navigation,
.sf-menu li{
    background-color: {{ settings.nav_background }};
}

#navigation{
    border-top: 1px solid {{ settings.nav_border }};
    border-bottom: 1px solid {{ settings.nav_border }};
}

.sf-menu ul{
    border: 1px solid {{ settings.nav_border }};
    background-color:{{ settings.nav_background }};
}

.sf-menu li.selected ul li a{
    color: {{ settings.nav_text }};
}

.sf-menu li.selected ul li a:hover {
    color: {{ settings.nav_text_hover }};
}

.slider-wrapper .fa-refresh{
    position: absolute;
    top: 140px;
    margin-left:-25px;
    left: 50%;
    z-index: 99999;
    font-size: 40px;
    color: $primary-color;
}

#ls_cart_widget .cart-summary, .button, .submit_button, #newsletter input.btn, #newsletter-popup input.btn.news, button#calculate-shipping-button, .button.continue-buying, .submit_button.contact, .contact_form .submit_button, .contact_form .field input.submit_button, addresses a, .password-password .btn{
    background-color: {{ settings.button_secondary_bg }};
    background: {{ settings.button_secondary_bg }};
    color: {{ settings.button_color}};
    font-family:{{ settings.font_buttons | raw }};
}

#button-installments {
    color: {{ settings.text_color }};
    background: none;
    text-decoration: underline;
}

.button:hover, .submit_button:hover {
    opacity: 0.9;
}

#wrapper-foot,
.dest-gral .head .offer,
.dest-gral .head .out-of-stock,
.dest-gral .head .product-details-overlay,
#newsletter input[type="news"], #newsletter input[type="text"], .password-password input[type="password"]{
    background-color: {{ settings.footer_bg }};
}
#newsletter input[type="news"], #newsletter input[type="text"] ,.password-password input[type="password"] {
    border: 1px solid {{ settings.actual_footer_text }};
    color: {{ settings.actual_footer_text }};
}
#wrapper-foot {
    color: {{ settings.actual_footer_text }};
}
.product-details-overlay span:hover {
    color: {{ settings.actual_footer_text }};
}
.button,
.submit_button,
.dest-gral .head .free-shipping {
    background-color: {{ settings.button_bg }};
}
.headerBox{
    color: {{ settings.title_color }};
    background-color: {{ settings.title_background }};
    border-color: {{ settings.content_border }};
}

.headerBox h2, .headerBox-Page h2, .headerBox-List h2,
.headerBox h1, .headerBox-Page h1, .headerBox-List h1, .productContainer .descriptioncol .title h1{
    color: {{ settings.title_color }};
    font-family: {{ settings.font_headings | raw }}!important;
}
.headerBox-List span {
    color: {{ settings.text_color }};
}

/* password page */
.password-page .password-container.password-message h2{
    color: {{ settings.title_color }};
    font-family: {{ settings.font_headings | raw }};
}
.password-page .password-container.password-icon .password-svg{
    fill:{{ settings.nav_cart }};
}
.password-container.password-message{
    border-top: 1px solid {{ settings.nav_border }};
    border-bottom: 1px solid {{ settings.nav_border }};
}
.password-password{
    border-bottom: 1px solid {{ settings.nav_border }};
}
.sf-menu a, .col-foot a {
    font-family: {{ settings.font_navigation | raw }}!important;
}
.password-page .password-container.password-social a.soc-foot i{
    color: {{ settings.title_color }};
}
.password-page .password-container #wrapper-foot ul.foot-nav li a{
    color: {{ settings.actual_footer_text }};
}
#wrapper-foot h4,
.col-foot li.phone,
.col-foot li.mail,
.col-foot li.mail a,
.col-foot li.address,
.col-foot li.blog,
.col-foot li.blog a,
.col-foot li a, #newsletter .contact-error, #newsletter .contact-ok,
#wrapper-foot i.fa {
    color: {{ settings.actual_footer_text }};
}

button, select, textarea {
    font-family: {{ settings.font_buttons | raw }}!important;
}

body, .dest-gral .bajada .title, .dest-gral .bajada .title a, .dest-gral .bajada .price, .cart-contents .name, .contact, .contact a, .contact_form .field label, .user-content a.quick, .social-title h1, a, .product-details-overlay span:hover, .product-details-overlay span, #shoppingCartPage .cart-contents .productrow a {
    color: {{ settings.text_color }};
    font-family: {{ settings.font_rest | raw }};
}
#filters-column button{
    color: {{ settings.text_color }};
}
.dest-gral .bajada .title a, .dest-gral .bajada .price, .dest-gral .bajada .price-compare span{
    font-family: {{ settings.font_product_title | raw }};
}
#shoppingCartPage .continue-buying{
    font-family: {{ settings.font_buttons | raw }}
}
.product-details-overlay span:hover, .product-details-overlay span {
    color: {{ settings.actual_footer_text }};
}
.fancybox-skin {
     color: {{ settings.text_color }};
     background: {{ settings.background_color }};
}
.badge {
    color: {{ settings.text_color }};
    background: {{ settings.background_color }};
    font-size: 13px;
}
/* Banner Services */
#banner-services{
    background: {{ settings.background_color }};
}
#banner-services h4{
    font-family: {{ settings.font_headings | raw}};
    color: {{ settings.title_color }};
    font-weight: 500;
}
/* Banner Services */
#banner-services{
    background: {{ settings.background_color }};
}
#banner-services h4{
    font-family: {{ settings.font_headings | raw}};
    color: {{ settings.text_color }};
    font-weight: 500;
}
#banner-services p{
    color: {{ settings.text_color }};
}
#banner-services .span4:not(:last-child), #banner-services .span6:not(:last-child){
    border-right: 1px solid;
    border-color:{{ settings.text_color }};
}
#banner-services .banner-service-item .service-icon{
    color: {{ settings.text_color }};
}
.banner-services-footer{
    background: {{ settings.background_color }};
    border-top: 1px dotted #a0a0a0; 
}
 /*Hamburguer Navigation*/
.pushy a:hover{
    text-decoration:none;
}
.mobile-dropdown i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.mobile-filters i{
    background: {{ settings.button_secondary_bg }};
    color: {{ settings.background_color }};
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

@media (max-width: 979px) {
    header {
        background: {{ settings.background_color }};
    }
}
#product_form  #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: {{ settings.title_color }};
}
#product_form  #shipping-calculator li .shipping-option .option-name{
    color: {{ settings.title_color }};
}
 #shipping-calculator li .shipping-option i{
 display:none;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border:2px solid {{ settings.title_color }};
 }
 #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: {{ settings.title_color }};
}
 #shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: {{ settings.title_color }};
  position: absolute;
  right: 10px;
  top: 10px;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option img{
  -webkit-filter: initial;
  filter:initial;
}
/*** Installments ***/
#InstallmentsModal {
    background: {{ settings.background_color }};
}
#InstallmentsModal .tab-content {
    color: {{ settings.text_color }};
}

/**** Cart ***/
#ls_cart_widget .cart-summary a, #ls_cart_widget .cart-summary span, #ls_cart_widget .cart-summary i.fa { color: {{ settings.button_color}} }
button.item-plus i.fa, button.item-minus i.fa, .item-delete {
    color: {{ settings.text_color }};
    opacity: 0.2;
}
button.item-plus i.fa:hover, button.item-minus i.fa:hover, .item-delete:hover {
    color: {{ settings.text_color }};
    opacity: 1;
}

/* AJAX Cart */
a.js-toggleCart {
    text-decoration: none;
    color: {{ settings.button_color}};
}
@media(max-width: 769px){
    #filters-container {
        border: 1px solid white;
        margin: 0 20px;
        background: rgba(131, 131, 131, 0.1);
        padding: 15px 0;
    }
}