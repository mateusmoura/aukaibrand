//VARIABLES
$primario: {{ settings.primary_color }};
$secundario: {{ settings.secondary_color }};
$fondo: {{ settings.fondo_color }};
$base: #FFFFFF;
$texto: {{ settings.texto_color }};
$logo-bg: {{ settings.logo_bg }};

$fonttxt: {{ settings.font_rest | raw }};
$fonttit: {{ settings.font_headings | raw }};

$opac1: 0.1;
$opac2: 0.2;
$opac3: 0.3;
$opac4: 0.42;
$opac7: 0.7; 
$opac8: 0.85; 
$opac9: 0.95; 

body {
    background: $fondo;
    font-family: $fonttxt;
    color: $texto;
}
.text-center {
    text-align: center;
}
#logo, .no-logo {
    padding: 10px;
    font-size: 28px;
    font-family: $fonttxt;
    font-weight: bolder;
    text-transform: none;
    text-align: center;
    color: $primario;
    width: 100%;
    display: block;
}
.left_disp {
    text-align: left;
}
.bg-danger {
    margin: 20px;
    padding: 10px;
    text-align: center;
}

.oh {
    overflow: hidden;
}

#cabezal_interior h3,  .logo, .logo_footer{
    font-family: $fonttit;
}

.logo_footer{
    color: $fondo;
}

a{
    color: inherit;
}

.banner_home .filtro{
     background-image: url( '{{ "banner-home.jpg" | static_url }}' );
}

.banner_home_2 .filtro{
     background-image: url( '{{ "banner-home-2.jpg" | static_url }}' );
}
#wrap-welcome-message{
    height: 160px;
    text-align: center;
    color:$base;
    padding-top: 20px;
}
#wrap-welcome-message .headerBox, .password-container.password-message{
    background-color:$texto;
    padding: 5px 10px;
    float: left;
    width: 100%;
}
#wrap-welcome-message h2, .password-container.password-message h2{
      font-size: 24px;
      border-bottom:1px solid $base;
}
#wrap-welcome-message a, #wrap-welcome-message p{
      width: 100%;
      float: left;
      font-size: 18px;
        margin-bottom: 4px;
}
#wrap-welcome-message a:hover{
    opacity:0.8;
    color:$base;
}
a:hover{
    color: $primario;
    text-decoration: none;
}

.contenido a:hover{
    color: rgba($secundario, $opac4);
}

::selection {
background: $primario;
color: $fondo;
}
::-moz-selection {
background: $primario;
}

.navbar-inverse{
    background-color:$secundario;
    border-bottom: 1px rgba($base, $opac1) solid;
}

.navbar-inverse9{
    background: $secundario;
}

.navbar-brand{
    background-color:$logo_bg;
}
.logo{
    color:$secundario;
}

#cabezal_interior{
    color:$primario;
    background-color: $secundario;
}

.nav > li > a{
  color: rgba($base, $opac7);
}

.nav > li > a:hover,
.nav > li > a:focus {
  background-color: $secundario;
  color: $primario;
}

.navbar-inverse a{
    color: rgba($fondo, $opac7);
}

.navbar-inverse a:hover{
    color: $primario;
}

.navbar-toggle .icon-bar {
    background-color: $fondo;
    border: 0px;
}

.navbar-toggle {
  border: 1px solid $secundario;
}

.color{
    color:$primario;
}

.en_oferta{
    color: rgba($secundario, $opac4);
}

#price_display, .max_installments {
    color: $primario;
}
.contenido .quick-content .max_installments {
  text-align: left;
  padding-left: 0;
}

.cantidad{
    background-color: $fondo;
}

.menu{
    background-color: $secundario;  
}

.navbar-base{
    background-color: $fondo;
    border-bottom: 1px solid $base;
}

#busco{
    color:rgba($secundario, $opac4);
}

.contenido{
    background-color: $fondo;
}

h1, h2{
    border-bottom: rgba($texto, $opac4) 1px solid;
}
.producto{
    background-color: $base;
}

.installments {
    display: block;
    width: 100%;
        li[id^="method"] {
            a {
            color: $primario;
            font-weight: bold;
            border-radius: 0;
            }
            a:hover {
            background: $fondo;
        }
        }
        span[id^="installment"] {
            display: block;
            width: 100%;
            padding: 2px 0;
        }
}
#InstallmentsModal .modal-dialog{
    width: 640px;
    .tab-content {
        padding: 15px;
    }
}
#InstallmentsModal .modal-content {
    border-radius: 0;
}
#product_form .max_installments {
    text-align: left;
    padding: 0;
}
.producto:hover{
    background-color: rgba($secundario, $opac9);
    color:$fondo;
}

.producto:hover .sin_stock{
    background-color: $secundario;
}

.producto:hover .en_oferta{
    color: rgba($base, $opac4);
}

.oferta > i {
    border: 1.5em solid $primario;
}

.oferta{
    background-color: $primario;
    color:$base;
}

.envios_gratis{
    border: 10px solid $secundario;
    color:$base;
    background-color: $secundario;
}

.sin_stock{
    background-color: rgba($base, $opac9);
    color:$primario;
}

.quick_view{
    background-color: $secundario;
}

.quick_view a{
    color: $fondo;
}

.quick_view a:hover{
    color: $primario;
}

hr{
    border-color: rgba($texto, $opac4);
}

.banner_home{
    color: $base;
    background-color: $primario;
}

.banner_home_2{
    color: $base;
    background-color: $secundario;
}

