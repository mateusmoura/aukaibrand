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
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
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

    <!-- bootstrap.css + bootstrap-responsive.css + fancybox/jquery.fancybox.css + js/pushy/pushy.css + js/bxslider/jquery.bxslider.css -->
    {{ 'vendor.css' | static_url | css_tag }}

    {{ '//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css' | css_tag }}
	{{ '//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700|Open+Sans:400,300,700|Slabo+27px|Oswald:400,300,700|Lora:400,700|Roboto+Condensed:400italic,700italic,300,400,700|Droid+Sans:400,700' | css_tag }}

    {{ 'style.css' | static_url | css_tag }}
	{{ 'custom.css.tpl' | static_url | css_tag }}
    {{ 'main-color.scss.tpl' | static_url | css_tag }}
    {{ 'media-style.css' | static_url | css_tag }}

	{% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}

    {% if params.preview %}
        {{ 'js/instatheme.js' | static_url | script_tag }}
    {% endif %}

    {% head_content %}

	<!--[if lte IE 7]>
		{{ "ie.css" | static_url | css_tag }}
	<![endif]-->
    <!--[if lt IE 9]>
        {{ "html5shiv-printshiv.js" | static_url | script_tag }}
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

<!-- Pushy Menu -->
<nav class="pushy pushy-left">
    <ul>
        {% snipplet "navigation-mobile.tpl" %}
        
    </ul>
