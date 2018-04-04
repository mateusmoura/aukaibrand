$font:    'Lato', sans-serif;

$main_foreground_color: {{ settings.main_foreground_color }}; // black
$main_CTA_background_color: {{ settings.main_CTA_background_color }}; // green
$navigation_foreground_color:{{ settings.navigation_foreground_color }}; // white
$body_background: {{ settings.body_background }};; // white
$footer_background_color: {{ settings.footer_background_color }}; // white
$main_brand_color:{{ settings.main_brand_color }};

$opac1: 0.1;
$opac2: 0.2;
$opac4: 0.4;
$opac6: 0.6;
$opac8: 0.8;

// TINT  SHADE FROM COMPASS
// Add percentage of white to a color
@function tint($color, $percent){
	@return mix(white, $color, $percent);
}

// Add percentage of black to a color
@function shade($color, $percent){
	@return mix(black, $color, $percent);
}


// MIXIN ROUNDED
@mixin borde($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
       -o-border-radius: $radius;
          border-radius: $radius;
}

// MIXIN EASE
@mixin ease($ease){
	-moz-transition: all $ease ease-in;
	-webkit-transition: $ease ease;
	-o-transition: all $ease ease;
	transition: all $ease ease;
}

/* FIX HEADER WITH AFFIX */

.affix{top:0;}

/* FULL WIDTH */
@media (min-width: 1200px) {
  .container {
    width: 100%;
  .navbar-wrapper .container{padding:0;}
  }
}

/* MODIFY BREAKPOINT COLLAPSE NAVBAR */

@media (max-width: 990px) {
    .navbar-header {
        float: none;
    }
    .navbar-left,.navbar-right {
        float: none !important;
    }
    .navbar-toggle {
        display: block;
    }
    .navbar-collapse {
        border-top: 1px solid transparent;
        box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
    }
    .navbar-fixed-top {
		top: 0;
		border-width: 0 0 1px;
	}
    .navbar-collapse.collapse {
        display: none!important;
    }
    .navbar-nav {
        float: none!important;
		margin: 7.5px -15px;
	}
	.navbar-nav>li {
        float: none;
    }
    .navbar-nav>li>a {
        padding-top: 9px;
        padding-bottom: 9px;
    }
    .collapse.in{
  		display:block !important;
	}
	
	/* SUPERFISH */
	#sf-menud{display:none;}
	
	
}

*{-webkit-font-smoothing: antialiased;}

.navbar-fixed-top, .navbar-fixed-bottom{
	position:absolute;
} 
.navbar-toggle{
	float:left; 
	margin-left:15px;
} 
.navbar-header .searchbox{
	margin-right:15px;
} 
.navbar-bg{
	width:100%;
}


/* BODY */
body {
	font-family: {{ settings.myfont | raw }}; 
	font-size:16px; 
	color: $main_foreground_color; 
	background-color:{{settings.body_background}};
}
.left{
	float:left;
}
.right{
	float:right;
}
.clear{
	clear:both;
}
input{
	outline:0;
}

#ls_cart_widget{
	float:left;
}

/* CUSTOMIZE NAVBAR */
.navbar-wrapper{
	background-color:{{ settings.main_brand_color }};
}
.navbar{border:none;}
.navbar-bg{background-color:darken({{ settings.main_brand_color }}, 10%);}
.navbar-inverse .navbar-nav > li > a {
  color: $navigation_foreground_color;
}
.navbar-nav{width:100%;}
.navbar-inverse .navbar-nav > li > a:hover{color:lighten($main_brand_color, 30%);}
.navbar-inverse .navbar-nav > .active > a,
.navbar-inverse .navbar-nav > .active > a:hover,
.navbar-inverse .navbar-nav > .active > a:focus {
  color: lighten({{ settings.main_brand_color }}, 40%);
  background-color: transparent;
}
.navbar-inverse .navbar-nav .glyphicon-stop{color:{{ settings.navigation_foreground_color }}; padding:20px 0 0 0px; font-size:9px;}
.navbar-inverse {
  background-color: {{ settings.main_brand_color }};
}
.nav a:hover{@include ease(1s);}