#banner-services{
    padding: 20px 0px;
    margin: 20px auto 60px auto;
    width: 1040px;
    border-top: 1px solid rgba($texto, $opac1);
    border-bottom: 1px solid rgba($texto, $opac1);
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
    font-size:15px;
    font-weight:bold;
    letter-spacing:0px;
}
#banner-services .service-text{
    line-height: 18px;
}
#banner-services .service-icon{
    float: left;
    width: 40px;
    margin-right: 10px;
}
#banner-services .service-text p{
    margin: 0px;
    letter-spacing:0px;
}
#banner-services .col-md-4 .banner-service-item, .col-md-6 .banner-service-item {
    width: 360px;
    height: 40px;
    margin: auto;
}
#banner-services .col-md-12 .banner-service-item{
  width: 320px;
  margin:auto;
  height: 40px;
}
.banner-services-footer{
   border-top: 1px solid rgba($texto, $opac1);
   border-bottom: 1px solid rgba($texto, $opac1);
   background-color:$base;
}
.banner-services-footer #banner-services{
    width: 1140px;
    margin: 25px auto;
    padding: 0px;
    border:none;
}
.banner-services-category .row-fluid{
    margin-bottom: 40px;
}
/*End Banner Services*/

.elementos_foto_prod:hover{
}

.cambiar_cant{
    background-color:rgba($secundario, $opac9);
    color: $base;
    margin: 20px;
}

.cambiar_cant:hover{
    background-color:$primario;
    color: $base !important;
}

#calculate-shipping-button{
    background-color:rgba($secundario, $opac9);
    color: $base;
    margin-top: -2px;
}

#calculate-shipping-button:hover{
    background-color:$primario;
}

.red{
    color:$fondo;
    background:$primario;
}
.red:hover{
    background:$secundario;
}

.medios{
    background-color:$base;
}

footer{
    background-color:rgba($secundario, $opac9);
}

.footer_bajo{
    border-top: rgba($base, $opac1) 1px solid;
    background-color:$secundario;
}

.boton{
    background-color: $primario;
    color: $base;
}

.boton:hover{
    background-color: $secundario;
}

#button-installments {
      display: inline-block;
      margin: 10px 0;
      text-align: left;
      float: left;
      text-decoration: underline;
    color: $secundario;
}
#button-installments:hover, #button-installmetns:focus {
     color: $secundario;
}

.navbar-submenu{
    background-color: $base;
}

.pagination .active a{
    background-color: $primario;
    border-color: $fondo;
}

.pagination .active a:hover{
    background-color: $primario;
    border-color: $primario;
}

.pagination li a{
    background-color: $base;
    color:$primario;
}

.pagination li a:hover{
    color:$secundario;
}

.pagination .disabled a{
    border-color: $fondo;
}

.foto_producto img{
    border: rgba($secundario, $opac1) 1px solid;
}

.info_producto select{
    background-color: rgba($secundario, $opac1);
    border:none;
    color: $secundario;
    outline:none;
}

.agregar{
    background-color: $primario;
    border:none;
    color:$base;
}

.agregar:hover{
    background-color: $secundario;
}

a.agregar:hover {
    color:$base;
}

.cabezal_tabla{
    background-color: $secundario;
    color: $primario;
}

.table_3 input{
    background-color: rgba($secundario, $opac1);
}

.celdas_tabla{
    background-color: $base;
}

.total_tabla{
    background-color: rgba($secundario, $opac1);
    font-size: 16pt;
}

.total_tabla{
    .total-price {
        font-weight: bold;
    }    
}


footer h2, footer li a,footer li, footer i, footer p{
    color:$base;
}
.loadBtnContainer {
    display: inline-block;
    margin: 0 auto;
    text-align: center;
    width: 100%;
}
#loadMoreBtn {
    border: 1px solid #999;
    display: inline-block;
    margin: 30px auto;
    padding: 10px;
    width: 360px;
    cursor: pointer;
}
.loadingSpin { display: none;
    float: left;
    font-size: 1.1em;
    transform-origin: 42% 47% 0;
    -webkit-transform-origin: 42% 47% 0;
    -ms-transform-origin: 42% 47% 0;
    position: relative;
    top: 2px;
    }
//Bootstrap override
@media (min-width: 768px) {
    .container {
        width: 100%;
        padding: 0px;
    }
    .navbar {
        border-radius: 0px;
    }
    
    .navbar-nav li a {
        padding-top: 30px;
        padding-bottom: 30px;
    }
    .list-inline{
        margin-left: 15px;
        margin-right: 15px;
    }
    
}
@media (max-width: 768px){
    /*Cart styles */
    .cart-item .productrow{
        position:relative;
    }
    .cart-item .cart-item-del{
    position: absolute;
    float: none;
    margin: 0px;
    right: 10px;
    top: 50%;
    margin-top: 5px;
    }
    .cart-item .cart-item-cant{
    margin-top: 35px;
    text-align:center;
    }
    .cart-item .cart-item-name{
    margin-left:0px;
    }
    .subtotal-header{
    text-align:right;
    }
    .cart-item-name a{
        display: block;
        width: 190px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    /*** Product grid ***/

    .producto{
        -moz-transition-property: none;
        -webkit-transition-property: none;
        -o-transition-property: none;
        transition-property: none;
    }
    .producto:hover{
        background-color: $base;
        color: $texto;
    }
    .producto:hover .elementos_foto_prod .quick_view{
        display:none;
    }
    .producto a:hover{
        opacity: 0.7;
    }
}
@media (min-width: 992px) {
  .container {
    width: 970px;
    padding: 0px;
  }
}
@media (max-width:990px){
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
    margin-top: 0px!important;
}

}
@media (min-width: 1125px) {
  .container {
    width: 1120px;
    padding: 0px;
  }
}

a{
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
}

.modal-backdrop{
    z-index: 999;
}

.modal-dialog{
    width: 1040px;
    text-align: left;
    text-decoration: none;
}

.producto:hover .modal-dialog img{
    opacity: 1;
}

