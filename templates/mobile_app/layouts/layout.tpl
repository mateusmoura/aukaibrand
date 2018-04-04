<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {{ store.name | og('site_name') }}
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}
    {% if template == 'product' %}
        {# Twitter #}
        <meta name="twitter:card" content="product" />
        <meta name="twitter:url" content="{{ product.social_url }}" />
        <meta name="twitter:image:src" content="{{ ('http:' ~ product.featured_image | product_image_url('huge')) }}" />
        {% if store.twitter_user %}
            <meta name="twitter:site" content="{{ store.twitter_user }}" />
        {% endif %}
        <meta name="twitter:title" content="{{ product.name }}" />
        <meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Consultar' | translate }}" />
        <meta name="twitter:label1" content="{{ 'Precio' | translate | upper }}" />
        <meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Si' | translate }}" />
        <meta name="twitter:label2" content="{{ 'Stock' | translate | upper }}" />
        {# Facebook #}
        {{ product.social_url | og('url') }}
        {{ product.name | og('title') }}
        {{ page_description | og('description') }}
        {{ "#{fb_app.namespace}:product" | og('type') }}
        {{ ('http:' ~ product.featured_image | product_image_url('huge')) | og('image') }}
        {{ ('https:' ~ product.featured_image | product_image_url('huge')) | og('image:secure_url') }}
        {% if product.display_price %}
            {{ (product.price / 100) | og_fb_app('price') }}
        {% endif %}
        {% if product.stock_control %}
            {{ product.stock | og_fb_app('stock') }}
        {% endif %}
    {% endif %}
    {{ 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css' | css_tag }}
    {{ 'js/bxslider/jquery.bxslider.css' | static_url | css_tag }}
    {{ 'css/style.css' | static_url | css_tag }}
    {{ 'css/main-color.scss.tpl' | static_url | css_tag }}
    {{ 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' | css_tag }}
    {% set nojquery = true %}
    {{ "//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" | script_tag }}
    {% head_content %}
</head>
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
    
{{back_to_admin}}

<!-- Site Overlay -->
<div class="site-overlay"></div>
<div id="container">
    <div class="wrapper {% if store.phone or store.email %} with-contact-top{% else %} no-contact-top{% endif %}" id="header">
        {% if store.phone or store.email %}        
            <div id="topper" class="grey-bg-color visible-sm visible-xs">
                <ul class="contact-cta">
                    {% if store.phone %}   
                    <li class="phone-number">
                         <a href="tel:{{ store.phone }}">
                            {{ "images/whatsapp.png" | static_url | img_tag }} 
                            <strong>{{ store.phone }}</strong>  
                        </a>
                    </li>  
                    {% endif %}   
                    {% if store.email %}
                        <li class="email"><i class="fa fa-envelope-o"></i>{{ store.email | mailto }}</li>
                    {% endif %}   
                </ul>   
            </div>
         {% endif %}
        <nav class="navbar navbar-default main-bg-color" id="navigation">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header col-md-12 col-sm-12 col-xs-12" id="navbar-mobile">
                <!--logo-->
                <div class="logo-container pull-left">
                    <a class="logo-container" href="{{ store.url }}">{{ "images/lite-store-logo.png" | static_url | img_tag }} <h1>{{ store.name }}</h1></a>
                </div>
                  <!--Account-->
                <div class="account-nav visible-md visible-lg pull-right">
                    <div class="access-top">
                        {% if store.has_accounts %}
                            <div id="auth">
                                {% if not customer %}
                                    {% if 'mandatory' not in store.customer_accounts %}
                                        {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }} <span class="divider">-</span>
                                    {% endif %}
                                    {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                                {% else %}
                                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }} <span class="divider">-</span>
                                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                                {% endif %}
                            </div>
                        {% endif %}
                    </div>
                </div>
                <!--contact btn-->
                 <a class="contact-link pull-right hidden-xs hidden-sm" href="{{ store.contact_url }}"> {{ "Contacto" | translate }}</a>
                <!--cart nav-->  
                <ul class="pull-right cart-button hidden-sm hidden-xs">
                  {% if not store.is_catalog and template != 'cart' %}
                            {% snipplet "cart.tpl" as "cart" %}
                    {% endif %}
                </ul>
                     
                 <!--Search desktop-->
                 <form action="{{ store.search_url }}" method="get" class="navbar-form pull-right hidden-xs">
                        <div class="form-group">
                          <input class="text-input form-control" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                        </div>
                        <i class="fa fa-search main-fg-color"></i>
                        <input type="submit" value="" class="btn btn-default search-navbar">
                  </form>
                  <a id="search-off-focus" class="btn btn-default search-navbar"><i class="fa fa-search"></i></a>    
            </div>
             <!--Search mobile-->
             <div id="searchbar-mobile" class="search-focus-bar">
                   <form action="{{ store.search_url }}" class="navbar-form show-mobile" role="search">
                        <i class="fa fa-arrow-left arrow-back main-fg-color"></i>
                        <div class="form-group" id="search-input-mobile">
                          <input class="text-input form-control" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                        </div>
                        <a id="search-on-focus" class="btn btn-default search-navbar main-fg-color"><i class="fa fa-search main-fg-color"></i><input type="submit" value="" class="btn btn-default search-navbar"></a>
                  </form>
              </div>
             
          </div>
        </nav>
        <!--mobile navigation-->
        <nav class="paradeiser visible-xs visible-sm" id="paradeiser">
            <!--products-->
            <span class="paradeiser-dropdown {% if template == 'category' or template == 'home' %} active{% endif %}">
                <a href="#paradeiser-more" class="paradeiser-dropdown-anchor">
                   <div class="paradeiser-icon-canvas main-fg-color">
                        <i class="fa fa-gift"></i>
                    </div>
                    <span>{{ "Productos" | translate }}</span>
                </a>
                 <ul class="paradeiser_children paradeiser-categories {% if store.phone or store.email %} paradeiser_children-with-top{% endif %}" id="paradeiser-more">
                    <li class="close-nav"><i class="fa fa-times"></i></li>
                    <li><a class="mobile-all-cats" href="{{ store.url }}">{{ "Ver todas las categorías" | translate }}</a></li>
                     {% set category_items = [] %}
                     {% for item in navigation %}
                         {% if item.name == "Products" or item.name == "Productos" or item.name == "Produtos" %}
                             {% set category_items = category_items|merge([item.subitems]) %}
                         {% endif %}
                     {% endfor %}
                     {% snipplet "navigation-mobile.tpl" with categories = category_items[0] %}
                     <li id="greybox" class="greybox"><a href="#!"></a></li>
                 </ul>
            </span>
            <!--cart-->
             {% if not store.is_catalog  %}
               {% snipplet "cart-mobile.tpl" %}
            {% endif %}
             <!--contact-->
             <a href="{{ store.contact_url }}" class="{% if template == 'contact' %} active{% endif %}">
                 <div class="paradeiser-icon-canvas main-fg-color">
                   <i class="fa fa-envelope"></i>
                </div>
                <span>{{ "Contacto" | translate }}</span>
            </a>
            <!--account-->
            <span class="paradeiser-dropdown main-fg-color {% if template == 'account.address' or template == 'account.addresses' or template == 'account.info' or template == 'account.login' or template == 'account.newpass' or template == 'account.order' or template == 'account.orders' or template == 'account.register' or template == 'account.reset' %} active{% endif %} ">
                <a href="#paradeiser-more"  class="cart-button paradeiser-dropdown-anchor" >
                   <div class="paradeiser-icon-canvas main-fg-color">
                        <i class="fa fa-user"></i>
                    </div>
                    <span>{{ "Cuenta" | translate }}</span>
                </a>
                <ul class="paradeiser_children {% if store.phone or store.email %} paradeiser_children-with-top{% endif %}" id="paradeiser-more">
                   {% if store.has_accounts %}
                        <div id="auth">
                            <div class="col-sm-12 col-xs-12">
                                {% if not customer %}
                                <div class="row margin-top margin-bottom">
                                    {% if 'mandatory' not in store.customer_accounts %}
                                    <div class="col-sm-6 col-xs-6">
                                        <div class="create-account account-btn">
                                            {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                                        </div>    
                                    </div>
                                   {% endif %}
                                   <div class="col-sm-6 col-xs-6">
                                        <div class="login account-btn">
                                            {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                                        </div>  
                                    </div>
                                </div>  
                                {% else %}
                                <div class="profile-image">
                                    <img src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80"/>
                                </div>
                                <div class="row margin-top margin-bottom">
                                    <div class="col-sm-6 col-xs-6">
                                        <div class="my-account account-btn">
                                            {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-6">
                                        <div class="logout account-btn">
                                        {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                                        </div>
                                    </div>
                                </div>
                                {% endif %}
                            </div>
                        </div>
                        <li id="greybox" class="greybox"><a href="#!"></a></li>
                    {% endif %}
                </ul>
            </span>
        </nav>
    </div>
    <div class="page-content {% if template == "home" %}page-content-home {% endif %}{% if store.phone or store.email %} page-content-with-top{% else %}page-content-no-top{% endif %}">
        {% template_content %}
    </div>
    {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
        <div id="wrapper-social">
            <div class="row-fluid">
                <div class="container">
                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                        {% set sn_url = attribute(store,sn) %}
                        {% if sn_url %}
                            <a class="soc-foot main-fg-color {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn }} fa-4x"></i></a>
                        {% endif %}
                    {% endfor %}
                </div>
            </div>
        </div>
    {% endif %}
    {% if store.phone or store.email %}
    <div id="wrapper-foot">
        <div class="row-fluid">
            <div class="container">
                    <div class="col-md-12 col-xs-12">
                        <span class="subheader">{{ "Datos de contacto" | translate }}</span>
                        <ul class="foot-nav">
                            {% if store.phone %}
                                <li><a href="tel:{{ store.phone }}">
                                    {{ "images/whatsapp-dark.png" | static_url | img_tag }} 
                                    <strong>{{ store.phone }}</strong>  
                                </a></li>
                            {% endif %}
                            {% if store.email %}
                                <li class="email"><i class="fa fa-envelope-o"></i>{{ store.email | mailto }}</li>
                            {% endif %}
                        </ul>
                    </div>
            </div>
        </div>
    </div>
    {% endif %}
    {% if settings.payments or settings.shipping %}
        <div id="wrapper-pay">
            <div class="row-fluid">
                <div class="container">
                    <div class="col-md-8 col-xs-12">
                        <h4>{{ "Medios de pago" | translate }}</h4>
                        <div class="payments">
                            {% for payment in settings.payments %}
                                {{ payment | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                            {% endfor %}
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12">
                        <h4>{{ "Medios de envío" | translate }}</h4>
                        <div class="shipping">
                            {% for shipping in settings.shipping %}
                                {{ shipping | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
    <div id="wrapper-seals">
        <div class="col-md-12 col-xs-12 text-center seals" {% if not (store.afip or ebit) %}style="display: none;"{% endif %}/>
            <div class="row">
                <h4>{{ "Seguridad y Certificaciones" | translate }}</h4>
                {% if store.afip %}
                    <div class="afip">
                        {{ store.afip | raw }}
                    </div>
                {% endif %}
                {% if ebit %}
                    <div class="ebit">
                        {{ ebit }}
                    </div>
                {% endif %}
            </div>
        </div>
        <div class="copyright">
              {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
        </div>
    </div>
    <div id="wrapper-legal">
        <div class="row-fluid">
            <div class="container">
                <div class="col-md-12 col-xs-12 text-center">
                    <div class="powered-by">
                        {#
                        La leyenda que aparece debajo de esta linea de código debe mantenerse
                        con las mismas palabras y con su apropiado link a Tienda Nube;
                        como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                        Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                        tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                        Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                        palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                        http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                        e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                        manter visivél e com um link funcionando.
                        #}
                        {{ powered_by_link }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{{ '//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js' | script_tag }}
{{ "//maps.googleapis.com/maps/api/js?sensor=false&language=#{current_language.lang}" | script_tag }}
{{ 'js/bootstrap.js' | static_url | script_tag }}
{{ 'js/lite.js' | static_url | script_tag }}
{% if template == "product" %}
<script type="text/javascript">
$(document).ready(function(){
    slider = $('#productbxslider').bxSlider({
        nextText:'<i class="fa fa-chevron-right"></i>',
        prevText:'<i class="fa fa-chevron-left"></i>',
    
    });
  LS.registerOnChangeVariant(function(variant){
        var liImage = $('#productbxslider').find("[data-image='"+variant.image+"']");
        var selectedPosition = liImage.data('image-position');
        var slideToGo = parseInt(selectedPosition);
        slider.goToSlide(slideToGo);
    });
    $('.product-share-button').click(function(){
        ga_send_event('social-sharing-product', $(this).data('network'))
    });
});

</script>
{% endif %}
{% if template == "category" %}
<script type="text/javascript">
$(document).ready(function(){
      $(".change-grid").click(function() {
        $(".product-row .dest-gral.col-md-3").toggleClass("row-products");
        $(".change-grid .fa-th-large").toggle();
        $(".change-grid .fa-square").toggle();
      });
       $(function() {
            new LS.infiniteScroll({
                afterSetup: function() {
                    $('.crumbPaginationContainer').hide();
                },
                finishData: function() {
                    $('#loadMoreBtn').remove();
                },
                productGridClass: 'product-table',
                bufferPx: 600,
                productsPerPage: 12
            });
        });
});
</script>
{% endif %}
<script type="text/javascript">

 function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
        if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
            if (installment_data.without_interests) {
                return [number_of_installment, installment_data.installment_value.toFixed(2)];
            }
        }
        return max_installments_without_interests;
    }

 function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
        if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
            if (installment_data.without_interests == false) {
                return [number_of_installment, installment_data.installment_value.toFixed(2)];
            }
        }
        return max_installments_with_interests;
    }

function changeVariant(variant){
        var parent = $("body");
        if (variant.element){
            parent = $(variant.element);
        }

        var sku = parent.find('#sku');
        if(sku.length) {
            sku.text(variant.sku).show();
        }

        if (variant.installments_data) {
            var variant_installments = JSON.parse(variant.installments_data);
            var max_installments_without_interests = [0,0];
            var max_installments_with_interests = [0,0];
            $.each(variant_installments, function(payment_method, installments) {
                $.each(installments, function(number_of_installment, installment_data) {
                    max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                    max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                    $('#installment_' + payment_method + '_' + number_of_installment).text(
                        number_of_installment + ' - R$' + installment_data.installment_value.toFixed(2) +
                                (installment_data.without_interests? ' sem juros' : '')
                    );
                });
            });
            if (max_installments_without_interests[0] != 0) {
                $('.installments.max_installments_container .max_installments').text('Até ' + max_installments_without_interests[0] + 'x de R$' + max_installments_without_interests[1] + ' sem juros');
            } else {
                $('.installments.max_installments_container .max_installments').text('Até ' + max_installments_with_interests[0] + 'x de R$' + max_installments_with_interests[1]);
            }
        }

        if (variant.price_long){
            parent.find('#price_display').text(variant.price_long).show();
        } else {
            parent.find('#price_display').hide();
        }

        if (variant.compare_at_price_long){
            parent.find('#compare_price_display').text(variant.compare_at_price_long).show();
        } else {
            parent.find('#compare_price_display').hide();
        }

        if(variant.contact) {
            parent.find('.container-box').hide();
        } else {
            parent.find('.container-box').show();
        }

        var button = parent.find('.addToCart');
        button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
        if (!variant.available){
            button.val('{{ "Sin stock" | translate }}');
            button.addClass('nostock');
            button.attr('disabled', 'disabled');
            $("#shipping-calculator-form").hide();
        } else if (variant.contact) {
            button.val('{{ "Consultar precio" | translate }}');
            button.addClass('contact');
            button.removeAttr('disabled');
            $("#shipping-calculator-form").hide();
        } else {
            button.val('{{ "Agregar al carrito" | translate }}');
            button.addClass('cart');
            button.removeAttr('disabled');
            $("#shipping-calculator-form").show();
        }
        {% endif %}
}

$(document).ready(function(){

    $(".paradeiser-dropdown > a.paradeiser-dropdown-anchor").click(function(e){
        $hidden_list = $(this).next(".paradeiser_children");
        if ($hidden_list.css('display') == 'block'){
            $("#header").css("height" , "auto");
            $hidden_list.fadeOut(400);
            $("body").removeClass("noscroll");
            $(".paradeiser-categories, .paradeiser_children.cart-summary").removeClass("scroll-y");
            $("#header").removeClass("height-visible");
        }
        else{
           $("#header").css("height" , "120%");
           $(".paradeiser_children").fadeOut(400);
           $hidden_list.fadeToggle(400);
           $("body").addClass("noscroll");
           $(".paradeiser-categories, .paradeiser_children.cart-summary").addClass("scroll-y");
           $("#header").addClass("height-visible");
        }
        e.preventDefault();
    })
    $(".greybox, .close-nav i").click(function(){
        $("#header").css("height" , "auto");
        $(".paradeiser_children").fadeOut(400);
        $("body").removeClass("noscroll");
        $(".paradeiser-categories").removeClass("scroll-y");
        $("#header").removeClass("height-visible");
    })

    //Hamburguer Menu Javascript
    $(".mobile-dropdown").click(function(){
        $(this).prev(".dropdown-anchor").toggleClass("anchor-selected");
        $(this).next(".accordion").slideToggle(300).toggleClass("accordion-selected");
        $(this).toggleClass("dropdown-selected");
    });
    $("#search-off-focus").click(function() {
      $("#navbar-mobile").hide();
      $("#searchbar-mobile").fadeIn("fast");   
      $(".navbar form.show-mobile #search-input-mobile input").focus();   
    });
    $(".arrow-back").click(function() {
       $("#navbar-mobile").fadeIn("fast");
      $("#searchbar-mobile").hide(); 
    });
    $(".navbar form.show-mobile #search-input-mobile input").focus();
    $(".page-content").click(function() {
      $("#navbar-mobile").fadeIn("fast");
      $("#searchbar-mobile").hide();  
    });
    $(".cart-preview").hover(function(){
        $("#cart-widget-container").css("display" , "none");
    });
    $(".cart-preview").mouseleave(function(){
       $("#cart-widget-container").css("display", "block");
    });  
    LS.registerOnChangeVariant(function(variant){
        // this is used on quick shop modals
        var current_image = $('img', '.quick-content[data-product="'+variant.product_id+'"]');
        current_image.attr('src', variant.image_url);
        // this is used on single product view
        $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
    }); 

    $('.goBack').click(function(){
        window.history.back();
    });


    $('#product_form').submit(function(){
        var button = $(this).find(':submit');

        button.attr('disabled', 'disabled');
        if (button.hasClass('cart')){
            button.val('{{ "Agregando..." | translate }}');
        }
    });

    

    {% if contact and contact.success and contact.type == 'newsletter' %}
    var $newsletter = $('#newsletter');
    $newsletter.find('form').hide();
    $newsletter.find('.title').hide();
    $newsletter.find('#ofertas').hide();
    {% endif %}

    $( ".spinner" ).spinner({
        spin: function( event, ui ) {
            if ( ui.value > 100 ) {
                $( this ).spinner( "value", 1 );
                return false;
            } else if ( ui.value < 1 ) {
                $( this ).spinner( "value", 1 );
                return false;
            }
        }
    });

   
    {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
    {% endif %}

    $("#calculate-shipping-button").click(function(e) {
        e.preventDefault();
        LS.calculateShipping($("#shipping-cep").val(), '{{store.shipping_calculator_url | escape('js')}}' );
    });

     $('.sort-by').change(function(){
            var params = LS.urlParams;
            params['sort_by'] = $(this).val();
            var sort_params_array = [];
            for (var key in params) {
                if ($.inArray(key, ['results_only', 'page']) == -1) {
                    sort_params_array.push(key + '=' + params[key]);
                }
            }
            var sort_params = sort_params_array.join('&');
            window.location = window.location.pathname + '?' + sort_params;
        });
});
</script>

{% if template == 'cart' %}
{{ 'js/jquery.livequery.min.js' | static_url | script_tag }}
<script type="text/javascript">
    $(document).ready(function(){

        // Key pressed in quantity input
        $(".col-quantity input").keypress(function(e){
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });

        // Quantity input focus out
        $(".col-quantity input").focusout(function(e){
            var itemID = $(this).attr("data-item-id");
            var itemVAL = $(this).val();
            if(itemVAL==0) {
                var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                if (r == true) {
                    LS.removeItem(itemID);
                } else {
                    $(this).val(1);
                }
            } else {
                LS.changeQuantity(itemID, itemVAL);
            }
        });

        // Clicked shipping method listener
        $(document).on( "click", "input.shipping-method", function() {
            var elem = $(this);
            var shippingPrice = elem.attr("data-price");
            elem.click(function() {
                LS.addToTotal(shippingPrice);
            });
            $('.shipping-suboption').hide();
            elem.closest('li').find('.shipping-suboption').show();
        });

        // Default shipping method listener
        $('input.shipping-method:checked').livequery(function(){
            var shippingPrice = $(this).attr("data-price");
            LS.addToTotal(shippingPrice);
        });

    });
</script>
{% endif %}


{% if template == 'product' %}
    <script type="text/javascript">
        {% if settings.show_product_fb_comment_box %}
        window.fbAsyncInit = function() {
            FB.Event.subscribe('comment.create',
                    function (response) {
                        LS.commentNotify("{{store.fb_comment_url}}", {{product.id}}, response);
                    });
        };
        {% endif %}
    </script>
{% endif %}

{% if template == 'account.login' or template == 'account.register' %}
    <script type="text/javascript">
        function loginFacebook() {
            LS.facebookLogin(FB, function(status, hasEmail) {
                if (status === 'connected') {
                    if (hasEmail) {
                        window.location = "{{ store.url }}/account/facebook_login/";
                    } else {
                        $('#login-form').prepend(
                                "<div class=\"st alert alert-error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                    }
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st alert alert-error c\">{{ 'Debes completar el login.' | translate }}</div>");
                }
            });
        }
        window.fbAsyncInit = function() {
            FB.init({
                version    : 'v2.2',
                cookie     : true
            });
        };
    </script>
{% endif %}
{{ social_js }}
{{ store.assorted_js | raw }}

</body>
</html>