/* CUSTOMIZE SUPERFISH */

.sf-menu ul li {
	background:darken({{ settings.main_brand_color }}, 5%);
}
.sf-menu ul ul li {
	background:darken({{ settings.main_brand_color }}, 8%);
}
.sf-menud li:hover,
.sf-menud li.sfHover {
	background: {{ settings.main_brand_color }};
}


.sf-menu a {
	color: {{ settings.navigation_foreground_color }};
}
.sf-menu a:hover {
	color: lighten({{ settings.main_brand_color }}, 60%);
}
.sf-menu a span{color:{{ settings.main_brand_color }};}

.sf-menu > ul{
	background-color:lighten({{ settings.main_brand_color }}, 5%);
}
/* CUSTOMIZE HEADER */



.header-logo .followus span{
	color:{{ settings.navigation_foreground_color }};
}			 
.header-logo{
			 height:90px;
			 .lang{text-align:right; padding:0 10px 0 0;
			 		a:hover{opacity:0.8;}
			 		.active{opacity:0.4;}
			 		}
			 .followus{border-bottom:solid 1px {{ settings.navigation_foreground_color }}; padding:10px 10px 40px 0;}
			 @media (max-width: 480px) {
			 .followus{padding-right:32px;}
			 .login-home{padding-right:22px;}
			 }
			 
			 .followus {
			 			span{font-style:italic; float:left; padding:6px 10px 10px 10px;}
			 
			 			a{width:30px; height:30px; font-size:20px; color:{{ settings.navigation_foreground_color }}; text-align:center; float:left; margin:0 0 0 10px; background-color:darken({{ settings.main_brand_color }},6%); padding:1px 0 0 0; display:block;}
			 			a:hover{background-color:darken({{ settings.main_brand_color }}, 16%); color:{{ settings.navigation_foreground_color }}};}
			 			}
			 
			 .login-home{padding-bottom:10px; float:right; text-align:right; 
			 			a{float:left; padding:10px 10px 5px 5px; text-align:center; color:{{ settings.navigation_foreground_color }}; font-weight:300; font-size:11px; text-transform: uppercase; list-style-type:none; margin:3px 0 0 0px;}
			 			a:last-child{border:none;}
			 			a{color:{{ settings.navigation_foreground_color }}; text-decoration:none; font-weight:600;}
			 		    a:hover{color:darken({{ settings.navigation_foreground_color }},10%);}
			 			li span{font-weight:700; font-size:16px; line-height:19px; float:left; display:block;}
			 			.icon-cart{padding:10px 0 0 26px; margin-left:0px; background-repeat:no-repeat; background-position:3px 11px; float:left; border:none; width:191px;}
			 			.quantity{ padding: 2px 5px; margin: 7px 10px 0px 10px; color:{{ settings.navigation_foreground_color }}; background-color:darken({{ settings.main_brand_color }},8%); text-align:center; float:left;}
			 			.price{color:{{ settings.navigation_foreground_color }}; padding:10px; margin:0 10px 0 0px; font-size:19px; line-height:22px;}
			 			
}
						


/* BANNER */
.bannerhome{
		margin-bottom:15px;
		img{width:100%; height:auto;}
		}
/* PASSWORD PAGE */
.password-page .password-container.password-icon .password-svg{
	fill:{{ settings.main_brand_color }};
}
/* CUSTOMIZE TITLES */

.titles{
	background-color:rgba($main_foreground_color, $opac1); 
	border-bottom:solid 3px {{ settings.main_brand_color }}; 
	color:$main_foreground_color; 
	font-size:26px; 
	font-weight:300; 
	padding:10px 10px 10px 0; margin:0 0 15px 0;  
	font-family:{{ settings.myfont2 | raw }};

		span{
			border-bottom:solid 5px {{ settings.main_brand_color }}; 
			padding:0 20px 10px 20px;}
		}

.titles2{background-color:rgba($main_foreground_color, $opac1);  border-bottom:solid 3px {{ settings.main_brand_color }}; color:$main_foreground_color; float: left;
  width: 100%;  padding: 10px 10px 0px 0;  margin-bottom: 20px; margin-top: 20px;
		h2{border-bottom:solid 5px {{ settings.main_brand_color }}; opacity:0.5; padding:0 20px 10px 20px;}
		}

