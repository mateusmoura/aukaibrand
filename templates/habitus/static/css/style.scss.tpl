//VARIABLES
$primary-color: {{ settings.primary_color }};
$secondary-color: {{ settings.secondary_color }};
$black-color: darken($primary-color, 25);
$white-color: lighten($primary-color, 74);
$banner-category-color: {{ settings.bannercategory_color_text }};
$banner-contact-color: {{ settings.bannercontact_color_text }};

$fonttxt: {{ settings.font_rest | raw }};
$fontnav: {{ settings.font_navigation | raw }};
$fonthead: {{ settings.font_headings | raw }};
$fontbut: {{ settings.font_buttons | raw }};

$primary-color-light: lighten( $primary-color, 10% );
$primary-color-lighter: lighten( $primary-color, 20% );
$primary-color-dark: darken( $primary-color, 10% );
$primary-color-darker: darken( $primary-color, 20% );

$secondary-color-light: lighten( $secondary-color, 10% );
$secondary-color-lighter: lighten( $secondary-color, 20% );
$secondary-color-dark: darken( $secondary-color, 10% );
$secondary-color-darker: darken( $secondary-color, 20% );

$black-color-softer: lighten( $black-color, 97% );
$black-color-soft: lighten( $black-color, 90% );
$black-color-light: lighten( $black-color, 80% );
$black-color-lighter: lighten( $black-color, 60% );

.homeslider {
    position: relative;
    padding: 0;
    margin: 0;
}
.homeslider img{
    visibility:hidden;
}
.slider-wrapper{
    position:relative;
}
.slider-wrapper .fa-refresh{
    position: absolute;
    top: 50%;
    margin-left:-25px;
    margin-top:-25px;
    left: 50%;
    z-index: 99999;
    font-size: 40px;
    color: $secondary-color;
}
.text-center {
    text-align: center;
}

.homeslider li {
    padding: 0;
    margin: 0;
    -webkit-background-size: 100% auto;
    -moz-background-size: 100% auto;
    -o-background-size: 100% auto;
    -ms-background-size: 100% auto;
    background-size: 100% auto;
    background-position-y: -75px;
    width: 100%;
}

.homeslider li img {
    width: 100%;
}

//MIXINS
@mixin vertical-align {
  position: relative;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}

@mixin opacity($opacity) {
  opacity: $opacity ;
  $opacity-ie: $opacity * 100;
  filter: alpha(opacity=$opacity-ie); //IE8
}

/************************************************************************************
DEFAULTS
*************************************************************************************/
body {
    color: $primary-color;
    font-family: $fonttxt!important;
    background-color: $white-color;
}

a, active, a:hover, a:focus {
    color: $secondary-color;
    text-decoration: none;
    outline: 0;
}

h1, h2, h3, h4 {
     font-weight: 300;

}
::-moz-selection {
    color: $white-color;
    background: $secondary-color;
}
::selection   {
    color: $white-color;
    background: $secondary-color;
} 

.hidden { display:none; }
.l { text-align: left; }
.c { text-align: center; }
.r { text-align: right; }

/************************************************************************************
COLOR SCHEME
*************************************************************************************/
.action-color {
    color: $secondary-color;
}
/************************************************************************************
HEADER
*************************************************************************************/
.navbar > .container .navbar-brand {
    margin-left: 0;
}
.navbar-non-static {
    padding-top: 41px;
}

.no-products {
    text-align: center;
}
.pushy{
    display:none;
}
.container-push, .push-push{
    transform: translate3d(0px,0,0); 
    -webkit-transform: translate3d(0px,0,0);
    -moz-transform: translate3d(0px,0,0);
    -ms-transform: translate3d(0px,0,0);
    -o-transform: translate3d(0px,0,0);
}
.site-overlay, .pushy-active .site-overlay{
    display: none;
}
.welcomeMessage {
    margin-top: 50px;
}
.welcomeMessage h2{
    font-size: 36px;
}
.top-header {

	background: $primary-color;
	color: $white-color !important;
    .languages a{
    margin-right:5px;
    }
    .message-wrapper,
    .account-wrapper,
    .languages-wrapper,
    .search-content-wrapper {
        display: block;
    }
    .message-wrapper,
    .account-wrapper,
    .languages-wrapper {
       margin-top: 2px; 
    }

    .message-wrapper {
        float: left;
        margin-left: 0; 
    }
    .search-content-wrapper {
        width: 30%;
        float: right;
    }
    .languages-wrapper {
        // width: 5%;
        float: right;
         margin-left: 2%; 
    }
    .account-wrapper {
        // width: 20%;
        float: right;
    }

    a {
        color: rgba( $white-color, .4 );

        &:hover {
            color: $secondary-color;
        }
    }

    p {
        padding-top: 11px;
    }

    .search-wrapper {
        padding:8px 0 6px;
        .form-control {
            border:0;
        }
    }

    .col {
        margin: 0;
        padding-left: 0;
        padding-right: 0;
    }

    #auth {
        padding: 11px 0 4px;
        text-align: right;
    }   
    .languages{
        padding: 11px 10px 4px;
        text-align: right;
    }
    #auth  {
        li {
            margin-left: 8px;
            &:first-child {
                margin-left: 0;
            }
        }
    } 
}

.navbar-toggle {
    outline: 0;
}

.cart-summary {
    text-align: right;
    a {
        padding: 0 0 30px 0;
    }
}

#logo {
    float: left;

    a {
        display: block;
        overflow: hidden;

        img {
            max-height: 32px;   
        }  
    }
}

#no-logo {
    font-size: 30px;
    font-weight: bold;
    color: $primary-color;
}
#logo.news {
    text-overflow: ellipsis;
    overflow: hidden;
    max-width: 300px;
    margin: 20px 0px;
}

#menu {
    width: auto;
    text-align: right;
    float: right;
    margin-right: 40px;

    &.list-inline  {
        
        li {
        margin: 0;
        margin-right: -2px;
        padding: 0 !important;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        }

        ul li {
            margin-right:0 !important;

        }
    }
}
#cart {
    float: right;
    padding-top: 7px;
}

/************************************************************************************
PRODUCTS
*************************************************************************************/
.products-list {

    .products-header {

        small {
            text-transform: uppercase;
            letter-spacing: 1.25px;
            font-size: 80%;
            color: $black-color-lighter;
        }
        h3 {
            margin: 4px 0 40px;
        }
    }
}
.thumbnail {
    .head {
        position: relative;

        .free_shipping {
            right: 0;
        }
    }
}
.thumbnail .head .image-wrap a{
    width:100%;
    height:100%;
    float:left;
}
.image-wrap a img{
    margin-top:0px!important
}
.free_shipping {
           right: 15px;
        }
.product-details-overlay {
    text-align: right !important;
    padding-left: 0;
    cursor: pointer;

    &:hover {
        text-decoration: underline !important;
    }
}
p.stockalarm-trigger {
    margin-top: 15px;
}


.product-description-wrap {
    margin: 60px 0;

    .product-description-title {
        font-weight: 300;
        color: $secondary-color;
        margin-bottom: 20px;
    }

}
.products-header {

    .title {
        h2 {
           margin: 0; 
        }
    }
}

.image-wrap {
    height: 312px;
    width: 260px;
    overflow: hidden;
    position: relative;
    -webkit-transition: max-width .3s ease-out;  /* Saf3.2+, Chrome */
    -moz-transition: max-width .35s ease-out;  /* FF4+ */
    -ms-transition: max-width .3s ease-out;  /* IE10? */
    -o-transition: max-width .53s ease-out;  /* Opera 10.5+ */
    transition: max-width .3s ease-out;
    background-color: $white-color !important;
    margin:auto;

    img {
            height:auto;
            width: 100%;
            -webkit-transition: margin-top .2s ease-out;  /* Saf3.2+, Chrome */
            -moz-transition: margin-top .2s ease-out;  /* FF4+ */
            -ms-transition: margin-top .2s ease-out;  /* IE10? */
            -o-transition: margin-top .2s ease-out;  /* Opera 10.5+ */
            transition: margin-top .2s ease-out;
            position: absolute;
            top: 0;
        }

    a {
        img {
        -webkit-transition: all 0.3s ease;                  
        -moz-transition: all 0.3s ease;                 
        -o-transition: all 0.3s ease;   
        -ms-transition: all 0.3s ease;          
        transition: all 0.6s ease;
        -webkit-transform:translate3d(0,0,0);
        -moz-transform:translate3d(0,0,0);
        }
        &:hover img {
            opacity: .5;
        }
    }
    &.show-help {
        background-color: $black-color-soft;
    }

}

.img.logo {
    float: left;
}
.img.logo img {
    max-height: 75px;
    max-width:210px;
    margin-bottom:15px;
}
     
@media only screen and (min-width: 1160px) {
    .image-wrap { max-width: 1000px; }
}
.descriptioncol {
    .thumbnail {
    float: left;
    position: relative;
    width: 50%;
        span {
            margin: 2px;
            position: relative;
            width: auto;
        }
    }
}
.imagecol {
    .offer, .free_shipping {
            position: absolute;
            display: inline-block;
            top: 0;
            z-index: 10;
            background: $secondary-color;
            text-transform: uppercase;
            font-weight: bold;
            color: $white-color;
            padding: 5px 8px;
        }
        .out-of-stock {
            position: absolute;
            display: block;
            text-align: center;
            z-index: 10;
            background: $primary-color;
            text-transform: uppercase;
            font-weight: bold;
            color: $white-color;
            padding: 5px 8px;
            height: 30px;
            width: 100px;
            top: 44%;
            margin-top: -30px;
            left: 50%;
            margin-left: -50px;
        }
}

.thumbnail {
    background-color: $white-color;
    border: none;
    border-radius: 0;
    display: block;
    line-height: 1.42857;
    margin-bottom: 20px;
    padding: 0;
    transition: all 0.2s ease-in-out 0s;

    .offer, .free_shipping {
        position: absolute;
        display: inline-block;
        top: 0;
        z-index: 10;
        background: $secondary-color;
        text-transform: uppercase;
        font-weight: bold;
        color: $white-color;
        padding: 5px 8px;
    }
    .out-of-stock {
        position: absolute;
        display: block;
        text-align: center;
        z-index: 10;
        background: $primary-color;
        text-transform: uppercase;
        font-weight: bold;
        color: $white-color;
        padding: 5px 8px;
        height: 30px;
        width: 100px;
        top: 44%;
        margin-top: -30px;
        left: 50%;
        margin-left: -50px;
    }

    .caption {

        color: $primary-color;

        p {
            color: $black-color-lighter;
        }

        .title {
            margin: 4px 0;
            font-weight: 300;
            letter-spacing: .5px;

            a {
                color: $primary-color-light;
            }
        }

        .price {
            color: $secondary-color;
            font-size: 16px;
            font-weight: bold;
        }

        .price-before {
            text-decoration: line-through;
            color: $black-color-lighter;
            font-weight: normal;
        }
    }
}

.cloud-zoom-wrap {
    #zoom img {
        max-width: 100%;
    }
    .mousetrap {
        display: block;
        visibility: visible;
    }
}
.crumbPaginationContainer{
    text-align:center;
}
.pagination>li>a, .pagination>li>span {
    color: $primary-color;
}

.pagination>li>a:hover, .pagination>li>span:hover {
    color: $white-color;
    background-color: $secondary-color;
}

/************************************************************************************
SINGLE PRODUCTS PAGE
*************************************************************************************/
.mobile-bxslider{
    display: none;
}
.desktop-featured-product{
    display: block;
}
#breadcrumb {
    color: $black-color-lighter;

    .crumb {
        color: $black-color-lighter;

        &:hover {
            color: $secondary-color;
        }

        &.last {
            color: $secondary-color;
            font-weight: bold;
        }
    }
}

