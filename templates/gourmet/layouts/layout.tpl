<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
    <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
    <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}
    {{ store.name | og('site_name') }}
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
        {% set prod_image_fb = product.featured_image_fb %}
        {{ ('http:' ~ prod_image_fb | product_image_url('huge')) | og('image') }}
        {{ ('https:' ~ prod_image_fb | product_image_url('huge')) | og('image:secure_url') }}
        {% if product.display_price %}
            {{ (product.price / 100) | og_fb_app('price') }}
        {% endif %}
        {% if product.stock_control %}
            {{ product.stock | og_fb_app('stock') }}
        {% endif %}
    {% endif %}
    {{ '//fonts.googleapis.com/css?family=Lato:100,300,400,700,900|Open+Sans:400,300,700|Lora:400,700|Slabo+27px|Playfair+Display:900|Droid+Sans:400,700' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css' | css_tag }}
    {{ 'js/cloud-zoom/cloud-zoom.css' | static_url | css_tag }}
    {{ 'css/style.scss.tpl' | static_url | css_tag }}
    {% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}

    {% if params.preview %}
        {{ 'js/instatheme.js' | static_url | script_tag }}
    {% endif %}

    {% head_content %}
    <!--[if lt IE 9]>
    {{ '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js' | script_tag }}
    <![endif]-->
    <style>
        {{ settings.css_code | raw }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
    {{ social_js }}
    {% if template == 'account.login' or template == 'account.register' %}
    <script>
        function loginFacebook() {
            LS.facebookLogin(FB, function(status, hasEmail) {
                if (status === 'connected') {
                    if (hasEmail) {
                        window.location = "{{ store.url }}/account/facebook_login/";
                    } else {
                        $('#login-form').prepend(
                                "<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                    }
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
                }
            });
        }
    </script>
    {% endif %}
{{back_to_admin}}
<div class="navbar-inverse" role="navigation">
    <div class="container menu-sec">
        {% if store.has_accounts %}
            <ul class="list-inline navbar-left">
                {% if not customer %}
                    {% if 'mandatory' not in store.customer_accounts %}
                        <li><i class="fa fa-plus-square"></i> {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}</li>
                    {% endif %}
                        <li><i class="fa fa-user"></i> {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}</li>
                    {% else %}
                        <li>{{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}</li>
                        <li>{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}</li>
                    {% endif %}
            </ul>
        {% endif %}
            <ul class="list-inline navbar-right">
                {% if languages | length > 1 %}
                    <div class="languages">
                        {% for language in languages %}
                            {% set class = language.active ? "active" : "" %}
                            <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                        {% endfor %}
                    </div>
                {% endif %}
            </ul>
    </div>
</div>
<div>
    {% set is_sticky = settings.sticky_header %}
    <div class="busqueda collapse"{% if is_sticky %} data-spy="affix" data-offset-top="100" style='top:80px; height:80px;'{% endif %}>
        <div class="navbar navbar-base" role="navigation">  
            <form action="{{ store.search_url }}" method="get" class='buscar' name="nameform">
                <input type='submit' class="fa fa-search" value='' style='position:absolute'><i class="fa fa-search"></i> 
                <input id="busco" type='text' name="q" class='search' placeholder="{{ 'Buscar' | translate }}"/>
            </form>
        </div>
    </div>
    <div class="navbar navbar-inverse9 navbar-static-top" role="navigation" {% if is_sticky %}data-spy="affix" data-offset-top="140"{% endif %}>
        <div class="navbar-left">
            <div class="navbar-brand">
                {% if template == 'home' %}
                    <h1 class="img logo">
                {% else %}
                    <div class="img logo">
                {% endif %}
                    <div class="logo-wrapper {% if not has_logo %}hidden{% endif %}">
                        {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                    </div>
                    <a id="logo" class="no-logo {% if has_logo %}hidden{% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                {% if template == 'home' %}
                    </h1>
                {% else %}
                    </div>
                {% endif %}
            </div>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                {% snipplet "navigation-mobile.tpl" %}
            </button>
        </div>
        <ul class="list-inline navbar-right busqueda-carrito">
            <li><a data-toggle="collapse" data-target=".busqueda" onclick="focus_on_lightbox(3);"><i class="fa fa-search"></i></a></li>
            <li>
                {% if not store.is_catalog %}
                    {% snipplet "cart.tpl" as "cart" %}
                {% endif %}
            </li>
        </ul>
        <div class="navbar-collapse collapse navbar-left" id="my-affix" {% if sticky_header %} data-spy="affix" data-offset-top="140"{% endif %}>
            <ul class="nav navbar-nav distancia">
                {% snipplet "navigation.tpl" %}
            </ul>
        </div>
    </div>
</div>
{% template_content %}
<div class="banner-services-footer">
    {% if settings.banner_services %}
        {% include 'snipplets/banner-services.tpl' %}
    {% endif %}
</div>
<!-- FOOTER -->
<!-- medios de pago y envio -->
{% set has_shipping_payment_logos = settings.payments or settings.shipping %}
{% set has_seals = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% if has_shipping_payment_logos or has_seals %}
    <div class="medios">
        <div class="container medios_todos">
            {% if settings.payments %}
                <div class="centrado col-md-{% if settings.shipping and has_seals %}6{% else %}8{% endif %}">
                  <h2>{{ "MEDIOS DE PAGO" | translate }}</h2>
                    {% for payment in settings.payments %}
                        {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                    {% endfor %}
                </div>
            {% endif %}
            {% if settings.shipping %}
                <div class="centrado col-md-{% if has_seals %}3{% else %}4{% endif %}">
                    <h2>{{ "FORMAS DE ENVÍO" | translate }}</h2>
                    {% for shipping in settings.shipping %}
                        {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                    {% endfor %}
                </div>
            {% endif %}
            {% if has_seals %}
                <div class="col-md-3 centrado logo_afip seals-container">
                  <h2>{{ "INFORMACIÓN LEGAL" | translate }}</h2>
                    <ul class="list-inline pull-right seals">
                        {% if ebit %}
                            <li class="ebit">
                                {{ ebit }}
                            </li>
                        {% endif %}
                        {% if store.afip %}
                            <li class="afip">
                                {{ store.afip | raw }}
                            </li>
                        {% endif %}
                    </ul>
                    {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
                        <div class="custom-seals-container">
                            {% if "seal_img.jpg" | has_custom_image %}
                                <div class="custom-seal custom-seal-img">
                                    {% if settings.seal_url != '' %}
                                    <a href="{{ settings.seal_url }}" target="_blank">
                                        {{ "seal_img.jpg" | static_url | img_tag }}
                                    </a>
                                    {% else %}
                                        {{ "seal_img.jpg" | static_url | img_tag }}
                                    {% endif %}
                                </div>
                            {% endif %}
                            {% if settings.custom_seal_code %}
                                <div class="custom-seal custom-seal-code">
                                    {{ settings.custom_seal_code | raw }}
                                </div>
                            {% endif %}
                        </div>
                    {% endif %}
                </div>
            {% endif %}
        </div>
    </div> 
{% endif %}
<!-- footer -->
<footer>
    <div class='container footer'>
        <div class="footer-nav">
            <div class="col-md-3 logo_footer">
                    <div class="logo-wrapper {% if not has_logo %}hidden{% endif %}">
                        {{ store.logo | img_tag | a_tag(store.url) }}
                    </div>
                    <div class="logo no-logo {% if has_logo %}hidden{% endif %}">
                        <a id="logo" href="{{ store.url }}">{{ store.name }}</a>
                    </div>
            </div>
            <div class="col-md-3 centrado_disp">
                <h2>{{ settings.footer_navigation_text }}</h2>
                <ul>
                    {% snipplet "navigation-foot.tpl" %}
                </ul>
            </div>
            {% if store.phone or store.email or store.blog or store.address%}
                <div class="col-md-3 centrado_disp">
                    <h2>{{ settings.footer_contact_text }}</h2>
                    <ul>
                                {% if store.phone %}
                                    <li class="phone"><i class="fa fa-phone"></i> {{ store.phone }}</li>
                                {% endif %}
                                {% if store.email %}
                                    <li class="mail"><strong><i class="fa fa-envelope"></i> {{ store.email | mailto }}</strong></li>
                                {% endif %}
                                {% if store.blog %}
                                    <li class="blog">
                                        <i class="fa fa-comment"></i> <a target="_blank" href="{{ store.blog }}"> {{ "Visita nuestro Blog!" | translate }}</a>
                                    </li>
                                {% endif %}
                                {% if store.address %}
                                    <li class="address"><i class="fa fa-map-marker"></i> {{ store.address }}</li>
                                {% endif %}
                    </ul>
                </div>
            {% endif %}
            <div class="col-md-3 centrado_disp">
                {% set newsletter_col = show_facebook and show_twitter ? 4 : (show_facebook or show_twitter ? 8 : 6) %}
                {% include 'snipplets/newsletter.tpl' %}
            </div>
        </div>
    </div>
</footer>
<div class="footer_bajo">
    <div class="container">
        <div class="col-md-6">
            <p>{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
        </div>
        <div class="col-md-6 derecha izquierda_disp">
          {{ new_powered_by_link }}
        </div>
    </div>
</div>
{{ '//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
{% set gmap_url = "//maps.google.com/maps/api/js" ~ (store.gmap_api_key and store.can_show_google_map ? "?key=#{store.gmap_api_key}" : "") %}
{{ gmap_url | script_tag }}
{{ 'js/gourmet.js' | static_url | script_tag }}
<script type="text/javascript">
    {% if settings.show_news_box %}
    $('#newsletter-popup').submit(function(){
        $(".loading-modal").show();
        $("#newsletter-popup .boton").prop("disabled", true);
        ga_send_event('contact', 'newsletter', 'popup');
        });
    LS.newsletter('#newsletter-popup', '#newsModal', '{{ store.contact_url | escape('js') }}', function(response){
        $(".loading-modal").hide();
        var selector_to_use = response.success ? '.alert-success' : '.alert-error';
        $(this).find(selector_to_use).fadeIn( 100 ).delay( 1300 ).fadeOut( 500 );
        if($("#newsletter-popup .contact-ok").css("display") == "block"){
            setTimeout(function()
                { $("#newsModal").modal('hide'); }, 2500);
        }else{
            {# nothing happens here #}
        }
        $('#newsletter-popup input[type="email"]').val('');
        $("#newsletter-popup .boton").prop("disabled", false);
    });
    
    $(document).ready(function(){ 
        LS.newsletterPopup();
    });
    {% endif %}

    function focus_on_lightbox(seconds) {
      var seconds_waited = seconds;
      document.getElementById('busco').focus(); 
      seconds_waited += 100;

      if (document.getElementById('busco') != document.activeElement && seconds_waited < 2000)
      setTimeout("focus_on_lightbox(" + seconds_waited + ");", 100);
    }

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

        $("#shipping-calculator-response").hide();
        $("#shipping-variant-id").val(variant.id);

        var parent = $("body");
        if (variant.element){
            parent = $(variant.element);
        }

        var sku = parent.find('#sku');
        if(sku.length) {
            sku.text(variant.sku).show();
        }

        var installment_helper = function($element, amount, price){
            $element.find('.installment-amount').text(amount);
            $element.find('.installment-price').text(LS.currency.display_short + price);
        };

        if (variant.installments_data) {
            var variant_installments = JSON.parse(variant.installments_data);
            var max_installments_without_interests = [0,0];
            var max_installments_with_interests = [0,0];
            $.each(variant_installments, function(payment_method, installments) {
                $.each(installments, function(number_of_installment, installment_data) {
                    max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                    max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                    var installment_container_selector = '#installment_' + payment_method + '_' + number_of_installment;
                    installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
                });
            });
            var $installments_container = $('.installments.max_installments_container .max_installments');
            var $installments_modal_link = $('#button-installments');

            var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

            if(installments_to_use[0] <= 1 ) {
                $installments_container.hide();
            } else {
                $installments_container.show();
                installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
            }
        }

        if (variant.price_short){
            parent.find('#price_display').text(variant.price_short).show();
        } else {
            parent.find('#price_display').hide();
        }

        if (variant.compare_at_price_short){
            parent.find('#compare_price_display').text(variant.compare_at_price_short).show();
        } else {
            parent.find('#compare_price_display').hide();
        }

        if(variant.contact) {
            parent.find('.social-container-box').hide();
        } else {
            parent.find('.social-container-box').show();
        }

        var button = parent.find('.addToCart');
        button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
        var $shipping_calculator_form = $("#shipping-calculator-form");
        if (!variant.available){
            button.val('{{ settings.out_of_stock_text | escape('js') }}');
            button.addClass('nostock');
            button.attr('disabled', 'disabled');
            $shipping_calculator_form.hide();
        } else if (variant.contact) {
            button.val('{{ "Consultar precio" | translate }}');
            button.addClass('contact');
            button.removeAttr('disabled');
            $shipping_calculator_form.hide();
        } else {
            button.val('{{ "Agregar al carrito" | translate }}');
            button.addClass('cart');
            button.removeAttr('disabled');
            $shipping_calculator_form.show();
        }
        {% endif %}
    }

    $(document).ready(function() {

          LS.registerOnChangeVariant(function(variant){
           // this is used on quick shop modals
           var current_image = $('img', '#quick'+variant.product_id);
           current_image.attr('src', variant.image_url);
           // this is used on single product view
           $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
          });

         // Controlamos que si pulsamos escape se cierre el div
        $(document).keyup(function(event){
            if(event.which==27) {
                $(".busqueda").removeClass('in');
            }
        });

        function centerImage(container) {
            var imageHeight = container.find('img').height();
            wrapperHeight = container.height();
            overlap = (wrapperHeight - imageHeight) / 2;
            container.find('img').css('margin-top', overlap);
        }

        $(window).on("load resize", function() {centerImage($('.image-wrap'));});

        $('.image-wrap').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',
            function() {
                centerImage($(this));
            }
        );

        $('.toggle-submenu').mouseover(function() {
            var $elem = $(this);
            $submenu = $elem.hasClass('navbar-submenu') ? $elem : $elem.siblings('.navbar-submenu');
            $submenu.show();
        }).mouseout(function() {
            var $elem = $(this);
            $submenu = $elem.hasClass('navbar-submenu') ? $elem : $elem.siblings('.navbar-submenu');
            $submenu.hide();
        });

        $('#product_form').submit(function(){
            var button = $(this).find(':submit');

            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
        });

        {% if contact and contact.success %}
            {% if contact.type == 'newsletter' %}
                var $newsletter = $('#newsletter');
                $newsletter.find('form').hide();
                $newsletter.find('.title').hide();
                $newsletter.find('#ofertas').hide();
                ga_send_event('contact', 'newsletter', 'standard');
            {% elseif contact.type == 'contact'%}
                ga_send_event('contact', 'contact-form');
            {% endif %}
        {% endif %}

        $("#tS3").thumbnailScroller({
            scrollerType:"clickButtons",
            scrollerOrientation:"vertical",
            scrollEasing:"easeOutCirc",
            scrollEasingAmount:600,
            acceleration:4,
            scrollSpeed:800,
            noScrollCenterSpace:10,
            autoScrolling:0,
            autoScrollingSpeed:2000,
            autoScrollingEasing:"easeInOutQuad",
            autoScrollingDelay:500
        });

        $("#shipping-zipcode").keydown(function(e) {
            var key = e.which ? e.which : e.keyCode;
            var enterKey = 13;
            if (key === enterKey) {
                e.preventDefault();
                $("#calculate-shipping-button").click();
            }
        });

        var $calculator = $("#shipping-calculator");
        var $loading = $calculator.find(".loading");
        $("#calculate-shipping-button").click(function () {
            var params = {'zipcode': $("#shipping-zipcode").val()};
            var variant = $("#shipping-variant-id");
            if(variant.length) {
                params['variant_id'] = variant.val();
            }
            $loading.show();
            $("#invalid-zipcode").hide();
            $.post('{{store.shipping_calculator_url | escape('js')}}', params, function (data) {
                $loading.hide();
                if (data.success) {
                    $("#shipping-calculator-response").html(data.html);
                    $("#shipping-calculator-form, #shipping-calculator-response").toggle();
                } else {
                    $("#invalid-zipcode").show();
                }
            }, 'json');
            return false;
        });
        $loading.hide();

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

        $("#show-filters").click(function(){
            $("#toggle-filters").slideToggle(800);
            });
            $(".mobile-filters").click(function(){
                $(this).toggleClass("dropdown-selected");
        });

        {% if store.address %}
            $('#google-map').gmap3({
                getlatlng:{
                    address: "{{ store.address | escape('js') }}",
                    callback: function(results) {
                        if ( !results ) return;
                        var storeLocation = results[0].geometry.location;
                        $('#google-map').gmap3({
                            map: {
                                options: {
                                    zoom: 14,
                                    center: storeLocation
                                }
                            },
                            marker: {
                                address: "{{ store.address | escape('js') }}"
                            }
                        });
                    }
                }
            });
        {% endif %}

        var $alert = $(".alert:first");
        if($alert.length) {
            $('html,body').animate({scrollTop:$alert.offset().top}, 400);
        }
    });
</script>
{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
    <script type="text/javascript">
        $(function() {
            new LS.infiniteScroll({
                afterSetup: function() {
                    $('.crumbPaginationContainer').hide();
                },
                finishData: function() {
                    $('#loadMoreBtn').remove();
                },
                productGridClass: 'product-table',
                productsPerPage: 12
            });
        });
    </script>
{% endif %}

{% if template == 'product' %}
<script type="text/javascript">
    $('.product-share-button').click(function(){
        ga_send_event('social-sharing-product', $(this).data('network'))
    });
</script>
{% endif %}

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
            $("#go-to-checkout").prop( "disabled", true ); 
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

{% if store.live_chat %}
    <!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
    window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
    /* custom configuration goes here (www.olark.com/documentation) */
    olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/
</script>
<!-- end olark code -->
{% endif %}
{{ store.assorted_js | raw }}
</body>
</html>