/* CUSTOMIZE PRODUCTS */

.products{
		 
		 h3 a{color:$main_foreground_color;}
		 h3 a:hover{text-decoration:none; color:lighten($main_foreground_color, 20%);}
		 .price{ padding:0 0 0 0; color:lighten($main_foreground_color, 20%);background-color:rgba($main_foreground_color, $opac1); font-size:14px; font-weight:700;
		 	.offer{color:lighten($main_foreground_color, 20%);opacity:0.5; display:block; text-align:center; padding:0px 5px 5px 5px; text-decoration:line-through; margin:0 4px 0 0;}
		 	span{display:block;}
		 	 	}
		 .photo{  
		 position: relative;
		  overflow: hidden;
		  height: 240px;
		  width: 210px;
		}
		 .single-product-item:hover{ outline: 2px solid lighten($main_foreground_color,70%);border:solid 0px lighten($main_foreground_color, 100%);}
		 
		 .nostock{background-color:$main_foreground_color; color:{{ settings.navigation_foreground_color }}; opacity:0.6;}
		 .single-product-item{background-color:rgba($main_foreground_color, $opac1);}
		 }

.offer2{width:100%; padding:10px 0 10px 0; background-color:{{ settings.main_brand_color }}; color:{{ settings.navigation_foreground_color }}; text-align:center; position:absolute; bottom:0; opacity:0.9; z-index:9; text-transform:uppercase;}	
.out-of-stock{
 	background-color:lighten({{ settings.main_brand_color }}, 20%); 
 	color:{{ settings.navigation_foreground_color }};
}	 
.free-shipping{
 	background-color:darken({{ settings.main_brand_color }}, 12%); 
 	color:{{ settings.navigation_foreground_color }};
}
select.sort-by{
	color:black;
}
#cloud-zoom-big{
	background-color:$body_background;
}
@media (max-width: 767px) {
.products{width:320px; margin:auto;}
}

#price_display{
  color:darken({{ settings.main_brand_color}},10%);
  font-weight: 400;
}
.single-product-item .price #price_display{
 	color:darken({{ settings.main_brand_color}},25%);
}
/* CUSTOMIZE PAGINATION */

.pagination > .active > a{color:{{ settings.navigation_foreground_color }};}
.pagination > .active > a{background-color:lighten({{ settings.main_brand_color }},20%); border:none;}
.pagination > li a{background-color:{{ settings.main_brand_color }}; color:{{ settings.navigation_foreground_color }};}
.pagination > li a:hover{background-color:tint({{ settings.main_brand_color }},60%); color:{{ settings.navigation_foreground_color }};}
.pagination > li > a{color:{{ settings.navigation_foreground_color }}; background-color:{{ settings.main_brand_color }};}
.pagination > li > a{border:none;}

/* TWITTER 100% */
iframe[id^='twitter-widget-']{ margin:0 0 0px 0;}
#twitter-widget-0{width:100%;}
#likeboxplugin {
  width: 100% !important;
  /*height:500px;*/
  border:none; 
  overflow:hidden;
    margin-top: 20px;
  margin-bottom: -50px;
}
.password-footer form input{
	font-size:12px; width:100%; padding:10px; border:solid 1px lighten($main_foreground_color, 60%); margin:0 0 5px; background-color:tint({{ settings.navigation_foreground_color }}, 95%); color:darkgrey;
}

.password-footer form .send{
font-size:16px; width:100%; 
float:left; border:none; 
background-color:darken({{ settings.main_brand_color }},20%);
color:{{ settings.navigation_foreground_color }};
}
.password-footer form .send:hover{
	background-color:darken({{ settings.main_brand_color }},16%);
}