.title-wrapper {
    margin: 20px 0;

    .title {
        max-width: 65%;
        margin-right: 5%;
        float: left;
        min-width: 60%;
    }

    .price-holder {
        font-size:30px;
        line-height: 100%;
        font-weight: 300 !important;
        float: right;
        text-align: right;
        min-width: 30%;

        .price {
            display: inline-block;
            vertical-align: bottom;
            text-align: right; 


            #price_display {
                font-weight: 300;
            }
            .price-compare {
                display: block;
                vertical-align: bottom;

                #compare_price_display {
                    font-weight: 300 !important;
                    font-size: 22px;
                }
              
            }
        }
    }
 }

.mousetrap{
    max-width: 100%;
 }
 .cloud-zoom-big {
    margin-left: 15px;
 }
/* --- password Page * ---- */
.password-page .password-container{
    width: 100%;
    clear: both;
    float: left;
    padding-top:0px;
}
.password-page .password-container.header-bar{
    margin-bottom: 40px;
}
.password-page .password-container .logo{
    margin: 12px auto 18px auto;
    text-align: center;
    float:none;
}
.password-page .password-container .logo img{
    max-width: 300px;
    max-height: 90px;
}
.password-page .password-container .logo.text-only{
    text-align: center;
}
.password-page .password-container.password-message h2{
    margin: 0px auto 20px auto;
    width: 70%;
    font-size: 34px;
    line-height: initial;
    color:{{ settings.primary_color }};
    overflow-wrap: break-word;
    word-wrap: break-word;
    -webkit-hyphens: auto;
    -ms-hyphens: auto;
    -moz-hyphens: auto;
    hyphens: auto;
}
#unlock-form{
    width: 15%;
    margin: 60px auto 20px auto;
    display: block;
}
#unlock-form .btn{
    width:100%;
}

.password-container.password-message{
    width: 90%;
    float: none;
    margin: auto auto 25px auto;
}
.password-page .password-container.password-icon{
    width: 150px;
    height: 150px;
    margin: 0px auto;
    float: none;
}
.password-page .password-container.password-icon .password-svg{
    width: 54%;
    margin-top: 40px;
    fill:$secondary-color;
}
.password-page .featurette-divider{
    margin-top: 0px;
    width:60%;
}
.password-page .password-container .unlock-form{
    width: 30%;
    margin: auto;
} 
.password-page .password-container .unlock-form .general-button{
    width: 100%;
}
@-webkit-keyframes wiggle {
    0% {
        -webkit-transform:rotate(0deg);
    }
    25% {
        -webkit-transform:rotate(-4deg);
    }
    50%{
         -webkit-transform:rotate(4deg);
    }
    75% {
        -webkit-transform:rotate(0deg);
    }
    100%{
         -webkit-transform:rotate(0deg);
    }
}
.wiggle {
    -webkit-animation: wiggle 1.5s infinite;
    animation-delay: 2s;
}
.password-container .access-top{
    text-align: center;
    margin-top: 10px;
}
.password-container .access-top i.fa.fa-unlock{
    margin-top: 6px;
    position: absolute;
    right: 10px;
    font-size: 20px;
}
.password-page .password-container #wrapper-foot{
     padding: 10px;
    text-align: center;   
}
.password-page .password-container #wrapper-foot .foot-nav{
    padding: 10px;
}
.password-page .password-container #wrapper-foot ul.foot-nav li{
    display: inline;
    padding-right: 10px;
    padding-left: 10px;
}
.password-page .password-container #wrapper-foot ul.foot-nav li:last-child{
    border-right: 0px;
}
.password-page .password-container #wrapper-foot .alert{
    width: 30%;
    margin: auto;
}

.password-password{
    margin-bottom: 13px;
    padding-bottom: 10px;
    width: 95%;
    margin: 0px auto 13px auto;
}
.password-password input[type="text"]{
    padding: 8px;
}
.password-password .btn{
    margin-top: 10px;
    padding: 8px;
    border: none;
    box-shadow: none;
    border: 0px;
    text-shadow: none;
    text-transform: uppercase;
    margin-left: 8px;
}
/************************************************************************************
404 PAGE
*************************************************************************************/
.headerBox-Page .error h1{
    font-size: 26px;
  margin-top: 30px;
}
.headerBox-Page .error h1 i{
    margin-right:10px;
}

/************************************************************************************
PAGE
*************************************************************************************/
.page {
    margin-top: 40px;

    .banner {
        padding: 0;
        position: relative;
        margin-top: 40px;
        overflow: hidden;

        & .text-banner {
            display: table;
            position: absolute;
            height: 200px;
            width: 100%;
            padding: 5%;
            text-align: center;

            
            & .banner-copy {
                display: table-cell;
                vertical-align: middle;
                font-weight: 300;
                line-height: 110%;
            }

        }

        img {
          width: 100%;  
        }
    }
}
.user-content img{
    margin: 10px auto;
}
/************************************************************************************
CARRITO
*************************************************************************************/
#shoppingCartPage {

    ul {
        list-style: none;
    }

    .contentBox {
        padding:20px 30px;
        width:880px;
    }
    .contentBox {
        & a {
        color:#535353;
        } 
    }
    .cart-contents {
        margin: 30px 0;
    }

    .cart-contents {
        margin: 40px 0 20px 0px;

        ul {
            overflow: hidden;
            list-style: none;

            li {
                float: left;
                margin:0;

                &.last {
                    padding-right: 0;
                }
            }
        } //ends cart-contents ul

        .firstrow {
            
            font-size: 16px;
            font-weight: bold;
            text-align: right;
            margin: 0;
            border-bottom: 3px solid $black-color-soft;
            padding: 6px 0;
            // padding: 0 0 10px 0;

            li {
                // height:20px;

                &.span6 {
                    width:55%;
                }
            }
            .col-image-product, .col-product, .col-quantity {
                text-align: left;
            }
        }  //ends firstrow 

        .productrow {
            padding: 10px 0;
            margin: 0;
            border-top: 1px solid $black-color-soft;

            &:hover {
                background: $black-color-softer;
            }

            a {
                font-size:16px;
            }

            li {
                font-size: 18px;
                line-height:22px;
                margin-top:35px;
                text-align: right;
            }

            .col-image {
                margin-top:0;
                img {
                    max-height: 88px;
                    max-width: 88px;
                }
            }
            .col-product {
                margin-top:0;
                text-align: left;
            }
            .col-delete {
                text-align: center;

                a {
                    color: $primary-color;

                   &:before {
                    content: '\f00d';
                    font-family: FontAwesome;
                    display: inline-block;
                    color: $primary-color;                        
                    } 

                    &:hover:before {
                        color: $secondary-color;
                    }

                }
                
            }
            .thumb{
                float:left;
            }
            .name {
                margin-top:35px;
                margin-left:10px;
                display:inline-block;
                color: $primary-color;
                font-weight: bold;

                &:hover {
                    color: $secondary-color;
                }
            }
            .col-quantity {

                margin-top: 25px;

                input {
                    border:1px solid #D2D2D2;
                    color:#353535;
                    font-size:16px;
                    padding: 6px;
                    text-align:center;
                    width: 50px;
                    margin: 0px;
                }
            }
            .col-delete {
                a {
                    font-size:18px;
                }
            }
        }//ends productrow

        .total {
            text-align: right;
            font-weight: 300;
            font-size: 22px;
            padding: 20px;
            border-top: 1px solid $black-color-light;
            background: $black-color-soft;
            color: $primary-color;
        }
        .total-price {
            font-weight: bold;
        }

        .go-to-checkout{
            text-align:right;
            margin: 20px 10px;
            overflow:hidden;

            input {
                margin-left:12px;
                padding: 11px 20px;
                float:right;
            }
        }

        button.item-plus, button.item-minus {
            display: block;
            font-size: 14pt !important;
            margin-top: -2px;
            background: transparent;
            border: 0;
        }
        button.item-delete {
            display: block;
            font-size: 22pt !important;
            background: transparent;
            border: 0;
        }
        button.item-plus i.fa, button.item-minus i.fa {
            color: rgba(0, 0, 0, 0.1);
        }
        button.item-plus i.fa:hover, button.item-minus i.fa:hover {
            color: #434343;
        }
        .fa-cog {
            color: #dedede !important;
            font-size: 26px;
            margin-left: 15%;
            margin-top: 12%;
        }
        .alert {
            margin-bottom: 0;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }

     } //ends cart-contents

     .checkOutCallOuts {
        & .btn {
            margin-left: 20px;
        }
        .continue-buying{
          margin-left:0px;
          margin-bottom: 30px;
          width: 200px;
          clear:both;
          padding: 10px 5px;
           background: {{ settings.primary_color }};
        }
    }

    .shipping-calculator {
        margin-bottom: 20px;
        margin-top:0px;
        float:left;

        ul.list-inline {
            display: inline-block;
            margin: 0 auto;

           & > li {
            line-height: 2.2em;
           }
        }

        ul.shipping-list > li {
            margin-top:20px;
        }

        .shipping-method-name {
            margin-left: 10px;
            text-align:left;
        }

        .loading {
            font-size: 20px;
        }

         .alert {
            vertical-align: super;
        }
    }

}
.shipping-list .radio-button{
    display: none;
}
.shipping-list .shipping-option{
    position:relative;
    padding: 7px 0px;
    cursor:pointer;
}
#product_form .shipping-calculator li input[type="radio"]:checked + .shipping-option{
    border:0px solid;
}
#product_form .shipping-calculator .shipping-option img{
  -webkit-filter: initial;
  filter: initial;
}
#product_form .shipping-calculator li input[type="radio"]:checked + .shipping-option i{
    display: none;
}
#product_form .fancyContainer > div{
    float:right;
}
#product_form span.shipping-method-name{
    text-align:right;
}
.shipping-calculator-form .form-control {
    max-width: 140px;
    display: inline;
}
#product_form .shipping-calculator{
    text-align:right;
}
.shipping-calculator {
    margin: 20px 0;
}
.shipping-calculator li .shipping-option i{
    display:none;
}
.shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border:2px solid $primary-color;
 }
.shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: $primary-color;
}
.shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: $primary-color;
  position: absolute;
  right: 10px;
  top: 10px;
}
.shipping-calculator li input[type="radio"]:checked + .shipping-option img{
  -webkit-filter: initial;
  filter:initial;
}
.lessthan.pull-right {
    margin-left: 20px;
}

.shipping-calculator p {
    font-weight: bold;
}
#shoppingCartPage .checkOutCallOuts .calculate-shipping-button {
    padding: 7px;
    margin-left:0px;
}

#button-installments {
    margin: 0 0 5px 0;
    cursor: pointer;
    text-decoration: underline;
    font-size: 13px;
}
span.shipping-method-name {
    font-weight: normal;
    margin-left: 10px;
    text-align:left;
}
.shipping-calculator li img {
    width: 70px;
    height: auto;
}
.addToCartButton {
    margin-bottom: 20px;
    text-align:right;
}
#change-quantities{
    display:none;
}

/************************************************************************************
SLIDER
*************************************************************************************/
.slider-wrapper {
    margin: 0 auto;
    max-width: 100%;
    text-align: center;
}

.bjqs-slide {
    width: 100%,
    img {
        min-width: 100%;
    }
}

/************************************************************************************
MENU
*************************************************************************************/
.navbar-nav a {
    display: block;
    position: relative;
    color: #7D7D7D;
    font-size: 17px;
    font-weight: 300;
    height: 20px;
    line-height: 20px;
    padding: 13px 18px;
    text-decoration: none;
    text-transform: uppercase;
}

.navbar {
    border-radius: 0 !important;
    margin-bottom: 0;
    border: none;
    border-bottom: 1px solid $black-color-lighter;

    .cart-summary {
        a {
           color: $primary-color; 

           &:hover {
            color: $secondary-color; 
           }
        }

        .badge {
            background: $secondary-color;
            padding: 4px 7px 5px;
            font-size: 13px;
            margin-left: 5px;
        }
        
     }

    .fa-shopping-cart {
        color: $primary-color;
        margin-right:5px;
    }  
}

