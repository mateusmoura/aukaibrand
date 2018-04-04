/* DECLARE FONTS */
$font:    'Lato', sans-serif;

/* DECLARE COLORS */
$color1: #1D1D1F; // black
$color2: #EC2F27; // red
$color3: #66CC99; // green
$color4: #FFF; // white
/*
$color1: #4B5A80; // 
$color2: #3399FF; // 
$color3: #66CC99; // 
$color4: #FFF; // 
*/

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

/* FULL WIDTH */
@media (min-width: 1200px) {
  .container {
    width: 100%;
  .navbar-wrapper .container{padding:0;}
  }
}

*{-webkit-font-smoothing: antialiased;}

/* BODY */
body {font-family: $font; font-size:16px; color: $color1;}
.left{float:left;}
.right{float:right;}
.clear{clear:both;}

#ls_cart_widget{float:left;}

/* CUSTOMIZE NAVBAR */
.navbar-wrapper{background-color:$color1;}
.navbar{border-top:solid 5px $color2;}
.navbar-bg{background-color:lighten($color1, 10%); border-top:solid 1px lighten($color1, 30%);}
.navbar-inverse .navbar-nav > li > a {
  color: $color4;
  text-transform:uppercase;
}
.navbar-inverse .navbar-nav > li > a:hover{color:lighten($color1, 40%);}
.navbar-inverse .navbar-nav > .active > a,
.navbar-inverse .navbar-nav > .active > a:hover,
.navbar-inverse .navbar-nav > .active > a:focus {
  color: $color2;
  background-color: lighten($color1, 10%);
}
.navbar-inverse .navbar-nav .glyphicon-stop{color:$color4; padding:20px 0 0 0px; font-size:9px;}
.navbar-inverse {
  background-color: $color1;
  border-bottom:solid 1px lighten($color1, 70%);
}
.nav a:hover{@include ease(1s);}


/* CUSTOMIZE HEADER */
.header-logo{
			 height:141px;
			 .lang{text-align:right;
			 		a:hover{opacity:0.8; @include ease(1s);}
			 		.active{opacity:0.4;}
			 		}
			 .followus{border-bottom:solid 1px lighten($color1, 20%); padding:10px 0 61px 0; color:$color4;}
			 @media (max-width: 480px) {
			 .followus{padding-right:30px;}
			 .login-home{padding-right:22px;}
			 }
			 .followus {
			 			span{font-style:italic; float:left; padding:12px 10px 10px 10px;}
			 
			 			a{width:46px; height:46px; float:left; margin:0 0 0 10px; background-color:$color2; @include borde(30px); @include ease(1s);}
			 			a:hover{background-color:darken($color2, 16%);}
			 			}
			 
			 .login-home{padding-bottom:10px;
			 			li{float:left; padding:10px 15px 5px 5px; text-align:center; color:$color4; font-weight:300; font-size:12px; list-style-type:none; border-right:solid 1px lighten($color1, 20%); margin:6px 10px 0 0px;}
			 			li:last-child{border:none;}
			 			li a{color:$color4; text-decoration:none;}
			 			li a:hover{color:$color2;}
			 			li span{font-weight:700; font-size:16px; line-height:19px; float:left; display:block;}
			 			.icon-cart{padding:10px 0 0 26px; margin-left:0px; background-repeat:no-repeat; background-position:3px 11px; float:left; border:none;}
			 			.quantity{width:30px; height:18px; margin:0 10px 0 10px; color:$color4; background-color:$color2; text-align:center; float:left; @include borde(5px);}
}
						}


/* BANNER */
.bannerhome{
		margin-bottom:15px;
		img{width:100%; height:auto;}
		}

/* CUSTOMIZE TITLES */

.titles{background-color:$color1; border-bottom:solid 3px $color2; color:$color4; font-size:26px; font-weight:300; padding:10px 10px 10px 0; margin:0 0 15px 0; text-transform:uppercase;
		span{border-bottom:solid 5px $color2; padding:0 20px 10px 20px;}
		}

