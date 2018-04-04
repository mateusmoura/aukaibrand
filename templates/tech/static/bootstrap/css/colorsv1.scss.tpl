/* DECLARE FONTS */
$font:    'Lato', sans-serif;


/* DECLARE COLORS */
$color1: #1D1D1F; // black
$color2: #EC2F27; // red
$color3: #66CC99; // green
$color4: #FFF; // white
/*
$color1: #767782; // 
$color2: #3399FF; // 
$color3: #999; //  
$color4: #000; // 
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
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .collapse.in{
  		display:block !important;
	}
	
	/* SUPERFISH */
	#sf-menud{display:none;}
	
	
}





*{-webkit-font-smoothing: antialiased;}

.navbar-fixed-top, .navbar-fixed-bottom{position:absolute;} /* DISABLE THE FIXED */
.navbar-toggle{float:left; margin-left:15px;} /* CUSTOMIZE THE TOGGLE */
.navbar-header .searchbox{margin-right:15px;} /* CUSTOMIZE THE SEARCH IN TOGGLE */
.navbar-bg{width:100%;}


/* BODY */
body {font-family: {{ settings.myfont | raw }}; font-size:16px; color: {{ settings.color1 }};}
.left{float:left;}
.right{float:right;}
.clear{clear:both;}
input{outline:0;}

#ls_cart_widget{float:left;}

/* CUSTOMIZE NAVBAR */
.navbar-wrapper{background-color:{{ settings.color1 }};}
.navbar{border-top:solid 5px {{ settings.color2 }};}
.navbar-bg{background-color:lighten({{ settings.color1 }}, 10%); border-top:solid 1px lighten({{ settings.color1 }}, 30%);}
.navbar-inverse .navbar-nav > li > a {
  color: {{ settings.color4 }};
  text-transform:uppercase;
}
.navbar-nav{width:100%;}
.navbar-inverse .navbar-nav > li > a:hover{color:lighten({{ settings.color1 }}, 40%);}
.navbar-inverse .navbar-nav > .active > a,
.navbar-inverse .navbar-nav > .active > a:hover,
.navbar-inverse .navbar-nav > .active > a:focus {
  color: color({{ settings.color1 }}, 40%);
  background-color: transparent;
}
.navbar-inverse .navbar-nav .glyphicon-stop{color:{{ settings.color4 }}; padding:20px 0 0 0px; font-size:9px;}
.navbar-inverse {
  background-color: {{ settings.color1 }};
  border-bottom:solid 1px lighten({{ settings.color1 }}, 70%);
}
.nav a:hover{@include ease(1s);}


/* CUSTOMIZE SUPERFISH */

.sf-menu ul li {
	background:lighten({{ settings.color1 }}, 10%);
}
.sf-menu ul ul li {
	background:lighten({{ settings.color1 }}, 20%);
}
.sf-menud li:hover,
.sf-menud li.sfHover {
	background: lighten({{ settings.color1 }}, 30%);
	
}


.sf-menu a {
	color: {{ settings.color4 }};
}
.sf-menu a:hover {
	color: lighten({{ settings.color1 }}, 60%);
}
.sf-menu a span{color:{{ settings.color2 }};}


/* CUSTOMIZE HEADER */

@media (max-width: 480px) {
			 #ls_cart_widget{float:left; margin:10px 0 0 0; width:100%; border-top:solid 1px tint({{settings.color4}},60%);  padding:10px 0 0 0;}
			 }
			 