.elementos_foto_prod .modal-dialog img{
    width: 100% !important;
}

.product-details-overlay{
    z-index: 1000;
}

.list-inline{
    margin-top: 10px;
}

.navbar {
    min-height: 80px;
    margin-bottom: 0px;
}

.navbar-brand{
    height: 80px;
    display: table;
    text-align: center;
    padding: 0px;
}

.navbar-brand img{
    max-height: 50px;
    max-width: 230px;
}

.nav>li{
    position: inherit;
}

.navbar-nav li a {
  padding-top: 30px;
  padding-bottom: 30px;
  text-transform: uppercase;
  padding-right: 13px;
  padding-left: 13px;
  text-shadow: 0 0px 0;
}

.navbar-static-top{
    position: relative;
}
.navbar-static-top{
    border:0px;
    width: 100%;
    z-index:100;
}


.navbar-toggle {
  margin-top: 15px;
  margin-bottom: 15px;
}

#myCarousel{
    width: 100%;
    overflow: hidden;
}


.carousel-inner img{
  width: 100%;
}

.container{
    position: relative;
}

h1{
    font-weight: 700;
    font-size: 24px;
    display: block;
    width: 100%;
    margin: 0px;
    padding: 0px;
    padding-bottom: 10px;
    text-align: center;
}

h2{
    font-weight: 400;
    font-size: 13px;
    display: block;
    width: 100%;
    margin: 0px;
    padding: 0px;
    padding-bottom: 10px;
    text-align: center;
    margin-bottom: 10px;
    margin-top: 10px;
    text-transform: uppercase;
}

footer ul, li{
    margin: 0px;
    padding: 0px;
    list-style: none;
}

footer input{
    width: 100%;
    border: none;
    margin-top: 8px;
    height: 35px;
    padding-left: 5px;
    outline: none;
}

.pagination>li>a, .pagination>li>span{
    color: inherit;
}

.img-thumbnail{
    padding: 0px;
    border-radius: 0px;
    border:none;
    width: 100%;
}

hr{
    margin-top: 50px;
    margin-bottom: 50px;
}

.dropdown-menu li a{
    height: 40px;
    margin: 0px;
    padding: 10px;
}

.breadcrumb{
    background: transparent;
}

.pagination{
    width: auto;
    margin: auto;
    margin-top: 50px;
    display: table;
}

button{
    border:none;
}

.btn-lg, .btn-group-lg > .btn{
    border-radius: 0px;
}

.form-control{
    border-radius: 0px;
    width: 100%;
    -webkit-box-shadow:none;
    box-shadow:none;
}

.thumb .img-thumbnail{
    width: 19.3%;
    margin-top: 20px;
    margin-bottom: 20px;
}

.thumb .img-thumbnail img{
    opacity: 0.5;
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
}

.thumb .img-thumbnail:hover img{
    opacity: 1;
}



@media (max-width: 992px) {
    .redes{
    width: 100%;
    }
    h2{
    margin-top: 30px;
    }
    .navbar-static-top{
    position: relative;
    }

    #fancybox-frame{
    width: 100% !important;
    }
    #wrap-welcome-message h2{
    margin-top:14px;
    }
}

@media (max-width: 768px) {
    h1{
    font-size:20px;
    }
    #wrap-welcome-message .headerBox{
    height: 100px;
    }
    #wrap-welcome-message{
    height:130px;
    }
    #wrap-welcome-message h2{
    font-size:16px;
    }
    #wrap-welcome-message a{
      font-size: 14px;
     font-weight: 700;
    }
    .navbar-nav li a {
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .navbar-brand img{
    width: auto;
    }
    .navbar-brand{
    width: 100%;
    }
    #myCarousel{
    position: relative;
    margin-top: 0px;

    }
    .installments li[id^="method"] {
        width: 100%;
    }
    li[id^="method"].active a {
        border-bottom: 1px solid rgba($texto, $opac4);
    }
    .container{
        width: 100%;
        padding: 0px;
    }
    .list-inline{
        margin-left: 15px;
        margin-right: 15px;
    }
    .navbar-collapse{
    margin-top: 80px;
    }
    #banner-services .service-text h4{
    font-size:14px;
    }
    #InstallmentsModal .modal-dialog {
        width: 95%;
    }
    #img-news img{
    display:none;
    }

}

//Custom CSS

body{
    font-weight: 400;
    letter-spacing: 1px;
}

img{
    vertical-align: top;
}

.logo_afip .list-inline{
    margin: auto;
    width: 100%;
}

.afip img, #seloEbit img {
    width: 40px;
    height: auto;
}

/*seals*/
.seals-container > div, .custom-seals-container, .seals{
    clear:both;
    margin:10px auto;
}
.custom-seals-container .custom-seal{
    margin: 5px 0px;
}
.custom-seals-container .custom-seal-img img {
    max-width: 150px;
    max-height: 80px;
}

/*end*/
.navbar-brand img, .logo_footer img {
    max-height: 100px;
    max-width: 230px;
}

.navbar-brand a {
    display: table-cell;
    vertical-align: middle;
}

input, select{
    border-radius: 0px;
}
select.sort-by.form-control {
    margin: 15px 0;
    display: inline-block;
    width:40%;
}
.sort-by-filter{
    margin-top: 20px;
    display: inline-block;
}

.active{
    font-weight: bold;
}

.modal{
    z-index: 10000500;
}

.avisos{
    position: fixed;
    top: 0px;
    width: 100%;
}
.breadcrumbs {
margin-bottom: 30px;
}

.busqueda-carrito{
    font-size: 30px;
    margin-right: 30px;
    margin-top: 0;
    height: 55px;
}