.titles2{background-color:tint($color1,80%); border-bottom:solid 3px $color2; color:$color1; font-size:26px; font-weight:300; padding:10px 10px 10px 0; margin:0 0 15px 0; text-transform:uppercase;
		span{border-bottom:solid 5px $color2; padding:0 20px 10px 20px;}
		}

/* CUSTOMIZE PRODUCTS */

.products{
		 margin-bottom:15px;
		 div{margin-bottom:15px;}
		 h1 a{font-size:21px; font-weight:300; color:$color1; height:61px; text-transform:uppercase;}
		 h1 a:hover{text-decoration:none; color:lighten($color1, 40%);}
		 .price{background-color:$color1; padding:0 0 0 0; color:$color4; font-size:14px; font-weight:700;
		 	.offer{background-color:$color3; color:$color4; display:block; width:50%; float:left; padding:10px; text-decoration:line-through; margin:0 10px 0 0; text-align:left;}
		 	span{padding:10px; display:block; text-align:right;}
		 	 	}
		 
		 .photo{position:relative; height:300px; border:solid 1px tint($color1, 75%); overflow:hidden;}
		 .offer2{width:100%; padding:10px 0 10px 0; background-color:$color3; color:$color4; text-align:center; font-size:19px; font-weight:700; position:absolute; bottom:0; opacity:0.9;}
		 .nostock{width:100%; padding:10px; background-color:$color2; color:$color4; text-align:center; font-size:19px; font-weight:700; position:absolute; bottom:0; opacity:0.9;}
		 }
@media (max-width: 767px) {
.products{width:320px; margin:auto;}
}

/* TWITTER 100% */
iframe[id^='twitter-widget-']{ width:100%; margin:0 0 25px 0;}
#likeboxplugin {
  width: 100% !important;
  /*height:500px;*/
  border:none; 
  overflow:hidden;
}
/* CUSTOMIZE FOOTER */
.footer{
		border-top:solid 1px tint($color1, 80%);
		/* COPY */
		.copy{padding:12px 0 10px 0; background-color:tint($color1, 84%); color:tint($color1, 30%); border-top:solid 1px tint($color1, 64%);
			.copyleft{font-size:11px; text-transform:uppercase;}
			.copyright{text-align:right; font-size:12px; color:$color1; font-weight:700;}
			 }
		/* FOOTER 1*/
		.footer1{
			padding:0 0 10px 0;
			h1{font-size:16px; padding:0 0 5px 0; border-bottom:solid 1px tint($color1, 60%);}
			 .followus {
			 			span{font-style:italic; display:block; float:left; padding:12px 10px 10px 10px;}
			 
			 			a{width:46px; height:46px; float:left; margin:0 0 0 10px; background-color:$color2; @include borde(30px); @include ease(1s);}
			 			a:hover{background-color:darken($color2, 16%);}
			 			}
			 			
			 .newsletter{
			 			input{font-size:12px; width:100%; padding:10px; border:solid 1px lighten($color1, 60%); margin:0 0 5px; background-color:$color4;}
			 			.send{font-size:16px; width:30%; float:right; border:none; background-color:lighten($color3, 8%); color:$color4;}
			 			.send:hover{background-color:lighten($color3, 16%); @include ease(1s);}
			}}
			
	    /* FOOTER 2 */
	    
	    .footer2{background-color:tint($color1, 92%); padding-bottom:31px; border-top:solid 1px tint($color1, 60%);
		    	h1{font-size:16px; padding:0 0 5px 0; border-bottom:solid 1px tint($color1, 60%);}
		    	.menu{
		    		  ul{padding:0; margin:0;}
		    		  li{list-style:none; width:100%; padding:0; margin:0;}
			    	  li a{color:$color1; font-size:12px; text-decoration:none;}
			    	  li a:hover{color:lighten($color1, 40%);}
		    	}
		    	.contactanos p{font-size:12px; padding:0; margin:0;}
		    	.contactanos a{color:$color1; text-decoration:none;}
		    	.contactanos a:hover{color:lighten($color1, 40%);}
		    }
		}
		
		