.header-logo{
			 height:111px;
			 .lang{text-align:right; padding:0 10px 0 0;
			 		a:hover{opacity:0.8; @include ease(1s);}
			 		.active{opacity:0.4;}
			 		}
			 .followus{border-bottom:solid 1px lighten({{ settings.color1 }}, 20%); padding:10px 10px 61px 0; color:{{ settings.color4 }};}
			 @media (max-width: 480px) {
			 .followus{padding-right:32px;}
			 .login-home{padding-right:22px;}
			 }
			 
			 .followus {
			 			span{font-style:italic; float:left; padding:12px 10px 10px 10px;}
			 
			 			a{width:46px; height:46px; font-size:24px; color:{{ settings.color4 }}; text-align:center; float:left; margin:0 0 0 10px; background-color:{{ settings.color2 }}; @include borde(30px); @include ease(1s); padding:8px 0 0 0; display:block;}
			 			a:hover{background-color:darken({{ settings.color2 }}, 16%); color:{{ settings.color4 }}};}
			 			}
			 
			 .login-home{padding-bottom:10px; float:right; text-alignz:right; widthz:442px;
			 			a{float:left; paddingz:10px 10px 5px 5px; text-align:center; color:{{ settings.color4 }}; font-weight:300; font-size:12px; list-style-type:none; border-right:solid 1px lighten({{ settings.color1 }}, 20%); margin:3px 0 0 19px;}
			 			a:last-child{border:none;}
			 			a{color:{{ settings.color4 }}; text-decoration:none; font-weight:600;}
			 		    a:hover{color:{{ settings.color2 }};}
			 			li span{font-weight:700; font-size:16px; line-height:19px; float:left; display:block;}
			 			.icon-cart{padding:10px 0 0 26px; margin-left:0px; background-repeat:no-repeat; background-position:3px 11px; float:left; border:none; width:191px;}
			 			.quantity{width:30px; heightz:18px; margin:0 15px 0 15px; color:{{ settings.color4 }}; background-color:{{ settings.color2 }}; text-align:center; floatz:left; @include borde(5px);}
			 			.price{color:$color4; paddingz:10px; margin:0 10px 0 0px; font-size:19px; line-height:22px;}
			 			
}
						


/* BANNER */
.bannerhome{
		margin-bottom:15px;
		img{width:100%; height:auto;}
		}

/* CUSTOMIZE TITLES */

.titles{background-color:{{ settings.color1 }}; border-bottom:solid 3px {{ settings.color2 }}; color:{{ settings.color4 }}; font-size:26px; font-weight:300; padding:10px 10px 10px 0; margin:0 0 15px 0; text-transform:uppercase; font-family:{{ settings.myfont2 | raw }};
		span{border-bottom:solid 5px {{ settings.color2 }}; padding:0 20px 10px 20px;}
		}

.titles2{background-color:tint({{ settings.color1 }},80%); border-bottom:solid 3px {{ settings.color2 }}; color:{{ settings.color1 }}; font-size:26px; font-weight:300; padding:10px 10px 10px 0; margin:0 0 15px 0; text-transform:uppercase;
		span{border-bottom:solid 5px {{ settings.color2 }}; padding:0 20px 10px 20px;}
		}

/* CUSTOMIZE PRODUCTS */

.products{
		 margin-bottom:15px;
		 div{margin-bottom:15px;}
		 h1{padding:0; margin:0 0 10px 0; line-height:19px;}
		 h1 a{font-size:21px; font-weight:300; color:{{ settings.color1 }}; height:41px; display:block; text-transform:uppercase; line-height:19px; font-family:{{ settings.myfont2 | raw }};}
		 h1 a:hover{text-decoration:none; color:lighten({{ settings.color1 }}, 20%);}
		 .price{background-color:{{ settings.color1 }}; padding:0 0 0 0; color:{{ settings.color4 }}; font-size:14px; font-weight:700;
		 	.offer{background-color:{{ settings.color3 }}; color:{{ settings.color4 }}; display:block; width:50%; float:left; padding:5px; text-decoration:line-through; margin:0 10px 0 0; text-align:left; font-family:{{ settings.myfont2 | raw }};}
		 	span{padding:5px; display:block; text-align:right;}
		 	 	}
		 .photo{position:relative; border:solid 1px tint({{ settings.color1 }}, 75%); overflow:hidden; height:280px;}
		 .photo:hover{@include ease(0.3s); opacity:0.8;}
		 .offer2{width:100%; padding:10px 0 10px 0; background-color:{{ settings.color2 }}; color:{{ settings.color4 }}; text-align:center; font-size:19px; font-weight:700; position:absolute; bottom:0; opacity:0.9; z-index:9; text-transform:uppercase; font-family:{{ settings.myfont2 | raw }};}
		 .nostock{width:100%; padding:130px 0 0 0; background-color:{{ settings.color3 }}; color:{{ settings.color4 }}; text-align:center; font-size:19px; font-weight:700; position:absolute; top:0; opacity:0.6; height:100%; text-transform:uppercase; font-family:{{ settings.myfont2 | raw }};}
		 }
