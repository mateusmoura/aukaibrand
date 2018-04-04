<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    {{ '//fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic|Roboto+Condensed:400italic,700italic,300,400,700|Bree+Serif|Arimo:400,700|Open+Sans+Condensed:300,300italic,700|Open+Sans:400,300,700|Source+Sans+Pro:400,700|Slabo+27px|Oswald:400,300,700|Lora:400,700|Droid+Sans:400,700' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/bootstrap/2.3.1/css/bootstrap.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/bootstrap/2.3.1/css/bootstrap-responsive.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css' | css_tag }}
    {{ 'js/pushy/pushy.css' | static_url | css_tag }}
    {{ 'js/fancybox/jquery.fancybox.css' | static_url | css_tag }}
    {{ 'css/style.css' | static_url | css_tag }}
    {{ 'css/media-style.css' | static_url | css_tag }}
    {{ 'css/main-color.scss.tpl' | static_url | css_tag }}
    {% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}

    {% if params.preview %}
        {{ 'js/instatheme.js' | static_url | script_tag }}
    {% endif %}

    {% head_content %}
    <!--[if lte IE 7]>
        {{ "css/ie.css" | static_url | css_tag }}
    <![endif]-->
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

        <!-- Pushy Menu -->
    <nav class="pushy pushy-left">
        <ul>
            {% snipplet "navigation-mobile.tpl" %}
        </ul>
    </nav>
        
    <!-- Site Overlay -->
    <div class="site-overlay"></div>
    <!-- Pushy push object -->
    <div id="container">
    <div class="wrapper" id="topper">
        <div class="container-fluid">
            <div class="row-fluid">
                {% if store.has_accounts %}
                    <div id="auth" class="auth-mobile">
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
                <div class="span3">
                    <div class="mobile mobile-nav {% if languages | length > 1 %}mobile-nav-lang{% endif %}">
                        <div class="menu-btn"><i class="fa fa-bars"></i></div>            
                    </div>
                    <div class="searchbox">
                        <form action="{{ store.search_url }}" method="get">
                            <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                            <input class="submit-button" type="submit" value="" /><i class="fa fa-search"></i>
                        </form>
                    </div>
                </div>
                <div class="span6">
                {% if store.has_accounts %}
                    <div id="auth" class="auth-desktop">
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
                {% if languages | length > 1 %}
                <div class="span2 lang-container">
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
    </div>
    <div class="wrapper" id="header">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span11">
                    {% if template == 'home' %}
                        <h1 class="{% if has_logo %}img logo{% else %}no-logo{% endif %}">
                    {% endif %}
                        <div id="logo" class="img {% if not has_logo %}hidden{% endif %}">
                            {{ store.logo | img_tag | a_tag(store.url) }}
                        </div>
                        <a id="no-logo" class="{% if has_logo %}hidden{% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                    {% if template == 'home' %}
                        </h1>
                    {% endif %}

                    <div id="navigation">
                        <ul id="menu" class="sf-menu">
                            {% snipplet "navigation.tpl" %}
                        </ul>
                    </div>
                    
                </div>
                <div class="span1 cart-container">
                    {% if not store.is_catalog %}
                        {% snipplet "cart.tpl" as "cart" %}
                    {% endif %}
                </div>
            </div>
        </div>
    </div>


    {% template_content %}
    {% if settings.banner_services %}
        {% include 'snipplets/banner-services.tpl' %}
    {% endif %}
        <div id="wrapper-foot">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span4 c">
                    <h4>{{ "Newsletter" | translate }}</h4>
                    {% snipplet "newsletter.tpl" %}
                </div>
                <div class="span4 c">
                    {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
                    <h4>{{ "Redes Sociales" | translate }}</h4>
                    <div class="row-fluid">
                          {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                            <a class="soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                            {% endif %}
                        {% endfor %}
                    {% endif %}
                    {% if store.email %}
                        <a class="soc-foot mail" href="mailto:{{ store.email }}"><i class="fa fa-envelope"></i></a>
                    {% endif %}
                    </div>
                </div>
                 {% if store.phone or store.email or store.address %}
                    <div class="span4 c">
                         <h4>{{ "Contactanos" | translate }}</h4>
                         <ul class="foot-contact">
                            {% if store.phone %}
                                <li class="phone">{{ store.phone }}</li>
                            {% endif %}
                            {% if store.email %}
                                <li class="email"><a class="email" href="mailto:{{ store.email }}">{{ store.email }}</a></li>
                            {% endif %}
                          </ul>

                          {% if store.address %}
                          <ul class="foot-contact">
                                <li class="address">{{ store.address }}</li>
                           </ul>     
                            {% endif %}
                    </div>
                {% endif %}
            </div>        
            <div class="row-fluid">
                <div class="span12">
                    <ul class="foot-nav">
                        {% snipplet "navigation-foot.tpl" %}
                    </ul>
                </div>
            </div>
            <div class="row-fluid c">
                <div class="row-fluid c">
                    {% for payment in settings.payments %}
                        {{ payment | payment_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                    {% endfor %}
                </div>
                <div class="row-fluid c">
                    {% for shipping in settings.shipping %}
                        {{ shipping | shipping_logo | img_tag('', {class : 'img-logo', height : 40}) }}
                    {% endfor %}
                </div>
                {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                    <div class="row-fluid seals c">
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
            </div>
        </div>
    </div>
    <div id="wrapper-legal">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="copyright">
                        {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                    </div>
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
            </div>
        </div>
    </div>
    </div>
{{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
{{ 'js/zen.js' | static_url | script_tag }}
{{ "//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js" | script_tag }}
{{ 'js/pushy/pushy.js' | static_url | script_tag }}
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
                var $newsletter = $('#newsletter');
                $newsletter.find('form').hide();
                $newsletter.find('.title').hide();
                $newsletter.find('#ofertas').hide();
                ga_send_event('contact', 'newsletter', 'standard');
            {% elseif contact.type == 'contact' %}
                ga_send_event('contact', 'contact-form');
            {% endif %}
        {% endif %}

        $("#tS2").thumbnailScroller({
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
        });

        window.homeSlider = {
            getSliderConfiguration: function() {
                return {
                    //JS For home slider Preloader - hides the images until loaded
                    onSliderLoad: function(){
                        $(".homeslider").css("visibility", "visible");
                        $(".homeslider img").css("visibility", "visible");
                        $(".slider-wrapper .fa-circle-o-notch").hide();
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

        {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}

        $("#shipping-zipcode").keydown(function(e) {
            var key = e.which ? e.which : e.keyCode;
            var enterKey = 13;
            if (key === enterKey) {
                e.preventDefault();
                $("#calculate-shipping-button").click();
            }
        });

        $("#calculate-shipping-button").click(function() {
            var params = {'zipcode': $("#shipping-zipcode").val()};
            var variant = $("#shipping-variant-id");
            if(variant.length) {
                params['variant_id'] = variant.val();
            }
            var $shipping_calculator = $("#shipping-calculator");
            var $shipping_calculator_loading = $shipping_calculator.find(".loading");
            $shipping_calculator_loading.show();
            $("#invalid-zipcode").hide();
            $.post('{{store.shipping_calculator_url | escape('js')}}', params, function(data) {
                $shipping_calculator_loading.hide();
                if(data.success) {
                    $("#shipping-calculator-response").html(data.html);
                    $("#shipping-calculator-form, #shipping-calculator-response").toggle();
                } else {
                    $("#invalid-zipcode").show();
                }
            }, 'json');
            return false;
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
            finishData: function() {
                    $('#loadMoreBtn').remove();
                },
            productGridClass: 'product-table',
            productsPerPage: 20
        });
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
  LS.registerOnChangeVariant(function(variant){
        var liImage = $('#productbxslider').find("[data-image='"+variant.image+"']");
        var selectedPosition = liImage.data('image-position');
        var slideToGo = parseInt(selectedPosition);
        slider.goToSlide(slideToGo);
    });
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
});
</script>
{% endif %}

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