/* CUSTOMIZE FOOTER */
.footer{
		/* COPY */
		.copy{padding:12px 0 10px 0; background-color:{{ settings.footer_background_color }}; color:{{ settings.navigation_foreground_color }}; 
			.copyleft{font-size:11px; text-transform:uppercase;}
			.copyright{text-align:right; font-size:11px; color:{{ settings.navigation_foreground_color }};}
			 }
		/* FOOTER 1*/
		.footer1{
			background-color:lighten({{ settings.footer_background_color }}, 10%); color:{{ settings.navigation_foreground_color }};
			padding:20px 0 10px 0;
			h3{font-size:16px; padding:0px 0 10px 0; text-transform: uppercase;}
			 .followus {
			 			span{font-style:italic; display:block; float:left; padding:12px 10px 10px 10px;}
			 
			 			a{width:32px; height:32px; float:left; margin:0 0 0 10px; font-size:18px; color:{{ settings.navigation_foreground_color }}; text-align:center; background-color:{{ settings.main_brand_color }}; padding:5px 0 0 0;}
			 			a:hover{background-color:darken({{ settings.main_brand_color }}, 16%); color:{{ settings.navigation_foreground_color }};}
			 			}
			 			
			 .newsletter{
			 			input{font-size:12px; width:100%; padding:10px; border:solid 1px lighten($main_foreground_color, 60%); margin:0 0 5px; background-color:tint({{ settings.navigation_foreground_color }}, 95%); color:darkgrey;}
			 			.send{font-size:16px; width:30%; float:left; border:none; background-color:$main_CTA_background_color ;border: 2px solid darken($main_CTA_background_color, 10%); color:{{ settings.navigation_foreground_color }};}
			 			.send:hover{background-color:lighten($main_CTA_background_color, 16%);}
			}

		}
			
	    /* FOOTER 2 */
	    
	    .footer2{background-color:lighten({{ settings.footer_background_color }}, 10%); color:{{ settings.navigation_foreground_color }}; padding-bottom:31px; padding-top: 10px;
		    	h3{text-transform:uppercase; font-size:16px; padding:0 0 10px 0; }
		    	.menu{
		    		  ul{padding:0; margin:0;}
		    		  li{list-style:none; width:100%; padding:0; margin:0;}
			    	  li a{color:{{ settings.navigation_foreground_color }}; font-size:12px; text-decoration:none;}
			    	  li a:hover{color:darken({{ settings.navigation_foreground_color }}, 40%);}
		    	}
		    	.contactanos p{font-size:12px; padding:0; margin:0;}
		    	.contactanos a{color:{{ settings.navigation_foreground_color }}; text-decoration:none;}
		    	.contactanos a:hover{color:darken({{ settings.navigation_foreground_color }}, 40%);}
		    }
		}
		
		
/* PRODUCT DETAIL */
#shipping-calculator .calculatorButton, .address-btn a{background-color:darken({{ settings.main_brand_color }},20%);color:{{ settings.navigation_foreground_color }}; text-align:center;border: 2px solid darken({{ settings.main_brand_color }},15%);}
#shipping-calculator .calculatorButton:hover,  .address-btn a{background-color:darken({{ settings.main_brand_color }},16%);}
 .addbutton{padding:10px 15px 10px 15px; margin:27px 0 0 0; display:block; color:{{ settings.navigation_foreground_color }}; background-color:$main_CTA_background_color; width:100%; border: 2px solid darken($main_CTA_background_color,10%)}
  .addbutton:hover{opacity:0.8;}
.prod_detail{
			padding-bottom:61px;
			p{font-weight:300; padding:10px;}
			.price{font-size:51px; font-weight:600; color:$main_CTA_background_color;
				  span{color:$main_foreground_color; font-size: 28px; }
				  }
		    .combos{padding:10px 0 20px 0; margin:10px 0 10px 0; border-top:solid 1px tint($main_foreground_color, 80%); border-bottom:solid 1px tint($main_foreground_color, 80%);
				  label{font-size:11px; color:tint($main_foreground_color,60%); margin-top:10px; display:block; text-transform:uppercase;}
		    }
		    .addtocart{padding:5px 0 20px 0; margin:0px 0 10px 0; float:left; width:100%; border-bottom:solid 1px tint($main_foreground_color, 80%);
		    .juros{padding:0 0 21px 0;}
		    }
		   
		    @media (max-width: 320px) {
		    .addbutton{width:100%; font-size:14px;}
		    .shareLinks{padding:41px 0 0 0;}
		    }
		    .addbutton:hover{text-decoration:none; opacity:0.8}
		    .shareLinks div{float:left; margin:0 0 0 10px;}
		    .shareLinks .twitter{width:70px;}
		    .shareLinks .facebook{width:106px;}
		    .shareLinks .facebook iframe{ z-index:5;}
		    .shareLinks .google{width:61px;}
		    .shareLinks{margin:31px 0 0 0;}
			}
			