.navbar {
    -webkit-transition: all 0.3s ease;                  
    -moz-transition: all 0.3s ease;                 
    -o-transition: all 0.3s ease;   
    -ms-transition: all 0.3s ease;          
    transition: all 0.6s ease;
    padding-top: 15px;

    & .container {
    }

    &.navbar-default .navbar-toggle {
        border-color: $primary-color;
    }

    &.navbar-toggle {
        background-image: none;
        border: 1px solid rgba(0, 0, 0, 0);
        border-radius: 4px;
        float: right;
        margin-bottom: 8px;
        margin-right: 15px;
        margin-top: 8px;
        padding: 9px 10px;
        position: relative;
    }
    &.navbar-default .navbar-toggle .icon-bar {
        background-color: $primary-color;
    }
    &.navbar-default .navbar-toggle:hover, 
    &.navbar-default .navbar-toggle:focus {
        background-color: $secondary-color;
        border-color: $secondary-color-dark;
    }
    &.navbar-default .navbar-toggle:hover .icon-bar {
        background-color: $white-color;
    }
}

.navbar-default {
    background-color: transparent;
    border-color: rgba( $black-color, .1 );
}

.affix {
    top: 0; /* Set the top position of pinned element */
    left: 0;
    right:0;
    margin: 0 auto !important;
    background: rgba( $white-color, .9 );
    padding-top: 5px; /* Set the top padding to reduce the nav height */
    // z-index: 99991;

    & .container{
        padding-top: 0;
        // height: 100px;
    }

    .container .navbar-brand .navbar-header & {
        padding-top: 0 !important;
        // height: 100px;
    }

    & .navbar-brand {
        margin-top: 10px;
    }

    & #logo {
        margin-top: 10px;

        & #no-logo {
            position: absolute;
            margin-top: -10px !important;
        }
    }

    & #main-menu {
        padding-top: 10px;
    }
}

/************************************************************************************
MODAL
*************************************************************************************/
.modal-dialog {
    width: 65%;

    .modal-body {
        img {
            max-width: 100%;
            height: auto;
        }
    }

    .modal-header {
        ul {
            margin: 0;
            overflow: hidden
        }
    }
    .modal-title {
        color: $secondary-color;
    }

    .title {
        h2 {
            margin: 0;
        }
    }

    .price {
        margin-top:10px;

        #price_display {
            font-size: 30px;
            font-weight: 300;
            line-height: 100%;
        }
        #compare_price_display {
          font-size: 22px;
          font-weight: 300 !important;
          margin-right: 10px;
        }
    }

    .image-wrap {
        max-height: 500px;
        overflow: hidden;
        max-width: 800px;
        -webkit-transition: max-width .3s ease-out;  /* Saf3.2+, Chrome */
        -moz-transition: max-width .35s ease-out;  /* FF4+ */
        -ms-transition: max-width .3s ease-out;  /* IE10? */
        -o-transition: max-width .53s ease-out;  /* Opera 10.5+ */
        transition: max-width .3s ease-out;
        background-color: $white-color;

        img {   
                width: 100%;
                -webkit-transition: margin-top .2s ease-out;  /* Saf3.2+, Chrome */
                -moz-transition: margin-top .2s ease-out;  /* FF4+ */
                -ms-transition: margin-top .2s ease-out;  /* IE10? */
                -o-transition: margin-top .2s ease-out;  /* Opera 10.5+ */
                transition: margin-top .2s ease-out;
            }

        a {
            img {
            -webkit-transition: all 0.3s ease;                  
            -moz-transition: all 0.3s ease;                 
            -o-transition: all 0.3s ease;   
            -ms-transition: all 0.3s ease;          
            transition: all 0.6s ease;
            -webkit-transform:translate3d(0,0,0);
            -moz-transform:translate3d(0,0,0);
            }
            &:hover img {
                opacity: .5;
            }
        } 
    }


    li.attributeLine {
         margin-bottom: 6px;
         width: 100%;

            label {
            display: block;
            font-size: 11px;
            font-weight: 400;
            line-height: 7px;
            letter-spacing: 1px;
            display: inline-block;
            padding: 5px 0px;
            text-transform: uppercase;
            margin-right:5px;
            }
            span{
                color: $black-color-lighter;
            }
            label .number{
            padding: 7px 6px;
            display: inline-block;
             font-size: 12px;
            font-weight: 700;
            border-radius: 100%;
            background-color:$black-color-soft;
            }
            select{
            font-size: 11px;
            padding: 1px;
            width: 30%;
            height: 33px;
            margin: 5px 0;
            text-transform: uppercase;
            letter-spacing: 3px;
            }
            input{
            font-size: 11px;
            padding: 6px;
            width: 35%;
            text-transform: uppercase;
            }
        }
        span.ui-spinner.ui-widget.ui-widget-content.ui-corner-all {
        width: 15%;
        border-radius: 0px;
        height: 35px;
        }
}
.quick-content input.btn.btn-primary.btn-lg.addToCart.cart {
width: 97%;
}
a.quick {
        width: 100%;
        margin: 10px 0px;
        display: inherit;
        text-decoration: underline;
    }

/************************************************************************************
WIDGETS
*************************************************************************************/
.widgets {

    margin-bottom: 40px;

    .newsletter {
        .btn {
            margin-top: 15px;
        }

    }

    .widget-header {

        small {
            text-transform: uppercase;
            letter-spacing: 1.25px;
            font-size: 80%;
            color: $black-color-lighter;
        }
        h3 {
            margin: 4px 0 40px;
        }
    }
    .widget-divider {
        width: 30px;
        height: 1px;
        background: $black-color-light;
        margin: 40px 0 20px;
    }
}
/************************************************************************************
FORMS
*************************************************************************************/

.form-control {
    background-color: $white-color;
    background-image: none;
    border-radius: 0;
    border-color: $black-color-light;
    box-shadow: none;
    color: $black-color-lighter;
    display: block;
    font-size: 12px;
    height: 34px;
    line-height: 1.42857;
    padding: 4px 10px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    vertical-align: middle;
    width: 100%;
}
.form-control:focus {
    border-color: $black-color-light;
    border-left: 2px solid $secondary-color;
     color: $primary-color;
    -webkit-box-shadow: none;
    box-shadow: none;
}

.form-control:-moz-placeholder,
.form-control::-moz-placeholder,
.form-control:-ms-input-placeholder,
.form-control::-webkit-input-placeholder {
  color: $primary-color;
}

/************************************************************************************
PAGE-PRODUCT
*************************************************************************************/
.page-product {
    .fb_iframe_widget iframe{
    z-index:5;
    }
    .fb_iframe_widget_lift{
    z-index:5!important;
    }
    .fb_iframe_widget{
    z-index:1!important;
    }
    .shareItem .fb_iframe_widget{
    z-index:20!important;
    }
    .shareLinks {
        *:before {
            content: none;
        }

    .shareItem { float: left; margin-right: 10px; }
        
    }
    .shareItem.google > div { width: 64px !important }
    .installments {
        text-align: right;
        margin: 10px 0;

        #installments_number, #installments_amount {
            font-weight: bold;
            color: $secondary-color;
        }

    }
    .jThumbnailScroller {
        margin-top: 20px;
    }
}
.imagecol .desktop-featured-product{
    width:90%;
}

/************************************************************************************
PAGE-CONTACT
*************************************************************************************/
.page-contact{
    margin-bottom:40px;
    .form {
        .btn {
            margin-top: 15px;
        }
    }

    .form-control {
        padding: 15px;
        font-size: 15px;
        font-weight: normal;
        height: auto !important;
        color: $black-color-lighter;

        &:focus {
            border-color: $black-color-light;
            border-left: 2px solid $secondary-color;
            color: $primary-color;
            outline: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
    }

    *:before {
        margin-right: 10px;
        color: $primary-color;
    }
    *:hover:before {
        color: $secondary-color;
        & > a {
            color: $secondary-color;
        }
    }

    ul li {
        color: $primary-color;
        & a {
            color: $primary-color;
        }
        &:hover > a {
             color: $secondary-color;
        }
    }

    .phone {
        &:before {
            content: '\f095';
            font-family: FontAwesome;
            display: inline-block;
            font-size: 16px;
            margin-right: 13px;
        }
    }
    .mail {
        &:before {
            content: '\f003';
            font-family: FontAwesome;
            display: inline-block;
            font-size: 15px;
        }
    }
    .blog {
        &:before {
            content: '\f086';
            font-family: FontAwesome;
            display: inline-block;
            font-size: 16px;
        }
    }
    .address {
        &:before {
            content: '\f041';
            font-family: FontAwesome;
            display: inline-block;
            font-size: 16px;
            margin-right: 16px;
        }
    }
}
.alert {
    border: 1px solid rgba(0, 0, 0, 0);
    border-radius: 0 !important;
    margin-bottom: 20px;
    padding: 15px;
}

.sidebar {
    margin-top:30px;
}

#google-map {
    margin-bottom:40px;
    width: 100%;
    height: 250px;

    img {
        max-width:none;
    }
}
/************************************************************************************
BANNER
*************************************************************************************/
#banner-innerpage {
    color: $white-color;
    min-height: 200px;

    .banner-copy {
        margin: 20px 0;

        a {
            color: $white-color;
        }
    }

    .text-banner {
        height: 200px;
        display: table;
    }

    &.banner-innerpage-content {
        position: relative;
        text-transform: inherit;
    }
    &.banner-innerpage-content .banner-innerpage-cover {
        background-position: center center;
        background-repeat: no-repeat;
        background-size: 100% auto;
        height: 100%;
        position: absolute;
        top: 0;
        width: 100%;
        z-index: 1;
    }
    &.banner-innerpage-content {
        text-transform: inherit;
    }

    &.banner-innerpage-content .inside {
        position: relative;
        display: table-cell;
        z-index: 2;
        vertical-align: middle;
    }
}

.banner-innerpage-link {
    display: inline-block;
    width: 100%;
}

.banner {
    background: $secondary-color;
    color: $white-color;
    padding: 40px 0;
    margin: 80px 0;

    h2 {
        margin: 20px 0;
    }

    &.widget-static-content {
        position: relative;
        text-transform: inherit;
    }
    &.widget-static-content .static-content-cover {
        background-position: center center;
        background-repeat: no-repeat;
        background-size: 100% auto;
        height: 100%;
        position: absolute;
        top: 0;
        width: 100%;
        z-index: 1;

        @include opacity(0.3);

    }
    &.widget-static-content {
        text-transform: inherit;
    }

    &.widget-static-content .inside {
        position: relative;
        z-index: 2;
    }
}
/*banner-services styles*/

#banner-services .col-md-1 {
    float: left;
    width: auto;
    margin-right: 10px;
}

#banner-services{
    padding: 20px 0px;
    margin: 20px auto 10px auto;
    width: 100%;
    border-top: 1px solid;
    border-bottom: 1px solid;
    border-color:$secondary-color-lighter;
}
#banner-services .span4, .span6, .span12{
    margin: 0px;
}
#banner-services i{
    font-size: 36px;
}
#banner-services .service-text h4{
    text-transform: uppercase;
    margin: 0px;
    font-size:16px;
    font-weight:bold;
}
#banner-services .service-text{
    line-height: 18px;
}
#banner-services .service-icon{
    float: left;
    width: 50px;
    margin-right: 10px;
}
#banner-services .service-text p{
    margin: 0px;
}
#banner-services .col-md-4 .banner-service-item, .col-md-6 .banner-service-item, .col-md-12 .banner-service-item {
    width: 350px;
    height: 40px;
    margin: auto;
}

.banner-services-footer{
    border-top:1px solid;
    border-color:$black-color-soft;
}
.banner-services-footer #banner-services{
    width: 1140px;
    margin: 25px auto 20px auto;
    border: none;
    padding: 0px;
}
.banner-services-category .row-fluid{
    margin-bottom: 40px;
}
/*End Banner Services*/
/************************************************************************************
Footer
*************************************************************************************/

