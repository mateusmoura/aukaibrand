<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'GA_TRACKING_ID');
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    <meta name="google-site-verification" content="5rDVbicVR5vmRgNGmjVm3DAFGYzV0qsH6MzTAhJ112o" />
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
    {# Watch out before upgrading bootstrap as these files have some custom changes #}
    {#
    {{ 'css/bootstrap.css' | static_url | css_tag }}
    {{ 'css/bootstrap-responsive.css' | static_url | css_tag }}
    {{ '//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css' | css_tag }}
    #}
    {{ 'js/pushy/pushy.css' | static_url | css_tag }}
    {#
    {{ 'css/style.css' | static_url | css_tag }}
    
    {{ 'css/main-color.scss.tpl' | static_url | css_tag }}

    #}

    {{ '//fonts.googleapis.com/css?family=Roboto:300,400,700' | css_tag }}
    {{ '//fonts.googleapis.com/css?family=Cinzel:400,700,900' | css_tag }}
    
    {% set nojquery = true %}
    {{ "//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}

    <!-- NOVO SITE -->
    {{ '//use.fontawesome.com/releases/v5.0.10/css/all.css' | css_tag }}
    {{ 'css/new/animate.css' | static_url | css_tag }}

    {{ 'css/new/style.css' | static_url | css_tag }}

        <!-- javascript -->

        {{ 'js/new/bootstrap/bootstrap.bundle.min.js' | static_url | script_tag }}
        {{ 'js/new/plugins/jquery.mb.YTPlayer.js' | static_url | script_tag }}
        {{ 'js/new/base.js' | static_url | script_tag }}

    <link href="{{ 'images/new/favicon.png' | static_url }}" rel="shortcut icon">
    <!-- FIM NOVO SITE -->

    {% if params.preview %}
        {{ 'js/instatheme.js' | static_url | script_tag }}
    {% endif %}

    {% head_content %}
    <!--[if lte IE 7]>
    {{ "css/ie.css" | static_url | css_tag }}
    <![endif]-->
    <!--[if lt IE 9]>
    {{ "js/html5shiv-printshiv.js" | static_url | script_tag }}
    <![endif]-->

    <style>
        {{ settings.css_code | raw }}
    </style>
</head>

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
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
    {{ back_to_admin }}

    {# start main content #}
        <!-- Site Overlay -->
        <div class="site-overlay"></div>


        <div class="container-wrapper">
            <!--  FREE SHIPPING & RETURNS* -->
            {% snipplet "free-shipping-returns.tpl" %}

            <!-- INICIO DO NOVO LAYOUT -->
            {% snipplet "navigation-mobile.tpl" %}

            <!-- HEADER -->
            <header class="header">
                <div class="header__content">
                    {% if template == 'home' %}
                        {% if has_logo %}
                            <h1 class="img logo">
                                {# {{ store.logo  | img_tag(store.name) | a_tag(store.url)}} #}
                                <img class="logo-preta animated" src="{{ 'images/new/aukai_logo.png' | static_url }}" alt="Aukai Brand" />
                                <img class="logo-preta-2 animated" src="{{ 'images/new/aukai_logo-2.png' | static_url }}" alt="Aukai Brand" />
                                <img class="logo-branca" src="{{ 'images/new/aukai_logo-branca.png' | static_url }}" alt="Aukai Brand" />
                            </h1>
                            <div id="no-logo-wrapper" class="hidden">
                                <div class="logo text-only">
                                    <a href="{{ store.url }}">{{ store.name }}</a>
                                </div>
                            </div>
                        {% else %}
                            <div class="img logo hidden">
                                {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                            </div>
                            <h1 id="no-logo-wrapper">
                                <div class="logo text-only">
                                    <a href="{{ store.url }}">{{ store.name }}</a>
                                </div>
                            </h1>
                        {% endif %}
                    {% else %}  
                        <div class="img logo {% if not has_logo %}hidden{% endif %}">
                            {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                        </div>
                        <div id="no-logo-wrapper" {% if has_logo %}class="hidden"{% endif %}>
                            <div class="logo text-only">
                                <a href="{{ store.url }}">{{ store.name }}</a>
                            </div>
                        </div>
                    {% endif %}

                    {% snipplet "navigation.tpl" %}

                    <div class="options">
                        <div class="options__nav">
                            <a href="/"><i class="fas fa-bars"></i></a>
                        </div>
                        <div class="options__search">
                            <a href="/"><i class="fas fa-search"></i></a>
                        </div>
                        <div class="options__account">
                            {% if store.has_accounts %}
                                <!-- <div class="options__account--menu"> -->
                                    {% if not customer %}
                                        {#
                                        {% if 'mandatory' not in store.customer_accounts %}
                                            {{ "Cadastre-se" | translate | a_tag(store.customer_register_url) }} <span class="divider">-</span>
                                        {% endif %}
                                        {{ "Login" | translate | a_tag(store.customer_login_url) }}
                                        #}

                                        <a href="{{ store.customer_login_url }}"><i class="far fa-user"></i></a>
                                    {% else %}
                                        {#
                                            {{ "Minha conta" | translate | a_tag(store.customer_home_url) }} <span class="divider">-</span>
                                            {{ "Sair" | translate | a_tag(store.customer_logout_url) }}
                                        #}

                                        <a href="{{ store.customer_home_url }}"><i class="far fa-user"></i></a>
                                    {% endif %}
                                <!-- </div> -->
                            {% endif %}
                        </div>
                        <div class="options__minicart">
                            <div class="cart-snipplet">
                                {% if not store.is_catalog and template != 'cart' %}
                                    {% if settings.ajax_cart %}
                                        {% snipplet "cart_ajax.tpl" as "cart" %}
                                    {% else %}
                                        {% snipplet "cart.tpl" as "cart" %}
                                    {% endif %}
                                {% endif %}
                            </div>
                        </div>

                        {% if languages | length > 1 %}
                            <div class="options__language">
                                <div class="languages">
                                    {% for language in languages %}
                                        {% set class = language.active ? "active" : "" %}
                                        <a href="{{ language.url }}" class="{{ class }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
                                    {% endfor %}
                                </div>
                            </div>
                        {% endif %}
                    </div>
                </div>

                <div class="header__search">
                    <button type="button" class="btn btn-close">
                        <i class="fas fa-times"></i>
                    </button>

                    <form action="{{ store.search_url }}" method="get">
                        <input class="field-search" type="text" name="q" placeholder="{{ 'buscar' | translate }}"/>
                    </form>
                </div>
            </header>

            <main>
                {% template_content %}
            </main>

            <!-- FOOTER -->
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-4 footer__order-4">
                            <div class="footer__social">
                                <ul>
                                    <li>
                                        <a href="/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    </li>
                                    <li>
                                        <a href="/" target="_blank"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li>
                                        <a href="/" target="_blank"><i class="fab fa-pinterest-p"></i></a>
                                    </li>
                                </ul>
                            </div>

                            <div class="footer__newsletter">
                                <span class="subheader">{{ "Siga as últimas tendências, vendas e estilos" | translate }}</span>
                                {# {% if settings.news_txt %}
                                    <p>{{ settings.news_txt }}</p>
                                {% endif %} #}

                                {% snipplet "newsletter.tpl" %}
                            </div>

                            <div class="copyright-2">
                                <span>{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</span>
                            </div>
                        </div>
                    
                        <div class="col-12 col-lg-3 footer__order-1">
                            <div class="footer__info">
                                <h4>Aukai Journey</h4>
                        
                                <div class="footer__info-text">
                                    <p>{{ "Explore o mundo Aukai" | translate }}</p>
                                </div>
                        
                                <div class="footer__info-link">
                                    {% snipplet "footer/link-journey.tpl" %}
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-12 col-lg-3 footer__order-2">
                            <div class="footer__menus">
                                {% snipplet "footer/menu-informacoes.tpl" %}
                            </div>
                        </div>

                        <div class="col-12 col-lg-2 footer__order-3">
                            <div class="footer__menus">
                                {% snipplet "footer/menu-sobre.tpl" %}
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="copyright">
                                <span>{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</span>
                                {% if not show_help %}
                                    {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                                        <div class="seals row">
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
                                    {% endif %}
                                {% else %}                     
                                <div class="seals row" {% if store.country == 'BR' and not (store.afip or ebit) %}data-tooltip="Esses são selos de exemplo"{% endif %}>
                                        {% if store.country == 'AR' %}
                                            <div class="afip">
                                                <img src="http://www.afip.gob.ar/images/f960/DATAWEB.jpg" border="0">
                                            </div>
                                        {% endif %}
                                        {% if store.country == 'BR' %}
                                            <div class="ebit">
                                                {{ "images/ebit-exemplo.png" | static_url | img_tag }}
                                            </div>
                                        {% endif %}
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>


        <div class="loading">
            <div>
                {{ 'images/new/favicon.png' | static_url | img_tag }}
            </div>
        </div>


        <!-- FIM DO NOVO LAYOUT -->

        <!-- LAYOUT ANTIGO -->


        <!-- <div class="banner-services-footer">
            {% if settings.banner_services %}
                {% include 'snipplets/banner-services.tpl' %}
            {% endif %}
        </div> -->
        <!-- {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
            <div id="wrapper-social">
                <div class="row-fluid">
                    <div class="container">
                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <a class="soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }} fa-4x"></i></a>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            </div>
        {% elseif show_help  %}
            {% snipplet "defaults/show_help_social.tpl" %}
        {% endif %} -->

        <!-- {% if store.phone or store.address or store.blog %}
            <div class="span3">
                <span class="subheader">{{ "Datos de contacto" | translate }}</span>
                <ul class="foot-nav">
                    {% if store.phone %}
                        <li><strong>{{ store.phone }}</strong></li>
                    {% endif %}
                    {% if store.address %}
                        <li>{{ store.address }}</li>
                    {% endif %}
                    {% if store.blog %}
                        <li class="blog"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                    {% endif %}
                    {% if store.email %}
                        <li class="email">{{ store.email | mailto }}</li>
                    {% endif %}
                </ul>
            </div>
        {% endif %} -->


       <!-- {% if settings.payments or settings.shipping %}
            <div id="wrapper-pay">
                <div class="row-fluid">
                    <div class="container">
                        <div class="span8">
                            <div class="payments">
                                {% for payment in settings.payments %}
                                    {{ payment | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                                {% endfor %}
                            </div>
                        </div>
                        <div class="span4">
                            <div class="shipping">
                                {% for shipping in settings.shipping %}
                                    {{ shipping | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {% else %}
            {% if not has_products %}
            {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
            {% snipplet "defaults/show_help_footer.tpl" %}
            {% endif %}
        {% endif %} -->


        <div id="wrapper-legal">
            <div class="row-fluid">
                <div class="container">
                    <div class="span6">
                        <div class="powered-by">
                            {#
                            La leyenda que aparece debajo de esta linea de código debe mantenerse
                            con las mismas palabras y con su apropiado link a Tienda Nube;
                            como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                            Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                            tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                            Os créditos que aparecem debaixo da linha de código deverá ser mantida com as mesmas
                            palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                            http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                            e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                            manter visivél e com um link funcionando.
                            #}
                            {{ new_powered_by_link }}
                        </div>
                    </div>
                    <div class="span6">
                        
                    </div>
                </div>
                <!-- <div class="top-page">
                    {{ "Subir" | translate }} ^
                </div> -->
            </div>
        </div>

    {{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js' | script_tag }}
    {% set gmap_url = "//maps.googleapis.com/maps/api/js?language=#{current_language.lang}" ~ (store.gmap_api_key and store.can_show_google_map ? "&key=#{store.gmap_api_key}" : "") %}
    {{ gmap_url | script_tag }}
    {{ 'js/luxury.js' | static_url | script_tag }}
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
        var selector_to_use = response.success ? '.alert-success' : '.alert-error';
        $(this).find(selector_to_use).fadeIn( 100 ).delay( 1300 ).fadeOut( 500 );
        if($("#newsletter-popup .alert-success").css("display") == "block"){
            setTimeout(function()
                { $("#newsModal").modal('hide'); }, 2500);
        }else{
            {# nothing happens here #}
        }
        $('#newsletter-popup input[type="email"]').val('');
        $("#newsletter-popup .btn").prop("disabled", false);

    });

    $(document).ready(function(){
        LS.newsletterPopup();
    });

    {% endif %}

    var fancybox_options = {
        padding: 15,
        maxWidth  : "90%",
        fitToView   : false,
        helpers: {
            overlay: {
                locked: false
            }
        }
    };

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
        //Hamburguer Menu Javascript
        $(".mobile-dropdown").click(function(){
            $(this).next("#accordion").slideToggle(300);
            $(this).toggleClass("dropdown-selected");
        });
        window.homeSlider = {
            getSliderConfiguration: function() {
                return {
                    //JS For home slider Preloader - hides the images until loaded
                    onSliderLoad: function(){
                        $(".homeslider img").css("visibility", "visible");
                        $(".slider-wrapper .fa-circle-o-notch").hide();
                    },
                    pause: 5000,
                    autoHover: true,
                    adaptiveHeight: false,
                    nextText:'<i class="fa fa-chevron-right"></i>',
                    prevText:'<i class="fa fa-chevron-left"></i>',
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

        LS.registerOnChangeVariant(function(variant){
            // this is used on quick shop modals
            var current_image = $('img', '.quick-content[data-product="'+variant.product_id+'"]');
            current_image.attr('src', variant.image_url);
            // this is used on single product view
            $(".cloud-zoom-gallery[data-image="+variant.image+"] > img").click();
        });

        $('.top-page').click(function(){
            $("html, body").animate({scrollTop:"0px"});
        });

        $('.goBack').click(function(){
            window.history.back();
        });
        $('#menu').supersubs({
            minWidth:    8,
            maxWidth:    40,
            extraWidth:  1.3
        }).superfish({
            autoArrows: false,
            cssArrows: false,
            dropShadows: false,
            speed: 'fast',
            delay: 500
        });

        

        $('#menu-slim').supersubs({
            minWidth:    8,
            maxWidth:    40,
            extraWidth:  1.3
        }).superfish({
            autoArrows: false,
            cssArrows: false,
            dropShadows: false,
            speed: 'fast',
            delay: 500
        });

        // Color variations - Used to select variants from colors/sizes squares
        $("a.insta-variations").click(function(e){
            e.preventDefault();
            $this = $(this);
            $this.parents("ul").find(".selected").removeClass("selected");
            $this.addClass("selected");

            var option_id = $this.data('option');
            $selected_option = $this.closest('.section__variantes').find('.variation-option option[value="'+option_id+'"]');
            $selected_option.prop('selected', true).trigger('change');

            $this.closest("[class^='variation']").find('.variation-label strong').html(option_id);
        });

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
        // Default shipping method listener
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

        $('#product_form').submit(function(){
            var button = $(this).find(':submit');

            button.attr('disabled', 'disabled');
            if (button.hasClass('cart')){
                button.val('{{ "Agregando..." | translate }}');
            }
        });
        var thumbnail_config_horizontal = {
            scrollerType:"clickButtons",
            scrollerOrientation:"horizontal",
            scrollEasing:"easeOutCirc",
            scrollEasingAmount:600,
            acceleration:4,
            scrollSpeed:800,
            noScrollCenterSpace:10,
            autoScrolling:0,
            autoScrollingSpeed:2000,
            autoScrollingEasing:"easeInOutQuad",
            autoScrollingDelay:500
        };
        var thumbnail_config_vertical = $.extend({}, thumbnail_config_horizontal, {scrollerOrientation:"vertical"});
        $("#tS1, #tS2").thumbnailScroller(thumbnail_config_horizontal);
        $("#tS3-recent, #tS3-offer, #tS3-coming").thumbnailScroller(thumbnail_config_vertical);



        $('.quick-content .span6').bxSlider({
            minSlides: 1,
            maxSlides: 1,
            slideMargin: 0
        });

        {% if settings.slider | length == 1 %}
            $('.bx-pager').remove();
        {% endif %}

        $('.fancybox').fancybox(fancybox_options);

        {% if contact and contact.success %}
            {% if contact.type == 'newsletter' %}
                var $newsletter = $('#newsletter');
                $newsletter.find('form').hide();
                $newsletter.find('.title').hide();
                $newsletter.find('#ofertas').hide();
                ga_send_event('contact', 'newsletter', 'standard');
            {% elseif contact.type == 'contact' %}
                ga_send_event('contact', 'contact-form');
            {% endif %}
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

        var jTwidth = $( "#tS1 .jTscrollerContainer" ).width();
        $("#tS1 .jTscrollerContainer").css("width", jTwidth + 20 )


        $('#gmap3').gmap3({
            marker:{
                address: "{{ store.address | escape('js')}}"
            },
            map:{
                options:{
                    zoom: 14
                }
            }
        });

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

        LS.instaFilterMobile();

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
                    bufferPx: 600,
                    productsPerPage: 16
                });
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
    {% if template == "product" %}
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
            $(".circle.offer").hide();
        }
        else {
            $(".circle.offer").show();
        }
        $("#product_form select").change(function(){
            if ($("#compare_price_display").css("display") == "none") {
                $(".circle.offer").hide();
            }
            else {
                $(".circle.offer").show();
            }
        });
        $('.product-share-button').click(function(){
            ga_send_event('social-sharing-product', $(this).data('network'))
        });
    });
    </script>
    {% endif %}
    {% if show_help %}
        {% snipplet "defaults/show_help_js.tpl" %}
    {% endif %}
    <script type="text/javascript">
        var maxHeight = 0;
        $('.wrap-banner, .wrap-banner-services').each(function(){
            maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
            });
        $('.wrap-banner, .wrap-banner-services').css("height", maxHeight);
    </script>
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