.busqueda-carrito li{
    margin-left: 10px;
    margin-top: 5px;
    position: relative;
    padding-bottom: 10px;
}
.busqueda-carrito li:first-child {
    margin-top: 15px;
    float: left;
    margin-right: 15px;
}
.texto-carrito{
    font-size: 13px;
    position: absolute;
    width: 80px;
    margin-left: -25px;
    text-align: center;
    margin-top: -3px;
    letter-spacing: 0px;
    line-height: 14px;
}

.cantidad{
    height: 20px;
    width: 20px;
    text-align: center;
    font-size: 10px;
    font-family: $fonttxt;
    font-weight: bold;
    position: absolute;
    padding: 3px;
    top: 2px;
    right: 2px;
    -moz-border-radius:50px;
    -webkit-border-radius:50px;
    border-radius:50px;
}

.distancia{
    margin-left: 20px;
}

.menu-sec{
    font-size: 13px;
}

a.toggle-submenu {
    cursor: pointer;
}

.busqueda{
    font-size: 40px;
    font-weight: 300;
    margin: auto;
}
.busqueda form{
    margin: 2%;
}

.buscar input{
    background: transparent;
    border: none;
    font-weight: 300;
    width: 89%;
    outline: none;
}
.buscar .fa{
    width: 7%;
}

.fa-search{
    cursor: pointer;
}

.affix{
    top: 0px;
    left: 0px;
    width: 100%;
    position: fixed;
    z-index: 1010;
}
.contenido .quick-content {
    width: 80%;
    margin: 0px auto;
    padding:20px;
}

.contenido{
    width: 100%;
    padding: 40px;
    padding-top: 25px;
    position: relative;
}

.productos{
   width: 100%;
   float: left;
}
.producto{
    width: 22.5%;
    min-height: 335px;
    margin-right: 2%;
    margin-top: 30px;
    float: left;
    display: inline-block;
    position: relative;
    cursor: pointer;
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
     overflow: hidden;
}

.producto-fake{
    float:left;
    text-align:center;
}
.product-fake .caption{
    padding-bottom:20px;
}
.producto-fake img{
    width:200px;
}
.producto:hover img{
    opacity: 0.9;
}
.producto:hover .quick_view{
    display: block;
}
.producto a.product-image{
    display:block;
}
 .ultimo{
    margin-right: -30px;
 }

 .des_producto{
    font-size: 13px;
    padding: 8px;
    text-align: center;
 }

 .logo{
    display: table-cell;
    vertical-align: middle;
    min-height: 37px;
    min-width: 207px;
    text-transform: uppercase;
    font-weight: 900;
    letter-spacing: 0;
    text-align: center;
}

.product_description{
height:100%;
 }
#related-products{
    clear:both;
}
.oferta{
    position: absolute;
    left: 0px;
    top: 25px;
    height: 44px;
    font-weight: 900;
    padding: 10px;
    font-size: 15px;
    text-transform: uppercase;
}

.oferta > i {
    position: absolute;
    display: inline-block;
    width: 0;
    height: 0;
    line-height: 0;
    margin-top: -10px;
    border-right: 21px solid transparent;
}

.cambiar_cant{
    border: none;
}

.cloud-zoom-wrap{
    z-index: 99;
}

.envios_gratis{
    position: absolute;
    left: 0px;
    bottom: 30px;
    font-size: 11px;
    text-align: center;
    padding: 5px;
    text-transform: uppercase;
    z-index: 2;
}

.envios_gratis span{
    display: table-cell;
    vertical-align: middle;
}

.elementos_foto_prod{
    position: relative;
    text-align: center;
    height: 240px;
}

.elementos_foto_prod img{
    max-height: 240px;
    width: inherit;
}

.sin_stock{
    padding: 5px;
    width: 100%;
    text-align: center;
    font-size: 13px;
    text-transform: uppercase;
    font-weight: 900;
    position: absolute;
    bottom: 0px;
    height: 28px;
}

.precio_producto{
    bottom: 10px;
    width: 100%;
    text-align: center;
    font-size: 15px;
    font-weight: 900;
}
.max_installments {
    padding: 8px;
    font-size: 13px;
    text-align:center;
    opacity: 0.8;
}

.en_oferta{
    text-decoration: line-through;
}
.precio_oferta{
    text-decoration: line-through;
}

.banners_home{
    /* display: table; */
}

.banner_home{
    width: 505px;
    height: 250px;
    position: relative;
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    display: table;
    text-transform: uppercase;
    margin-right: 28px;
    float: left;
    cursor: pointer;
}

.banner_home_2{
    width: 505px;
    height: 250px;
    position: relative;
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    display: table;
    text-transform: uppercase;
    margin-right: 0px;
    float: left;
    cursor: pointer;
}

.texto_banner{
    display: table-cell;
    vertical-align: middle;
    position: relative;
    z-index: 10;
}

.banners_home img{
    width: 100%;
}

.filtro{
    position: absolute;
    left: 0px;
    background-position: center;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    opacity: 0.7;
    width: 505px;
    height: 250px;
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
}

.banner_home_2:hover .filtro, .banner_home:hover .filtro{
    opacity: 1;
}
/*banner-services styles*/

#banner-services .col-md-1 {
    float: left;
    width: auto;
    margin-right: 10px;
}


.quick_view{
    display: none;
    padding: 5px;
    width: 100%;
    text-align: center;
    font-size: 13px;
    text-transform: uppercase;
    font-weight: 900;
    position: absolute;
    bottom: 0px;
    height: 28px;
}
.redes{
    display: table;
    text-align: center;
}
.red{
    display: inline-table;
    width: 60px;
    height: 60px;
    border-radius: 80px;
    font-size: 30px;
    text-align: center;
    padding: 5px;
    margin-top: 30px;
    cursor: pointer;
    margin-right: 20px;
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
}