.pre-footer {
    padding-bottom: 10px;

    .delivery {
        text-align: right;
    }

    .list-inline > li {
        padding-left: 0;
        margin-bottom: 4px;
    }
}

footer {
    .footer {
        background: $primary-color;
        color: rgba( $white-color, .4 );
    }
    .footer-nav {

        padding: 50px 0 40px;

        p {
            margin: 0;
            padding: 0;
        }

        nav {

            a {
                color: rgba( $white-color, .4 );
                &:hover {
                    color: $secondary-color;
                }
            }
            .active a {
                color: $secondary-color;
            }
        }
        .copy {
            color: rgba( $white-color, .4 );
        }

        .fiscal {
            max-height: 60px;
        }
    }

    .sub-footer {
        background-color: $primary-color-dark;
        color: rgba( $white-color, .4 );
        padding: 10px 0;

        p {
            color: $primary-color-light;
        }
        a {
            color: rgba( $white-color, .4 );
                text-decoration: underline;
            &:hover {
                color: $secondary-color;
            }

        }
        .social {
            text-align: right;

            .list-inline > li {
                padding-left: 6px;
                padding-right: 6px;
            }
            .fa-inverse {
                color: $primary-color-dark;
            }
        }
    }   
}

.afip,
.ebit {
    text-align: right;
    vertical-align: middle;
    max-width: 70px;
}
.afip img,
.ebit img {
    display: block;
    float: right;
    width: 100%;
    height: auto;
    max-height: 80px;
}
/*seals*/
.seals > li, .custom-seals-container, .seals > div{
    float: right;
}
.custom-seals-container .custom-seal{
    float: left;
}
.custom-seals-container .custom-seal-img{
   margin: 0px 5px; 
}
.custom-seals-container .custom-seal-img img {
    max-width: 110px;
    max-height: 70px;
}
/*end*/
/************************************************************************************
Buttons
*************************************************************************************/
.btn {

    border-radius: 0;
    border: none;

    &.btn-default {
        background-color: $white-color;
        border-color: $black-color-lighter;
        color: $black-color;
    }

    &.btn-default:hover, &.btn-default:focus, &.btn-default:active, &.btn-default.active {
        background-color: $black-color-light;
    }

    &.btn-primary {
        background-color: $secondary-color;
        color: $white-color;
    }

    &.btn-secundary {
        background-color: $primary-color;
        color: $white-color;
    }

    &.btn-primary:hover, &.btn-primary:focus, &.btn-primary:active, &.btn-primary.active {
        opacity: .85;

    }
     &.btn-secundary:hover, &.btn-secundary:focus, &.btn-secundary:active, &.btn-secundary.active {
        opacity: .85;
    }

    &.btn-search {
        padding: 6px 8px;
        background: $white-color;
        color: $primary-color;
        border: 1px solid $white-color;
        &:hover {
            color: $secondary-color;
        }
    }

    &.btn-lg {
    border-radius: 0;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.33;
    padding: 12px 24px;
    width:270px;
    }

    &.btn-sm {
        border-radius: 0;
        font-size: 12px;
        line-height: 1.5;
        padding: 5px 10px;
    }

    &.btn-xs {
        border-radius: 0;
        font-size: 12px;
        line-height: 1.5;
        padding: 1px 5px;
    }

    &.btn-transparent {
        background-color: $white-color;
        border-color: $white-color;
        color: $primary-color !important;
    }

    &.btn-transparent:hover, &.btn-transparent:focus, &.btn-transparent:active, &.btn-transparent.active {
        background-color: $black-color-softer;
        color: $secondary-color;
    }

    &.cart {
    }

    &.dropdown-toggle {
        text-align: left;
    }

    &.dropdown-toggle {
        border: 1px solid $black-color-light;
    }

    &.nostock {
        cursor: not-allowed;
        pointer-events: none;
        opacity: .65;
        filter: alpha(opacity=65);
        -webkit-box-shadow: none;
        box-shadow: none;
    }
}

/************************************************************************************
SOCIAL ICONS
*************************************************************************************/
.facebook {

    &:before {
        content: '\f09a';
        font-family: FontAwesome;
        display: inline-block;
        font-size: 16px;
    }
}
.twitter {

    &:before {
        content: '\f099';
        font-family: FontAwesome;
        display: inline-block;
        font-size: 16px;
    }
}
.google_plus {

    &:before {
        content: '\f0d5';
        font-family: FontAwesome;
        display: inline-block;
        font-size: 16px;
    }
}
.pinterest {

    &:before {
        content: '\f0d2';
        font-family: FontAwesome;
        display: inline-block;
        font-size: 16px;
    }
}
.instagram {

    &:before {
        content: '\f16d';
        font-family: FontAwesome;
        display: inline-block;
        font-size: 16px;
    }
}

.page-contact .facebook:before {
    margin-right: 19px;
}
/************************************************************************************
ICON FONT
*************************************************************************************/
i {
    font-family: FontAwesome !important;
}

/************************************************************************************
DIVIDER
*************************************************************************************/
.divider, .featurette-divider {
    margin-top: 20px;
    border-top: 1px solid;
}
.divider {
    border-color:$white-color;
}

.featurette-divider {
    border-color:$black-color-soft;
}

/************************************************************************************
PRICE
*************************************************************************************/

#price_display {
    color: $secondary-color;
    h2 {
        margin-top: 6px !important;
    }
}
#compare_price_display {
    color: $black-color-lighter;
    text-decoration:line-through;
    font-weight: normal;

    h4 {
        font-weight: normal;
        margin: 0;
    }
}

/************************************************************************************
QUICK SHOP
*************************************************************************************/
.descriptioncolContent {
    .title {
        h2 {
            margin-top: 0;
        }
    }
}

/************************************************************************************
Superfish
*************************************************************************************/

/*** ESSENTIAL STYLES ***/

.sf-menu, .sf-menu * {
    margin:         0;
    padding:        0;
    list-style:     none;
}
.sf-menu {
    line-height:    1.0;
}
.sf-menu ul {
    position:       absolute;
    top:            -999em;
    width:          10em; /* left offset of submenus need to match (see below) */
}
.sf-menu ul li {
    width:          100%;
    text-align: left;
}
.sf-menu li:hover {
    visibility:     inherit; /* fixes IE7 'sticky bug' */
}
.sf-menu li {
    position:       relative;
}
.sf-menu a {
    display:        block;
    position:       relative;
}
.sf-menu li:hover ul,
.sf-menu li.sfHover ul {
    left:           0;
    top:            38px; /* match top ul list item height */
    z-index:        99999;
}
ul.sf-menu li:hover li ul,
ul.sf-menu li.sfHover li ul {
    top:            -999em;
}
ul.sf-menu li li:hover ul,
ul.sf-menu li li.sfHover ul {
    left:           10em; /* match ul width */
    top:            -1px;
}

/****Right dropdown going off screen fix****/

ul.sf-menu > li:nth-last-child(-n + 2) > ul{
right:0px;
left:auto;
}
ul.sf-menu > li:nth-last-child(-n + 2) > ul > li ul{
right: 100%;
left: auto!important;
}
ul.sf-menu > li:nth-last-child(-n + 2) > ul > li a{
padding: 10px 0px 9px 10px;
}
ul.sf-menu > li:nth-last-child(-n + 2) > ul > li a.sf-with-ul{
padding: 10px 0px 9px 25px;
}
ul.sf-menu > li:nth-last-child(-n + 2) > ul > li a.sf-with-ul .arrow{
line-height: 9px;
}
ul.sf-menu > li:nth-last-child(-n + 2) > ul > li .fa-chevron-right:before {
content: "\f053";
}

ul.sf-menu > li:nth-last-child(-n + 2) > ul > li .fa-chevron-right {
margin-left: 0px;
float: left;
margin-right: 10px;
margin-top: 3px;
}

/*** DEMO SKIN ***/
#navigation {
    width:100%;
}

.sf-menu {
    width: 100%;
    text-align: right;
}
.sf-menu a {
    font-size: 14px;
    font-weight: normal;
    padding:10px 10px 20px 10px;
    letter-spacing: -0.5;
    text-decoration:none;
    color: $primary-color;
     box-shadow: none;
     -moz-box-shadow: none;
    -webkit-box-shadow: none;
}

.sf-menu a:hover,
.sf-menu li.active a,
.sf-menu li:hover > a {
    color: $secondary-color;
    box-shadow:  inset 0 -5px 0 0 $secondary-color;
    -moz-box-shadow:   inset 0 -5px 0 0 $secondary-color;
    -webkit-box-shadow: inset 0 -5px 0 0 $secondary-color;
}    
 
.sf-menu ul {
   background: rgba($white-color,.9);
    border: 1px solid $black-color-soft;
    margin-top: 6px;
}
.sf-menu ul a {
    padding:12px 6px;
    background: transparent;

}
.sf-menu ul a:hover {
    background: $secondary-color;
    color: $white-color !important;
     box-shadow: none;
     -moz-box-shadow: none;
    -webkit-box-shadow: none;
}

.sf-menu li.active ul a {
   background: rgba($white-color,.9);
    color: $primary-color;
     box-shadow: none;
     -moz-box-shadow: none;
    -webkit-box-shadow: none;
}
.sf-menu li.active ul a:hover {
    background: $secondary-color;
    color: $white-color;
}

.sf-menu li.first a{
    padding-left:20px;
}
.sf-menu li {
    // background: $white-color;
    display: inline-block;
}

.sf-menu li:hover, .sf-menu li.sfHover,
.sf-menu a:focus, .sf-menu a:hover, .sf-menu a:active {
    outline: 0;
}

.sf-menu ul li ul li a, .sf-menu ul li ul li ul li a{
    text-align: left;
}

.sf-menu li.selected a {
    text-align: left;
}

.sf-menu li.selected ul li a {
    border: none;
}
.sf-menu i {
    font-size: 10px;
    margin-left: 6px;
    line-height:14px;
}
.navbar-header > li > a > .arrow{
    margin-top:1px;    
}


.dropdown-menu {
    max-height: 600px;
    overflow-y: auto;
}


// .mobile navigation
.mobile {
    font-size: 16px;
    margin-left: 20px;
     padding: 0px;

    & a {
        color: $primary-color;
        &:hover {
            background: $black-color-soft !important;
        }
    }

    & .dropdown-menu > .active > ul,
    & .dropdown-menu ul {
        list-style: none;
        padding-left: 0;
        
    }

     .dropdown-menu > .active > ul > li,
     .dropdown-menu ul li {
        overflow: hidden;
        padding: 3px 5px 6px 20px;

        & a {
            color: $primary-color;
        }
     }

    .dropdown-menu > .active > a,
    .dropdown-menu > .active > a:hover, 
    .dropdown-menu > .active > a:focus {
        color: $white-color !important;
        background: $secondary-color;
        font-variant: bold !important;
    }

    .dropdown-menu > .active > ul > .active {
        background: $black-color-lighter !important;
        color: $white-color !important;
    }

    .dropdown-menu .active ul li:hover,
    .dropdown-menu ul li:hover {
        color: $primary-color !important;
        background: $black-color-soft !important;

    }
}

/************************************************************************************
MEDIA QUERIES
*************************************************************************************/

@media (min-width: 1200px) {

  // .visible-lg

    .cloud-zoom-wrap {
        #zoom img {
            max-width: 100%;
            margin:auto;
        }
        .mousetrap {
            display: block;
            visibility: visible;
        }
    }
}


@media (min-width: 992px) and (max-width: 1199px) {

  // .visible-md 
  #banner-services .col-xs-12 .banner-service-item {
    width:280px;
    }
#banner-services .service-text h4{
    font-size: 12px;
    font-weight: bold;
    }
    #banner-services i {
    font-size: 32px;
    }
    #banner-services{
    width:100%;
    }
    .products-list .thumbnail .image-wrap img{
    width:80%;
    }
}