@media (max-width: 767px) {
.products{width:320px; margin:auto;}
}


/* CUSTOMIZE PAGINATION */

.pagination > .active > a{color:{{ settings.color4 }};}
.pagination > .active > a{background-color:tint({{ settings.color2 }},60%); border:none;}
.pagination > li a{background-color:{{ settings.color2 }}; color:{{ settings.color4 }};}
.pagination > li a:hover{background-color:tint({{ settings.color2 }},60%); color:{{ settings.color4 }};}
.pagination > li > a{color:{{ settings.color4 }}; background-color:{{ settings.color2 }};}
.pagination > li > a{border:none;}

/* TWITTER 100% */
iframe[id^='twitter-widget-']{ width:100% !important; margin:0 0 25px 0;}
#twitter-widget-0{width:100%;}
#likeboxplugin {
  width: 100% !important;
  /*height:500px;*/
  border:none; 
  overflow:hidden;
}
/* CUSTOMIZE FOOTER */
.footer{
		border-top:solid 1px tint({{ settings.color1 }}, 80%);
		/* COPY */
		.copy{padding:12px 0 10px 0; background-color:tint({{ settings.color1 }}, 84%); color:tint({{ settings.color1 }}, 30%); border-top:solid 1px tint({{ settings.color1 }}, 64%);
			.copyleft{font-size:11px; text-transform:uppercase;}
			.copyright{text-align:right; font-size:12px; color:{{ settings.color1 }}; font-weight:700;}
			 }
		/* FOOTER 1*/
		.footer1{
			padding:0 0 10px 0;
			h1{font-size:16px; padding:0 0 5px 0; border-bottom:solid 1px tint({{ settings.color1 }}, 60%);}
			 .followus {
			 			span{font-style:italic; display:block; float:left; padding:12px 10px 10px 10px;}
			 
			 			a{width:42px; height:42px; float:left; margin:0 0 0 10px; font-size:24px; color:{{ settings.color4 }}; text-align:center; background-color:{{ settings.color2 }}; @include borde(30px); @include ease(1s); padding:5px 0 0 0;}
			 			a:hover{background-color:darken({{ settings.color2 }}, 16%); color:{{ settings.color4 }};}
			 			}
			 			
			 .newsletter{
			 			input{font-size:12px; width:100%; padding:10px; border:solid 1px lighten({{ settings.color1 }}, 60%); margin:0 0 5px; background-color:tint({{ settings.color4 }}, 95%); color:{{ settings.color1 }};}
			 			.send{font-size:16px; width:30%; float:left; border:none; background-color:lighten({{ settings.color3 }}, 8%); color:{{ settings.color4 }};}
			 			.send:hover{background-color:lighten({{ settings.color3 }}, 16%); @include ease(1s);}
			}}
			
	    /* FOOTER 2 */
	    
	    .footer2{background-color:tint({{ settings.color1 }}, 92%); padding-bottom:31px; border-top:solid 1px tint({{ settings.color1 }}, 60%);
		    	h1{text-transform:uppercase; font-size:16px; padding:0 0 5px 0; border-bottom:solid 1px tint({{ settings.color1 }}, 60%);}
		    	.menu{
		    		  ul{padding:0; margin:0;}
		    		  li{list-style:none; width:100%; padding:0; margin:0;}
			    	  li a{color:{{ settings.color1 }}; font-size:12px; text-decoration:none;}
			    	  li a:hover{color:lighten({{ settings.color1 }}, 40%);}
		    	}
		    	.contactanos p{font-size:12px; padding:0; margin:0;}
		    	.contactanos a{color:{{ settings.color1 }}; text-decoration:none;}
		    	.contactanos a:hover{color:lighten({{ settings.color1 }}, 40%);}
		    }
		}
		
		
/* PRODUCT DETAIL */