/* PRODUCT DETAIL */

.prod_detail{
			padding-bottom:61px;
			p{font-weight:300; padding:10px;}
			.price{font-size:51px; font-weight:600; color:$color3;
				  span{color:$color1; text-decoration:line-through;}
				  }
		    .combos{padding:10px 0 20px 0; margin:10px 0 10px 0; border-top:solid 1px tint($color1, 80%); border-bottom:solid 1px tint($color1, 80%);
				  label{font-size:11px; color:tint($color1,60%); margin-top:10px; display:block; text-transform:uppercase;}
		    }
		    .addtocart{padding:10px 0 20px 0; margin:10px 0 10px 0; border-bottom:solid 1px tint($color1, 80%);}
		    .addbutton{padding:10px 20px 10px 20px; margin:20px 0 0 21px; display:block; color:$color4; background-color:$color3; @include ease(0.3s); border:none; text-transform:uppercase;}
		    .addbutton:hover{text-decoration:none; background-color:tint($color3,60%); color:$color3;}
		    .shareLinks div{float:left; margin:0 0 0 10px;}
			}
			

/* CUSTOMIZE BREADCRUMB */
#breadcrumb{padding:0 0 10px 0; color:tint($color1, 60%); font-size:11px; font-weight:300; text-transform:capitalize;
			a{color:tint($color1, 30%);}
			a:hover{color:$color1; text-decoration:none;}	
			}	


/* CUSTOMIZE PAGE */

.page_detail{
			padding-bottom:61px;
			font-weight:300; padding:10px;
			ol, ul{padding:0 0 0 21px;}
			}	
		
/* DISABLE NAV FIXED 480 */
@media (max-width: 480px) {
.navbar-wrapper .container{padding-left:0; padding-right:0;}
.navbar-wrapper .container .navbar-fixed-top{position:relative;}
.banner{margin-top:0;}
.navbar{margin:0;}
.navbar .navbar-bg .navbar-header{margin:0;}
.navbar .navbar-bg .navbar-collapse{margin:0;}
.followus a{
	zoom: 0.8; /* IE */
-moz-transform: scale(0.8); /* Firefox */
-moz-transform-origin: 0 0;
-o-transform: scale(0.8); /* Opera */
-o-transform-origin: 0 0;
-webkit-transform: scale(0.8); /* Safari And Chrome */
-webkit-transform-origin: 0 0;
transform: scale(0.8); /* Standard Property */
transform-origin: 0 0;  /* Standard Property */
margin-left:0px;
width:36px; height:36px;}
.followus span{display:none;}
.header-logo .followus{padding-right:0;}
.header-logo .followus span{display:none;}
.header-logo .followus .right{float:none;}
.titles{font-size:16px;}
}

/* CUSTOMIZE CART */

.cart-contents{
				.border{border-bottom:solid 1px tint($color1,61%); padding:0 0 10px 0; margin:0 0 10px 0; font-size:19px; text-transform:uppercase; color:tint($color1,31%);}
				@media (max-width: 480px) {
				.border{font-size:12px;}
				}
				.col-quantity input{width:41px; border:solid 1px tint($color1,51%); padding:5px;}
					.border2{border-bottom:solid 1px tint($color1,61%); padding:0 0 10px 0; margin:0 0 10px 0; font-size:19px; text-transform:uppercase; color:tint($color1,31%);
					a{color:tint($color1,31%); font-size:12px;}
				    a:hover{color:$color1;}
				    img{border:solid 2px tint($color1,61%);}
				    .col-quantity, .col-price, .col-subtotal, .col-delete{padding-top:26px; color:$color1;}
				    .total-price span{font-size:31px; color:$color1;}
				    .col-delete a{font-size:31px; color:$color2;}
				    .col-delete a:hover{color:tint($color2,80%); text-decoration:none;}
				    }
				    
				}
				
				
				
				