.red span{
    display: table-cell;
    vertical-align: middle;
}

.medios{
    padding-top: 30px;
    padding-bottom: 30px;
}

.medios_todos .footer{
    padding: 0px 25px;
}

.medios_todos img{
    margin-bottom: 5px;
}

.footer{
    padding-top: 50px;
    padding-bottom: 50px;
}

.footer_bajo{
    padding-top: 15px;
    padding-bottom: 18px;
    font-size: 13px;
}

.centrado{
    text-align: center;
}

.derecha{
    text-align: right;
}

.navbar-submenu{
    position: absolute;
    display: none;
    padding: 20px;
    z-index: 999999;
}

ul{
    -webkit-padding-start: 0px;
}

#shipping-calculator{
    text-align: left;
    margin-top: 30px;
    float: left;
}

#shipping-calculator ul{
    padding: 0px;
    margin: 10px 0px;
}

#calculate-shipping-button{
    border-radius: 0px;
}
.shipping-list .radio-button{
    display: none;
}
.shipping-list .shipping-option{
    position:relative;
    cursor:pointer;
    width:100%;
}
.shipping-list .shipping-option .shipping-method-name{
    margin-top:10px;
}
#product_form #shipping-calculator li input[type="radio"]:checked + .shipping-option{
    border:0px solid;
}
#product_form #shipping-calculator li input[type="radio"]:checked + .shipping-option i{
    display: none;
}

#product_form span.shipping-method-name{
    text-align:right;
}
#shipping-calculator-form .form-control {
    max-width: 140px;
    display: inline;
}
#product_form #shipping-calculator{
    text-align:right;
}
#shipping-calculator {
    margin: 20px 0;
}
 #shipping-calculator li .shipping-option i{
 display:none;
}
#shipping-calculator li input[type="radio"]:checked + .shipping-option { 
    border:2px solid $primario;
 }
 #shipping-calculator li input[type="radio"]:checked + .shipping-option .option-name{
    color: $primario;
}
 #shipping-calculator li input[type="radio"]:checked + .shipping-option i{
  display: block;
  float: right;
  font-size: 18px;
  color: $primario;
  position: absolute;
  right: 10px;
  top: 10px;
}
.navbar-submenu ul{
    min-width: 31%;
    width:auto;
    float: left;
    margin-right: 10px;
    padding: 0px 20px;
}

.navbar-submenu ul li, .navbar-submenu ul li a{
    margin: 0px;
    margin-bottom: 15px;
    padding: 0px;
}

.navbar-submenu ul li h2{
    font-weight: 900;
}

.sin_foto{
    height: 150px;
}

#google-map{
    height: 400px;
    width: 100%;
}

footer li{
    margin-bottom: 10px;
    font-size: 13px;
}

footer p{
    letter-spacing: 0;
}

.boton{
    width: auto;
    text-transform: uppercase;
    padding: 10px;
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
}

#cabezal_interior{
    width: 100%;
    height: 250px;
    position:relative;
}
#cabezal_interior img {
    width: 100%;
    position: absolute;
}

#cabezal_interior.home{
    height: 0;
}

#cabezal_interior h3{
    font-weight: 900;
    display: block;
    font-size: 50px;
    border: none;
    margin:auto;
    top:25%;
}
.vista_producto{
    margin-top: 30px;
}

.vista_producto img{
    width: 100%;
}
.vista_producto-Quickshop{
    margin-top: 5px;
}

.vista_producto-Quickshop img{
    width: 100%;
}

.info_producto {
        h3{
        font-size: 26px;
        font-weight: 900;
        padding-right: 20px;
        text-align: left;
         margin-top: 12px;
    }
        h1 {
        font-weight: 700;
        font-size: 22px;
        display: block;
        width: 100%;
        margin: 0px;
        padding: 0px;
        border: none;
        text-align: left;
    }
}
.info_producto-quickshop {
        h3{
        font-size: 26px;
        font-weight: 900;
        padding-right: 20px;
        text-align: left;
        margin-top:5px;
    }
        h2{
        font-weight: 700;
        font-size: 22px;
        display: block;
        width: 100%;
        margin: 0px;
        padding: 0px;
        border:none;
        text-align: left;
        text-transform: none;
    }
}
.info_producto-quickshop .attributeLineQuickshop {
    margin-bottom: 5px;
    margin-top: 10px;
}
.info_producto-quickshop .attributeLineQuickshop label {
    display: block;
    font-size: 12px;
    line-height: 7px;
    letter-spacing: 1px;
    display: inline-block;
    padding: 5px 0px;
    text-transform: uppercase;
    margin-right: 5px;
}
.info_producto-quickshop .attributeLineQuickshop label span{
    color:rgba($secundario, $opac3);
}
.info_producto-quickshop .attributeLineQuickshop label .number{
    padding: 7px 6px;
    display: inline-block;
     font-size: 12px;
    font-weight: 700;
    border-radius: 100%;
    background-color:rgba($secundario, $opac1);
}
.info_producto-quickshop .attributeLineQuickshop select{
    font-size: 12px;
    padding: 1px;
    width: 30%;
    height: 33px;
    text-transform: uppercase;
    letter-spacing: 1px;
    border-radius: 0;
    margin-top: 5px;
    margin-bottom: 5px;
    background-color: rgba($secundario, $opac1);
    border:none;
    color: $secundario;
    outline:none;
}
.info_producto-quickshop .attributeLineQuickshop input {
    height: 30px;
    text-align: center;
    margin: 5px 0;
    font-size: 12px;
    font-weight: 700;
    width: 55px;
    background-color: rgba($secundario, $opac1);
    border:none;
    color: $secundario;
    outline:none;
}
.info_producto input, .info_producto select{
    margin-top: 10px;
    margin-bottom: 12px;
}
a.quick{
    color: $primario;
    text-decoration:underline;
}