.prod_detail{
			padding-bottom:61px;
			p{font-weight:300; padding:10px;}
			.price{font-size:51px; font-weight:600; color:{{ settings.color3 }};
				  span{color:{{ settings.color1 }}; text-decoration:line-through;}
				  }
		    .combos{padding:10px 0 20px 0; margin:10px 0 10px 0; border-top:solid 1px tint({{ settings.color1 }}, 80%); border-bottom:solid 1px tint({{ settings.color1 }}, 80%);
				  label{font-size:11px; color:tint({{ settings.color1 }},60%); margin-top:10px; display:block; text-transform:uppercase;}
		    }
		    .addtocart{padding:10px 0 20px 0; margin:10px 0 10px 0; border-bottom:solid 1px tint({{ settings.color1 }}, 80%);
		    .juros{padding:0 0 21px 0;}
		    }
		    .addbutton{padding:10px 15px 10px 15px; margin:20px 0 0 0; display:block; color:{{ settings.color4 }}; background-color:{{ settings.color3 }}; @include ease(0.3s); border:none; text-transform:uppercase; width:100%;}
		    @media (max-width: 320px) {
		    .addbutton{width:100%; font-size:14px;}
		    .shareLinks{padding:41px 0 0 0;}
		    }
		    .addbutton:hover{text-decoration:none; background-color:tint({{ settings.color3 }},60%); color:{{ settings.color3 }};}
		    .shareLinks div{float:left; margin:0 0 0 10px;}
			}
			

/* CUSTOMIZE BREADCRUMB */
#breadcrumb{padding:0 0 10px 0; color:tint({{ settings.color1 }}, 60%); font-size:11px; font-weight:600; font-size:14px; text-transform:capitalize;
			a{color:tint({{ settings.color1 }}, 30%);}
			a:hover{color:{{ settings.color1 }}; text-decoration:none;}	
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
width:36px;
height:36px;
font-size:16px;	
margin-left:0;
width:36px; height:36px;}
.followus span{displayz:none;}
.header-logo .followus{padding-right:0;}
.header-logo .followus a{margin-right:5px;}
.header-logo .followus span{display:none;}
.header-logo .followus .right{float:none;}
.titles{font-size:16px;}
.header-logo .followus{padding-bottom:5px; border:none; float:right; padding-right:6px;}
.header-logo .login-home li:last-child{border-right:solid 1px lighten({{ settings.color1 }}, 20%);}
.titles2{font-size:16px;}

}

/* CUSTOMIZE CART */

.cart-contents{
				.border{border-bottom:solid 1px tint({{ settings.color1 }},61%); padding:0 0 10px 0; margin:0 0 10px 0; font-size:19px; text-transform:uppercase; color:tint({{ settings.color1 }},31%);}
				@media (max-width: 480px) {
				.border{font-size:12px;}
				}
				@media (max-width: 700px) {
				.col-xs-2, .col-xs-5{font-size:12px;}
				}
				.col-quantity input{width:41px; border:solid 1px tint({{ settings.color1 }},51%); padding:5px;}
					.border2{border-bottom:solid 1px tint({{ settings.color1 }},61%); padding:0 0 10px 0; margin:0 0 10px 0; font-size:19px; text-transform:uppercase; color:tint({{ settings.color1 }},31%);
					a{color:tint({{ settings.color1 }},31%); font-size:12px;}
				    a:hover{color:{{ settings.color1 }};}
				    @media (max-width: 993px) {
				    a{display:block; margin:5px 0 10px 0;}
				    }
				    img{border:solid 2px tint({{ settings.color1 }},61%);}
				    
				    .col-quantity, .col-price, .col-subtotal, .col-delete{padding-top:26px; color:{{ settings.color1 }};}
				    @media (max-width: 700px) {
				    .col-quantity, .col-delete{padding-top:0px; color:{{ settings.color1 }};}
				    .col-price, .col-subtotal{padding-top:3px;}
				    }
				    .total-price span{font-size:31px; color:{{ settings.color1 }};}
				    .col-delete a{font-size:31px; color:{{ settings.color2 }}; line-height:28px;}
				    .col-delete a:hover{color:tint({{ settings.color2 }},80%); text-decoration:none;}
				    }
				    
				}
				
				
				
				