/* CUSTOMIZE BREADCRUMB */
#breadcrumb{padding:0 0 10px 0; color:tint($main_foreground_color, 60%); font-size:11px; font-weight:600; font-size:14px; text-transform:capitalize;
			a{color:tint($main_foreground_color, 30%);}
			a:hover{color:$main_foreground_color; text-decoration:none;}	
			}	


/* CUSTOMIZE PAGE */

.page_detail{
			padding-bottom:61px;
			padding:10px;
			ol, ul{padding:0 0 0 21px;}
			}	
		
/* DISABLE NAV FIXED 480 */
@media (max-width: 760px) {
.navbar-wrapper .container{padding-left:0; padding-right:0;}
.navbar-wrapper .container .navbar-fixed-top{position:relative;}
.banner{margin-top:0;}
.navbar{margin:0;}
.navbar .navbar-bg .navbar-header{margin:0;}
.navbar .navbar-bg .navbar-collapse{margin:0;}
.header-logo .followus a{
margin-left:0;
}
.followus span{display:none;}
.header-logo .followus{padding-right:0;}
.header-logo .followus a{margin-right:5px;}
.header-logo .followus span{display:none;}

.titles{font-size:16px;}
.header-logo .followus{padding-bottom:5px; float:right; padding-right:6px;}
.header-logo .login-home li:last-child{border-right:solid 1px lighten($main_foreground_color, 20%);}
.titles2{font-size:16px;}
}

/* FILTERS & CATEGORIES */
a.category-back {
    color: $main_brand_color;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}

/* CUSTOMIZE CART */

.cart-contents{
				.border{border-bottom:solid 1px tint($main_foreground_color,61%); padding:0 0 10px 0; margin:0 0 10px 0; font-size:19px; text-transform:uppercase; color:tint($main_foreground_color,31%); height:40px;}
				.col-quantity input{width:46px;height:46px;float:left; border:solid 1px tint($main_foreground_color,51%); padding:5px; text-align:center;}
					.border2{border-bottom:solid 1px tint($main_foreground_color,61%);height:116px; padding:0 0 10px 0; margin:0 0 10px 0; font-size:19px; text-transform:uppercase; color:tint($main_foreground_color,31%);
					a{color:tint($main_foreground_color,31%); font-size:14px; }
				    a:hover{color:$main_foreground_color;}
				    @media (max-width: 993px) {
				    a{display:block; margin:0;}
				    }
				    .thumb{border:solid 1px tint($main_foreground_color,61%);}
				    .col-quantity, .col-price, .col-subtotal, .col-delete{padding-top:26px; color:$main_foreground_color}
				    @media (max-width: 700px) {
				    .col-price, .col-subtotal{padding-top:3px;}
				    }
				    .total-price span{font-size:31px; color:$main_foreground_color;}
				    .col-delete button{font-size:31px; line-height:28px; background: none; border: none;}
				    }
				    
				}
				
				
a.continue-buying{
	padding: 9px 15px 8px 15px;
	margin: 5px 0 0 0;
	text-align:center;
	width:200px;
	margin-top: 30px;
	margin-bottom:20px;
	text-decoration:none;
}
a.continue-buying:hover{
	color:{{ settings.navigation_foreground_color }};
}
/* CUSTOMIZE SEARCH BOX */