@media (max-width: 992px){
    .smaller-logo .img.logo{
        line-height: 36px;
    }
    /* Headers */
    .welcomeMessage {
        margin-top: 30px;
    }
    .welcomeMessage h1{
        font-size:26px;
    }
    .page{
        margin-top:10px;
    }
     /*Hamburguer Navigation*/
    .pushy-active{
    overflow-x: hidden;
    }
     .top-header .container{
       width: 100%;
    }
    .pushy{
    z-index: 99999;
    left: -50px;
    display:block;
    }
    .pushy{
        width: 250px; /* Changed the width to 400px */
    }
    .pushy-left{
        transform: translate3d(-250px,0,0);
        -webkit-transform: translate3d(-250px,0,0);
        -moz-transform: translate3d(-250px,0,0);
        -ms-transform: translate3d(-250px,0,0);
        -o-transform: translate3d(-250px,0,0);
    }
    .pushy-open{
        left: 0px;
    }
    .site-overlay, .pushy-active .site-overlay{
        display: block;
    }
    .container-push, .push-push{
         transform: translate3d(250px,0,0);
        -moz-transform: translate3d(250px,0,0);
        -ms-transform: translate3d(250px,0,0);
        -o-transform: translate3d(250px,0,0);
    }
    .pushy a{
        border-bottom: 0px;
        padding: 13px 20px;
        color: #F2F2F2;
        font-weight: normal;
    }
    .pushy i{
        font-size: 8px;
        margin-top: 6px;
        float: left;
        margin-right: 5px;
    }
    #accordion{
        display: none;
    }
    .mobile-dropdown{
        position: absolute;
        top: 0px;
        right: 0px;
    }
    .mobile-dropdown i{
        font-size: 15px;
        padding: 16px 10px;
        margin: 0px;
    }
    .subitems{
        position: relative; 
    }
    .pushy ul{
    padding-left:0px;
    }
    .pushy ul li{
        list-style:none;
    }
    .pushy > ul > .subitems > ul#accordion{
        background: rgb(73, 73, 73);
    }
    .pushy ul > .subitems > ul#accordion > .subitems > ul#accordion{
        background: rgb(95, 95, 95);
    }
    .pushy ul > .subitems > ul#accordion > .subitems > ul#accordion > .subitems > ul#accordion{
        background: rgb(113, 113, 113);
    }
    .mobile-nav{
        width: 45px;
        float: left;
        margin-left: 0px;
        margin-top: 12px;
    }

    .mobile-nav i{
        font-size:21px;
        padding: 6px 10px;
        background-color: $primary-color-dark;  
    }
    .mobile-fixed .menu-btn i{
        font-size:21px;
        background:none;
        padding:0px;
    }
    .mobile-fixed .menu-btn{
      width: 32px;
    }
    .pushy a:hover{
    background:$secondary-color;
    text-decoration:none;
    }
    .mobile-dropdown i{
        background:rgba(131, 131, 131, 0.4);
        color:white;
    }
    .mobile-dropdown.dropdown-selected > i{
        background:$secondary-color;
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
    .mobile-fixed{
     display:none;
     margin-top: 10px;
     width:35px;
    }

    /*Hamburguer Navigation end*/
    /*Top Header*/
    .top-header-rightcolumn {
        display: block;
        width:100%;
        text-align:center;
    }
    .top-header .search-wrapper{
        padding: 10px 0 12px 0;
    }
    message-desktop{
    display:none!important;
    }
    .top-header .message-wrapper{
        width:100%;
        text-align:center;
    }
    .top-header p {
        padding-top: 0px;
        padding-bottom: 10px;
        margin: 0px;
    }
    .affix #main-menu {
   padding-top: 5px;
    }
    .img.logo{
      font-size: 26px;
      padding-bottom:10px;
      line-height: 30px;
    }
    .smaller-logo #logo h1, .smaller-logo #logo a{
        font-size: 22px;
          line-height: 42px;
    }
    #navigation #cart{
        padding-top:5px;
    }
    .smaller-logo #cart{
        padding-top:5px!important;
    }
    .top-header #auth {
      padding: 8px 0 0px;
      text-align: center;
        margin-bottom: 0px;
    }
    .top-header .account-wrapper{
        float:none;
    }
    /*Products Grid*/
    .products-list .row{
        clear:both;
        float:left;
    }
     .products-list .caption .row{
        float:none;
    }
    .thumbnail{
        text-align:center;
        line-height: 21px;
    }
    .thumbnail .offer{
        left:0px;
    }
    /*Product Detail*/
    .cloud-zoom-wrap #zoom img{
        width: 60%;
        min-width:60%;
        margin: auto;
    }
    .cloud-zoom-wrap .mousetrap{
        width:100%!important;
    }
    #cloud-zoom-big{
        display:none!important;
    }
    .sharelinks{
      width: 300px;
      margin: 0px auto 10px auto;
      display: block;
      height: 40px;
    }
}

@media (min-width: 768px) and (max-width: 991px) {

// .visible-sm

    .top-header {
        .container {
            position: relative;
        }
    }

    .message-wrapper,
    .account-wrapper,
    .languages-wrapper,
    .search-content-wrapper {
        float: none;
        position: static;
        text-align: left;
        margin-left: 0;
    }

    .search-content-wrapper {
        width: 92% !important;
        margin-bottom:10px;
    }
    .languages-wrapper {
        display: inline-block !important;
        margin-left: 15px !important;
    }
    .account-wrapper {
        float: none !important;
        width: 280px;
    }

    #compare_price_display {
        font-size: 18px !important;
    }
    .title-wrapper {
        .price-holder {
            font-size: 26px !important;
        }        
    }

    .widgets {
        .widget {
            margin-bottom: 40px;
        }
    }
     .navbar-nav {
        float: right;
    }
    .navbar-nav > li > a,
    .navbar-brand,
    #cart {
        padding-top: 5px;

    }
    .affix-top {
        padding-top: 31px;
        padding-bottom: 10px;
    }
    .affix {
        & #logo {
            margin-top: 5px;

        }
    }
    /*Cart Mobile*/
    .col-xxs {
        display: inline-block !important;
        width: 14% !important;
        margin-left: 0;
        margin-right: 0;
        text-align: left !important;
        padding: 0 !important;

        &.col-quantity {
            width: 20% !important;
        }

        &.last {
            content: ' ';
        }
        &.col-delete {
            text-align: right !important;
            width: 2% !important;
            margin-right: 1%;
        }
        &.col-quantity {
            text-align: right !important;
            width: 10% !important;
            margin-right: 5% !important;
        }
        &.col-image-product {
            width: 55% !important;
        }
        &.col-product {
            width: 40% !important;
        }
    }

    #shoppingCartPage {
        .cart-contents {

            .firstrow {

            }
            .productrow {

                li {
                    text-align: right;
                    font-size: 18px;
                }
                .name {
                    font-size: 13px !important;
                }
            } 
        } 
    } 
    #banner-services{
    width:100%;
    padding: 30px 0px 2px 0px;
    }
    #banner-services .col-xs-12 .banner-service-item{
    height: 60px;
    }
    .banner-services-footer #banner-services{
    width:100%;
    margin: 40px auto 5px auto;
    }
    #banner-services .service-text h4{
    font-size: 12px;
    font-weight: bold;
    }
    #banner-services i {
    font-size: 25px;
    }
    #banner-services .col-md-4 .banner-service-item, .col-md-6 .banner-service-item, .col-md-12 .banner-service-item{
      width: 290px;
    }

}

@media (max-width: 767px) {

    .top-header .languages-wrapper{
    width: 100%;
    float: none;
    margin: auto;
    }
    .top-header #auth{
      padding: 0px 0 0px;
    }
    .top-header .languages-wrapper .languages{
    text-align:center;
    padding-top:5px;    
    }
    .top-header .account-wrapper{
      width: 100%;
      clear: both;
    }
    .widgets .widget-header h3{
    margin: 4px 0 20px;   
    }
    .smaller-logo .cart-summary a{
        padding: 0 0 16px 0;
    }
    .widgets .widget-divider{
    margin: 20px 0 20px;
    }
    /*Headers*/
    .welcomeMessage {
        margin-top: 10px;
    }
    .welcomeMessage h1 {
        font-size: 22px;
    }
    .products-list .products-header h3 {
        margin: 4px 0 30px;
        font-size: 18px;
        text-align:center;
    }
    .products-list{
        margin-top: 20px;
    }
    .widget-header, .widget-content{
        text-align:center;
    }
    .headerBox-Page .error h1{
        font-size: 20px;
        text-align: center;
        width: 80%;
        margin: 20px auto 18px auto;
    }
    #no-logo{
        font-size:24px;
    }
    .cart-summary a{
        padding: 0 0 18px 0;
    }
    /**Footer**/
    .footer .footer-nav {
        padding: 20px 0 20px;
        text-align: center;
    }
    .widgets .widget-divider{
        width:100%;
        margin: 20px 0 20px;
    }
    .widgets .newsletter .btn{
        width: 100%;
        height: 40px;
        font-weight: bold;
    }
    .divider, .featurette-divider{
        margin-top: 0px;
    }
    .banner-services-footer #banner-services{
        margin: 30px auto 5px auto;
    }
    .widget-content.newsletter-content{
    width:70%;
    margin:auto;
    }
    /*Contact page*/
    .page-contact .form .btn{
        width:100%;
    }
