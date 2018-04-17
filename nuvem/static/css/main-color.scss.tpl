{#/*============================================================================

main-color.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style.css --> For non critical styles witch will be loaded asynchronously
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // Texts
  #Components
    // Mixins
    // Wrappers
    // SVG Icons
    // Placeholders
    // Breadcrumbs
    // Buttons
    // Links
    // Modals
    // Tabs
    // Panels
    // Badge
    // Dividers
    // Forms
    // Pagination
    // Sliders
    // Pills
    // Labels
    // Tables
  #Header and nav
    // Logo
    // Nav desktop
    // Search
    // Cart widget desktop
  #Product grid
    // Filters and categories
    // Grid item
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
      //// Colors and fonts
      //// Components
      //// Header and nav
      //// Product grid
      //// Product detail

==============================================================================*/#}


{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}

{# /* // Colors */ #}

$primary-color: {{ settings.primary_color }};
$secondary-color: {{ settings.secondary_color }};
$main-foreground: {{ settings.text_primary_color }};
$main-background: {{ settings.background_color }};
$line-color: {{ settings.line_color }};

{# /* // Font families */ #}

$font-headings: {{ settings.main_font | raw }};
$font-body: {{ settings.default_font | raw }};

{# /* // Texts */ #}

{# /* Headings */ #}

.title-container {
  clear: both;
}
.title{
  font-size: 28px;
}
.subtitle{
  font-size: 18px;
  text-transform: uppercase;
}
.title,
.subtitle{
  margin: 10px 0 30px 0;
  text-align: center;
  display: flex;
  flex-direction: row;
  justify-content: center;
  &:after,
  &:before{
    flex-grow: 1;
    height: 1px;
    content: '\a0';
    background-color: $line-color;
    position: relative;
    top: 0.5em;
  }
  &:before{
    margin-right:10px;
  }
  &:after{
    margin-left:10px;
  }
}

h1, .h1,
h2, .h2,
h3, .h3,
h4, .h4,
h5, .h5,
h6, .h6 {
  text-transform: uppercase;
  font-weight: bold;
  font-family: $font-headings;
  letter-spacing: 2px;
  small{
    color: $main-foreground;
  }
}

.box-title {
  float: left;
  width: 100%;
  padding-bottom: 10px;
  font-weight: bold;
}

{# /* Body */ #}

body,
.font-body {
  font-size: 14px;
}
.font-medium {
  font-size: 16px;
}
.font-small {
  font-size: 12px;
}
.font-small-extra {
  font-size: 10px;
}

{# /* Icons */ #}

.fa-min {
  font-size: 8px;
}
.fa-huge{
  font-size: 6em;
}

{# /* Weight */ #}

.weight-normal {
  font-weight: 400;
}
.weight-strong {
  font-weight: 700;
}
.weight-light {
  font-weight: 100;
}

.border-top{
  border-top: 1px solid $line-color;
}
.border-bottom{
  border-bottom: 1px solid $line-color;
}
.border-left{
  border-left: 1px solid $line-color;
}
.border-right{
  border-right: 1px solid $line-color;
}
.border-none {
  border: 0 !important;
}

{# /* Color */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $secondary-color;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

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

@mixin link-default(){
  color:$main-foreground;
  &:hover,
  &:focus{
    color:$main-foreground;
    text-decoration: underline;
  }
}

@mixin border-radius($radius) {
  border-radius: $radius;
}
@mixin background-gradient($gradient) {
	background: $gradient;
	background: -moz-linear-gradient(top, rgba($gradient, 0.7) 0%, rgba($gradient,.9) 100%);
	background: -webkit-linear-gradient(top, rgba($gradient, 0.7) 0%, rgba($gradient,.9) 100%);
	background: linear-gradient(to bottom, rgba($gradient, 0.7) 0%, rgba($gradient,.9) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba($gradient,.7)', endColorstr='rgba($gradient,.9)',GradientType=0 );
}
@mixin background-gradient-hover($gradient) {
	background: $gradient;
	background: -moz-linear-gradient(top, rgba($gradient, 0.8) 0%, $gradient 100%);
	background: -webkit-linear-gradient(top, rgba($gradient, 0.8) 0%, gradient 100%);
	background: linear-gradient(to bottom, rgba($gradient, 0.8) 0%, $gradient 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='rgba($gradient,.8)', endColorstr='$gradient',GradientType=0 );
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
   #{$property}: $value;
}

{# /* // Wrappers */ #}

body {
  background-color: $main-background;
  color: $main-foreground;
  font-family: $font-body;
  &.pattern-background{
    background-image: url( "{{ ("img/tramas/" ~ settings.background_pattern ~ ".png") | static_url }}" );
  }
  &.user-background{
    background-image: url( "{{ ("default-background.jpg") | static_url }}" );
  }
}

.bg-no-repeat {
  background-repeat: no-repeat;
}

.box-container{
  float: left;
  width: 100%;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding:8px;
  border:1px solid rgba($main-foreground, 0.05);
  background-color: darken($main-background, 0.5%);
  @include border-radius(4px);
}

.circle-box{
  border: dashed $secondary-color 5px;
}

.container-with-border{
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid $line-color;
}

{# /* // SVG Icons */ #}

.svg-primary-fill{
  fill:$primary-color;
}
.svg-secondary-fill{
  fill:$secondary-color;
}
.svg-text-fill{
  fill:$main-foreground;
}
.svg-back-fill{
  fill:$main-background;
}

{# /* // Placeholders */ #}

.slider-placeholder-container,
.product-placeholder-container{
  background-color:rgba($main-foreground, 0.05);
}
.product-placeholder-preloader{
  fill:rgba($main-foreground, 0.07);
}
.placeholder-color{
  background-color:rgba($main-foreground, 0.07);
}

{# /* // Breadcrumbs */ #}


.breadcrumb{
  @extend .font-small;
  li{
    padding: 0;
  }
  &-crumb{
    color:rgba($main-foreground, .8);
  }
}

{# /* // Buttons */ #}

.btn{
  position: relative;
  height: 50px;
  padding: 14px 20px;
  background-color:transparent;
  @include border-radius(4px);
  font-size: 14px;
  letter-spacing: 2px;
  text-transform: uppercase;
  @include text-decoration-none();
}
.btn-circle{
  height: 50px;
  width: 50px;
  padding: 0; 
  border-radius: 50px;
  text-align:center;
  font-size: 24px;
  line-height: 46px;
  cursor: pointer;
  @include text-decoration-none();
  &:hover{
    opacity: 0.8;
  }
}
.btn-primary{
  color:$main-background;
  fill:$main-background;
  border: none;
  border-bottom: 4px solid darken($secondary-color, 10%);
  @include background-gradient($secondary-color);
  &:hover{
    @include background-gradient-hover($secondary-color);
    color:$main-background;
    fill:$main-background;
    border: none;
    border-bottom: 0;
  }
  &:focus,
  &:active,
  &:active:hover{
    @include background-gradient($secondary-color);
    color:$main-background;
    fill:$main-background;
    border: none;
    border-bottom: 0;
  }
  &[disabled],
  &[disabled]:hover{
    background-color: #DDD;
    color:$main-background;
    fill:$main-background;
    border: none;
    border-bottom: 0;
  }
}
.btn-secondary{
  @include background-gradient($primary-color);
  color: $main-background;
  text-transform: uppercase;
  border: none;
  border-bottom: 4px solid darken($primary-color, 10%);
  &:hover{
    @include background-gradient-hover($primary-color);
    color: $main-background;
    border: none;
    border-bottom: 0;
  }
  &:focus,
  &:active,
  &:active:hover{
    @include background-gradient($primary-color);
    color: $main-background;
    border: none;
    border-bottom: 0;
  }
  &[disabled],
  &[disabled]:hover{
    background-color: #DDD;
    color:$main-background;
    border: none;
    border-bottom: 0;
  }
}
.btn-default,
.filter-remove {
  color: $main-foreground;
  background-color: $main-background;
  border: 1px solid lighten($secondary-color, 30%);
  @include border-radius(4px);
  &:hover,
  &:focus{
    color: $main-foreground;
    background-color: $main-background;
    border-color: $line-color;
    opacity: 0.8;
  }
  &-icon{
    width: 18px;
    height: 20px;
    fill: rgba($main-foreground, .6);
    float: right;
  }
}
.transparent{
  background: transparent;
}

.btn-link{
  color: $primary-color;
  text-decoration: underline;
  text-transform: none;
  font-size: 18px;
  &:hover,
  &:focus{
    color: $primary-color;
    opacity: 0.8;
  }
  &-small{
    font-size: 14px;
  }
  &-small-extra{
    font-size: 10px;
    text-transform: uppercase;
  }
}
.btn-link-secondary{
  text-transform: uppercase;
  @extend .font-medium;
  font-weight: bold;
  i{
    margin-left: 5px;
  }
}
.btn-link-text{
  color: $main-foreground;
}
.btn-append{
  border-radius: 0;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.btn-small{
  height: 35px;
  padding:0 10px;
  font-size: 12px;
}
.btn-floating{
  position:absolute;
  top: 5px;
  right: 5px;
  height: auto;
  padding: 5px;
  opacity: 0.5;
  border: 0;
  z-index: 1;
  &:hover,
  &:focus {
    opacity: 0.8;
  }
}

{# /* // Links */ #}

a {
  color: rgba($main-foreground, .8);
  text-decoration: none;
	&:hover {
		color: $primary-color;
		text-decoration: none;
	}
}

{# /* // Modals */ #}

.modal-body{
  float: left;
  width: 100%;
  background: $main-background;
  color: $main-foreground;
  @include border-radius(6px);
}
.modal-right{
  background: $main-background;
  color: $main-foreground;
}

.modal-footer {
  background: $main-background;
  color: $main-foreground;
  border-top:1px solid rgba($main-foreground, 0.1);
  box-shadow:none;
}

.link-modal-xs-right{
  color: $primary-color;
}

{# /* // Tabs */ #}

.nav-tabs-container{
  border-bottom:1px solid rgba($main-foreground, 0.1);
}
.nav-tabs-links{
  border-bottom:0;
}
.nav-tabs {
  .tab.active{
    .tab-link{
      color: $primary-color;
      background-color:transparent;
      border:0;
      border-bottom:3px solid $primary-color;
    }
  }
  .tab-link{
    background-color: transparent;
    &:hover,
    &:focus{
      background-color: transparent!important;
    }
  }
  .tab-check.active{
    .tab-check-link,
    .tab-check-link:focus{
      outline:2px solid $primary-color;
    }
  }
  .tab-check-link-text{
    outline:1px solid rgba($main-foreground, .3);
  }
  .tab-check-icon{
    color: $primary-color;
    .fa-inverse{
      color:$main-background;
    }
  }
}

{# /* // Panels */ #}

.panel{
  background-color: $main-background;
  border:1px solid rgba($main-foreground, .2);
  &-heading{
    background-color: $main-background!important;
    border-bottom:1px solid rgba($main-foreground, .2);
  }
  &-footer{
    background-color: $main-background;
    border-top:1px solid rgba($main-foreground, .2);
  }
}

{# /* // Badge */ #}

.badge {
	background: $main-background;
	color: $main-foreground;
	font-size: 14px;
}

{# /* // Dividers */ #}

.divider{
  float: left;
  width: 100%;
  margin: 20px 0;
  border-bottom:1px solid rgba($main-foreground, .1);
}


hr {
  border-top-color: $line-color;
}

{# /* // Forms */ #}

.form-control {
  height: 42px;
  color: rgba($main-foreground, .8);
  background-color: $main-background;
  border: 1px solid $line-color;
  &-small{
    height: 35px;
  }
}

.dropdown-toggle{
  border: 0;
}
.dropdown-menu{
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .1);
  li a{
    color:$main-foreground;
    &:hover{
      background-color: rgba($main-foreground, .2);
    }
  }
}

select {
	border: 1px solid  rgba($main-foreground, .06);
	padding: 4px;
}

.radio-button{
  input[type="radio"]:checked + .radio-button-content{
    background-color: $primary-color;
    color: $main-background;
    @include border-radius(4px);

    select{
      color: $main-foreground;
    }
  }
}

{# /* // Pagination */ #}

.pagination{
  &>li>a{
    background-color: $main-background;
    color:$main-foreground;
    margin-bottom: 5px;
  }
  &>li>a:hover{
    color: $main-foreground;
    background-color: darken($main-background, 10%);
    border-color: $line-color;
  }
  &>.active>a,
  &>.active>a:focus,
  &>.active>a:hover{
    color: $main-foreground;
    background-color: lighten($primary-color, 50%);
    border-color: $line-color;
  }
}

{# /* // Sliders */ #}

.bx-viewport {
  height: auto !important;
}
.bx-pager {
  width: 100%;
  margin-top: 10px;
  text-align: center;
  color: $main-foreground;
  &-item {
    display: inline;
    a{
      display: inline-block;
      width: 10px;
      height: 10px;
      margin: 0 3px;
      text-indent: -9999px;
      border-radius: 50%;
      background: rgba($main-foreground, .2);
      &:hover,
      &.active{
        background: $primary-color;
      }
    }
  }
}
.bx-wrapper {
  clear: both;
  .bx-controls-direction{
    a{
      position: absolute;
      top: 50%;
      margin-top: -45px;
      width: 40px;
      overflow: hidden;
      &.bx-prev{
        left: 20px;
      }
      &.bx-next{
        right: 20px;
      }
    }
  }
}

{# /* // Pills */ #}

.pills-container{
  background-color: rgba($main-foreground, 0.03);
}
.pill-link{
  padding: 10px;
  color:$main-background;
  border: none;
  border-bottom: 4px solid darken($secondary-color, 10%);
  @include background-gradient($secondary-color);
  @include border-radius(4px);
  @extend .font-small;
  letter-spacing: 2px;
  text-transform: uppercase;
  &:hover,
  &:focus{
    color:$main-background;
    @include background-gradient-hover($secondary-color);
  }
}

{# /* // Labels */ #}

.label{
  color: $main-background;
  @include prefix(box-shadow, 1px 1px 2px 0 rgba(50, 50, 50, 0.30), webkit ms moz);
  &-secondary{
    background: $secondary-color;
  }
  &-primary{
    background: $primary-color;
  }
  &-primary-dark{
    background: darken($primary-color, 30%);
  }
}

{# /* // Tables */ #}

.table-striped {
  tbody>tr:nth-child(odd) {
    >th,
    >td {
      background-color: rgba($main-foreground, .03);
    }
  }
  >thead>tr>th{
    border-bottom:0;
  }
}
.table {
  >thead>tr>th,
  >tbody>tr>th,
  >tfoot>tr>th,
  >thead>tr>td,
  >tbody>tr>td,
  >tfoot>tr>td{
    border:0;
  }
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Logo */ #}

.logo-text{
	color: $primary-color;
	font-family: $font-headings;
}

{# /* // Nav desktop */ #}

.nav-head {
  background: $main-background;
  @include prefix(box-shadow, 0 2px 2px 0 rgba(50, 50, 50, 0.15), webkit ms moz);
  &-top {
    border-bottom: 1px solid $line-color;
    @extend .font-small;
  }
}

.nav-head-fixed{
	background: $main-background;
}

.desktop-nav {
  background-color: $main-background;

  &-item{
    background: $main-background;

    &:hover > .desktop-nav-link {
      color:$primary-color;
    }
    .desktop-nav-item {
      &:first-child {
        border-top:1px solid $line-color;
      }
      &:last-child {
        border-bottom:1px solid $line-color;
      }
      border-bottom: 1px solid $line-color;
      border-left: 1px solid $line-color;
      border-right: 1px solid $line-color;

      &:hover {
        background-color: $primary-color;
      }

      &:hover > .desktop-nav-link{
        color: $main-background;
      }
    }
  }
  &-item.selected > .desktop-nav-link {
    color:$primary-color;
    font-weight: bold;
  }
  &-list {
    @include prefix(box-shadow, 0 6px 12px rgba(0,0,0,.175), webkit ms moz);
    background-color: $main-background;
  }
}

{# /* // Search */ #}

.desktop-search-input{
  height: 28px
}
.desktop-search-icon{
	fill:rgba($main-foreground, .8);
}

{# /* // Search suggestions */ #}

.search-suggest{
  background-color: $main-background;
  &-link,
  &-icon{
    color: rgba($main-foreground, 0.8);
    &:hover,
    &:focus{
      color: rgba($main-foreground, 0.6);
      background-color: darken($main-background, 3%);
    }
  }
  &-price{
    color: $primary-color;
    font-weight: bold;
  }
  &-icon{
    color: rgba($main-foreground, 0.8);
  }
  &-all-link{
    background-color: darken($main-background, 3%);
  }
}

{# /* // Cart widget desktop */ #}

.cart-summary-items {
	background: $secondary-color;
	color: $main-background;
	@extend .font-small;
  font-weight: bold;
}
.cart-summary {
  @extend .font-small;
	color: rgba($main-foreground, .8);
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Filters and categories */ #}

.btn-filter{
  @extend .font-medium;
  margin: 4px;
}
.filter-btn-color{
  border: 1px solid lighten($secondary-color, 30%);
}
.filter-remove{
  border: 1px dotted rgba($main-foreground, .4);
}
.btn-more-categories {
  border-top: 1px solid rgba($main-foreground, .2);
  i{
    background-color: $main-background;
    color: $main-foreground;
    border-left: 1px solid rgba($main-foreground, .2);
    border-right: 1px solid rgba($main-foreground, .2);
    border-bottom: 1px solid rgba($main-foreground, .2);
  }
}

{# /* // Grid item */ #}


.item{
	background-color:$main-background;
  &-overlay{
    position: absolute;
    top: 0px;
    left: 0px;
    height: 100%;
    width: 100%;
    opacity:0;
    background:$primary-color;
    transition: opacity .15s ease-in-out;
    @include prefix(transition, opacity .15s ease-in-out, webkit ms moz);
    z-index: 1;
  }
  &:hover .item-overlay{
    opacity:0.6;
  }
  &-info-container{
    background-color: darken($main-background, 3%);
  }
  &-info{
    border-color: transparent transparent darken($main-background, 3%) transparent;
  }
  &-info:before{
    border-color: transparent transparent darken($main-background, 3%) transparent;
  }
  &-price{
    font-size: 18px;
    letter-spacing: 2px;
    font-family: $font-headings;
  }
  &-price-compare{
    letter-spacing: 2px;
    font-family: $font-headings;
  }
}
.installments{
  text-transform: uppercase;
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.cloud-zoom-loading {
	background:$main-background;
	color:$main-foreground;
	@include border-radius(5px);
}

{# /* // Form and info */ #}

.price-compare {
  letter-spacing: 0;
  color: rgba($main-foreground,.6);
  text-decoration: line-through;
}

.product-price{
  letter-spacing: 0;
  font-weight: 400;
}

.product-selected-gateway{
  color: $main-foreground;
}

.product-variants{
  float: left;
  width: 100%;
  padding-top: 20px;
  border-top: 1px dotted rgba($main-foreground, .2);
  border-bottom: 1px dotted rgba($main-foreground, .2);
}

.variant-label{
  font-family: $font-headings;
}

.btn-variant { 
  color: $main-foreground;
  border: 2px solid rgba($main-foreground, 0.2); 
  &-custom{
    background: $main-background;
  }
  &:hover,
  &:focus{
    color: $main-foreground;
  }
  &.selected{
    border: 2px solid $primary-color;
  }
} 

.product-shipping-calculator{
  label{
    cursor: default;
  }
  li input[type="radio"]:checked + .shipping-option{
    background: transparent;
    color: $main-foreground;
  }
  .radio-button-icons{
    display: none;
  }
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

.footer {
	background: $main-background;
  border-bottom: 1px solid $line-color;
}
.footer-legal{
  background: $main-background;
  .powered-by-logo svg { 
    fill: $main-foreground; 
  }
}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

.map {
	border-color: $line-color;
}

{#/*============================================================================
  #Cart page
==============================================================================*/#}

{# /* // Cart table */ #}

.cart-table-row {
  background: $main-background;
}
.cart-quantity-btn{
  color: rgba($main-foreground, .6); 
  fill: rgba($main-foreground, .6); 
  border:1px solid rgba($main-foreground, .6); 
}
.cart-quantity-input{
  border:0;
  border-top:1px solid rgba($main-foreground, .6); 
  border-bottom:1px solid rgba($main-foreground, .6); 
}
.cart-totals-container {
	background: $main-background;
}
.total-promotions,
.cart-total{
  color: $secondary-color;
  font-weight: bold;
}

{# /* // Ajax cart */ #}

.ajax-cart-table-header { 
  border-top: 1px solid rgba($secondary-color, 0.2);
  border-bottom: 1px solid rgba($secondary-color, 0.2);
}
.ajax-cart-item { 
  border-bottom: 1px solid rgba($secondary-color, 0.2); 
  background: rgba(150, 150, 150, 0.06); 
}

{#/*============================================================================
  #Media queries
==============================================================================*/#}

{# /* // Max width 767px */ #}

@media (max-width: 767px) {

  {# /* //// Colors and fonts */ #}

  {# /* Headings */ #}

  .title{
    font-size: 18px;
  }
  
  .h1-xs {
    font-size: 36px;
  }
  .h2-xs {
    font-size: 30px;
  }
  .h3-xs {
    font-size: 24px;
  }
  .h4-xs {
    font-size: 18px;
  }
  .h5-xs {
    font-size: 14px;
  }
  .h6-xs {
    font-size: 12px;
  }

  {# /* Body */ #}
  
  .font-body-xs {
    font-size: 14px;
  }
  .font-medium-xs {
    font-size: 16px;
  }
  .font-small-xs {
    font-size: 12px;
  }
  .font-small-extra-xs {
    font-size: 10px;
  } 

  {# /* Weight */ #}

  .weight-normal-xs {
    font-weight: 400;
  }
  .weight-strong-xs {
    font-weight: 700;
  }
  .weight-light-xs {
    font-weight: 100;
  }

	{# /* //// Components */ #}

  {# /* Wrappers */ #}

  .box-title {
    margin-top: 10px;
    font-size: 16px;
  }


  {# /* Modals */ #}

  .modal-xs,
  .modal{
    background-color:$main-background; 
    &-header{
      color: $main-foreground;
      &:active{
        background-color:$primary-color;
        color:$main-background;
        &-icon{
          color:$main-background;
          fill:$main-background;
        }
      }
    }
    &.inverse{
      background-color: $main-foreground;
      .modal-xs-header{
        color: $main-background;
      }
      .modal-xs-header-icon{
        color:$main-background;
        fill:$main-background;
      }
    }
  }

  .modal-xs-list-item{
    color: $main-foreground;
    border-bottom: 1px solid rgba($main-foreground, .25);
    &.darker{
      background-color:rgba($main-foreground, 0.02);
    }
    .modal-xs-list-icon{
      fill:$primary-color;
    }
    &:active{
      background-color:$primary-color;
      color:$main-background;
      .modal-xs-list-icon{
        color:$main-background;
        fill:$main-background;
      }
    }
    &.selected{
      color: $main-background;
      border-right: 0;
      border-left: 0;
      border-bottom: 0;
      background: $primary-color;
      .modal-xs-radio-icon {
        background: $main-background;
        i{
          visibility: visible; 
          color: $primary-color;
        }
      }
    }
    .modal-xs-radio-icon {
      background: rgba($primary-color, .4);
      color: $primary-color;
    }
    &.inverse{
      color:rgba($main-background, .8);
      border-bottom: 1px solid rgba($main-background, .05);
      .modal-xs-list-icon{
        fill:$main-background;
      }
    }
  }
  .modal-footer {
    border: 0;
  }

  {# /* Links that call the modal from right */ #}

  .btn-modal-xs-right {
    color: $main-foreground;
    border: 1px solid rgba($main-foreground, .2);
    border-radius: 0;
    background: $main-background;
    font-family: $font-headings;
    &:hover
    &:focus{
      color: $main-foreground;
    }
    &-icon{
      fill:$primary-color;
    }
  }
  .link-modal-xs-right-icon{
    fill:$main-foreground;
  }

	{# /* Tables */ #}

	.table-responsive {
		border-color: $line-color;
	}

	{# /* Pagination */ #}

  .pagination{
    background:lighten($main-foreground, 70%);
    &>li>a,
    &>li>span,
    &>.active>a,
    &>.active>a:hover,
    &>li>a:hover{
      background-color: transparent;
      border:0;
    }
    &-input{
      color:$main-foreground;
    }
    &-icon{
      float: left;
      color:$main-foreground;
    }
  }
  	
	{# /* //// Header and nav */ #}

  {# /* Nav mobile */ #}

  .hamburger-panel{
    &-link:hover,
    &-link:focus{
        background: $primary-color;
        color: $main-background;
    }
    &-arrow.selected{
      background-color: $primary-color;
      i{
        transform-origin: center;
        @include prefix(transform, rotate(180deg), webkit ms moz);
      }
    }
  }

  .mobile-nav{
    background-color:$main-background;
    &-first-row-icon{
      fill: $main-foreground;
    }  
    &-tab:hover {
      color: $main-foreground;
    }
    &-tab.selected{
      .mobile-nav-tab-icon{
        fill: $primary-color;
      }
      .mobile-nav-tab-text{
        color: $primary-color;
      }
    }
    .mobile-nav-tab-icon{
      fill: $main-foreground;
    }
    &-cart-amount{
      background-color: $secondary-color;
      color: $main-background;
    }
    &.move-up {
      box-shadow: 2px 0px 5px rgba($main-foreground, .3);
    }
  }
  .mobile-nav-arrow-up {
    background-color: $main-background;
  }
  .mobile-nav-categories-container{
    background-color: $main-foreground;
    box-shadow: 2px 0px 1px 1px rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
  }

  .backdrop.search-backdrop{
    background-color: rgba($main-background, .9);
  }

  {# /* //// Product grid */ #}

  .btn-filter{
    margin: 10px 10px 5px 0;
    padding: 5px 10px;
  }
  .item-price{
    margin: 2px 0;
    font-size: 16px;
    font-weight: bold;
  }

  {# /* //// Product detail */ #}

  .product-price{
    font-size: 30px;
  }

  .mobile-zoom-panel{
    background:$main-background;
  }
}