.searchbox{
		   float:right; position:relative; margin:7px 0 7px 0; width:220px;
		   input{font-size:12px; padding:0px 10px; height:25px; outline:0; width:220px;}
		   @media (max-width: 1200px) {
		   input{width:201px;}
		   }
		   .submit-button{width:26px; height:25px; padding:0; position:absolute; right:0; top:0; border:none; background-color:{{ settings.main_brand_color }}; font-family: FontAwesome, 'Helvetica Neue', Helvetica, Arial, sans-serif; color:{{ settings.navigation_foreground_color }}; font-size: 12px!important;}
		   .submit-button:hover{opacity:0.8;}
		  }
		  
/* CUSTOMIZE SEARCH RESULT */

.search-result{
				.no-result{background-color:tint($main_foreground_color,81%); padding:30px; text-align:center; color:$main_foreground_color; text-transform:uppercase; margin:0 0 31px 0;}
				a{color:{{ settings.navigation_foreground_color }};}
				
				
			  }
			  
/* CUSTOMIZE 404 */

.page404{
		 .content{background-color:$main_foreground_color; color:{{ settings.navigation_foreground_color }}; padding:121px 0 101px 0; text-align:center; margin:0 0 31px 0; border-bottom:solid 5px {{ settings.main_brand_color }};
			 	 h1, p{text-transform:uppercase;}
		 }
		}

		
/* CUSTOMIZE CONTACT */

.pagecontact .form{padding:0 0 51px 0;
				   label{display:block; font-size:14px; color:tint($main_foreground_color, 30%); padding:12px 0 3px 0;}
				   input{width:90%; border:solid 1px tint($main_foreground_color, 30%); padding:10px;}
				   .inputarea{width:90%; border:solid 1px tint($main_foreground_color, 30%); padding:10px;}
				   .optional{font-size:11px;}
				   .submit_button{clear:both; margin:10px 0 31px 0; font-size:16px; width:40%; float:right; border:none; background-color:$main_CTA_background_color; color:{{ settings.navigation_foreground_color }}; float:left; border: 2px solid darken($main_CTA_background_color,10%);}
			 	   .submit_button:hover{opacity:0.8;}
			 	   .winnie-pooh{display:none;}
			 	   .contact-ok, .contact-error{padding:20px; width:80%; color:$main_foreground_color; background-color:tint($main_foreground_color, 80%);}
				   }
.contact-info a{
	color: $main_foreground_color; 
}
/* QUERIES FOR HEADER */
@media (max-width: 759px) {
.prod_detail, .page_detail, .search-result, .page404, .pagecontact{padding-top:31px;}
.carouselprods{height:241px; padding-bottom:61px;}
.sf-menu > li {float:none;}
}
@media only screen 
and (min-width : 321px) {
.carouselprods{height:341px;}
}
@media only screen 
and (min-width : 391px) {
.carouselprods{height:441px;}
}
@media only screen 
and (min-width : 480px) {
.carouselprods{height:541px;}
}

@media (min-width: 992px) {
.prod_detail, .page_detail, .search-result, .page404, .pagecontact{padding-top:25px;}
}
@media (max-width: 481px) {
.padtop480{padding-top:79px;}
}



/* PRODUCTS CAROUSEL PHOTOS */

#wrapper-carousel {
	position: absolute;
	width: 90%;
	
	top: 50px;
}
#carousel-wrapper {
	padding-bottom: 10px;
	position: relative;
}
#carousel, #thumbs {
	overflow: hidden;
}
#carousel-wrapper .caroufredsel_wrapper {
	/*border-radius: 10px;
	box-shadow: 0 0 5px #899;*/
}

#carousel span, #carousel img,
#thumbs a, #thumbs img  {
	display: block;
	float: left;
}

#carousel span, #carousel a,
#thumbs span, #thumbs a {
	position: relative;
}
#carousel img,
#thumbs img {
	border: none;
	border:solid 2px tint($main_foreground_color,89%);
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	
}
#carousel img.glare,
#thumbs img.glare {
	width: 102%;
	height: auto;
}

#carousel span {
	width: 554px;
}

#thumbs-wrapper {
	padding: 20px 40px;
	position: relative;
}
#thumbs a {
	/*border: 2px solid #899;*/
	width: 150px;
	margin: 0 10px;
	overflow: hidden;
	/*border-radius: 10px;*/
	
	-webkit-transition: border-color .5s;
	-moz-transition: border-color .5s;
	-ms-transition: border-color .5s;
	transition: border-color .5s;
}
#thumbs a:hover, #thumbs a.selected {
	border-color: #566;
}