// .visible-xs 

    .navbar > .container .navbar-brand {
        margin-left: 15px;
    }
    .navbar-nav > li > a {
        border-bottom: 1px solid $black-color-soft;
        margin: 0;
    }
    .navbar-nav > li > a:hover,
    .navbar-default .navbar-nav > .active > a, 
    .navbar-default .navbar-nav > .active > a:hover, 
    .navbar-default .navbar-nav > .active > a:focus {
        background-color: $secondary-color !important;
        color: $white-color !important;
        border-bottom: 1px solid $secondary-color-dark;
        margin-top: 1px;
    }
    .navbar-default .navbar-nav > .open {
        border-bottom: 0;
        margin-bottom: 0;
    }

    .message-wrapper,
    .account-wrapper,
    .languages-wrapper,
    .search-content-wrapper {
        float: none;
        position: static;
        text-align: left;
        margin-left: 0;
    }

    .search-content-wrapper {
        width: 88%!important;
        float:left;
    }
    .languages-wrapper {
        margin-left: 10 !important;
        width: 18%;
    }


    .navbar-nav > li > a,
    .navbar-brand,
    #cart {
        padding-top: 5px;

    }
    .affix-top {
        padding-top: 31px;
        padding-bottom: 10px;
    }
    .affix {
        & #logo {
            margin-top: 5px;

        }
    }
    .cloud-zoom-wrap {

        .mousetrap {
            display: none;
            visibility: hidden;
        }
    }
    /*Cart Mobile*/
    #shoppingCartPage {

        .cart-contents {

            .firstrow {
                font-size: 14px;

                li.col-quantity {
                    text-align: left;
                }
            }
            .productrow {
                
                .name {
                   margin: 5px 0 0 0;
                   text-align: center;
                }
                a {
                    font-size: 12px;
                    line-height: 110%;
                }
            }
        } 
    } 
    #shoppingCartPage{
    margin-bottom:20px;
    }
    #shoppingCartPage .cart-contents{
    margin: 20px 0;
    }
    .shipping-calculator{
    margin:10px auto 20px auto;
    width:100%;
    }
    .shipping-calculator .calculate-shipping-button{
    width:100%;
    }
    #shoppingCartPage .cart-contents .productrow, #shoppingCartPage .cart-contents .productrow:hover{
    background-color:#F7F7F7;
    margin-bottom: 10px;
    border-bottom: 1px solid $black-color-soft;
    }
    #shoppingCartPage .cart-contents .productrow .col-product{
     padding-left: 10px;
    }
    #shoppingCartPage .cart-contents .productrow .col-product .name{
    width:90%;
      text-align: left;
      font-size: 14px;
      font-weight: 600;
    }
    #shoppingCartPage .cart-contents .productrow .col-delete .col-xs-6{
    padding:0px;
    }
    #shoppingCartPage .cart-contents button.item-plus, #shoppingCartPage .cart-contents button.item-minus{
    background-color:$primary-color;
    height: 36px;
    width: 32px;
    margin-top: 0px;
    }
    #shoppingCartPage .cart-contents button.item-plus i.fa, #shoppingCartPage .cart-contents button.item-minus i.fa{
    color: $white-color !important;
    font-size: 14px;
    }
    #shoppingCartPage .cart-contents .total{
        text-align:center;
        font-size: 18px;
        padding:10px;
    }
    #shoppingCartPage .cart-contents .total .subtotal-price{
    margin-bottom:6px;
    }
    #shoppingCartPage .cart-contents .productrow .col-quantity{
      margin-top: 25px;
      margin-left: 60px;
      width: 30%;
    }
    #shoppingCartPage .checkOutCallOuts .col-xs-12, #shoppingCartPage .checkOutCallOuts .col-md-8{
    text-align:center;
    }
    #shoppingCartPage #go-to-checkout{
    margin:0px auto 0px auto;
    width:70%;
    float: none!important;
    }
    #shoppingCartPage .cart-contents .productrow{
    position:relative;
    }
    #shoppingCartPage .cart-contents .productrow .col-image {
    width: 100px;
    padding: 16px 10px 0px 12px;
    }
    #shoppingCartPage .cart-contents .productrow .col-image img {
      max-width: 70px;
    }
    #shoppingCartPage .cart-contents .productrow .col-quantity {
      margin-top: 40px;
      margin-left: 0px;
      width: 116px;
      padding-left: 10px;
      padding-right: 10px;
    }
    #shoppingCartPage .col-quantity .col-xs-3{
    width: 27px;  
    }
    #shoppingCartPage .col-quantity .col-xs-6{
      width: 36px;
    }
    #shoppingCartPage .cart-contents .productrow .col-quantity input{
       width: 40px;
       font-size:14px;
    }
    #shoppingCartPage .cart-contents .productrow .col-delete{
      width: 26px;
      padding: 0px;
      position: absolute;
      top: 10px;
      right: 10px;
      margin-top: 0px;
    }
    #shoppingCartPage .cart-contents .productrow .col-subtotal{
    width:40%;
    float:right;
    margin-top:45px;
    }
    #shoppingCartPage .shipping-calculator{
    margin-bottom:10px;
    float:none;
    }
    #shoppingCartPage .checkOutCallOuts .continue-buying{
      width: 70%;
      float: none!important;
    }
    #product_form #calculate-shipping-button, #shoppingCartPage .checkOutCallOuts #calculate-shipping-button{
    margin-top: 6px;
    padding: 10px;
    }
    #banner-services{
    width:100%;
    padding: 30px 0px 2px 0px;
    }
    #banner-services .col-xs-12 .banner-service-item{
    height: 60px;
    }
    .banner-services-footer #banner-services{
    width:100%;
    margin: 40px auto 5px auto;
    }
    #banner-services .service-text h4{
    font-size: 12px;
    font-weight: bold;
    }
    #banner-services i {
    font-size: 32px;
    }
    #banner-services .col-xs-12 .banner-service-item {
    width:280px;
    }
    /*Product grid*/
    .thumbnail{
      width: 300px;
     margin: 0px auto 14px auto;
  }
    /*Product Grid*/
    .title-wrapper .title{
        width: 100%;
        text-align: center;
          max-width: 100%;
    }
    .title-wrapper .price-holder{
        width: 100%;
        float: left;
        text-align: center;
    }
    #breadcrumb{
        text-align:center;
    }
    .page-product .installments{
        text-align: center;
    }
    .installments.max_installments_container{
        text-align: center;
    }
    #button-installments{
        width:100%;
        text-align:center;
    }
    .fancyContainer .col-xs-12{
    float: left;
    margin: 0px auto 5px auto;
    clear: both;
    }
    .fancyContainer .attributeLine{
      width: 70%;
      margin: auto;
      display: block;
    }
    .attributeLine .variation-label{
    max-width:200px;
    clear:both;
    float:left;
    }
    .product-description-wrap{
      margin: 20px 0;
    }
    .shipping-calculator-form .form-control{
        width:100%;
        margin-bottom: 0px;
          max-width: 100%;
        text-align:center;  
    }
    #calculate-shipping-button{
        width: 100%;
        margin: 10px 0px;
    }
    #product_form .addToCartButton{
    text-align:center;
    }
    #product_form .btn.btn-primary{
        width:70%;
        margin: auto;
        float: none;
    }
    #invalid-cep{
        text-align:center;
    }

    #product_form span.shipping-method-name{
    text-align:left;
    }
    #product_form .shipping-calculator{
    text-align:center;
    }
    .shipping-calculator{
      text-align: center;
    }
    .shipping-calculator .list-unstyled {
        margin-top:20px;
        text-align:center;
    }
    .shipping-calculator .list-unstyled li{
      margin: 10px 0px;
    }

    .mobile-bxslider{
        display: block;
        float: left;
        width: 100%;
        text-align: center;
        margin-bottom: 15px;
        position: relative;
    }
    .imagecol .bx-wrapper{
        display: block;
    }
    .desktop-featured-product{
        display: none;
    }
    .mobile-bxslider img{
        margin: auto;
        height: auto;
        max-width: 70%!important;
        max-height: 300px;
    }
    .mobile-bxslider .bx-wrapper .bx-viewport{
        moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
    }
    #related-products .products-list .row{
        float:none;
    }
    .imagecol .mobile-bxslider .free_shipping{
        left: 30px;
        right: auto;
    }
    .imagecol .mobile-bxslider .offer{
        right: 30px;
    }
    .social-container-box{
    width: 100%;
    float: left;
    margin: auto;
    height:70px;
    }
    .social-container-box .shareLinks{
    width: 300px;
    margin: auto;
    height: 50px;
    display: block;
    float: none;
    }
    /*Login - Register - Account*/
    #login-form .btn-primary{
        width:100%;
        margin-top: 15px;
    }
    #orderBoxDesk{
        display:none!important;
    }
    #orderBoxMobile {
        display: block!important;
    }
    .footer-nav nav{
        margin: 20px 0 20px 0;
        clear: both;
        float: left;
        width: 100%;
    }
    .smaller-logo .img.logo img{
        margin-top: 0px;
    }
    .product-description-wrap .product-description-title{   
    text-align:center;
    }
    select.sort-by.form-control{
    width:40%;
    }
    .account-form-wrapper{
        width:80%;
        margin:20px auto;
    }
    /*User Content*/
    .user-content img, .product-description-wrap img {
        max-width: 80%!important;
        height: auto!important;
        width: auto;
    }
    .user-content, .product-description-wrap{
        width: 100%;
    }
    .user-content table, .product-description-wrap table{
        width: 100%!important;
    }
    /*Password page*/
    #unlock-form{
    width:30%;
    }
    .password-page .password-container.password-message h2{
    width:80%;
    }
}

@media (max-width: 600px) {
    .affix-top .mobile-nav{
    width: 32px;
    margin-top:2px;
    }
    .slider-wrapper .fa-refresh{
        font-size:30px;
        margin-top:-5px;
    }
    select.sort-by.form-control {
        width: 100% !important;
        margin: 15px 0 !important;
    }

    .installments li[id^="method"] {
        width: 100%;
    }
    li[id^="method"].active a {
        border-bottom: 1px solid $black-color-soft ;
    }
    .seals > li, .seals > div{
        float:none;
        width: 100%!important;
        clear: both;
        margin:5px auto;
    }
    .custom-seals-container{
        clear: both;
        width: 100%;
        margin:5px auto;
        text-align: center;
    }
    .custom-seals-container .custom-seal{
        float: none;
    }
    .custom-seals-container .custom-seal-img {
        margin: 5px;
    }
    .footer-nav {
        .copy {
             text-align: center !important;
        }
        ul.list-inline {
            display: block;
            position: static;
            float: none !important;
            text-align: center !important;

            &.pull-right {
                float: none !important;
                text-align: center !important;
                width: 100%;
            }
        }
        nav {
            .list-inline > li {
                display: block !important;
                margin-left: 0;
                margin: 6px 0;

            }
        }
    }

    .banner-copy {
        font-size: 1.33em;
    }
    .sort-by-filter {
        display: block;
    }
    /*Account Order*/
    .customer-box .profile-image, .customer-box .personal-data, .customer-box .addresses{
        width:100%;
        margin-right:0px;
        margin-bottom:20px;
        text-align:center;
    }
    .customer-box h3, #orderBoxDesk h3, #orderBoxMobile h3{
        text-align:center;
    }
    /*password page*/
    #unlock-form{
        width:40%;
    }
    .password-page .password-container.password-icon{
        height:130px;
    }  
    .password-page .password-container.password-icon .password-svg{
        width:40%;
    }
    .password-page .password-container.password-message h2{
        font-size:28px;
    }
    .password-page .password-container.password-message h2{
        width:100%;
    }
    .password-page .featurette-divider{
        width:90%;
    }

}

@media (max-width: 480px) {
    .smaller-logo .img.logo img{
        max-width:85px;
    }
    /*Headers*/
    .welcomeMessage h1 {
        font-size: 18px;
    }
    .products-list .products-header h3{
    font-weight: 600;
      margin: 4px 0 25px;
    }
    .headerBox-Page .error h1{
          font-size: 18px;
          text-align: center;
          line-height: 24px;
    }
    hr{
        margin-top: 10px;
    }
    #banner-innerpage{
        min-height: 90px;
    }
    .widget-content.newsletter-content{
    width:100%;
    margin:auto;
    }
    /*Banner Services*/
    #banner-services i {
        font-size: 26px;
    }
    /*navigation*/
    #main-menu #cart .cart-summary span:first-child{
        display:none;
    }
    .navbar .fa-shopping-cart{
        font-size: 24px;
        float: right;
        margin-left: 10px;
    }

    .navbar .cart-summary a{
          float: right;
    }
    .cart-summary .badge{
        float: left;
        margin-right: 8px;
    }
    /*Contact page*/
    .page-contact .sidebar ul{
        text-align:center;
    }
    .page-contact h3{
        font-size: 18px;
        text-align: center;
          margin-top: 40px;
    }
    .page-contact ul li{
        margin-bottom:10px;
    }
    #no-logo{
        font-size:18px!important;
    }
    .fb_iframe_widget span{
        height: 160px!important;
        display: block!important;
        text-align: center!important;
    }
    .page-product .fb_iframe_widget span{
        height:auto!important;
    }
    .fb_iframe_widget{
      margin: 0 auto 0px auto!important;
      width: 320px!important;
    }
    .fb_iframe_widget iframe{
      position: relative!important;
      width: 320px !important;
    }
    .image-wrap {
        width: 100%;
    }
    .col-xxs {
        display: inline-block !important;
        width: 20% !important;
        margin-left: 0;
        margin-right: 0;
        text-align: left !important;
        padding: 0 !important;

        &.last {
            content: ' ';
        }
        &.col-delete {
            text-align: right !important;
            width: 4% !important;
            margin-right: 6%;
        }
        &.col-quantity {
            text-align: right !important;
            width: 15% !important;
            margin-right: 10% !important;
        }
        &.col-product {
            width: 25% !important;
        }
    }

    select.sort-by.form-control {
    width:74%;
    }
    #banner-services .col-xs-12 .banner-service-item {
    width:280px;
    }
    /*Product grid*/
    .image-wrap{
      height: 250px;
      width: 210px;
    }
    /*Product detail*/
    .cloud-zoom-wrap #zoom img{
        width: 80%;
        min-width: 80%;
    }
    #product_form .btn.btn-primary{
    width:100%;
    }
    .mobile-bxslider img{
    max-height:250px;
    max-width: 80% !important;
    }
    .title-wrapper .title h2, .title-wrapper .title h1{
    font-size:20px;
    margin-bottom:20px;
    }
    .fancyContainer .attributeLine{
     width: 100%;
    }
    /*Cart Mobile*/
    #shoppingCartPage .cart-contents .productrow{
    padding-bottom:0px;
    }
    #shoppingCartPage .cart-contents button.item-plus, #shoppingCartPage .cart-contents button.item-minus{
       width: 28px;
    }
    #shoppingCartPage .cart-contents button.item-plus i.fa, #shoppingCartPage .cart-contents button.item-minus i.fa{
        font-size: 12px;
    }
    #shoppingCartPage .col-quantity .col-xs-6, #shoppingCartPage .col-quantity .col-xs-3{
    padding:0px;
    }
    #shoppingCartPage .cart-contents .productrow .col-quantity{
      padding-left: 20px;
       width:126px;
    }
    #shoppingCartPage .cart-contents .productrow .col-quantity{
    float:right;
    }  
    #shoppingCartPage .cart-contents .productrow .col-subtotal{
    margin-top: 25px;
    float: right;
    width: 100%;
    background-color: rgb(244, 244, 244);
    padding-top: 5px;
    padding-bottom: 5px;
    }  
    #shoppingCartPage #go-to-checkout{
    margin:0px auto 0px auto;
    width:100%;
    float: none!important;
    }
    .shipping-calculator{
    width:100%;
    }
    #shoppingCartPage .checkOutCallOuts .continue-buying{
    width:100%;
    }
    .account-form-wrapper{
        width:100%;
        margin:20px auto;
    }
    /*password page*/
    .password-page .password-container.password-message h2{
        font-size:24px;
    }
    #unlock-form{
        margin: 80px auto 20px auto;
    }

}
@media (max-width: 400px) {
    /*Product grid*/
    .image-wrap {
        height: 190px;
        width: 160px;
    }
    .thumbnail{
        width: 270px;
        margin: 0px auto 24px auto;
    }
    /*Contact page*/
    .page-contact h3 {
        font-size: 16px;
        font-weight:bold;
    }
    .page-contact .mail strong{
        font-weight:normal;
    }
    .imagecol .mobile-bxslider .free_shipping{
        left: 5px;
        right: auto;
    }
    .imagecol .mobile-bxslider .offer{
        right: 5px;
    }

}