</nav>
<!-- Site Overlay -->
<div class="site-overlay"></div>
<div id="container">
<div class="container">
    <header>
        <div class="utilities-nav">
            <div class="mobile mobile-nav {% if languages | length > 1 %}mobile-nav-lang{% endif %}">
                <div class="menu-btn"><i class="fa fa-bars"></i></div>            
            </div>
            <div class="mobile-cart-container">
                {% if languages | length > 1 %}
                    <div class="languages">
                    {% for language in languages %}
                                {% set class = language.active ? "active" : "" %}
                                <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                    {% endfor %}
                    </div>
                {% endif %}
                {% if store.has_accounts %}
                    <div id="auth">
                        {% if not customer %}
                            {% if 'mandatory' not in store.customer_accounts %}
                            {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                            {% endif %}
                            {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                        {% else %}
                            {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                            {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                        {% endif %}
                    </div>
                {% endif %}
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3 search-wr">
                <div class="searchbox">
                    <form action="{{ store.search_url }}" method="get">
                        <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                        <input class="submit-button" type="submit" value=""/>
                    </form>
                </div>
            </div>
            <div class="span6 logo-wr">
                {% if template == 'home' %}
                    {% if has_logo %}
                        <h1 class="img logo">
                            {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        </h1>
                        <div id="no-logo-wrapper" class="hidden">
                            <div id="logo">
                                <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        </div>
                    {% else %}
                        <div class="img logo hidden">
                            {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        </div>
                        <h1 id="no-logo-wrapper">
                            <div id="logo">
                                <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        </h1>
                    {% endif %}
                {% else %}
                    <div class="img logo {% if not has_logo %}hidden{% endif %}">
                        {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                    </div>
                     <div id="no-logo-wrapper" {% if has_logo %}class="hidden"{% endif %}>
                        <div id="logo">
                            <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
                        </div>
                    </div>
                {% endif %}
            </div>
            <div class="span3">
                {% if languages | length > 1 %}
                    <div class="languages cart-desktop">
                        {% for language in languages %}
                            {% set class = language.active ? "active" : "" %}
                            <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                        {% endfor %}
                    </div>
                {% endif %}
                {% if not store.is_catalog and template != 'cart' %}
                    {% if settings.ajax_cart %}
                        {% snipplet "cart_ajax.tpl" as "cart" %}
                    {% else %}
                        {% snipplet "cart.tpl" as "cart" %}
                    {% endif %}
                {% endif %}
                {% if store.has_accounts %}
                    <div id="auth" class="cart-desktop">
                        {% if not customer %}
                            {% if 'mandatory' not in store.customer_accounts %}
                            {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                            {% endif %}
                            {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                        {% else %}
                            {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                            {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                        {% endif %}
                    </div>
                {% endif %}
            </div>
        </div>
        <div id="navigation">
            <ul id="menu" class="sf-menu">
                {% snipplet "navigation.tpl" %}
            </ul>
        </div>
    </header>
    {% template_content %}
</div>
{% if settings.banner_services %}
<div class="container serv-cont">
    <div class="banner-services-footer">
         {% include 'snipplets/banner-services.tpl' %}
     </div>
 </div>    
{% endif %}
<div id="wrapper-foot">
    <div class="container">
        {% if not has_products %}
            {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
           {% snipplet "defaults/show_help_footer.tpl" %}
        {% else %}
        <div class="row-fluid">
            {% set has_shipping_logos = settings.shipping %}
            {% set has_payment_logos = settings.payments %}
            {% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
            <div class="span{{ has_shipping_payment_logos ? 2 : 3 }} responsive-inline">
                <div class="col-foot">
                    <h4>{{ "Navegación" | translate }}</h4>
                    {% snipplet "navigation-foot.tpl" %}
                </div>
            </div>
            <div class="span{{ has_shipping_payment_logos ? 2 : 3 }} responsive-inline">
                <div class="col-foot">
                    <h4>{{ "Redes Sociales" | translate }}</h4>
                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                        {% set sn_url = attribute(store,sn) %}
                        {% if sn_url %}
                            <a href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                        {% endif %}
                    {% endfor %}
                </div>
                 <div class="col-foot">
                    <h4>{{ settings.news_message }}</h4>
                    {% snipplet "newsletter.tpl" %}
                </div>
            </div>
            {% if has_shipping_payment_logos %}
                <div class="span3">
                    {% if has_payment_logos %}
                        <div class="col-foot">
                            <h4>{{ "Medios de pago" | translate }}</h4>
                            {% for payment in settings.payments %}
                                {{ payment | payment_logo | img_tag('', {'height' : 20}) }}
                            {% endfor %}
                        </div>
                    {% endif %}
                    {% if has_shipping_logos %}
                        <div class="col-foot">
                            <h4>{{ "Formas de envío" | translate }}</h4>
                            {% for shipping in settings.shipping %}
                                {{ shipping | shipping_logo | img_tag('', {'height' : 20}) }}
                            {% endfor %}
                        </div>
                    {% endif %}
                </div>
            {% endif %}
            <div class="{% if not (store.afip or ebit or settings.custom_seal_code or "seal_img.jpg" | has_custom_image ) %}span5{% else %}span3{% endif %}">
                <div class="col-foot contact-data">
                    <h4>{{ "Contactanos" | translate }}</h4>
                    {% if store.phone %}
                        <li><i class="fa fa-phone"></i>{{ store.phone }}</li>
                    {% endif %}
                    {% if store.email %}
                        <li><i class="fa fa-envelope"></i>{{ store.email | mailto }}</li>
                    {% endif %}
                    {% if store.blog %}
                        <li><i class="fa fa-comments"></i><a target="_blank" href="{{ store.blog }}">{{ "Visita nuestro Blog!" | translate }}</a></li>
                    {% endif %}
                    {% if store.address %}
                        <li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
                    {% endif %}
                </div>
            </div>
            {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                <div class="span2 seals">
                    <div class="col-foot">
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
                </div>
            {% endif %}
        </div>   
        {% endif %}  
    </div>
</div>
<div id="wrapper-legal">
    <div class="container">
        <div class="row-fluid">
            <div class="span6">
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
                    {{ new_powered_by_link }}
                </div>
            </div>
            <div class="span6">
                <div class="copyright">
                    {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- bootstrap.min.js + hoverIntent.js + superfish.js + supersubs.js + cloud-zoom.1.0.2.min.js + js/bxslider/jquery.bxslider.min.js + fancybox/jquery.fancybox.pack.js + js/pushy/pushy.js -->
{{ 'vendor.js' | static_url| script_tag }}
{{ 'js/jquery.livequery.min.js' | static_url | script_tag }}

<script type="text/javascript">
    {% if settings.show_news_box %}
    $('#newsletter-popup').submit(function(){
        $(".loading-modal").show();
        $("#newsletter-popup .btn").prop("disabled", true);
        ga_send_event('contact', 'newsletter', 'popup');
    });
    LS.newsletter('#newsletter-popup', '#newsModal', '{{ store.contact_url | escape('js') }}', function(response){
        $(".loading-modal").hide();
        var selector_to_use = response.success ? '.contact-ok' : '.contact-error';
        $(this).find(selector_to_use).fadeIn( 100 ).delay( 1300 ).fadeOut( 500 );
        if($("#newsletter-popup .contact-ok").css("display") == "block"){
            setTimeout(function()
                { $("#newsModal").modal('hide'); }, 2500);
        }else{
            {# nothing happens here #}
        }
        $('#newsletter-popup input[type="text"]').val('');
        $("#newsletter-popup .btn").prop("disabled", false);
    });

    $(document).ready(function(){ 
        LS.newsletterPopup();
    });
    {% endif %}

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
        $("#single-product .shipping-calculator-response").hide();
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
            $("#single-product .shipping-calculator-form").hide();
		} else if (variant.contact) {
			button.val('{{ "Consultar precio" | translate }}');
			button.addClass('contact');
			button.removeAttr('disabled');
            $("#single-product .shipping-calculator-form").hide();
		} else {
			button.val('{{ "Agregar al carrito" | translate }}');
			button.addClass('cart');
			button.removeAttr('disabled');
            $("#single-product .shipping-calculator-form").show();
		}
        {% endif %}
	}
	
	$(document).ready(function(){

        {% if settings.ajax_cart %}
        $(document).on("click", ".js-addtocart", function(e) {
            if(!$(this).hasClass('contact')) {
                e.preventDefault();
                $prod_form = $(this).closest("form");
                LS.addToCart(
                    $prod_form, 
                    '{{ "Agregar al carrito" | translate }}', 
                    '{{ "Agregando..." | translate }}', 
                    '{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}' );
            }
        });
        $(document).on("click", ".js-toggleCart", function(e) {
            e.preventDefault();
            LS.toggleCart();
        });
        $('input.shipping-method:checked').livequery(function(){ 
            var shippingPrice = $(this).attr("data-price");     
            LS.addToTotal(shippingPrice);
        }); 
        $(document).on( "click", "input.shipping-method", function() {
            var elem = $(this);
            var shippingPrice = elem.attr("data-price");
            elem.click(function() {
                LS.addToTotal(shippingPrice);               
            });
        });
        {% endif %}

        LS.registerOnChangeVariant(function(variant){
            // this is used on quick shop modals
            var current_image = $('img', '#quick'+variant.product_id);
            current_image.attr('src', variant.image_url);
            // this is used on single product view
            $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
        });

        $('#menu').supersubs({
            minWidth:    8,
            maxWidth:    40,
            extraWidth:  1.3
        }).superfish({
            autoArrows: false,
            dropShadows: false,
            speed: 'fast',
            delay: 500
        });
        
        $('#menu a').bind('touchstart', function(e){
            var li = $(this).parent('li');
            if(li.find('ul a').length > 0){
		        e.preventDefault();
		        
		        if (! li.hasClass('sfHover')){
		            li.showSuperfishUl().siblings().hideSuperfishUl();
		        } else {
		            li.hideSuperfishUl();
		        }
		        
		        return false;
		    }
		});

        $('#menu a[href=#]').click(function(e){
            e.preventDefault();
		    return false;
		});

        window.homeSlider = {
            getSliderConfiguration: function() {
                return {
                    //JS For home slider Preloader - hides the images until loaded
                    onSliderLoad: function(){
                        $("#slider").css("visibility", "visible");
                        $(".bx-wrapper img").css("visibility", "visible");
                        $(".slider-wrapper .fa-refresh").hide();
                      },
                    pause: 5000,
                    autoHover: true,
                    adaptiveHeight: false
                };
            },
            getAutoRotation: function() {
                return {% if settings.slider_auto %}true{% else %}false{% endif %};
            },
            create: function() {
                var config = this.getSliderConfiguration();
                config.auto = this.getAutoRotation() && this.get$Element().children().size() > 1;
                this._instance = this.get$Element().bxSlider(config);
                return this;
            },
            getInstance: function() {
                return this._instance;
            },
            get$Element: function() {
                return $('.homeslider');
            },
            get$Wrapper: function() {
                return $('.slider-wrapper');
            }
        };
        window.homeSlider.create();

        {% if settings.slider | length == 1 %}
            $('.bx-pager').remove();
        {% endif %}

        $('#product_form').submit(function(){
            var button = $(this).find(':submit');

            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
        });
        $('.fancybox').fancybox();

        {% if contact and contact.success %}
            {% if contact.type == 'newsletter' %}
                $('#newsletter form').hide();
                $('#newsletter .title').hide();
                $('#newsletter #ofertas').hide();
                ga_send_event('contact', 'newsletter', 'standard');
            {% elseif contact.type == 'contact' %}
                ga_send_event('contact', 'contact-form');
            {% endif %}
        {% endif %}

        {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}


        $("input.shipping-zipcode").keydown(function(e) {
            var key = e.which ? e.which : e.keyCode;
            var enterKey = 13;
            if (key === enterKey) {
                e.preventDefault();
                $(this).parent().find(".calculate-shipping-button").click();
            }
        });

        $(".calculate-shipping-button").click(function(e) {
            e.preventDefault();
            LS.calculateShippingAjax(
                $(this).parent().find("input.shipping-zipcode").val(), 
                '{{store.shipping_calculator_url | escape('js')}}',
                $(this).closest(".shipping-calculator") );
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

        $("#show-filters").click(function(){
            $("#toggle-filters").slideToggle(800);
            });
            $(".mobile-filters").click(function(){
                $(this).toggleClass("dropdown-selected");
            });
    	});

</script>

{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
<script type="text/javascript">
    $(function() {
        new LS.infiniteScroll({
            afterSetup: function() {
                $('.crumbPaginationContainer').hide();
            },
            productGridClass: 'product-table',
            finishData: function() {
                    $('#loadMoreBtn').remove();
                },
			productsPerPage: 12
        });
    });
</script>
{% endif %}
{% if template == 'home' %}
    <script type="text/javascript">
    var categoriesList = $("#categories-list li");

    if (categoriesList.length > 10) {
        $("#show-more-cats").show(); 
        for (i = 10; i < categoriesList.length; i++) { 
            $(categoriesList[i]).hide();
        }
    }

    $("#show-more-cats").click(function(e){
        e.preventDefault();
        for (i = 10; i < categoriesList.length; i++) { 
            $(categoriesList[i]).toggle();
        }
        $(this).find("i").toggleClass("fa-angle-up fa-angle-down");
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

{% if template == 'product' %}
{{ "js/jquery-ui-1.8.13.custom.min.js" | static_url | script_tag }}
{{ "js/jquery.thumbnailScroller.js" | static_url | script_tag }}
<script type="text/javascript">
$(document).ready(function(){
     slider = $('#productbxslider').bxSlider({
        nextText:'<i class="fa fa-chevron-right"></i>',
        prevText:'<i class="fa fa-chevron-left"></i>',
    
    });
    {% if product.images_count > 1 %}
    LS.registerOnChangeVariant(function(variant){
        var liImage = $('#productbxslider').find("[data-image='"+variant.image+"']");
        var selectedPosition = liImage.data('image-position');
        var slideToGo = parseInt(selectedPosition);
        slider.goToSlide(slideToGo);
    });
    {% endif %}
     if ($("#compare_price_display").css("display") == "none") {
        $(".offer-product").hide();
    }
    else {
        $(".offer-product").show();
    }
    $("#product_form select").change(function(){
        if ($("#compare_price_display").css("display") == "none") {
            $(".offer-product").hide();
        }
        else {
            $(".offer-product").show();
        }
    });

    $('.product-share-button').click(function(){
        ga_send_event('social-sharing-product', $(this).data('network'))
    });

    (function($){
        window.onload=function(){
            $("#tS3").thumbnailScroller({
                scrollerType:"hoverAccelerate",
                scrollerOrientation:"vertical",
                acceleration:0,
                noScrollCenterSpace:100,
                autoScrolling:0,
                autoScrollingSpeed:2000,
                autoScrollingEasing:"easeInOutQuad",
                autoScrollingDelay:500
            });
        }
    })(jQuery);
    });
</script>
{% endif %}
<script>
$( document ).ready(function() {

    //Hamburguer Menu Javascript
    $(".mobile-dropdown").click(function(){
        $(this).next("#accordion").slideToggle(300);
        $(this).toggleClass("dropdown-selected");
    });
    
});
</script>
<script type="text/javascript">
    $(document).ready(function(){ 
        {# 404 handling to show the example product #}
        if ( window.location.pathname === "/product/example/" ) {
            document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
            $("#404").hide();
            $("#product-example").show();
        } else {
            $("#product-example").hide();
        }
    });
</script>
{% if store.live_chat %}
<!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
/* custom configuration goes here (www.olark.com/documentation) */
olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/</script>
<!-- end olark code -->
{% endif %}
{{ store.assorted_js | raw }}
</body>
</html>