.agregar{
    width: 100%;
    text-transform: uppercase;
    -webkit-transition: all 0.4s;
     -moz-transition: all 0.4s;
     -o-transition: all 0.4s;
     transition: all 0.4s;
}

.iniciar_compra{
    float: right;
    width: auto;
}
input.btn-lg.agregar.iniciar_compra {
    margin-top: 30px;
}
.detalle_prod-Quickshop{
    margin-top: 10px;
    font-size:13px;

        h5{
        font-weight: 600;
        font-size:15px;
        }
}

.detalle_prod{
    margin-top: 30px;
}


.detalle_prod h1, .datos_con h1, .datos_con h2{
    text-align: left;
    border-bottom: 0px;
}

.detalle_prod p{
    margin-bottom: 30px;
}

.me_gusta{
    width: 100%;
    margin-bottom: 30px;
    display: table;
    margin-top: 20px;
    margin-bottom: 20px;
}

.me_gusta li{
    float: left;
}
.shareItem.facebook iframe{
    z-index:5;
}
.lista_carrito{
    margin-top: 30px;

    .fa-cog {
        color: #dedede !important;
        font-size: 20px;
        margin-left: 12%;
        margin-top: 0;
    }
}

.logo_afip li{
    float: left;
    width: 100%;
}

.logo_afip {
    text-align: center;
}

.cabezal_tabla, .celdas_tabla, .total_tabla, .acciones_tabla{
    width: 100%;
    display: table;
    margin: 0px;
    padding: 0px;
    margin-bottom: 10px;
    min-height: 35px;
}

.cabezal_tabla li, .celdas_tabla li, .total_tabla li, .acciones_tabla li{
    float: left;
    padding: 10px;
}

.table_1{
   width: 25%;
}

.table_2{
   width: 25%;
}

.table_3{
    width: 13%;
}

.table_4{
    width: 15%;
}

.table_5{
    width: 15%;
}
.table_6{
    width: 5%;
}

.table_5a6{
    width: 20%;
}

.table_total{
    float: right;
}

.table_total h3{
    margin: 20px;
}

.table_prod_contact{
    width: 25%;
}

.table_prod_text_contact{
    width: 75%;
}

input#change-quantities {
margin: 30px 0;
}
input#shipping-zipcode {
    border: 1px solid rgba(41, 41, 40, 0.1);
    margin-bottom: 0px;
    width: 160px !important;
    display: inline;
    height: 36px;
}
.shipping-list img {
    vertical-align: middle;
    margin: 10px 0px;
    width: 80px;
    height: auto;

}

.table_1a2{
    width: 50%;
}

.table_1a3{
    width: 63%;
}

.table_3 input{
    width: 50%;
    border-style: none;
    padding: 10px;
    text-align: center;
    outline: none;
}

.datos_con{
    margin: 0px;
    padding: 0px;
    padding-left: 20px;
}

.datos_con li{
    font-size: 15px;
    margin-bottom: 12px;
    padding-bottom: 13px;
}

.form_con{
    float: right;
}

.formulario_contacto{
    margin-top: 30px;
}

.logo_footer{
    text-transform: uppercase;
    font-size: 20px;
    -webkit-filter: grayscale(1);
    /* For FF: http://stackoverflow.com/a/12173285*/
    filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#grayscale");
    filter: gray;
}

.paginacion{
    width: 100%;
    text-align: center;
}
.new-address{
    margin-top:30px;
}
.account-form-wrapper{
    margin-top: 30px;
}
.user-content img{
    margin: 10px auto;
}
.user-content ul li, .user-content ol li{
    list-style: inherit;
}
.user-content ul, .user-content ol{
    padding: inherit;
}
/*** Password page***/
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
.password-page .password-container .navbar-brand{
    margin: 0px auto;
    text-align: center;
    float:none;
}
.password-page .password-container .logo a{
    float: left;
    width: 100%;
}
.password-page .password-container .logo img{
    max-width: 300px;
    max-height: 90px;
}
.password-page .password-container .logo.text-only{
    text-align: center;
    display:block;
}
.password-page .password-container .logo.text-only a{
    display:block;
    margin-top:20px;
}
.password-page .password-container.password-message h2{
    margin:0px auto 20px auto;
    font-size: 28px;
    line-height: normal;
    color:$base;
    overflow-wrap: break-word;
    word-wrap: break-word;
    -webkit-hyphens: auto;
    -ms-hyphens: auto;
    -moz-hyphens: auto;
    hyphens: auto;
}
.password-page .alert-danger{
    width: 80%;
    margin: 20px auto 0px auto;
}
.password-page .section-title .line{
    margin: -50px 0 34px 0;
}
#unlock-form{
    width: 20%;
    margin: 60px auto 20px auto;
    display: block;
}
#unlock-form .btn.btn-primary{
    width:100%;
}

.password-container.password-message{
    width: 60%;
    float: none;
    margin: auto auto 35px auto;
    padding:15px;
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
    fill:$primario;
}
.password-page .password-container .redes{
    width: 60%;
    margin: 20px auto 40px auto;
    float: none;
}
.password-page .password-container .unlock-form{
    width: 30%;
    margin: auto;
} 
.password-page .password-container .unlock-form .general-button{
    width: 100%;
}
.password-page #newsletter{
    width: 50%;
    margin: 30px auto 10px auto;
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
.password-page .password-container .footer{
    padding-top: 20px;
    padding-bottom: 20px;
}
.password-page .password-container form{
    width: 60%;
    float: none;
    margin: auto;
}
.password-page .password-container form input{
    width:100%;
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
        color: $texto;
        background: $fondo;
        font-size: 13px;
    }
}