.go-to-checkout{padding:10px 0 20px 0; border-bottom:solid 1px tint($color1,61%); margin:0 0 21px 0;
				.addbutton{padding:10px 20px 10px 20px; margin:20px 0 0 21px; display:block; color:$color4; background-color:$color3; @include ease(0.3s); border:none; text-transform:uppercase; float:left; font-size:31px; height:56px;}
				.addbutton:hover{text-decoration:none; background-color:tint($color3,60%); color:$color3;}
				.updatebutton{padding:10px 20px 10px 20px; margin:20px 0 0 21px; display:block; color:$color4; background-color:tint($color1,60%); @include ease(0.3s); border:none; text-transform:uppercase; float:left; font-size:16px; height:56px;}
				.updatebutton:hover{text-decoration:none; background-color:tint($color3,60%); color:$color3;}
				@media (max-width: 480px) {
				.addbutton, .updatebutton{font-size:14px;}
				}
				}
				
/* CUSTOMIZE SEARCH BOX */

.searchbox{
		   padding:10px 0 10px 0; float:right; background-color:tint($color1,90%); border-top:solid 1px tint($color1,80%);
		   input{font-size:12px; padding:5px;}
		   .submit-button{width:26px; height:30px; border:none;}
		  }
		  
/* CUSTOMIZE SEARCH RESULT */

.search-result{
				.no-result{background-color:tint($color1,81%); padding:101px; text-align:center; color:$color1; text-transform:uppercase; margin:0 0 31px 0;}
			  }
			  
/* CUSTOMIZE 404 */

.page404{
		 .content{background-color:$color1; color:$color4; padding:121px 0 101px 0; text-align:center; margin:0 0 31px 0; border-bottom:solid 5px $color2;
			 	 h1, p{text-transform:uppercase;}
		 }
		}

		
/* CUSTOMIZE CONTACT */

.pagecontact .form{padding:0 0 51px 0;
				   label{display:block; font-size:14px; color:tint($color1, 30%); padding:10px 0 10px 0;}
				   input{width:80%; border:solid 1px tint($color1, 30%); padding:10px;}
				   .inputarea{width:80%; border:solid 1px tint($color1, 30%); padding:10px;}
				   .optional{font-size:11px;}
				   .submit_button{clear:both; margin:10px 0 31px 0; font-size:16px; width:30%; float:right; border:none; background-color:lighten($color3, 8%); color:$color4; float:left;}
			 	   .submit_button:hover{background-color:lighten($color3, 16%); @include ease(1s);}
			 	   .winnie-pooh{display:none;}
			 	   .contact-ok, .contact-error{padding:20px; width:80%; color:$color1; background-color:tint($color1, 80%);}
				   }

/* QUERIES FOR HEADER */
@media (max-width: 480px) {
.prod_detail, .page_detail, .search-result, .page404, .pagecontact{padding-top:61px;}
.carouselprods{height:401px;}
}
@media (min-width: 481px) {
.prod_detail, .page_detail, .search-result, .page40, .pagecontact4{padding-top:381px;}
.carouselprods{height:511px;}
}
@media (min-width: 992px) {
.prod_detail, .page_detail, .search-result, .page404, .pagecontact{padding-top:261px;}
}
@media (max-width: 481px) {
.padtop480{padding-top:151px;}
}

/* PRODUCTS CAROUSEL PHOTOS */

#wrapper-carousel {
				position: absolute;
				width: 90%;
				
				topZ: 50px;
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
				border:solid 2px tint($color1,89%);
				width: 100%;
				height: variable;
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
				height: variable;
			}

			#thumbs-wrapper {
				padding: 20px 40px;
				position: relative;
			}
			#thumbs a {
				/*border: 2px solid #899;*/
				width: 150px;
				height: variable;
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
		
 