@media (max-width: 321px) {

    .header-message {
        margin: 0;
        margin-bottom: -5px;
    }

    .title-wrapper {
        .title {
            margin-right: 0;
            min-width: 100%;

        }
        .price-holder {
            min-width: 100%;
            margin-right: 0;
            min-width: 100% !important;

            .price {
                text-align: left;
            }
        }
    }
    .page-product {
        .installments {
            text-align: left;
        }
    }
    .page-product .shareLinks .shareItem{
    margin-right:5px;
    }
    .col-xxs {

        &.last {
            content: ' ';
            width: 5% !important;
            margin: 0 !important;
        }
        &.col-delete {
            text-align: right !important;
            width: 4% !important;
            margin-right: 0 !important;
            margin-left: 1% !important;
            margin-top: 35px !important;
        }
        &.col-quantity {
            text-align: right !important;
            width: 20% !important;
            margin-right: 5% !important;
        }

    }
    select.sort-by.form-control {
    width:74%;
    }
}


/************************************************************************************
TWITTER
*************************************************************************************/
iframe .timeline-header,
iframe .timeline-footer {
    display: none !important;
    visibility: hidden !important;
}
.customisable-border {
    border: none;
}
.tweet {
    border-width: 0 0 1px;
    padding: 12px 12px 10px 0 !important;
}

/************************************************************************************
Facebook
*************************************************************************************/

._8r {
    display: none !important;
    visibility: hidden !important;
}

.uiList {
    padding: 10px;
    padding-top: 40px !important;
}

.fb-comments,
.fb-comments iframe[style],
.fb-comments .pluginSkinLight > div,
.fb-comments > span,
.fb-comments #feedback_06PwWERA4ObWH1fn3 {
    width: 100% !important;
}


/* Make the Facebook Like box responsive (fluid width)
https://developers.facebook.com/docs/reference/plugins/like-box/ */

/* This element holds injected scripts inside iframes that in 
some cases may stretch layouts. So, we're just hiding it. */

#fb-root {
  display: none;
}

.fb_iframe_widget {width: 100% !important; margin: 0 auto 20px auto; text-align: center;}

.fb_iframe_widget div{
    margin: auto;
}



/************************************************************************************
CUSTOM CSS
*************************************************************************************/
::selection{
    background: $secondary-color;
}
::-moz-selection {
    background: $secondary-color;
}
h1, h2, h3, h4 {
	font-family: $fonthead!important;
}
.btn {
	font-family: $fontbut!important;
}

.top-header,
.btn.btn-secundary,
footer .footer,
.thumbnail .out-of-stock
{
    background: {{ settings.primary_color }};
}

.form-control:focus,
.page-contact .form-control:focus {
    border-left: 2px solid $secondary-color!important;
}

a, active, a:hover, a:focus,
.top-header a:hover, 
#menu .sf-menu a,
.btn.btn-search:hover,
.welcomeMessage,
.sf-menu a:hover,
.sf-menu li.active a,
.sf-menu li:hover > a,
.product-description-title,
.price,
#breadcrumb .crumb:hover,
#breadcrumb .crumb.last,
#shoppingCartPage .cart-contents .productrow .col-delete a:hover:before,
#shoppingCartPage .cart-contents .productrow .name:hover,
.navbar .cart-summary a:hover,
.navbar-default .navbar-toggle:hover, 
.navbar-default .navbar-toggle:focus,
.modal-dialog .modal-title,
.page-contact ul li:hover > a,
footer nav a:hover,
footer nav .active a,
footer .sub-footer a:hover,
.btn-search:hover, .btn-transparent:hover, .btn-transparent:focus, .btn-transparent:active, .btn-transparent.active,
#price_display,
.product-description-wrap .product-description-title,
footer .footer-nav nav a:hover,
.page-product .installments #installments_number, .page-product .installments #installments_amount,
.page-contact *:hover:before, .max_installments
{
	color: $secondary-color;
}

.sf-menu ul a:hover,
.image-wrap,
.btn.btn-primary,
.thumbnail .offer,
.navbar .cart-summary .badge,
.mobile .dropdown-menu > .active > a,
.mobile .dropdown-menu > .active > a:hover, 
.mobile .dropdown-menu > .active > a:focus,
.sf-menu li.active ul a:hover,
.banner
{
	background: $secondary-color;
}

#no-logo,
.btn.btn-search,
.sf-menu a,
.sf-menu li.active ul a,
.caption,
#shoppingCartPage .cart-contents .productrow .name,
.total-price,
.navbar .fa-shopping-cart,
.navbar .cart-summary a,
#shoppingCartPage .cart-contents .productrow .col-delete a:before,
#shoppingCartPage .cart-contents .total-price,
.fa-shopping-cart,
.page-contact ul li, .page-contact ul li a,
btn.btn-search,
.mobile .dropdown-menu ul li a,
.mobile .dropdown-menu > .active > ul > li a, 
.mobile .dropdown-menu ul li a,
.thumbnail .caption .title a,
.page-contact *:before,
.form-control:-moz-placeholder,
.form-control::-moz-placeholder,
.form-control:-ms-input-placeholder,
.form-control::-webkit-input-placeholder
{
	color: {{ settings.primary_color }};
}
#shoppingCartPage .cart-contents .total .subtotal-price{
    margin-bottom:10px;
}
#main-menu,
#menu .sf-menu a,
.footer-nav,
.powered-by {
	font-family: $fontnav;
}
#main-menu{
 margin-top: 15px;   
}
.btn {
	font-family: $fontbut;
}

.sf-menu a:hover,
.sf-menu li.active a,
.sf-menu li:hover > a,
.sf-menu a:hover, .sf-menu li.active a, .sf-menu li:hover > a
 {
	 box-shadow:  inset 0 -5px 0 0 $secondary-color;
	-moz-box-shadow:   inset 0 -5px 0 0 $secondary-color;
	-webkit-box-shadow: inset 0 -5px 0 0 $secondary-color;
} 
/****Right dropdown going off screen fix****/

ul.sf-menu > li:nth-last-child(-n + 4) > ul{
right:0px;
left:auto;
}
ul.sf-menu > li:nth-last-child(-n + 4) > ul > li ul{
right: 100%;
left: auto!important;
}
ul.sf-menu > li:nth-last-child(-n + 4) > ul > li a .arrow:before {
content: "\f104";
font-family: FontAwesome;
font-size: 20px;
}
.sf-menu > li:nth-last-child(-n + 4) > ul > li a .arrow{
float: left;
margin-right: 8px;
line-height:14px;
}
ul.sf-menu li ul > li a .arrow:before {
content: "\f105";
font-family: FontAwesome;
font-size: 20px;
}
.sf-menu .arrow{
float: right;
}

.widget-static-content .static-content-cover {
 	background-image: url( "{{ "banner-home.jpg" | static_url }}" );
}

#banner-innerpage.banner-innerpage-content.contact-banner .banner-innerpage-cover {
 	background-image: url( "{{ "banner-contact.jpg" | static_url }}" );
}
#banner-innerpage.banner-innerpage-content.category-banner .banner-innerpage-cover {
 	background-image: url( "{{ "banner-products.jpg" | static_url }}" );
}
#banner-innerpage.category-banner .banner-copy {
	color: $banner-category-color;
}
#banner-innerpage.contact-banner .banner-copy {
	color: $banner-contact-color;
}
#banner-innerpage.contact-banner .banner-copy h2{
    font-size: 36px;
}
select.sort-by.form-control {
    display: inline-block;
    margin: 15px;
    width: 40%;
}
.sort-by-filter{
    margin-top: 20px;
}

//Infinite scrolling
.infinite-scroll-loading {
    background: url( "{{ "img/loading.gif" | static_url }}" ) no-repeat center;
    display: block;
    height: 80px;
    width: inherit;
    overflow: hidden;
}
//center align items on big tablet
@media (min-width: 481px) and (max-width: 768px){
    .thumbnail .caption, .products-list .products-header h3{
        text-align:center;
    }
    .row .col-xs-12 .thumbnail .image-wrap{
    margin:0px auto;
    }
    .thumbnail .offer, .thumbnail .free_shipping{
    margin-top: 0px;
    }
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
    i.fa.fa-facebook {
        color: #fff;
        top: 24px;
        left: 37px;
        position: absolute;
        font-size: 25px;
        z-index: 9;
    }
    .featurette-or-divider {
        margin: -9px auto 24px auto;
    }
    .badge {
        color: $black-color-lighter;
        background: $white-color;
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
        margin-bottom:10px;
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
.customer-box h3, #orderBoxDesk h3, #orderBoxMobile h3{
    margin-bottom: 20px;
    font-size: 20px;
      margin-top: 10px;
}
.customer-box .profile-image, .customer-box .personal-data, .customer-box .addresses{
    float: left;
    margin-right: 20px;
}
#orderBoxMobile .wrapper {
    background-color: #fff;
    border-radius: 4px;
    border: 1px solid #ccc;
    margin-bottom: 15px;
}

#orderBoxMobile .wrapper h3 {
    border-bottom: 1px solid #ccc;
    line-height: 35px;
    margin: 0;
}

#orderBoxMobile .wrapper .data-left,
#orderBoxMobile .wrapper .data-right {
    width: 50%;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

#orderBoxMobile .wrapper .data-left {
    float: left;
    border-right: 1px solid #ccc;
}

#orderBoxMobile .wrapper .data-right {
    float: right;
}