@media (max-width: 1125px) {
   .ultimo{
    margin-right: 30px;
    }
    .banner_home{
    width: 100%;
    height: 250px;
    margin-bottom: 30px;
    }
    .banner_home_2{
    width: 100%;
    height: 250px;
    }
    .filtro{
    width: 100%;
    height: 250px;
    }
    .productos{
    width: 100%;
    text-align: center;
    }
    .producto{
    width: 31%;
    }

    .acciones_tabla .table_1a2, .acciones_tabla .table_5a6{
        width: 50%;
    }

    .acciones_tabla .table_3, .acciones_tabla .table_4{
        display: none;
    }
    #cabezal_interior{
    height: 228px;
    }

    #cabezal_interior.home{
    height: 50px;
    }

    #cabezal_interior h1{
    top: 130px;
    font-size: 60px;
    }
}
#myCarousel {
height: 500px;
}

@media (max-width: 992px) {
   .contenido{
        margin-top: 0px;
    }
    #myCarousel {
        height: auto;
    }
    .centrado_disp{
        text-align: center;
    }
    .izquierda_disp{
        text-align: left;
    }
    footer{
        text-align: center;
    }
    .sin_foto{
        height: 15px;
    }
    .detalle_prod{
        clear: both;
    }
    #cabezal_interior{
    height: 166px;
    }
    #cabezal_interior.home{
    height: 0;
    }
    #cabezal_interior h1{
    top: 50px;
    left: 25px;
    font-size: 50px;
    }
    .widget-content iframe{
    width: 100% !important;
    }
    .fb-comments, .fb-comments span, .fb-comments iframe[style], .fb_iframe_widget {
    width: 100% !important;
    }
    .fb_iframe_widget {
    width: 100%;
    text-align: center;
    float: left;
    overflow: hidden;
    }

    select.sort-by.form-control {
    width:100%;
    }
     /*banner services*/
    #banner-services{
        width: 95%;
    }
    #banner-services .col-md-4 .banner-service-item, .col-md-6 .banner-service-item, .col-xs-12 .banner-service-item{
        width: 240px;
        margin: 20px auto;
        height: 35px;
    }
    #banner-services .col-md-4 .banner-service-item h4, .col-md-6 .banner-service-item h4, .col-xs-12 .banner-service-item h4{
        font-size: 14px;
    }
    .banner-services-footer #banner-services {
        width: 100%;
        margin: 6px auto 0px auto;
    }
    /*End Banner Services*/
    #cabezal_interior h3{
        padding:0px 30px;
    }
    /** Password Page **/
    .password-container.password-message{
    width:80%;
    }
    .password-page .password-container.password-message h2{
        font-size:22px;
    }
}

@media (max-width: 830px) {
    .producto{
        width: 46%;
    }
}

@media (max-width: 768px) {
    .navbar-submenu {
    position: relative;
    margin: 0px;
    margin-top: -10px;
    padding: 0px;
    display: block;
    overflow: hidden;
    text-align: left;
    background: transparent;
    }
    .navbar-brand a{
    display:block;
    text-align:center
    }
    .navbar-submenu ul{
    max-width: 100%;
}

    .navbar-collapse.collapse{
        overflow: auto !important;
    }

    .navbar-collapse{
        margin-top: 0px;
        margin-top: 80px;
    }

    .navbar-nav>li{
        width: 100%;
    }

    .navbar-submenu ul{
    width: 100%;
    float: left;
    margin-left: 0px;
    margin-top: -10px;
    }

    .navbar-submenu h2{
        text-align: left;
    }
    #cabezal_interior{
    height:130px;
    }
    #cabezal_interior h3{
    font-size: 42px;
    top:30%;
    }
    .table_1{
    width: 20%;
    }

    .table_2{
        width: 70%;
    }

    .table_3{
        width: 23%;
    }

    .table_4{
        width: 23%;
    }

    .table_5{
        width: 23%;
    }
    .table_6{
        width: 5%;
    }

    .total_tabla .table_5a6{
        width: 40%;
    }

    .total_tabla .table_1{
        width: 1%;
    }
    .total_tabla .table_4{
        width: 50%;
    }
    .acciones_tabla .table_1a2, .acciones_tabla .table_5a6{
        width: 100%;
    }
    .cabezal_tabla{
    display: none;
    }

     .logo{
    min-height: 0px;
    min-width: 0px;
    }
    #cabezal_interior h1{
    top: 50px;
    font-size: 40px;
    }
    .affix{
    position: relative;
}
 /* banner services*/
    #banner-services .banner-service-item .service-text{
        float:left;
        width: auto;
    }
    #banner-services .banner-service-item .service-icon{
        width:50px;
       float:left;
       margin-right: 10px;
    }
    #banner-services .col-md-4 .banner-service-item, .col-md-6 .banner-service-item, .col-xs-12 .banner-service-item {
        width: 310px;
    }
    /*End Banner Services*/
    .agregar{
        float:left;
        text-align:center;
    }
}