#wrapper img#shadow {
	width: 100%;
	position: absolute;
	bottom: 0;
}

#prev, #next {
	display: block;
	width: 19px;
	height: 20px;
	margin-top: -10px;
	position: absolute;
	top: 50%;
}
#prev {
	background-position: 0 0;
	left: 10px;
	z-index:999;
}
#next {
	background-position: -19px 0;
	right: 10px;
	z-index:999;
}			
#prev:hover { 
	background-position: 0 -20px;				
}
#next:hover {
	background-position: -19px -20px;				
}
#prev.disabled, #next.disabled {
	display: none !important;
}

//Infinite scrolling
.infinite-scroll-loading {
    background: url( "{{ "images/loading.gif" | static_url }}" ) no-repeat center;
    display: block;
    height: 80px;
    width: inherit;
    overflow: hidden;
}
.loadMoreContainer .button.secondary{
	background-color:darken({{ settings.main_brand_color }},20%);
	border: 2px solid darken({{ settings.main_brand_color }},15%);
}
.loadMoreContainer .button.secondary:hover{
	background-color:darken({{ settings.main_brand_color }},16%);
}
.text-only a{
	color: {{ settings.navigation_foreground_color }};
}
#banner-services{
	background-color:rgba($main_foreground_color, $opac6);
}
#banner-services .banner-service-item{
	color: lighten($main_foreground_color, 82%);
}
.banner-services-footer, .banner-services-footer #banner-services{
	background-color:lighten({{ settings.footer_background_color }}, 30%);
}
.banner-services-footer #banner-services .banner-service-item{
	color:{{ settings.navigation_foreground_color }};
}
.es-carousel ul li a{
	border-color:tint($main_foreground_color,40%)!important;
}
.es-carousel ul li.selected a{
	border-color:$main_foreground_color!important;
}
.sf-menu li.active > a{
  color: lighten({{settings.main_brand_color}},40%);
}
.form-horizontal .send{
	background-color:$main_CTA_background_color;
	border: 2px solid darken($main_CTA_background_color,10%);
}
.form-horizontal .send:hover{
	opacity:0.8;
}
.alert-error{
	color: darken({{ settings.main_brand_color }},20%);
}
.user-product-description ul li a, .user-product-description ol li a{
	color: $main_foreground_color;
}
.product-details-overlay a{
	color: {{ settings.navigation_foreground_color }};
}
.product-details-overlay {
	background-color:lighten($main_foreground_color, 40%);
	opacity:0.9;
}
.imagecolContent{
	border:1px solid rgba($main_foreground_color, $opac2);
}
.imagecol .img-thumbnail{
	border-left:none;
	border-top:none;
	border-bottom:none;		
}
.mTS_horizontal ul.mTSContainer > li{
 	border-right:1px solid lighten($main_foreground_color, 70%)
   
}
.mTSWrapper{
	border:1px solid rgba($main_foreground_color, $opac2)
}
.mTSButton{
	background-color:lighten($main_foreground_color, 50%)!important;
}
.mTSButtonIconContainer{
	color:{{ settings.navigation_foreground_color }}!important;
}
.table>thead>tr>th{
	  border-bottom: 1px solid lighten($main_foreground_color, 50%);
}
.single-product-container .max_installments{
	border-bottom: 1px solid lighten($main_foreground_color, 50%);
	text-align:center;
}
.quick-content .max_installments{
	border-bottom:0px;
}
.prod_detail #button-installments{
	color:darken($main_CTA_background_color, 10%);
}
.prod_detail #button-installments:hover{
	color:darken($main_CTA_background_color, 0%);
}
@media (max-width: 767px){
	.header-logo{
		background-color:lighten({{ settings.main_brand_color }}, 5%);
	}	
}
.related-title{
border-bottom:solid 3px lighten($main_foreground_color,40%);
}
@media (max-width: 767px){
	.pagecontact .form .submit_button{
		width:100%;
	}
}
@media (max-width: 500px){
	#ls_cart_widget .cart-container a{
	background-color:darken({{ settings.main_brand_color }},2%);
	}
}