#orderBoxMobile .wrapper .row.last {
    background-color: #f2f2f2;
}

#orderBoxMobile .wrapper .checkout-link {
    display: block;
    text-align: center;
    padding: 10px;
}

#orderBoxMobile.dos .wrapper .row.head {
    height: 30px;
    border-bottom: 1px solid #ccc;
    background: #f2f2f2;
    margin: 0px;
}

#orderBoxMobile.dos .wrapper .data-left,
#orderBoxMobile.dos .wrapper .data-right {
    height: 45px;
    border: none;
    text-align: left;
}

#orderBoxMobile.dos .wrapper .data-right {
    text-align: right;
}

#orderBoxMobile.dos .wrapper .row {
  text-align: center;
  padding: 5px 10px;
}

#orderBoxMobile.dos .wrapper .row .fa {
  height: 35px;
  color: $primary-color;
  padding: 8px 0px 4px 4px;
  text-align: center;
  margin-right: 6px;
  font-size: 17px;
}

#orderBoxMobile.dos .wrapper .row.prata {
    font-size: 22px;
    text-align: center;
    margin-top:10px;
}

#orderBoxMobile.dos .wrapper .row.last {
    border-top: 1px solid #ccc;
    margin: 0px;
}

#orderBoxMobile.dos .wrapper .row.pagamento {
    padding: 0 10px 16px 10px;
    margin-top: -10px;
    text-align: center;
}

#orderBoxMobile.dos .wrapper .row.pagamento .pending {
    color: red;
}
/*Account*/
#orderBoxDesk {
    display: block;
      margin-top: 40px;
  margin-bottom: 40px;
}
#orderBoxMobile{
    display: none;
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

.bx-wrapper img {
    max-width: 100%;
    display: block;
}

/** THEME
===================================*/

.bx-wrapper .bx-viewport {
    -moz-box-shadow: 0 0 5px $secondary-color;
    -webkit-box-shadow: 0 0 5px $secondary-color;
    box-shadow: 0 0 5px $secondary-color;
    background: $white-color;
}

.bx-viewport {
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
    background: url({{ 'js/bxslider/images/bx_loader.gif' | static_url }}) center center no-repeat $primary-color;
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
    color: $primary-color-light;
    padding-top: 20px;
}

.bx-wrapper .bx-pager .bx-pager-item,
.bx-wrapper .bx-controls-auto .bx-controls-auto-item {
    display: inline-block;
    *zoom: 1;
    *display: inline;
}

.bx-wrapper .bx-pager.bx-default-pager a {
    background: $primary-color-light;
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
    background: $primary-color;
}

/* DIRECTION CONTROLS (NEXT / PREV) */

.bx-wrapper .bx-prev {
    left: 10px;
    background: url({{ 'js/bxslider/images/controls.png' | static_url }}) no-repeat 0 -32px;
}

.bx-wrapper .bx-next {
    right: 10px;
    background: url({{ 'js/bxslider/images/controls.png' | static_url }}) no-repeat -43px -32px;
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
    text-indent: -9999px;
    z-index: 999;
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
    background: $primary-color-light;
    background: rgba(80, 80, 80, 0.75);
    width: 100%;
}

.bx-wrapper .bx-caption span {
    color: $primary-color;
    font-family: Arial;
    display: block;
    font-size: .85em;
    padding: 10px;
}

.loadMoreContainer {
    text-align: center;
    margin: 30px 0;
}

/* MODAL */
.modal-content {
    border-radius: 0;
}
.max_installments {
  margin-top: 10px;
}
#InstallmentsModal {
    .modal-dialog {
        width: 600px;
        margin: 30px auto;
        max-width: 95%;
    }
    .tab-content {
        padding: 10px 0;
    }
}
.installments {
    display: block;
    width: 100%;
        li[id^="method"] {
            a {
            color: $secondary-color;
            font-weight: bold;
            border-radius: 0;
            }
        }

        span[id^="installment"] {
            display: block;
            width: 100%;
            padding: 2px 0;
            color: $fonttxt;
        }
}
h1.logo {
    margin: 0;
    float: left;
}
h1.logo img {
    max-height: 32px;
}
.title h1 {
    margin: 0px 0px 10px 0px;
    font-size: 30px;
}
.caption h3 {
    font-size: 14px;
}
.headerBox-Page h1 {
    font-size: 30px;
}
@media (max-width: 480px){
    .headerBox-Page h1{
        font-size:22px;
        text-align:center;
    }
}
/****Right dropdown going off screen fix****/
.sf-menu li:nth-last-child(-n + 2) > ul{
right:0px;
left:auto;
}
.sf-menu > li:nth-last-child(-n + 2) > ul > li ul{
right: 100%;
left: auto!important;
}
.sf-menu > li:nth-last-child(-n + 2) > ul > li a{
padding-left: 25px;
}
.sf-menu > li:nth-last-child(-n + 2) > ul > li .fa-angle-right:before {
content: "\f104";
}

.sf-menu > li:nth-last-child(-n + 2) > ul > li .fa-angle-right {
margin-left: 0px;
float: left;
margin-right: 10px;
margin-top: 5px;
}
.sf-menu > li:nth-last-child(-n + 2) > ul > li .arrow {
position: absolute;
right: auto;
font-size: 12px;
left: 10px;
}

@media (max-width: 480px){
    .search-content-wrapper{
         width: 85% !important; 
    }
    #orderBoxMobile.dos .wrapper .row.prata{
        font-size:18px;
    }
}
@media (max-width: 420px){
    .search-content-wrapper{
         width: 80% !important; 
    }
}

/* FILTERS & CATEGORIES */
.sort-bar {
    margin-top: 6px;
}
#categories-column {
    margin: 20px 0 0 0;
}
#categories-column h4 {
    margin: 0 0 20px 0;
    font-weight: 100;
}
#categories-column ul#categories-list {
  list-style: none;
  padding: 0;
}
#categories-column #categories-list li {
    margin: 0 0 8px 0;
}
#categories-column #show-more-cats {
    text-align: center;
    display: block;
    border-top: 1px solid #ccc;
    position: relative;
    margin-top: 20px;
    margin-bottom: 40px;
}
#categories-column #show-more-cats i.fa {
    color: #ccc;
    top: -1px;
    position: absolute;
    background: #fff;
    padding: 0 20px 5px 10px;
    left: 40%;
    width: 20px;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
#filters-column {
    margin: 20px 0 0 0;
}
#filters-column .filter-container {
    margin: 0 0 20px 0;
    border-bottom: 1px solid #eee;
    padding-bottom: 20px;
}
#filters-column .filter-container h4 {
    margin: 0 0 20px 0;
    font-weight: 100;
}
#filters-column .color-filter {
    width: 20px;
    height: 20px;
    border: 1px solid #e1e1e1;
    margin: 0 8px 8px 0;
}
#filters-column .size-filter {
    background: transparent;
    border: 1px solid #e1e1e1;
    margin: 0 8px 8px 0;
}
#filters-column .other-filter {
    background: transparent;
    margin: 0 8px 8px 0;
    border: 1px solid #e1e1e1;
    text-align: center;
}
#filters-column .size-filter:hover, #filters-column .other-filter:hover, #filters-column .color-filter:hover {
    border-color: #c1c1c1;
}

#get-filters {
    margin: 0 0 20px 0;   
    border-bottom: 1px solid #eee;
    padding-bottom: 20px; 
}
#get-filters h4 {
    margin: 0 0 20px 0;
    font-weight: 100;
}
.filter-remove {
    background: #eee;
    border: 1px solid #999;
    width: 100%;
    text-align: left;
    position: relative;
    margin: 0 0 10px 0;
    color: #333;
}
.filter-remove:hover {
    border: 1px solid #000;
    color: #000;
}
.filter-remove:after {
  display: inline-block;
  position: absolute;
  right: 10px;
  top: 5px;
  font: normal normal normal 14px/1 FontAwesome;
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  transform: translate(0, 0);
  content: "\f00d";
}
.filters-msg {
    text-align: center;
    font-size: 15pt;
    margin-top: 10%;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}

.products-wfilters .image-wrap {
  width: 223px;
}
.products-wfilters .thumbnail .caption .price {
  width: 56.666667% !important;
}

/* NEWS MODAL */
#newsletter-popup .loading-modal{
    font-size: 14px;
    text-align: center;
    margin-top: 20px;
}
#newsletter-popup .alert{
    margin-top:10px;
}
#newsletter-popup input.btn.btn-primary.newsbtn{
    margin-top:0px;
}
.img.logo.news {
  text-align: center;
  display: inline;
  width: 100%;
  margin: 20px 0px;
}
.img.logo.news img{
    max-height:130px;
}
p.newsletter {
  text-align: center;
  padding: 20px 0px;
}
.modal-dialog.news {
      width: 50%;
      margin: 30px auto;
      background-color:$white-color;
    }
input.btn.btn-primary.newsbtn {
  width: 100%;
  margin-top: 20px;
}
@media (max-width: 768px){
    .modal-dialog.news {
      width: 65%;
      margin: 30px auto;
    }
    #img-news img{
    display:none;
    }
    .page-account .new-address a{
    width:100%;
    }
}
#img-news img{
    max-width: 280px;
}

/* new copyright */
.powered-by-text, .powered-by-logo { display: inline-block; vertical-align: top; }
.powered-by-logo { width: 92px;padding-top:2px;}
#svg_brand .st0 { fill: rgba($white-color, .4); }
#svg_brand .st1 { fill: rgba($white-color, .3); }
/* /new copyright */
#habla_window_div { z-index: 999 !important; }
/* Cart Ajax */
#ajax-cart-details {
    position: fixed;
    top: 0;
    right: 0;
    width: 500px;
    height: 100%;
    background-color: $white-color;
    z-index: 999999;
    padding: 20px;
    border-left: 1px solid $black-color-soft;
    overflow-y: scroll;
}
#ajax-cart-details .alert h4 {
    margin-bottom: 0;
}
@media (max-width: 767px){
    #ajax-cart-details {
        width: 100%;
    }
    #ajax-cart-details .btn-primary{
        width:100%;
    }
    #ajax-cart-details .edit-cart{
        text-align: center;
        width: 100%;
        margin: 10px 0px;  
    }
}
#ajax-cart-backdrop {
    background-color: rgba(0,0,0,0.8);
    position: fixed;
    top: 0;
    width: 100%;
    height: 100%;
    left: 0;
    z-index: 1;
}
.close-cart {
    font-size: 21px;
    line-height: 1;
    color: $black-color-soft;
    background: transparent;
    border: 0;
    outline: 0;
}
table#cart-table {
    margin: 20px 0;
}
#ajax-cart-shipping {
    border-top: 1px solid $black-color-soft;
    border-bottom: 1px solid $black-color-soft;
    margin: 20px 0 30px 0;
}
#ajax-cart-shipping .shipping-option {
    width: 100%;
}
#ajax-cart-shipping .shipping-calculator li input[type="radio"] + .shipping-option { 
    border: 2px solid transparent;
}
#ajax-cart-shipping .shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border: 2px solid $primary-color;
}
#ajax-cart-totalwshipping {
    text-align: right;
    font-weight: bold;
    font-size: 20pt;
    margin-bottom: 20px;
}
div.addToCartButton div.alert {
    margin-top: 20px;
}

/* FILTERS MOBILE */
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
    background:$secondary-color;
    color:white;
}
.mobile-filters.dropdown-selected > .fa-chevron-down:before{
    content: "\f077";   
 }

@media(max-width: 767px){
    #filters-container {
        background: rgba(131, 131, 131, 0.1);
        padding: 15px 0;
        margin-top: 15px;
    }
    #toggle-filters { margin: 0 15px; }
}
@media(min-width: 768px){
    #show-filters { display: none; }
    #toggle-filters { display: block !important; }
}
.user-content img.user-page-logos {
    width: 45px;
    margin-top: 5px;
}