@media (max-width: 553px) {
    .fb_iframe_widget span{
        display: block!important;
        text-align: center!important;
    }
    .fb_iframe_widget{
      margin: 7px auto 0px auto!important;
      width: 100%!important;
    }
    .fb_iframe_widget iframe{
      position: relative!important;
    }
    .distancia{
    margin-left: 0px;
    }
    #InstallmentsModal .modal-dialog {
        width: 95%;
    }
    .busqueda{
    font-size: 30px;
    }
    .texto-carrito{
        width: 90px;
    }
    .busqueda .navbar{
    min-height: 50px;
    }
    .productos{
    text-align: center;
    }
    .producto{
        margin-right: 0px;
        width: 100%;
    }
    .table_1{
    width: 100%;
    }
    .total_tabla .table_4{
        width: 100%;
    }
    .table_3{
        width: 50%;
    }

    .table_4{
        display: none;
    }

    .table_5{
        width: 88%;
        font-size: 18px;
    }
    #cabezal_interior h1{
    top: 40px;
    font-size: 30px;
    }
    #cabezal_interior{
    height: 100px;
    }
    #cabezal_interior.home{
    height: 0;
    }
    #cabezal_interior h3{
    font-size: 30px;
    top:35%;
    }

    .contenido{
        padding: 20px;
    }
    .table_5a6{
    width: 100%;
    }

    .table_1a3{
    width: 100%;
    }
    select.sort-by.form-control {
    width:100%;
    }

    .cart-item .cart-item-del{
    top:0px;
    }

}

.cart-header {
    background-color: $secundario;
    color: $primario;
    margin-right: 0;
    margin-left: 0;
    margin-bottom: 15px;
    padding: 15px 0;
}
.cart-item {
    background: #FFF;
    margin-bottom: 15px;
    margin-right: 0;
    margin-left: 0;
    height: 100px;
}

.cart-item .thumb img {
    max-height: 75px;
    margin-top:14px;
}
.cart-item-name {
    margin-top: 40px;
    margin-left: 20px;
}
.cart-item-name a {
    display: block;
}
.cart-item-cant {
    margin-top: 26px;
}
.cart-item-cant input {
    width: 50px;
    text-align: center;
}

.cart-item-price {
    margin-top: 40px;
}
.cart-item-del {
    float: right;
    margin-top: -20px;

    .table_1a3{
    width: 100%;
    }
    #loadMoreBtn {
    border: 1px solid #999;
    display: inline-block;
    margin: 30px auto;
    padding: 10px;
    width: 100%;
    cursor: pointer;
    }
}

@media (max-width: 769px) {
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
        margin-top: 7.5px;
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
}
.navbar-brand h1 {
    margin: 0;
    padding: 0;
    text-decoration: none;
    border-bottom:0px;
}
.des-producto h3 {
    font-size: 14px;
    margin: 0;
    padding: 0;
}

.fb_iframe_widget {width: 100% !important; margin: 7px auto 20px auto; text-align: center;}
.fb_iframe_widget div{
    margin: auto;
}

/* FILTERS & CATEGORIES */
#categories-column {
  margin: 20px 0 0 0;
}
#categories-column h4 {
    margin: 0 0 20px 0;
    font-weight: 100;
}
#categories-column #categories-list {
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
    background-color: $fondo;
    padding: 0 20px 5px 12px;
    left: 38%;
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
    margin: 0 5px 8px 0;
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
    text-align: left;
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
    margin-top: 15%;
}
a.category-back {
    color: $primario;
}
a.category-back i {
    font-size: 12px;
    margin-right: 10px;
}

#img-news{
    margin-left: -13px;
}
#img-news img{
    max-width: 100%;
}
p.newsletter{
  text-align: center;
  font-size: 16px;
  padding: 20px 0px;
}
.news-modal input{
    background-color: rgb(224, 224, 224);
}
input.boton.news-modal{
   width: 100%; 
   border: 0px;
}
.img.logo.news{
    vertical-align:middle;
    display:inline-block;
    margin: 20px 0px;
    border: none;
    width: 100%;
}
.img.logo.news img{
    max-width: 65%;
    max-height: 180px;
    margin: auto;
}
a#logo.news {
  text-overflow: ellipsis;
  overflow: hidden;
  max-width: 400px;
}
button.close.news {
  position: relative;
  left: -11px;
  margin-bottom: 3px;
  top: -10px;
}
#news.modal-dialog{
    width: 800px;
}
#news.modal-dialog .modal-content{
     background-color:$fondo;   
}
#newsletter-popup .loading-modal{
    font-size: 14px;
    text-align: center;
    margin-top: 20px;
    color: $primario;
}
#news .no-logo-container{
    width:100%;
}
@media (max-width:768px){
    #news.modal-dialog{
    width: 600px;
    left: 10%;
    }
}
@media (max-width:480px){
    #news.modal-dialog{
    width: 300px;
    }
    #cabezal_interior{
    height:80px;
    }
    #cabezal_interior h3{
    font-size: 24px;
    }

    .oh.socials { padding-left: 0; padding-right: 0 }
    .oh.socials .widget-header { margin: 0 15px; }
    .facebook-container { margin: 10px 0; padding-left: 5px }

    /*cart styles*/
    .cart-item-name a{
        width: 130px;
    }
    /** password page **/
    .password-container.password-message{
        width:90%;
    }
    .password-page .password-container.password-message h2{
        font-size:18px;
    }
    .password-page .password-container.password-icon{
        height:130px;
    }
    .password-page .password-container.password-icon .password-svg{
        width:45%;
    }

}

#img-news img{
    max-width: 280px;
}

/* new copyright */
.powered-by-text, .powered-by-logo { display: inline-block; vertical-align: top; }
.powered-by-logo { width: 90px; padding-top: 2px; }
#svg_brand .st0 { fill: $texto; }
#svg_brand .st1 { fill: rgba($texto, $opac9); }
/* /new copyright */

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
    background: $primario;
    color:$fondo;
}
.mobile-filters.dropdown-selected > .fa-chevron-down:before{
    content: "\f077";   
 }

@media(max-width: 991px){
    #filters-container {
        background: rgba(131, 131, 131, 0.1);
        padding: 15px 0;
    }
    #toggle-filters { margin: 0 15px; }
}
@media(min-width: 992px){
    #show-filters { display: none; }
    #toggle-filters { display: block !important; }
}
.user-content img.user-page-logos {
    width: 45px;
    margin-top: 5px;
}