.go-to-checkout{padding:10px 0 20px 0; border-bottom:solid 1px tint({{ settings.color1 }},61%); margin:0 0 21px 0;
				.addbutton{padding:6px 20px 10px 20px; margin:20px 0 0 21px; display:block; color:{{ settings.color4 }}; background-color:{{ settings.color3 }}; @include ease(0.3s); border:none; text-transform:uppercase; float:left; font-size:31px; height:56px;}
				.addbutton:hover{text-decoration:none; background-color:tint({{ settings.color3 }},60%); color:{{ settings.color3 }};}
				.updatebutton{padding:10px 20px 10px 20px; margin:20px 0 0 21px; display:block; color:{{ settings.color4 }}; background-color:tint({{ settings.color1 }},60%); @include ease(0.3s); border:none; text-transform:uppercase; float:left; font-size:16px; height:56px;}
				.updatebutton:hover{text-decoration:none; background-color:tint({{ settings.color1 }},40%); color:{{ settings.color4 }};}
				@media (max-width: 480px) {
				.addbutton, .updatebutton{font-size:14px; width:80%;}
				}
				}
				
/* CUSTOMIZE SEARCH BOX */

.searchbox{
		   float:right; position:relative; margin:10px 0 10px 0; width:201px;
		   input{font-size:12px; padding:5px; height:29px; outline:0; width:301px;}
		   @media (max-width: 1200px) {
		   input{width:201px;}
		   }
		   .submit-button{width:26px; height:29px; padding:0; position:absolute; right:0; top:0; border:none; background-color:transparent; font-family: FontAwesome, 'Helvetica Neue', Helvetica, Arial, sans-serif; color:$color1; font-size:14px;}
		   .submit-button:hover{color:$color2;}
		  }
		  
/* CUSTOMIZE SEARCH RESULT */

.search-result{
				.no-result{background-color:tint({{ settings.color1 }},81%); padding:101px; text-align:center; color:{{ settings.color1 }}; text-transform:uppercase; margin:0 0 31px 0;}
				a{color:{{ settings.color4 }};}
				
				
			  }
			  
/* CUSTOMIZE 404 */

.page404{
		 .content{background-color:{{ settings.color1 }}; color:{{ settings.color4 }}; padding:121px 0 101px 0; text-align:center; margin:0 0 31px 0; border-bottom:solid 5px {{ settings.color2 }};
			 	 h1, p{text-transform:uppercase;}
		 }
		}

		
/* CUSTOMIZE CONTACT */

.pagecontact .form{padding:0 0 51px 0;
				   label{display:block; font-size:14px; color:tint({{ settings.color1 }}, 30%); padding:10px 0 10px 0;}
				   input{width:80%; border:solid 1px tint({{ settings.color1 }}, 30%); padding:10px;}
				   .inputarea{width:80%; border:solid 1px tint({{ settings.color1 }}, 30%); padding:10px;}
				   .optional{font-size:11px;}
				   .submit_button{clear:both; margin:10px 0 31px 0; font-size:16px; width:30%; float:right; border:none; background-color:lighten({{ settings.color3 }}, 8%); color:{{ settings.color4 }}; float:left;}
			 	   .submit_button:hover{background-color:lighten({{ settings.color3 }}, 16%); @include ease(1s);}
			 	   .winnie-pooh{display:none;}
			 	   .contact-ok, .contact-error{padding:20px; width:80%; color:{{ settings.color1 }}; background-color:tint({{ settings.color1 }}, 80%);}
				   }

/* QUERIES FOR HEADER */
@media (max-width: 759px) {
.prod_detail, .page_detail, .search-result, .page404, .pagecontact{padding-top:31px;}
.carouselprods{height:241px; padding-bottom:61px;}
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
@media (min-width: 768px) {
.prod_detail, .page_detail, .search-result, .page40, .pagecontact4{padding-top:231px;}
.carouselprods{height:511px; padding-bottom:61px;}
}
@media (min-width: 992px) {
.prod_detail, .page_detail, .search-result, .page404, .pagecontact{padding-top:216px;}
}
@media (max-width: 481px) {
.padtop480{padding-top:79px;}
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
	border:solid 2px tint({{ settings.color1 }},89%);
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

//Infinite scrolling
.infinite-scroll-loading {
    background: url( "{{ "images/loading.gif" | static_url }}" ) no-repeat center;
    display: block;
    height: 80px;
    width: inherit;
    overflow: hidden;
}
