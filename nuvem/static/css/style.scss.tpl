{# /*============================================================================
style.scss.tpl

    -This file contains all the theme non critical styles wich will be loaded asynchronously
    -Rest of styling can be found in:
        -static/css/custom.scss.tpl --> For color and font styles related to config/settings.txt
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/ #}

{# /*============================================================================
  Table of Contents

  #Components
    // Mixins
    // Animations
    // Wrappers
    // Buttons
    // Dividers
    // Forms
    // Alerts
    // Modals
    // Tabs
    // Pagination
    // User content
    // Tables
    // Images
  #Header and nav
    // Nav desktop
    // Search
  #Product grid
    // Filters and categories
  #Product detail
    // Image
    // Form and info
  #Footer
  #Contact page
  #Cart page
    // Cart table
    // Ajax cart
  #Media queries
    // Max width 767px
      //// Components
      //// Header and nav
      //// Product grid
      //// Product detail
      //// Footer
      //// Cart page
  #Critical path utilities

==============================================================================*/ #}

{#/*============================================================================
  #Components
==============================================================================*/ #}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
    text-decoration: none;
    outline: 0;
    &:hover,
    &:focus{
      text-decoration: none;
      outline: 0;
    }
}

@mixin no-wrap(){
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  font-weight: normal;
}

@mixin border-radius() {
  border-radius: 4px;
}

@mixin appearance-none() {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}


{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
   #{$property}: $value;
}

{# /* // Animations */ #}

@-webkit-keyframes wiggle {
  0% {
    @include prefix(transform, rotate(0), webkit ms moz);
  }
  25% {
    @include prefix(transform, rotate(-4deg), webkit ms moz);
  }
  50%{
    @include prefix(transform, rotate(4deg), webkit ms moz);
  }
  75% {
    @include prefix(transform, rotate(0), webkit ms moz);
  }
  100%{
    @include prefix(transform, rotate(0), webkit ms moz);
  }
}

.wiggle {
  -webkit-animation: wiggle 1.5s infinite;
  animation-delay: 2s;
}

@keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@-moz-keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@-webkit-keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@-o-keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}


{# /* // Wrappers */ #}

.circle-box{
  width: 350px;
  height: 350px;
  margin: 20px auto;
  padding: 90px 20px;
  text-align: center;
  @include prefix(border-radius, 200px, webkit ms moz);
  &-mid{
    width: 200px;
    height: 200px;
    padding: 50px 20px;
  }
  .circle-icon{
    width: 60%;
    margin: auto;
  }
  .circle-title {
    font-size:150px;
    font-weight: bold;
    line-height: 122px;
  }
  .circle-subtitle {
    font-size:40px;
    font-weight: bold;
  }
}

.backdrop{
  display: none;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  height: 140%;
  background-color: rgba(0,0,0,0.5);
  z-index: 3000;
  @include prefix(animation, fade 500ms, webkit ms moz);
}

{# /* // Buttons */ #}

.btn-spinner{
  float: right;
  margin: 3px 0 0 10px;
}
.btn-link:hover{
  opacity: 0.8;
}

.btn.facebook {
  background-color: #3B5998;
  border-bottom:4px solid #263a63;
  color: white;
  &:hover,
  &:focus,
  &:active{
    background-color: #3B5998;
    color: white;
    border-bottom: 0;
  }
  i{
    position: absolute;
    top: 15px;
    left: 15px;
    color: #fff;
  }
}

{# /* // Dividers */ #}

.divider-with-circle {
  margin: -10px 0 25px 0;
}

{# /* // Forms */ #}

.select-container {
  position: relative;
  &:before{
    display: inline-block;
    position: absolute;
    right: 10px;
    top: 10px;
    content: '\f078';
    font-family: FontAwesome;
    pointer-events: none;
  }
  .select {
    width: 100%;
    padding: 10px 30px 10px 10px;
    @include appearance-none();
    font-size: 16px;
    &::-ms-expand {
      display: none;
    }
  }
}

.input-prepend{
  border-radius: 0px;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}

.radio-button-container{
  padding: 0;
  list-style: none;
}
.radio-group-label{
  margin-bottom: 10px;
}
.radio-button{
  width: 100%;
  float: left;
  clear: both;
  margin-bottom: 20px;
  &-content{
    width: 100%;
    float: left;
    padding: 5px;
    text-align: left;
  }
  input[type="radio"]{
    display: none;
    & +  .radio-button-content .unchecked{
      display: inline-block;
      width: 23px;
      opacity: .2;
    }
    &:checked + .radio-button-content .unchecked{
      display: none;
      opacity: .2;
    }
    & +  .radio-button-content .checked{
      display: none;
    }
    &:checked + .radio-button-content .checked{
      display: inline-block;
    }
  }
  &-icons{
    float: right;
    display: inline-block;
    width: 10%;
    padding-top: 5px;
    font-size: 16px;
    text-align: right;
  }
  &-label{
    width: 90%;
  }
  &-img{
    float: left;
    display: inline-block;
    width: 60px;
    margin: 0 10px 0 0;
    vertical-align: middle;
  }
  &-text{
    width: 75%;
  }
}

{# /* // Alerts */ #}

.alert{
  border-radius: 4px;
  border: 0;
}

{# /* // Modals */ #}

{# /* Modal docked to the right */ #}

.modal-right{
  position: fixed;
  top: 0;
  right: 0;
  width: 500px;
  height: 100%;
  z-index: 999999;
  border-left: 1px solid #eee;
  overflow-y: scroll;
  text-align: left;
  &-header{
    padding: 25px 15px 15px 15px;
  }
  &-body{
    padding: 0 15px 15px 15px;
  }
}

.modal-footer {
  display: inline-block;
  width: 100%;
}

.link-modal-xs-right{
  float: left;
  width: 100%;
  padding-top: 10px;
  margin-bottom: 20px;
}

{# /* // Tabs */ #}

.nav-tabs{
  margin-bottom: 0px;
  border-bottom: 0;
  > li{
    display: inline-block;
    float: none;
  }
  .tab-link {
    padding: 12px 15px;
  }
  .tab-link,
  .tab-check-link{
    border-radius: 0;
    border:0;
  }
  .tab-check{
    position: relative;
    margin: 2px 5px 2px 2px;
    .tab-check-icon{
      display:none;
      position: absolute;
      top: -7px;
      right: -5px;
    }
    &.active{
      .tab-check-link,
      .tab-check-link:focus{
        background-color: transparent;
        border: 0;
        line-height: 12px;
        outline-offset:0;
      }
      .tab-check-icon{
        display: block;
      }
    }
  }
  .tab-check-link{
    padding:2px;
    background-color: transparent;
    &:hover,
    &:focus{
      opacity: 0.8;
      background-color: transparent;
      outline-offset:0;
    }
  }
  .tab-check-link-text{
    padding: 10px;
    line-height: 12px;
  }
}

{# /* // Pagination */ #}

.pagination-container {
  text-align:center;
}

{# /* // User content */ #}

.user-content{
  img{
    width: auto;
    max-width: 100%!important;
    height: auto!important;
    margin: 10px auto;
    &.user-page-logos {
      width: 45px;
      margin-top: 5px;
    }
  }
  iframe{
    max-width:100%;
  }
}

{# /* // Tables */ #}

.table {
  td,
  th {
    border-top: 0;
  }
}

{# /* // Images */ #}

.card-img{
  margin: 0 5px 5px 0;
  border: 1px solid #00000012;
  @include prefix(box-shadow, 0 1px 0px 0 rgba(0, 0, 0, 0.05), webkit ms moz);
  @include prefix(border-radius, 5px, webkit ms moz);
  &-medium{
    height: 35px;
  }
  &-big{
    height: 50px;
  }
}

{#/*============================================================================
  #Header and nav
==============================================================================*/ #}

{# /* // Nav desktop */ #}

.nav-head-fixed {
    position: absolute;
    top: -140px;
    left: 0;
    right: 0;    display: block;
    z-index: 99;
    @include prefix(box-shadow, 0 2px 2px 0 rgba(50, 50, 50, 0.15), webkit ms moz);
    opacity: 0.95;

    &.fixed {
        position: fixed;
        transition: height 6s;
        z-index: 999;
    }
}

.desktop-nav {
  &-item:hover {
    .desktop-nav-list {
      top:38px; /* match top ul list item height */
      z-index:99999;
      min-width: 130px;
      max-width: 200px;
      @include border-radius();
    }
  }
  &-item{
    &:first-child {
        border-top-right-radius: 5px;
        border-top-left-radius: 5px;
    }
    &:last-child {
        border-bottom-right-radius: 5px;
        border-bottom-left-radius: 5px;
    }
    .desktop-nav-item {
      .desktop-nav-link {
        display: block;
        padding:10px;
        text-transform: none;
      }
    }
    .desktop-nav-item:hover,
    .desktop-nav-item.sfHover {
      .desktop-nav-list{
        top:0;
      }
    }
  }
  &-arrow{
    display: inline-block;
    float: right;
  }
  &-link{
    @include text-decoration-none();
  }
}

{# /* // Search */ #}

.search-suggest{
  position: absolute;
  top: 34px;
  right: 0;
  z-index: 998;
  display: none;
  width: 300px;
  border-radius: 7px;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
  -webkit-overflow-scrolling: touch;
  &-list{
    float: left;
    width: 100%;
    margin: 0;
    padding: 0;
  }
  &-item{
    list-style-type: none;
  }
  &-link{
    position: relative;
    display: block;
    float: left;
    width: 100%;
    padding: 5px 10px;
    box-sizing: border-box;
    border-bottom: 1px solid rgba(0, 0, 0, 0.12);
    list-style-type: none;
    @include text-decoration-none();
  }
  &-text{
    display: inline-block;
    float: left;
    width: 70%;
  }
  &-image-container{
    width: 40px;
    float: left;
    margin-right: 10px;
    padding-top: 3px;
  }
  &-image{
    max-width: 100%;
    max-height: 45px;
  }
  &-icon{
    position: absolute;
    right: 10px;
    top: 50%;
    width: 30px;
    margin-top: -7px;  
    text-align: right;
  }
  &-all-link{
    min-height: initial;
    padding: 10px;
    text-align: center;
    text-decoration: underline;
  }
}

{# /* // Logo */ #}

.logo-fixed{
  max-height: 40px;
  max-width: 100%;
}

{#/*============================================================================
  #Product grid
==============================================================================*/ #}

{# /* // Filters and categories */ #}

.btn-more-categories {
  text-align: center;
  display: block;
  margin-top: 20px;
  margin-bottom: 40px;
  &:hover{
  text-decoration: none;
  }
  i {
    display: block;
    padding:5px; 
    width: 30px;
    margin: auto;
  }
}

.filter-remove {
  width: 100%;
  text-align: left;
  position: relative;
  margin: 0 0 10px 0;
  white-space: normal;
  word-break: break-word;
  padding: 5px 34px 5px 10px;
  @include border-radius();
  &:after{
    display: inline-block;
    position: absolute;
    right: 8px;
    top: 8px;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
    content: "\f00d";
  }
}

.btn-filter-color{
  width: 25px;
  height: 25px;
  border: 1px solid #ccc;
  margin: 0 5px 8px 0;
  border-radius: 100%;
  &:hover{
    border-color: #c1c1c1;
    opacity: 0.8;
  }
}

{#/*============================================================================
  #Product Detail
==============================================================================*/ #}

{# /* // Image */ #}

.desktop-product-image-container {
  position: relative;
  width: 70%;
  margin: 0 auto 20px auto;
}

.cloud-zoom-big {
  overflow:hidden;
  background-color:#fff;
  /* Importants necesaries to overide plugin inline styles */
  z-index: 1!important;
  width: 100%!important
}

.mousetrap{
  /* Importants necesaries to overide plugin inline styles */
  z-index: 2!important;
  width: 100%!important
}

.cloud-zoom-loading {
  color:white;
  background:#222;
  padding:3px;
  border:1px solid #000;
}

.btn-product-slider{
  position: absolute;
  top: 50%;
  margin-top: -50px;

  &.btn-product-prev{
    left: 20px;
  }
  &.btn-product-next{
    right: 20px;
  }
  i{
    font-size: 100px;
  }
}

.thumbs{
  width: 70%;
  margin: auto;
  .thumb-link {
    display: block;
    float: left;
    margin: 0 9px 9px 0;
    opacity: 0.7;
    &:hover{
      opacity: 1;
    }
  }
  .thumb-image {
    width: auto;
    max-width: 100px;
    max-height: 130px;
  }
}

{# /* // Form and info */ #}

{# /* // Variants */ #}

.variant-container{
  padding: 0 10px 20px 0;
  .variant-label{
    width: 100%;
    font-weight: bold;
    text-transform: uppercase;

    &-property{
      font-weight: normal;
      text-decoration: underline;
      opacity: 0.8;
    }
  }
  &.btn-variant-container{
    float: left;
    width: 100%;
    padding-bottom: 10px;
  }
  .btn-variant {
    display: inline-block;
    width: auto;
    height: 30px;
    margin: 5px 10px 10px 0;
    padding: 1px;
    cursor: pointer;
    border-radius: 30px;
  }
  .btn-variant-content {
    display: inline-block;
    float: left;
    height: 24px;
    width: 24px;
    cursor: pointer;
    border-radius: 30px;
  }
  .btn-variant.btn-variant-custom{
    min-height: 24px;
    height: auto;
    width: auto;
    .btn-variant-content {
      width: auto;
      height: auto;
      padding: 2px 8px;
      font-size: 16px;
    }
  }
}

{# /* // Payments */ #}

.product-selected-gateway{
  position: relative;
  float: left;
  width: 100%;
  padding: 5px 10px 0 0;
  font-size: 12px;
  text-align: left;
}
.product-payment-logos-i-credit{
  line-height: 20px;
}
.payment-credit-icon{
  line-height: 12px;
}
.product-payment-icon-plus{
  top: -7px;
}
.payments-card-img{
  height: 26px;
}
.product-check-icon-gw{
  position: relative;
  top: 0;
  right: 0;
  display: inline-block;
  margin-top: -3px;
}
.payments-disabled-select{
  top: 0;
  left: 0;
  cursor: not-allowed;
  &.hidden{
    display: none!important;
  }
}

{#/*============================================================================
  #Footer
==============================================================================*/ #}

.footer {
  padding: 10px 0;
  @include prefix(box-shadow, inset 1px 4px 7px -6px, webkit ms moz);
  &-title{
    font-size: 16px;
    margin-bottom: 15px;
  }
  &-payship-img{
    height: 30px;
    margin: 0 10px 10px 0;
  }
  &-list li{
    margin-bottom: 5px;
  }
  .seals-container img{
    max-width: 170px;
    max-height: 80px;
  }
  .afip img{
    max-width: 60px;
    max-height: 80px;
  }
}

.footer-legal{
  padding: 10px 0;
}
.powered-by-text,
.powered-by-logo {
  display: inline-block;
  vertical-align: top;
}
.powered-by-logo {
  width: 95px;
}

{#/*============================================================================
  #Contact page
==============================================================================*/ #}

.map {
  height: 280px;
  border: 1px solid;
}

{#/*============================================================================
  #Cart page
==============================================================================*/ #}

{# /* // Cart table */ #}

.cart-table{
  width: 100%;
  margin-bottom: 10px;
  &-row{
    position: relative;
    clear: both;
    margin-bottom: 10px;
    padding: 15px 0;
    list-style: none;
  }
}
.cart-quantity-btn,
.cart-btn-delete{
  padding: 10px;
  display: inline-block;
  background: transparent;
  vertical-align: bottom;
  font-size: 16px;
  opacity: 0.8;
  &:hover{
    opacity: 0.6;
  }
}
.cart-quantity-btn-left{
  border-radius: 6px 0 0 6px;
}
.cart-quantity-btn-right{
  border-radius: 0 6px 6px 0;
}
.cart-btn-delete{
  float: right;
  padding-right: 0;
  border:0;
  &-svg-icon{
    width: 20px;
    height: 20px;
  }
}
.cart-delete-svg-icon{
  width: 30px;
  height: 30px;
  opacity: 0.6;
  &.small{
    width: 20px;
    height: 20px;
  }
}
.cart-quantity-input {
  display: inline-block;
  width: 40px;
  height: 38px;
  margin: 0 -4px 0 -3px;
  color: #353535;
  font-size: 16px;
  text-align: center;
  -moz-appearance:textfield;
  border-left: 0;
  border-right: 0;
  &::-webkit-outer-spin-button,
  &::-webkit-inner-spin-button{
    -webkit-appearance: none;
  }
}
.cart-quantity-input-container i{
  padding: 10px;
  vertical-align: middle;
}
.cart-quantity-svg-icon{
  width: 16px;
  height:16px;
}


{# /* // Totals */ #}

.shipping-calculator{
  float: left;
  clear: both;
  margin-bottom: 10px;
}
.cart-totals-container{
  padding: 5px 15px;
  margin-bottom: 10px;
}
.cart-totals{
  float: left;
  width: 100%;
  clear: both;
  margin: 5px 0;
  text-align: right;
  font-weight: bold;
}
.cart-subtotal{
  font-size: 16px;
}
.cart-total{
  font-size: 24px;
}

.total-promotions-row{
  position: relative;
  float: right;
  width: 100%;
  margin-bottom: 5px;
  text-align: right;
  .cart-promotion-number{
    margin-left: 5px;
  }
}

{# /* // Ajax cart */ #}

.ajax-cart-row{
  padding: 10px 0;
  margin-bottom: 0;
}
.ajax-cart-item-unit-price{
  float: left;
  width: 100%;
  margin:5px 0 2px 0;
}

.ajax-cart-item-subtotal.not-editable{
  width: auto;
  float: right;
  margin: 0;
}

{#/*============================================================================
  #Media queries page
==============================================================================*/#}

{# /* // Max width 767px */ #}

@media (max-width: 767px) {

  {# /* //// Components */ #}

  {# /* Wrappers */ #}

  body.hamburger-panel-animated{
    height: 100%;
    overflow: hidden;
  }

  .circle-box,
  .circle-box-mid{
    width: 200px;
    height: 200px;
    padding: 50px 20px;
    .circle-title{
      font-size: 64px;
      line-height: 42px;
    }
    .circle-subtitle{
      font-size: 30px;
    }
  }

  {# /* Animations */ #}

  .move-down{
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,0,0);
    -moz-transform: translate3d(0,0,0);
    -ms-transform: translate3d(0,0,0);
    -o-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
  }
  .move-up{
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,-45px,0);
    -moz-transform: translate3d(0,-45px,0);
    -ms-transform: translate3d(0,-45px,0);
    -o-transform: translate3d(0,-45px,0);
    transform: translate3d(0,-45px,0);
  }

  .radio-button{
    margin-bottom: 10px;
    &-icons{
      width: 32px;
      font-size: 20px;
    }
    &-text{
      width: 70%;
    }
  }

  {# /* Modals */ #}

  .modal-backdrop{
    display: none;
  }
  .modal-open{
    overflow: hidden;
  }
  .modal{
    z-index: 5000;
    .modal-footer {
      box-shadow: none;
    }
  }

  .modal-xs{
    display: block;
    position: fixed;
    top: 0;
    z-index: 4000;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    border:0;
    opacity: 1;
    box-sizing:border-box;
    overflow: auto;
    &-dialog{
      margin: 0;
      @include prefix(transform, translate3d(0, 0, 0)!important, webkit ms moz);
      .modal-content{
        box-shadow:none;
        border: 0;
      }
    }
    &-header{
      position: relative;
      display: block;
      padding: 15px;
      clear: both;
      text-decoration: none;
      ms-word-break: break-all;
      word-wrap: break-word;
      -webkit-hyphens: auto;
      -moz-hyphens: auto;
      hyphens: auto;
      -webkit-tap-highlight-color:rgba(0,0,0,0);
    }
    &-header-text{
      display: inline-block;
      clear: both;
      font-size: 16px;
      text-transform: uppercase;
      &.modal-xs-right-header-text{
        margin-left: 30px;
      }
    }
    &-header-icon{
      position: absolute;
      top: 11px;
    }
    &-body{
      max-height: initial;
      padding:10px;
    }
    &-list-item{
      position: relative;
      display: block;
      clear: both;
      padding: 20px 15px;
      text-decoration: none;
      font-size: 16px;
      &.selected{
        .modal-xs-radio-icon i{
          visibility: visible;
        }
      }
    }
    &-list-subtitle{
      font-weight: bold;
      font-size: 12px;
      text-transform: uppercase;
    }
    &-radio-icon-container {
      width: 12%;
      display: inline-block;
      float: left;
    }
    &-radio-icon {
      height: 22px;
      width: 22px;
      display: inline-block;
      padding: 0px 4px;
      border-radius: 100%;
      cursor: pointer;
      opacity: 0.7;
      i{
        visibility: hidden;
      }
    }
    &-radio-text {
      width: 88%;
      display: inline-block;
    }
  }

  {# /* Modal animated from right */ #}

  .modal-xs-right{
    right: inherit;
    left: inherit;
    padding: 0 0 200px 0;
    @include prefix(box-shadow, -4px 0 17px 0 rgba(0,0,0,0.23), webkit ms moz);
    -webkit-overflow-scrolling: touch;
    &.modal.fade.in,
    &.modal.fade{
      top: 0;
    }
    &.mobile-nav-subcategories-panel{
      top: 126px;
      z-index: 3000;
    }
  }
  .modal-xs-right.modal.fade.in,
  .modal-xs-right-in{
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    @include prefix(transform, translate3d(0,0,0), webkit ms moz o);
  }

  {# /* Links that call the modal from right */ #}

  .link-modal-xs-right,
  .btn-modal-xs-right{
    display: block;
    position: relative;
    float: left;
    width: 100%;
    clear: both;
    box-sizing:border-box;
    &:hover{
      opacity: 0.8;
    }
  }

  .btn-modal-xs-right {
    margin: 0 0 20px 0;
    padding: 10px 40px 10px 10px;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    text-align: left;
    text-transform: uppercase;
    font-size: 16px;
  }

  .link-modal-xs-right-icon,
  .btn-modal-xs-right-icon {
    width: 36px;
    height: 36px;
    position: absolute;
    right: 0;
    float: right;
    display: block;
    top: 50%;
    margin-top: -20px;
  }

  {# /* // Tabs */ #}

  .nav-tabs>li{
    display: inline-block;
  }
  .nav-tabs{
    .tab-check{
      margin: 2px 5px 8px 2px;
    }
  }

  {# /* Pagination */ #}

  .pagination{
    width: 100%;
    margin-bottom: 0;
    padding: 10px;
    border-radius: 0;
    &-input-container{
      display: inline-block;
      width: 60%;
      margin-top: 10px;
      font-size: 18px;
    }
    &-input{
      height: 30px;
      width: 50px;
      margin: 0px 5px 5px 0;
      padding: 7px;
    }
    &-arrow-container{
      width: 20%;
      display: inline-block;
    }
    a.pagination-arrow-link{
      border: 0;
      .pagination-icon{
        margin-top: 3px;
        font-size: 36px;
      }
      &:hover,
      &:focus{
        @include text-decoration-none();
      }
    }
  }

  {# /* User content */ #}

  .user-content{
    width: 100%;
    img{
      width: 80%!important;
    }
    table{
      width: 100%!important;
    }
  }

  {# /* Images */ #}

  .card-img{
    &-big{
      height: 60px;
    }
  }
    
  {# /* //// Header and nav */ #}

  {# /* Nav mobile */ #}

  .btn-hamburger-icon{
    width: 25px;
    height: 25px;
    margin-top: 5px;
    cursor: pointer;
  }
  .hamburger-panel{
    display: block;
    position: fixed;
    top: 0;
    width: 280px;
    height: 100%;
    z-index: 999999;
    -webkit-overflow-scrolling: touch;
    overflow-y: auto; 
    background: #333332;
    color:white;
    @include prefix(transition, 0.3s, webkit ms moz);
    @include prefix(transform, translate3d(-280px,0,0), webkit ms moz);
    &.hamburger-panel-animated{
      @include prefix(transform, translate3d(0,0,0), webkit ms moz);
    }
    &-list{
      float: left;
      width: 100%;
      clear: both;
      padding: 0;
      margin: 0;
    }
    &-item{
      display: block;
      position:relative;
      float: left;
      width: 100%;
      .hamburger-panel-link{
        float: left;
        width: 100%;
        padding: 20px 40px 20px 20px;
        font-size: 16px;
        color:white;
        border-top: 1px solid rgba(255,255,255,.1);
      }
    }
    &-arrow{
      position: absolute;
      top: 24px;
      right: 10px;
      margin-top: -10px;
      background:rgba(131, 131, 131, 0.4);
      color:white;
    }
    &-accordion,
    &-first-row{
      float: left;
      width: 100%;
      background:rgba(131, 131, 131, 0.4);
    }
  }

  .backdrop{
    &.hamburger-overlay{
      z-index: 9998;
    }
    &.hamburger-panel-animated{
      display: block;
    }
  }

  .mobile-nav-categories-container{
    top: 126px;
    margin: 0;
    padding:0 0 200px 0;
    z-index: 1000;
    -webkit-overflow-scrolling: touch;
  }
  .move-list-up{
    .mobile-nav-categories-container,
    .mobile-nav-subcategories-panel{
      top: 80px;
    }
  }

  .mobile-nav-arrow-up {
    position: absolute;
    height: 18px;
    width: 100%;
    text-align: center;
  }
  .mobile-categories-visible .mobile-nav-arrow-up {
    display: block;
  }

  .mobile-search-input-back,
  .mobile-search-input-submit{
    height: auto;
    border: 0;
    margin-top: 14px;
    background: none;
  }
  .mobile-search-input{
    width: 80%;
    height: 40px;
    margin: 3px 0 3px 10px;
    padding: 10px;
    border: 0;
    font-size: 14px;
    font-weight: normal;
    &:focus{
      border: 0;
      outline: 0;
      box-shadow: none;
    }
  }
    
  .search-suggest{
    position: fixed;
    top: 50px;
    z-index: 3000;
    display: none;
    height: 100%;
    width: 100%;
    box-sizing:border-box;
    margin: 0;
    padding-bottom: 1000px;
    overflow-y: scroll;
    &-link{
      padding: 20px 15px;
    }
  }
    
  {# /* //// Product grid */ #}

  .filter-remove{
    width: 60%;
  }

  {# /* //// Product detail */ #}

  {# /* Image */ #}

  .zoom-svg-icon{
    width: 24px;
    height: 24px;
  }
  .mobile-zoom-panel{
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    width: 100%;
    height: 100%;
    overflow: auto;
    .mobile-zoom-image-container{
      margin: 15px;
      max-height: 95%;
    }
    .mobile-zoom-spinner{
      display: none;
      position: absolute;
      top: 40%;
      left: 50%;
      z-index: 99;
      margin-left: -15px;
    }
    img{
      width: 100%;
      max-height: inherit;
    }
  }

  {# /* Form and info */ #}

  .btn-variant-container{
    padding-top: 0;
  }
  .panel-mobile-variant {
    left: 0;
  }
    
  {# /* //// Footer */ #}

  .footer{
    padding: 0 0 10px 0;
    &-title{
      margin-top: 30px;
      text-align: center;
    }
    &-list li{
      margin-bottom: 10px;
      text-align: center;
    }
    &-payship-img{
      margin: 5px;
    }
  }    

  {# /* //// Cart page */ #}

  {# /* Table */ #}

  .cart-item-subtotal{
    margin: 10px 0;
    text-align: right;
    font-weight: bold;
  }
  .cart-quantity-btn {
    &.small {
      padding: 6px;
    }
  }
  .cart-quantity-input {
    &.small{ 
      width: 40px;
      height: 30px;
    }
  }
  .cart-delete-container{
    position: absolute;
    right: 0;
    padding: 0;
    .cart-btn-delete{
      padding: 0 10px 0 0; 
    }
  }
  .cart-delete-svg-icon{
    width: 25px;
    height: 25px;
  }
}

{#/*============================================================================
  #Critical path utilities
==============================================================================*/#}

.visible-when-content-ready{
  visibility: visible!important;
}
.display-when-content-ready{
  display: block!important;
}
.hidden-when-content-ready{
  display: none;
}
.product-single-image{
  height: auto;
}