/*Hamburguer Navigation*/
.pushy a:hover{
    background:$main_brand_color;
    text-decoration:none;
}
.menu-btn{
	color:{{ settings.navigation_foreground_color }};
}
.mobile-dropdown i{
    background:rgba(131, 131, 131, 0.4);
    color:white;
}
.mobile-dropdown.dropdown-selected > i{
    background:$main_brand_color;
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
.descriptioncolContent .installments strong{
  color:darken({{ settings.main_brand_color}},15%);
}
.max_installments strong{
    color:darken({{ settings.main_brand_color}},25%);
}
#orderBoxMobile.dos .wrapper .row .fa{
	background-color:$main_brand_color;
}
#orderBoxMobile .wrapper .checkout-link{
	background-color:$main_CTA_background_color ;
	border: 2px solid darken($main_CTA_background_color, 10%); 
	color:{{ settings.navigation_foreground_color }};
}

#orderBoxMobile .wrapper .checkout-link:hover{
background-color:lighten($main_CTA_background_color, 16%);
}
.social-title h3{
	color:$main_foreground_color; 
	border-bottom: 1px solid rgba($main_foreground_color, $opac4);
}
#newsletter-popup{
			input{font-size:12px; width:100%; padding:10px; border:solid 1px lighten($main_foreground_color, 60%); margin:0 0 5px; background-color:tint({{ settings.navigation_foreground_color }}, 95%); color:darkgrey;}
			.send{font-size:16px; width:30%; float:left; border:none; background-color:$main_CTA_background_color ;border: 2px solid darken($main_CTA_background_color, 10%); color:{{ settings.navigation_foreground_color }}; width:100%}
			.send:hover{background-color:lighten($main_CTA_background_color, 16%);}
}
#newsModal .modal-content{
	background-color:{{settings.body_background}};
}
#newsModal .img.logo.news .no-logo-news{
	color:{{ settings.main_brand_color }};
}
/**** Sidebarhome****/
 .sidebar-home{background-color:rgba($main_foreground_color, $opac1);}
 .sidebar-home a{
color:{{ settings.main_foreground_color }};
}
#categories-column.sidebar-home h4{
	background-color:rgba($main_foreground_color, $opac1);
}
#categories-column.sidebar-home #show-more-cats i.fa{
	background-color:darken({{ settings.main_brand_color }}, 10%);
	border:none;
 	color: $navigation_foreground_color;
}

/**** Shipping Calculator ***/
.shipping-list .shipping-option i{
 display:none;
}
 .shipping-list li .shipping-method:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: $main_brand_color;
  position: absolute;
  right: 10px;
  top: 10px;
}
 .shipping-list li .shipping-method:checked + .shipping-option { 
    border:2px solid $main_brand_color;
 }


/* new copyright */
#svg_brand .st0 { fill: $navigation_foreground_color; }
#svg_brand .st1 { fill: rgba($navigation_foreground_color, $opac8); }

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
    background:$main_brand_color;
    color:$body_background;
}
.mobile-filters.dropdown-selected > .fa-chevron-down:before{
    content: "\f077";   
 }
#filters-column .color-filter, #filters-column .size-filter, #filters-column .other-filter { border: 1px solid rgba($main_foreground_color, $opac2); }

#filters-column .color-filter:hover, #filters-column .size-filter:hover, #filters-column .other-filter:hover {
border-color: rgba($main_foreground_color, $opac6);
} 
 #show-filters:hover, #show-filters:hover i { color: inherit } 

@media(max-width: 767px){
    #filters-container {
        background: rgba(131, 131, 131, 0.1);
        padding: 15px 0;
    }
    #toggle-filters { margin: 0 15px; }
    #show-filters { display: block; text-align: left; color: $main_foreground_color; }
    .sidebar-container { width: 100% !important }
}
@media(min-width: 768px){
    #show-filters { display: none; }
    #toggle-filters { display: block !important; }
}