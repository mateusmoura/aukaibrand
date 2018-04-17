<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
      <title>{{ page_title }}</title>
      <link rel="preconnect" href="https://d26lpennugtm8s.cloudfront.net" />
      <link rel="dns-prefetch" href="https://d26lpennugtm8s.cloudfront.net" />
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta name="description" content="{{ page_description }}" />
      <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
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
      
      {# OG tags to control how the page appears when shared on Facebook. See http://ogp.me/ #}
        {% snipplet "metas/facebook-og.tpl" %}
        {# Twitter tags to control how the page appears when shared on Twitter. See https://dev.twitter.com/cards/markup #}
        {% if template == 'product' %}
            {# Twitter #}
            {% snipplet "metas/twitter-product.tpl" %}
            {# Facebook #}
            {% snipplet "metas/facebook-product-og.tpl" %}
        {% elseif template == 'category' %}
            {# Facebook #}
            {% snipplet "metas/facebook-category-og.tpl" %}
        {% endif %}

      <!-- Critical CSS to improve the percieved performance on first load -->
      <style>
          {% snipplet 'css/critical-css.tpl' %}
      </style>

      <style>
        {% snipplet 'css/main-css.tpl' %}
      </style>

      <style>
        {% snipplet 'css/timber-css.tpl' %}
      </style>

      {{ "//fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic|Bitter:400,700|Oswald:400,300,700|Montserrat:400,700|Droid+Serif:400,700|Lato:300,400,500,700,900|Open+Sans:400italic,700italic,400,700|Nunito:400,700,300" | css_tag }}

      <!-- Aynsc CSS for the non-critical stylesheets -->
      {% snipplet 'js/load-css-async.tpl' %}
      {{ 'css/main-color.scss.tpl' | static_url | css_tag }}

      {% set nojquery = true %}
      {% set async_js = true %}

      {{ "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" | script_tag(true) }}

      {% head_content %}
      <!--[if lt IE 9]>
        {{ "html5shiv-printshiv.js" | static_url | script_tag }}
      <![endif]-->
      <!--[if lt IE 9]>
        {{ "html5shiv-printshiv.js" | static_url | script_tag }}
      <![endif]-->
      <style>
        {{ settings.css_code | raw }}
      </style>
    </head>

    {# Only remove this if you want to take away the theme onboarding advices #}
    {% set show_help = not has_products %}
    {% if "default-background.jpg" | has_custom_image %}
      <!-- <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:{{ settings.bg_position_x }};"> -->
    {% else %}
      <!-- <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} pattern-background"> -->
    {% endif %}

    <body class="template-collection show-main-nav">
      {{ social_js }}
      {% if template == 'account.login' or template == 'account.register' %}
        <script>

          {# Facbook login #}
            function loginFacebook() {
                  LS.ready.then(function(){
                      LS.facebookLogin(FB, function(status, hasEmail) {
                          if (status === 'connected') {
                              if (hasEmail) {
                                  window.location = "{{ store.url }}/account/facebook_login/";
                              } else {
                                  $('#login-form').prepend(
                                      "<div class=\"alert alert-danger\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                              }
                          } else {
                              $('#login-form').prepend(
                              "<div class=\"alert alert-danger\">{{ 'Debes completar el login.' | translate }}</div>");
                          }
                      });
                  });
            }
        </script>
      {% endif %}


      {# Hamburger panel #}

      <nav class="hamburger-panel js-hamburger-panel">
        {% snipplet "navigation/navigation-hamburger-panel.tpl" %}
      </nav>
  
      {# Overlays #}

      <div class="js-hamburger-overlay js-toggle-hamburger-panel hamburger-overlay backdrop"></div>

      <div class="js-search-backdrop js-toggle-mobile-search search-backdrop backdrop container-fluid full-width" style="display: none;"></div>

      <!--[if lt IE 7]>
          <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
      <![endif]-->
      <div class="visible-xs">
        {% snipplet "navigation/navigation-mobile.tpl" %}
      </div>


      <div id="PageContainer" class="is-not-moved-by-drawer">
        <header class="site-header" role="banner">
          <div class="header content">
            <div class="logo" itemscope itemtype="http://schema.org/Organization">
              {% if "fixed_menu_logo.jpg" | has_custom_image %}
                <div class="logo-img-container">
                  {{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name, {class: 'logo-img logo-fixed'}) | a_tag(store.url) }}
                </div>
              {% else %}
                <div class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                  {{ store.logo('large') | img_tag(store.name, {class: 'logo-img logo-fixed'}) | a_tag(store.url) }}
                </div>
                <a href="{{ store.url }}" class="logo-text {% if has_logo %} hidden {% endif %}">{{ store.name }}</a>
              {% endif %}
            </div>
          </div>

          <nav class="nav-bar" role="navigation">
            <div class="medium-down--hide">
              <ul class="site-nav">
                {% snipplet "navigation/navigation.tpl" %}
              </ul>
            </div>
          </nav>


        </header>

      </div>

    </body>






    <div class="js-main-content main-content">
    <div class="nav-head">
      {% if settings.fixed_menu %}
        <div class="js-nav-head-fixed nav-head-fixed header-bar-fixed hidden-xs">
          <div class="container display-when-content-ready">
            <div class="nav-head-main">
              <div class="logo-container">
                {% if "fixed_menu_logo.jpg" | has_custom_image %}
                  <div class="logo-img-container">
                    {{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name, {class: 'logo-img logo-fixed'}) | a_tag(store.url) }}
                  </div>
                {% else %}
                  <div class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                    {{ store.logo('large') | img_tag(store.name, {class: 'logo-img logo-fixed'}) | a_tag(store.url) }}
                  </div>
                  <a href="{{ store.url }}" class="logo-text {% if has_logo %} hidden {% endif %}">{{ store.name }}</a>
                {% endif %}
              </div>
              <ul class="js-desktop-nav hidden-xs desktop-nav">
                {% snipplet "navigation/navigation.tpl" %}
              </ul>
              <div class="d-flex">
                <div class="desktop-search">
                  <div class="js-search-container">
                    <form action="{{ store.search_url }}" class="js-search-form" method="get" role="form">
                      <div class="form-group">
                        <input class="js-search-input form-control desktop-search-input" type="search" autocomplete="off" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                        <button class="desktop-search-submit submit-button" type="submit">
                          <div class="desktop-search-icon">
                                    {% include "snipplets/svg/search.tpl" %}
                                </div>
                        </button>
                      </div>
                    </form>
                  </div>
                  <div class="js-search-suggest search-suggest">
                                  {# AJAX container for search suggestions #}
                              </div>
                </div>
                {% if not store.is_catalog and template != 'cart' %}
                  {% if settings.ajax_cart %}
                    {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                  {% else %}
                    {% snipplet "cart.tpl" as "cart" %}
                  {% endif %}
                {% endif %}	
              </div>
            </div>
          </div>
        </div>
      {% endif %}
      <div class="nav-head-top header-bar-top hidden-xs">
        <div class="container">
          <div class="row">
            <div class="col-sm-6 text-left">
              <ul class="list-unstyled list-inline m-none">
                {% if languages | length > 1 %}
                <li class="p-left-none dropdown">
                  {% for language in languages %}
                  {% if language.active %}
                  <a  class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                  {{ language.country | flag_url | img_tag(language.name) }}
                  <span class="caret"></span>
                  </a>
                  {% endif %}
                  {% endfor %}
                  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    {% for language in languages %}
                    <li role="presentation">
                      <a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
                        {{ language.country | flag_url | img_tag(language.name) }}<span>&nbsp{{ language.name }}</span>
                      </a>
                    </li>
                    {% endfor %}
                  </ul>
                </li>
                {% endif %}
                {% if store.phone %}
                  <li class="phone {% if store.email %} border-right {% endif %}">
                    {{ store.phone }}
                  </li>
                {% endif %}
                {% if store.email %}
                  <li class="mail">{{ store.email | mailto }}</li>
                {% endif %}
              </ul>
            </div>
            <div class="col-sm-6 text-right">
            {% if store.has_accounts %}
              <ul class="list-unstyled list-inline m-none">
                {% if not customer %}
                  {% if 'mandatory' not in store.customer_accounts %}
                  <li class="border-right">
                    {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                  </li>
                  {% endif %}
                  <li>
                    {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                  </li>
                {% else %}
                  <li class="border-right">
                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                  </li>
                  <li>
                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                  </li>
                {% endif %}
              </ul>
            {% endif %}						
            </div>
          </div>
        </div>
      </div>
      <div class="js-nav-head-main container">
        <div class="nav-head-main">
          <div class="logo-container">
            {% if template == 'home' %}
                          <h1 class="mobile-logo-home">
                      {% endif %}
                          <div id="logo" class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                              {{ store.logo('large') | img_tag('', {class: 'logo-img'}) | a_tag(store.url) }}
                          </div>
                          <a id="no-logo" class="logo-text {% if has_logo %} hidden {% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                      {% if template == 'home' %}
                          </h1>
                      {% endif %}
          </div>
          <ul class="js-desktop-nav hidden-xs desktop-nav">
            {% snipplet "navigation/navigation.tpl" %}
          </ul>
          <div class="d-flex hidden-xs">
            <div class="desktop-search">
              <div class="js-search-container">
                <form action="{{ store.search_url }}" class="js-search-form" method="get" role="form">
                  <div class="form-group">
                    <input class="js-search-input form-control desktop-search-input" type="search" autocomplete="off" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                    <button class="desktop-search-submit submit-button" type="submit">
                      <div class="desktop-search-icon">
                                {% include "snipplets/svg/search.tpl" %}
                            </div>
                    </button>
                  </div>
                </form>
              </div>
              <div class="js-search-suggest search-suggest">
                              {# AJAX container for search suggestions #}
                          </div>
            </div>
            {% if not store.is_catalog and template != 'cart' %}
              {% if settings.ajax_cart %}
                {% snipplet "cart-widget-ajax.tpl" as "cart" %}
              {% else %}
                {% snipplet "cart.tpl" as "cart" %}
              {% endif %}
            {% endif %}			
          </div>
        </div>
      </div>
    </div>
    {% template_content %}
    {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
    <div class="container visible-when-content-ready">
      <div class="row social-networks m-top">
        <div class="col-md-12">
          <div class="title-container">
               <h4 class="subtitle">{{"Seguinos" | translate}}</h4>
            </div>
                    <ul class="text-center list-inline">
                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <li>
                                    <a class="btn btn-circle btn-primary" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                                </li>
                            {% endif %}
                        {% endfor %}
                    </ul>
        </div>
      </div>
    </div>
    {% endif %}
        {% set has_only_category_banner_service = settings.banner_services_category and not settings.banner_services and template == 'category' %}
        {% if settings.banner_services or has_only_category_banner_service %}
        <div class="container {% if has_only_category_banner_service %} visible-xs {% endif %}">
          {% include 'snipplets/banner-services/banner-services.tpl' with {'footer': true} %}
       </div>
        {% endif %}
    <div class="visible-when-content-ready">
      <div class="footer footer-main">
        <div class="container">
          {% set has_seals = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
          <div class="row">
            <div class="col-md-{% if has_seals %}3{% else %}4{% endif %} m-bottom-xs">
              <h4 class="footer-title">{{ settings.footer_menu_title }}</h4>
              <ul class="footer-list list-unstyled">
                {% snipplet "navigation/navigation-foot.tpl" %}
              </ul>
            </div>
            {% set has_shipping_payment_logos = settings.payments or settings.shipping %}
                  {% if not (has_products or has_shipping_payment_logos) %}
                  {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
                     {% snipplet "defaults/show_help_footer.tpl" %} 
            {% elseif has_shipping_payment_logos%}
              <div class="payment-send col-md-{% if has_seals %}3{% else %}4{% endif %} m-bottom-xs">
                {% if settings.payments %}
                  <h4 class="footer-title">{{ 'Medios de pago' | translate }}</h4>
                                  <div class="text-center-xs">
                    {% for payment in settings.payments %}
                                        {{ payment | payment_logo | img_tag('', {class: 'footer-payship-img'}) }}
                                    {% endfor %}
                  </div>
                {% endif %}
                {% if settings.shipping %}
                <h4 class="footer-title">{{ 'Formas de envío' | translate }}</h4>
                                  <div class="text-center-xs">
                                      {% for shipping in settings.shipping %}
                                        {{ shipping | shipping_logo | img_tag('', {class: 'footer-payship-img'}) }}
                                    {% endfor %}
                                  </div>
                {% endif %}
              </div>
            {% endif %}	
            {% if store.phone or store.email or store.blog or store.address %}
              <div class="col-md-{% if has_seals %}3{% else %}4{% endif %} contact-data">
                <h4 class="footer-title">{{ 'Contactanos' | translate }}</h4>
                <ul class="footer-list list-unstyled">
                {% if store.phone %}
                  <li><i class="fa fa-phone fa-lg m-right-quarter"></i>{{ store.phone }}</li>
                {% endif %}
                {% if store.email %}
                  <li><i class="fa fa-envelope fa-lg m-right-quarter"></i>{{ store.email | mailto }}</li>
                {% endif %}
                {% if store.blog %}
                  <li><a target="_blank" href="{{ store.blog }}"><i class="fa fa-comments fa-lg m-right-quarter"></i>{{ "Visita nuestro Blog!" | translate }}</a></li>
                {% endif %}
                {% if store.address %}
                  <li><i class="fa fa-map-marker fa-lg m-right-quarter"></i>{{ store.address }}</li>
                {% endif %}								
                </ul>
              </div>
            {% endif %}
            {% if has_seals %}
              <div class="col-md-3 seals">
                <h4 class="footer-title">{{ 'Información legal' | translate }}</h4>
                {% if store.afip %}
                  <div class="afip m-top-quarter m-bottom-quarter">
                    {{ store.afip | raw }}
                  </div>
                {% endif %}
                {% if ebit %}
                  <div class="ebit m-top-quarter m-bottom-quarter">
                    {{ ebit }}
                  </div>
                {% endif %}
                {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
                                <div class="seals-container text-center">
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
      <div class="footer-legal footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-md-6 copyright">
              <p class="text-left text-center-xs m-bottom">{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
            </div>
            <div class="col-md-6 powered-by text-right text-center-xs font-small">
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
  {# AJAX Cart Panel #}
  {% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
    {% snipplet "cart-panel-ajax.tpl" %}
  {% endif %}

{# External JS: Plugins and libraries #}

{# without dependencies #}
{{ "js/external-no-dependencies.js" | static_url | script_tag }}

{# with dependencies #}
<script>
    LS.ready.then(function(){
        {% snipplet "js/external.js.tpl"  %}
    });
</script>
{% set gmap_url = "//maps.google.com/maps/api/js" ~ (store.gmap_api_key and store.can_show_google_map ? "?key=#{store.gmap_api_key}" : "") %}
{{ gmap_url | script_tag }}

{# Store js #}
<script type="text/javascript">
  

    {# Masonry Grid #}
    var grid = document.querySelector('.js-masonry-grid');
    if (grid) {
        var $masonry_grid = new Masonry( grid, {
            // options
            itemSelector: '.js-masonry-grid-item',
            transitionDuration: 0,
            horizontalOrder: true
        });
    }

    {# Lazy load #}

    $(window).load(function () {
      document.addEventListener('lazybeforeunveil', function(e){
          if ((e.target.parentElement) && (e.target.nextElementSibling)) {
              var parent = e.target.parentElement;
              var sibling = e.target.nextElementSibling;
              if (sibling.classList.contains('js-lazy-loading-preloader')) {
                  sibling.style.display = 'none';
                  parent.style.display = 'block';
              }
          }
          if ($masonry_grid) $masonry_grid.layout();
      });
    });

    LS.ready.then(function() {

      {# Newsletter popup #}

      LS.newsletter_avoid_siteblindado_bot();

        {% if settings.show_news_box %}
          var $newspopup_mandatory_field = $('#news-popup-form').find(".js-mandatory-field");
        $('#news-popup-form').submit(function(){
            $(".js-news-spinner").show();
            $newspopup_mandatory_field.removeClass("input-error");
              $(".js-news-popup-submit").prop("disabled", true);
              ga_send_event('contact', 'newsletter', 'popup');
      });
          LS.newsletter('#news-popup-form-container', '#news-popup', '{{ store.contact_url | escape('js') }}', function(response){
                $(".js-news-spinner").hide();
                var selector_to_use = response.success ? '.js-news-popup-success' : '.js-news-popup-failed';
                $(this).find(selector_to_use).fadeIn(100).delay(1300).fadeOut(500);
                if ($(".js-news-popup-success").css("display") == "block") {
                    setTimeout(function () {
                        $("#news-popup").modal('hide');
                    }, 2500);
                } else {
                    $newspopup_mandatory_field.addClass("input-error");
                }
                $(".js-news-popup-submit").prop("disabled", false);
            });

            $(document).ready(function () {
                LS.newsletterPopup({
                    selector: "#news-popup"
                });
            });
        {% endif %}

    });

   {# Get installments info #}

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
    
    {# Change product variant function: updates prices and installments #}
    
    function changeVariant(variant){
        $(".js-product-detail .js-shipping-calculator-response").hide();
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
            $element.find('.js-installment-amount').text(amount);
            $element.find('.js-installment-price').attr("data-value", price);
            $element.find('.js-installment-price').text(LS.currency.display_short + parseFloat(price).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
            if(variant.price_short && Math.abs(variant.price_number - price * amount) < 1) {
                $element.find('.js-installment-total-price').text((variant.price_short).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
            } else {
                $element.find('.js-installment-total-price').text(LS.currency.display_short + (price * amount).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
            }
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
            var $installments_container = $(variant.element + ' .js-max-installments-container .js-max-installments');
            var $installments_modal_link = $(variant.element + ' #btn-installments');
            var $payments_module = $(variant.element + ' .js-product-payments-container');
            var $installmens_card_icon = $(variant.element + ' .js-installments-credit-card-icon');
    
            {% if store.installments_on_steroids_enabled and product.has_direct_payment_only %}
            var installments_to_use = max_installments_without_interests[0] >= 1 ? max_installments_without_interests : max_installments_with_interests;
    
            if(installments_to_use[0] <= 0 ) {
            {%  else %}
            var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;
    
            if(installments_to_use[0] <= 1 ) {
            {% endif %}
                $installments_container.hide();
                $installments_modal_link.hide();
                $payments_module.hide();
                $installmens_card_icon.hide();
            } else {
                $installments_container.show();
                $installments_modal_link.show();
                $payments_module.show();
                $installmens_card_icon.show();
                installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
            }
        }
    
        $('.js-installments-one-payment').text(variant.price_short);
        $('.js-installments-one-payment').attr("data-value", variant.price_number);


        if (variant.price_short){
            parent.find('.js-price-display').text(variant.price_short).show();
            parent.find('.js-price-display').attr("content", variant.price_number);
        } else {
            parent.find('.js-price-display').hide();
        }

        if ((variant.compare_at_price_short) && !(parent.find(".js-price-display").css("display") == "none")) {
            parent.find('.js-compare-price-display').text(variant.compare_at_price_short).show();
        } else {
          parent.find('.js-compare-price-display').hide();
        }

        var button = parent.find('.js-addtocart');
    button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
        var $shipping_calculator_form = parent.find("#product-shipping-container");
    if (!variant.available){
      button.val('{{ settings.no_stock_text | escape('js') }}');
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

  LS.ready.then(function() {
    
    $(document).ready(function(){

      {# Cart quantity changes functions related to input quantity #}

            $(document).on("keypress", ".js-cart-quantity-input", function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $(document).on("focusout", ".js-cart-quantity-input", function (e) {
                $(".js-shipping-calculator-response").hide().empty();
                $("#go-to-checkout").prop("disabled", true);
                var itemID = $(this).attr("data-item-id");
                var itemVAL = $(this).val();
                if (itemVAL == 0) {
                    var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                    if (r == true) {
                        LS.removeItem(itemID, true);
                    } else {
                        $(this).val(1);
                    }
                } else {
                    LS.changeQuantity(itemID, itemVAL, true);
                }
            });

             $(".js-hide-alert").click(function(e){
                e.preventDefault();
                $(this).closest(".alert").hide();
            });

           {# Empty cart alert #}
           
          $(".js-trigger-empty-cart-alert").click(function(e){
              e.preventDefault();
              $(".js-mobile-nav-empty-cart-alert").fadeIn(100).delay(1500).fadeOut(500);
          });

           {% if settings.ajax_cart %}

          {# Ajax cart functions #}

          var ajax_cart_panel = $(".js-ajax-cart-panel");

          $(document).on("click", ".js-addtocart", function (e) {
              if (!$(this).hasClass('contact')) {
                  e.preventDefault();
                  var callback_add_to_cart = function(){
                      if ($(window).width() < 768) {
                          $("body").toggleClass("overflow-none");
                          if(ajax_cart_panel.hasClass("modal-xs-right-in")){
                              ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                              setTimeout(function() { 
                                  ajax_cart_panel.hide();
                              }, 300);
                          }else{
                              ajax_cart_panel.show();
                              setTimeout(function() { 
                              ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                              }, 200);
                          }
                      }else{
                          $(".js-ajax-backdrop").toggle();
                          ajax_cart_panel.toggle();
                      }        
                  }
                  $prod_form = $(this).closest("form");
                  LS.addToCartEnhanced(
                      $prod_form,
                      '{{ "Agregar al carrito" | translate }}',
                        '{{ "Agregando..." | translate }}',
                        '{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}',
                        {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
                            callback_add_to_cart
                  );
              }
          });

          {# Ajax cart show or hide #}

          $(document).on("click", ".js-toggle-cart", function (e) {
              e.preventDefault();
              if ($(window).width() < 768) {
                  $("body").toggleClass("overflow-none");
                  if(ajax_cart_panel.hasClass("modal-xs-right-in")){
                      ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                      setTimeout(function() { 
                          ajax_cart_panel.hide();
                      }, 300);
                  }else{
                      ajax_cart_panel.show();
                      setTimeout(function() { 
                      ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                      }, 200);
                  }
              }else{
                  $(".js-ajax-backdrop").toggle();
                  ajax_cart_panel.toggle();
              }            
          });
          
          {% endif %}

          {# Shipping calculator functions #}

          $('input.js-shipping-method:checked').livequery(function () {
                var shippingPrice = $(this).attr("data-price");     
                LS.addToTotal(shippingPrice);
            }); 

            $(document).on("click", "input.js-shipping-method", function () {
                var elem = $(this);
                var shippingPrice = elem.attr("data-price");
                elem.click(function () {
                    LS.addToTotal(shippingPrice);
                });
                $('.js-shipping-suboption').hide();
                elem.closest('li').find('.js-shipping-suboption').show();
            });

            $(".js-shipping-input").keydown(function(e) {
                var key = e.which ? e.which : e.keyCode;
                var enterKey = 13;
                if (key === enterKey) {
                    e.preventDefault();
                    $(this).closest(".js-shipping-calculator-form").find(".js-calculate-shipping").click();
                }
            });

            $(".js-calculate-shipping").click(function(e) {
                e.preventDefault();
                LS.calculateShippingAjax(
                    $(this).closest(".js-shipping-calculator").find(".js-shipping-input").val(),
                    '{{ store.shipping_calculator_url | escape('js') }}',
                    $(this).closest(".js-shipping-calculator"));
            });

            {# Filters #}

            $(".js-toggle-mobile-filters").click(function (e) {
                e.preventDefault();
                $(".js-mobile-filters-panel").toggleClass("modal-xs-right-in modal-xs-right-out");
                $("body").toggleClass("overflow-none");
            });

            LS.ready.then(function() {
                LS.showWhiteListedFilters("{{ filters|json_encode() }}");
            });

         {# Mobile navigation tabs and search #}

          var $top_nav = $(".js-mobile-nav");
          var $page_main_content = $(".js-main-content");
          var $mobile_categories_btn = $(".js-toggle-mobile-categories");
          var $main_categories_mobile_container = $(".js-categories-mobile-container");
          var $search_backdrop = $(".js-search-backdrop");
          var $delete_search = $(".js-search-delete");
          var $search_suggest = $(".js-search-suggest");

          // Mobile search
          $(".js-toggle-mobile-search").click(function(e){
              e.preventDefault;
              var $mobile_tab_navigation = $(".js-mobile-nav-second-row");
              $(".js-mobile-first-row").toggle();
              $(".js-mobile-search-row").toggle();
              $mobile_tab_navigation.toggle();
              $(".js-search-input").val();
              $search_backdrop.toggle().toggleClass("search-open");
            if(!$("body").hasClass("mobile-categories-visible")){
                $("body").toggleClass("overflow-none");
            }else{
                $("body").removeClass("mobile-categories-visible");
            }
              $main_categories_mobile_container.hide();
              $(".js-mobile-nav-arrow").hide();
              if($page_main_content.hasClass("move-up")){
                  $page_main_content.removeClass("move-up").addClass("move-down");
                  $search_backdrop.removeClass("move-up").addClass("move-down");
                  setTimeout(function() { 
                      $page_main_content.removeClass("move-down");
                  }, 200);
              }else{
                  $page_main_content.removeClass("move-down").addClass("move-up");
                  $search_backdrop.removeClass("move-down").addClass("move-up");
              }
              if($mobile_categories_btn.hasClass("selected")){
                  $mobile_categories_btn.removeClass("selected");
                  $(".js-current-page").addClass("selected");
              }
          });


          var $mobile_search_input = $(".js-mobile-search-input");
          $(".js-toggle-mobile-search-open").click(function(e){
              e.preventDefault;
              $mobile_search_input.focus();
          });
          $(".js-search-back-btn").click(function(e){
            $(".js-search-suggest").hide();
            $mobile_search_input.val('');
          });

          $mobile_search_input.keyup(function(){
              $delete_search.show();
          });

          $mobile_search_input.focusout(function(){
              var val = $mobile_search_input.val();
              if(val == ''){
                  $delete_search.hide();
              }else{
                  $delete_search.show();
              }
          });
          
          $delete_search.click(function(e){
              e.preventDefault();
              $(this).hide();
              $mobile_search_input.val('').focus();
              $search_suggest.hide();
          });

          {# Mobile nav categories #}

          $top_nav.addClass("move-down").removeClass("move-up");
          $mobile_categories_btn.click(function(e){
              e.preventDefault();
              $("body").toggleClass("overflow-none mobile-categories-visible");
              $(".js-mobile-nav-arrow").toggle();
              if($mobile_categories_btn.hasClass("selected")){
                  $mobile_categories_btn.removeClass("selected");
                  $(".js-current-page").addClass("selected");
              }else{
                  $mobile_categories_btn.addClass("selected");
                  $(".js-current-page").removeClass("selected");
              }
              $main_categories_mobile_container.toggle();
               if($top_nav.hasClass("move-up")){
                $main_categories_mobile_container.toggleClass("move-list-up");
              }
          });

          {# Mobile nav subcategories #}

          $(".js-open-mobile-subcategory").click(function(e){
              e.preventDefault();
              var $this = $(this);
              var this_link_id_val = $this.data("target");
              var $subcategories_panel_to_be_visible = $this.closest($main_categories_mobile_container).find("#" + this_link_id_val);
              $subcategories_panel_to_be_visible.detach().insertAfter(".js-categories-mobile-container > .js-mobile-nav-subcategories-panel:last-child");
              $subcategories_panel_to_be_visible.addClass("modal-xs-right-out").show();
              setTimeout(function(){
                  $subcategories_panel_to_be_visible.toggleClass("modal-xs-right-in modal-xs-right-out");
              },100);
          });

          $(".js-go-back-mobile-categories").click(function(e){
              e.preventDefault();
              var $this = $(this);
              var $subcategories_panel_to_be_closed = $this.closest(".js-mobile-nav-subcategories-panel");
              $(".js-mobile-nav-subcategories-panel").scrollTop(0);
              $subcategories_panel_to_be_closed.toggleClass("modal-xs-right-in modal-xs-right-out");
              setTimeout(function() { 
                  $subcategories_panel_to_be_closed.removeClass("modal-xs-right-out").hide();
              },300);
          });

          {# Mobile nav hamburger subitems #}

          $(".js-toggle-hamburger-panel").click(function(e){
            e.preventDefault();
              $("body, .js-hamburger-overlay, .js-hamburger-panel, .js-main-content").toggleClass("hamburger-panel-animated");
          });

          $(".js-toggle-page-accordion").click(function (e) {
              e.preventDefault();
              $(this).toggleClass("selected").closest(".js-hamburger-panel-toggle-accordion").next(".js-pages-accordion").slideToggle(300);
          });

          // Show and hide part of nav depending scroll up or down
          var didScroll;
          var lastScrollTop = 0;
          var delta = 20;
          var navbarHeight = $('header').outerHeight();

          $(window).scroll(function(event){
              didScroll = true;
          });

          setInterval(function() {
              if (didScroll) {
                  hasScrolled();
                  didScroll = false;
              }
          }, 250);

          function hasScrolled() {
              var st = $(this).scrollTop();
              
              // Make sure they scroll more than delta
              if(Math.abs(lastScrollTop - st) <= delta)
                  return;
              
              // If they scrolled down and are past the navbar, add class .move-up.
              if (st > lastScrollTop && st > navbarHeight){
                  // Scroll Down
                      if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.addClass("move-up").removeClass("move-down");
                    }
                      $(".backdrop").addClass("move-up").removeClass("move-down");
              } else {
                  // Scroll Up
                  if(st + $(window).height() < $(document).height()) {
                      if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.removeClass("move-up").addClass("move-down");
                    }
                      $(".backdrop").removeClass("move-up").addClass("move-down");
                  }
              }
              
              lastScrollTop = st;
          }

          {# Search suggestions #}

        LS.search($(".js-search-input"), function(html, count){
            $search_suggests = $(this).closest(".js-search-container").next(".js-search-suggest");
            if(count > 0){
                $search_suggests.html(html).show();
            }else{
                $search_suggests.hide();
            }
        }, {
            snipplet: 'navigation/search-results.tpl'
        });
        $("body").click(function() {
            $(".js-search-suggest").hide();
        })
        $(".js-search-suggest").on("click", ".js-search-suggest-all-link", function(e){
            e.preventDefault();
            $this_closest_form = $(this).closest(".js-search-suggest").prev(".js-search-container").find(".js-search-form");
            $this_closest_form.submit();
        });

        {# Resgister on product change variant #}

        LS.registerOnChangeVariant(function(variant){
        $('img', ".js-product-thumb-zoom[data-image="+variant.image+"]").click();
      });

      {# Desktop nav dropdown #}

      $('.js-desktop-nav').supersubs({
        minWidth:    9,
        maxWidth:    40,
        extraWidth:  1.3
      }).superfish({
        autoArrows: false,
        dropShadows: false,
        speed: 'fast',
        delay: 200
      });

      {# Desktop fixed nav #}

            {% if settings.fixed_menu %}
              var menu = $('.js-nav-head-main');
              var pos = menu.offset();
              var fixedMenu = $('.js-nav-head-fixed');

              $(window).scroll(function(){
                  if($(this).scrollTop() > pos.top + menu.height() && !fixedMenu.hasClass('fixed')){
                      fixedMenu.animate({top:'0'},200).addClass('fixed');
                  } else if($(this).scrollTop() <= pos.top && fixedMenu.hasClass('fixed')){
                      fixedMenu.animate({top:'-140px'},200,function(){
                          $(this).removeClass('fixed');
                      });
                      $(".js-nav-head-fixed .js-search-suggest").hide();
                  }
              });
            {% endif %}

            {# Contact form analytics events #}

            {% if contact and contact.success %}
                {% if contact.type == 'newsletter' %}
                    ga_send_event('contact', 'newsletter', 'standard');
                {% elseif contact.type == 'contact' %}
                    ga_send_event('contact', 'contact-form');
                {% endif %}
            {% endif %}

            {# Submit to contact form when product has no price #}

            $("#product_form").submit(function(e){
              var button = $(this).find(':submit');
                button.attr('disabled', 'disabled');
                if (button.hasClass('cart')){
                    button.val('{{ "Agregando..." | translate }}');
                }
                if(($(this).find('input.contact').length) || ($(this).find('input.catalog').length)) {
                    e.preventDefault();
                    window.location = "{{ store.contact_url | escape('js') }}?product=" + LS.product.id;
                }
            });

            {# Home slider #}

        window.homeSlider = {
            getSliderConfiguration: function() {
                return {
                  //JS For home slider Preloader - hides the images until loaded
                   onSliderLoad: function(){
                     $(".js-home-slider-container img").css("visibility", "visible");
                      $(".js-home-slider-preloader, .js-home-slider-placeholder, .js-slider-desktop-placeholder").hide();
                      $(".js-home-slider, .js-home-slider-container .bx-wrapper").css({"visibility" : "visible" , "height" : "auto"});
                          $(".js-home-slider-container .bx-controls-direction, .js-home-slider-container .bx-pager").show();
                  },
                    {% if settings.slider_speed == '2000' %}
                      pause: 2000,
                    {% elseif  settings.slider_speed == '4000' %}
                      pause: 4000,
                    {% elseif  settings.slider_speed == '8000' %}
                      pause: 8000,
                    {% elseif  settings.slider_speed == '15000' %}
                      pause: 15000,
                    {% else %}
                      pause: 30000,
                    {% endif %}
                    autoHover: true,
                    adaptiveHeight: false,
                    prevText: '<i class="fa fa-angle-left fa-huge"></i>',
                    nextText: '<i class="fa fa-angle-right fa-huge"></i>',
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
                return $('.js-home-slider');
            },
            get$Wrapper: function() {
                return $('.js-home-slider-container');
            }
        };
        window.homeSlider.create();

            {% if settings.slider | length == 1 %}
              $('.js-home-slider-container .bx-pager').remove();
            {% endif %}

            {# Banner services slider #}

            var $banner_services_slider = $('.js-mobile-services');
            var has_more_than_one_banner_service = $banner_services_slider.find('.js-service-item').length / $banner_services_slider.length > 1;
            $banner_services_slider.bxSlider({
                // When only one element, don't spin. It's 3 because there is always two more elements to achieve the sliding effect.
                auto: false,
                touchEnabled: has_more_than_one_banner_service,
                controls: false,
                adaptiveHeight: false,
                onSliderLoad: function () {
                    $banner_services_slider.css("visibility", "visible");
                    $(".js-mobile-services-container .bx-has-pager").css("visibility", "visible");
                    $(".js-services-placeholder").hide();
                    $(".js-mobile-services").css({"visibility" : "visible", "height" : "auto"});
                }
            });

            if (!has_more_than_one_banner_service) {
                $(".js-mobile-services-container .bx-has-pager").hide();
            }

            {# Desktop product slider #}

            $(".js-product-next").click(function(e){
                e.preventDefault();
                var current = $(".mousetrap").prev().attr("href");
                var tmp = $(".js-product-thumb-zoom[href='" + current + "']").next();

                if(tmp.length) {
                    tmp.click();
                } else {
                    $(".js-product-thumb-zoom:first-child").click();
                }
            });
            $(".js-product-prev").click(function(e) {
                e.preventDefault();
                var current = $(".mousetrap").prev().attr("href");
                var tmp = $(".js-product-thumb-zoom[href='" + current + "']").prev();

                if(tmp.length) {
                    tmp.click();
                } else {
                    $(".js-product-thumb-zoomlast-child").click();
                }
            });

            {# Show and hide labels on product variant change. Also recalculates discount percentage #}

          $(document).on("change", ".js-variation-option", function(e) {
                var $this_compare_price =  $(this).closest(".js-product-container").find(".js-compare-price-display");
                var $this_price = $(this).closest(".js-product-container").find(".js-price-display");
                var $installment_container = $(this).closest(".js-product-container").find(".js-product-payments-container");
                var $installment_text = $(this).closest(".js-product-container").find(".js-max-installments-container");
                var $this_product_container = $(this).closest(".js-product-container");
                var $this_add_to_cart =  $(this).closest(".js-product-container").find(".js-prod-submit-form");
                // Get the current product discount percentage value
                var current_percentage_value = $this_product_container.find(".js-offer-percentage");
                // Get the current product price and promotional price
                var compare_price_value = $this_compare_price.html();
                var price_value = $this_price.html();
                // Filter prices to only have numbers
                old_price_value_filtered = parseInt(compare_price_value.replace(/[^0-9]/gi, ''), 10)/100;
                current_price_value_filtered = parseInt(price_value.replace(/[^0-9]/gi, ''), 10)/100;
                // Calculate new discount percentage based on difference between filtered old and new prices
                price_difference = (old_price_value_filtered-current_price_value_filtered);
                updated_discount_percentage = Math.round(((price_difference*100)/old_price_value_filtered));
                $this_product_container.find(".js-offer-percentage").html(updated_discount_percentage);
                if ($this_compare_price.css("display") == "none")  {
                    $this_product_container.find(".js-offer-label").hide();
                }
                else {
                    $this_product_container.find(".js-offer-label").show();
                }
                if ($this_compare_price.hasClass('js-promotional-offer')){
                    $this_product_container.find(".js-offer-label").show();
                }
                if ($this_add_to_cart.hasClass("nostock")) {
                    $this_product_container.find(".js-stock-label").show();
                }
                else {
                    $this_product_container.find(".js-stock-label").hide();
                }
                if ($this_price.css('display') == 'none'){
                    $installment_container.hide();
                    $installment_text.hide();
                }else{
                    $installment_text.show();
                }
            });

      {# Color and size variations #}

      $(document).on("click", ".js-insta-variations", function(e) {
              e.preventDefault();
              $this = $(this);
              $this.siblings().removeClass("selected");
              $this.addClass("selected");

              var option_id = $this.data('option');
              $selected_option = $this.closest('.js-variants-container').find('.js-variation-option option').filter(function() {
                  return this.value == option_id;
              });
              $selected_option.prop('selected', true).trigger('change');

              $this.closest("[class^='variation']").find('.js-insta-variation-label').html(option_id);
          });

          {# Sort by products #}

          $('.js-sort-by').change(function(){
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

            {# Mobile pagination #}

            $(".js-mobile-paginator-input").focusout(function(e){
              e.preventDefault();
              LS.paginateMobile();
          });

          {% if template == 'category' %}

                {# Categories sidebar #}

                var categoriesList = $(".js-category-sidebar-item");
                var categoriesAmount = 5;
                if (categoriesList.length > categoriesAmount) {
                    $("#show-more-categories").show();
                    for (i = categoriesAmount; i < categoriesList.length; i++) {
                        $(categoriesList[i]).hide();
                    }
                }

                $("#show-more-categories").click(function(e){
                    e.preventDefault();
                    for (i = categoriesAmount; i < categoriesList.length; i++) {
                        $(categoriesList[i]).toggle();
                    }
                    $(this).find("i").toggleClass("fa-angle-up fa-angle-down");
                });

            {% endif %}

            {# Google maps #}

            $('#google-map').gmap3({
                getlatlng:{
                    address: "{{ store.address | escape('js') }}",
                    callback: function(results) {
                        if ( !results ) return;
                        var store_location = results[0].geometry.location;
                        $('#google-map').gmap3({
                            map: {
                                options: {
                                    zoom: 14,
                                    center: store_location
                                }
                            },
                            marker: {
                                address: "{{ store.address | escape('js') }}"
                            }
                        });
                    }
                }
            });

            {# Show more products function #}

            {% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
            $(function() {
                new LS.infiniteScroll({
                    afterSetup: function() {
                        $('.js-pagination-container').hide();
                    },
                    productGridClass: 'js-product-table',
                    productsPerPage:16,
                    finishData: function() {
                        $('.js-load-more-btn').remove();
                    },
                    afterLoaded: function() {
                      // Reload masonry items after load more products
                          $masonry_grid.reloadItems();
                          imagesLoaded( grid ).on( 'progress', function() {
                              // layout Masonry after each image loads
                              $masonry_grid.layout();
                          });
                  },
                    bufferPx: 550
                });
            });
      {% endif %}

      {% if template == "product" %}

        {# Product mobile slider #}

            slider = $('#product-slider').bxSlider({
                onSliderLoad: function(){
                    //Add class to active slider image
                    $('#product-slider > .js-product-slide').eq(1).addClass('js-product-active-image');
                    $(".js-product-slider-placeholder, .js-product-detail-loading-icon").hide();
                    $("#product-slider").css({"visibility" : "visible", "height" : "auto"});
                    $("#product-slider-container").css({"visibility" : "visible", "height" : "auto"});
                },
                onSlideAfter: function (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {
                    $('#product-slider .js-product-active-image').removeClass('js-product-active-image');
                    //Add class to active slider image
                    $('#product-slider > .js-product-slide').eq(currentSlideHtmlObject + 1).addClass('js-product-active-image');
                },
                nextText:'<i class="fa fa-chevron-right hidden-phone"></i>',
                prevText:'<i class="fa fa-chevron-left hidden-phone"></i>',
            
            });
            {% if product.images_count > 1 %}
              LS.registerOnChangeVariant(function(variant){
                  var liImage = $('#product-slider').find("[data-image='"+variant.image+"']");
                  var selectedPosition = liImage.data('image-position');
                  var slideToGo = parseInt(selectedPosition);
                  slider.goToSlide(slideToGo);
              });
            {% endif %}

          {# Mobile Zoom #}
          //Save scrolling position for fixed body on Mobile Zoom opened
          var scrollPos = $(document).scrollTop();
          $(window).scroll(function(){
              scrollPos = $(document).scrollTop();
          });
          var savedScrollPos = scrollPos;

          // Add tap class to product image
          if ($(window).width() < 768) {
              $(".js-image-open-mobile-zoom").addClass("js-open-mobile-zoom");
          }

          // Mobile zoom open event
          $(".js-open-mobile-zoom").click(function(e){
              e.preventDefault();
              savedScrollPos = scrollPos;
              $('body').css({
                  position: 'fixed',
                  top: -scrollPos
              });
              LS.openMobileZoom();
          });

          // Mobile zoom close event
          $(".js-close-mobile-zoom").click(function(e){
              e.preventDefault();
              LS.closeMobileZoom(180);
          });

          {# Social share events #}

          $('.js-product-share-button').click(function(){
                ga_send_event('social-sharing-product', $(this).data('network'))
            });

            {# Mobile variants with offcanvas panels #}

            $(document).on("click", ".js-mobile-vars-btn", function(e) {
              $(this).next(".js-mobile-vars-panel").removeClass('js-var-panel modal-xs-right-out').addClass('js-var-panel modal-xs-right-in');
                $(this).closest(".modal").scrollTop(0), "fast";
              $("body").addClass("overflow-none");
          });
          function closeVarPanel() {
          setTimeout(function(){ 
              $('.js-var-panel').removeClass('js-var-panel modal-xs-right-in').addClass('js-var-panel modal-xs-right-out')}, 300);
              $("body").removeClass("overflow-none");
          };
          $(document).on("click", ".js-close-panel", function(e) {
              closeVarPanel();
          });
          $(".js-quickshop-mobile-vars-property").on( "click", function() {
              $(this).closest(".modal").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
              closeVarPanel();
          });
          $(".js-mobile-vars-property").on( "click", function() {
          var selectedoption = $(this).data("option");
          var varname = $(this).closest(".js-mobile-vars-panel").data("custom");
          $(this).closest(".js-mobile-vars").find(".js-mobile-vars-selected-label").html(selectedoption);
          $(this).closest(".js-product-detailr").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
          closeVarPanel();
          });
          $(document).on("click", ".js-mobile-vars-property", function(e) {
          e.preventDefault();
          $this = $(this);
          $this.siblings().removeClass("selected");
          $this.addClass("selected");
          var option_id = $this.data('option');
          $selected_option = $this.closest('.js-mobile-variations-container').find('.js-variation-option option[value="'+option_id+'"]');
          $selected_option.prop('selected', true).trigger('change');
          });

          {# Payments and installments details popup #}

            {% if store.installments_on_steroids_enabled %}
                            
                    {# On installment select change function show the correct price of installment #}
                    
                    $(".js-installments-bank-select optgroup:not(:has(option))").hide();
                    $('.js-installment-select').on('change', function() {
                        $(".js-installments-container").removeClass("js-installments-container-active");
                        var $installments_container = $(this).closest(".js-installments-container").addClass("js-installments-container-active");
                        var installment_select_value = $(this).val();
                        $(".js-installments-container-active .js-installment-price-container").hide();
                        var $installment_price_to_show = $installments_container.find('.'+installment_select_value);
                        $installment_price_to_show.show();
                    });

                    {# On credit card click #}

                    $(".js-installments-credit-tab").click(function(){
                        var $main_container = $(this).closest(".js-gw-tab-pane");

                        {# Show the correct installment value related to each credit card #}

                        $main_container.find(".js-installments-final-info").show();
                        $main_container.find(".js-cash-final-info").hide();
                        var current_credit_card_id_val = $(this).attr("id"); 
                        $main_container.find(".js-installment-select").hide().removeClass("active");
                        $main_container.find(".js-installment-select-container").hide().removeClass("active");
                        $main_container.find('.'+current_credit_card_id_val).show().addClass("active");

                        // Update the installment depending the selected credit card
                        $(".js-gw-tab-pane.active .js-installments-container").removeClass("js-installments-container-active");
                        var $installments_container = $main_container.find(".js-installment-select.active").closest(".js-installments-container").addClass("js-installments-container-active");
                        var installment_select_value = $main_container.find('.js-installment-select.active').val();
                        $(".js-gw-tab-pane.active .js-installment-price-container").hide();
                        var $installment_price_to_show = $installments_container.find('.'+installment_select_value);
                        $installment_price_to_show.show();
                        $(".js-installment-single-select").show().addClass("active");
                    });

                    {# Refresh installments data on click and change: CFT, TEA, etc #}

                    $(".js-refresh-installment-data").click(function(e){
                        setTimeout(function() {
                            let active_card;
                            if ($(this).hasClass("js-installments-credit-tab")){
                                active_card = $(this).data("code");
                            }else{
                                active_card = $(".js-gw-tab-pane.active .js-installments-flag-tab.active").data("code");
                            }
                            refreshInstallmentData(active_card);
                        }, 10);
                    });

                    $(".js-refresh-installment-data").change(function(e){
                        var active_card = $(".js-gw-tab-pane.active .js-installments-flag-tab.active").data("code");
                        refreshInstallmentData(active_card);
                    });


                    {# Only MP AR: Enable installments select when bank is selected #}

                    $(".js-installments-bank-select").change(function(e){
                        var $main_container = $(this).closest(".js-gw-tab-pane");
                        $main_container.find(".js-credit-cart-tab-pane.active .js-bank-not-selected-error").hide();
                        var $disabled_installment_select = $(".js-installment-select:visible:disabled");
                        $disabled_installment_select.prop('disabled', false).addClass("enabled");
                        $(".js-installment-select:visible.enabled").next(".js-installment-select-container").remove();
                    });

                    {# Only MP AR: Show error when user wants to calculate installments without selecting bank #}

                    $(".js-installment-select-container").click(function(e){
                        var $main_container = $(this).closest(".js-gw-tab-pane");
                        $main_container.find(".js-credit-cart-tab-pane.active .js-bank-not-selected-error").show();
                        e.preventDefault();
                    });

                    function refreshInstallmentv2(price){
                      $(".js-installment-price-v2" ).each(function( index ) {
                        const installment = Number($(this).data('installment'));
                        $(this).text(LS.currency.display_short + (price/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                      });
                    }

                    function refreshInstallmentData(active_card) {
                        var installment = Number($(".js-gw-tab-pane.active select.js-installments-card-" + active_card + " option:selected").data('number'));
                        var installment_value = $(".js-gw-tab-pane.active select.js-installments-card-" + active_card + " option:selected").val();
                        var total_value_one_payment = Number($(".js-installments-one-payment").attr("data-value"));
                        var base_price = Number($("#price_display").attr("content"));

                        refreshInstallmentv2(base_price);

                        if ($('.js-installments-cft-value').length) {
                            //CFT
                            var cft = $(".js-gw-tab-pane.active select[data-card=" + active_card + "] option:selected").data("cft-" + installment);
                            $(".js-gw-tab-pane.active .js-installments-cft-value").text(cft ? cft.toLocaleString('de-DE', {
                                    maximumFractionDigits: 2,
                                    minimumFractionDigits: 2
                                }) + "%" : "0,00%");

                            //TEA
                            var tea = $(".js-gw-tab-pane.active select[data-card=" + active_card + "] option:selected").data("tea-" + installment);
                            $(".js-gw-tab-pane.active .js-installments-tea").text(tea ? tea.toLocaleString('de-DE', {
                                    maximumFractionDigits: 2,
                                    minimumFractionDigits: 2
                                }) + "%" : "0,00%");

                            // CFT Visibility
                            if (installment == 1) {
                                $(".js-gw-tab-pane.active .js-installment-cft-container, .js-gw-tab-pane.active .js-installment-ptf-container, .js-gw-tab-pane.active .js-installment-tea-container").hide();
                            } else {
                                $(".js-gw-tab-pane.active .js-installment-cft-container, .js-gw-tab-pane.active .js-installment-ptf-container, .js-gw-tab-pane.active .js-installment-tea-container").show();
                            }
                        }

                        //Total Price
                        if (cft == 0) {
                            $(".js-gw-tab-pane.active .js-installments-ptf").text($(".js-gw-tab-pane.active strong.js-installments-one-payment").text());
                            $(".js-gw-tab-pane.active ." + installment_value + " .js-installment-price").text(LS.currency.display_short + (total_value_one_payment/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                            $(".js-installments-container-active .js-installment-without-int-text").show();
                        } else {
                            var base_price = Number($("#price_display").attr("content"));
                            var installment_price_container = $(".js-gw-tab-pane.active ." + installment_value + " .js-installment-price");
                            installment_price_container.text(LS.currency.display_short + Number(installment_price_container.attr("data-value")).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                            var total_value = installment * priceToFloat($(".js-gw-tab-pane.active ." + installment_value + " .js-installment-price").text());
                            total_value = ((Math.abs(base_price - total_value) < 0.07) ? base_price : total_value);
                            $(".js-gw-tab-pane.active .js-installments-ptf").text(LS.currency.display_short + total_value.toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                            if (total_value != $(".js-gw-tab-pane.active .js-installment-number-0 .js-installment-price").attr("data-value")) {
                                $(".js-gw-tab-pane.active .js-installment-without-int-text").hide();
                            } else {
                                $(".js-gw-tab-pane.active .js-installment-without-int-text").show();
                            }
                        }
                        if ($(".js-gw-tab-pane.active .js-installments-ptf").text().trim() == $('.js-gw-tab-pane.active .js-installment-legal-info .js-installments-one-payment').text().trim()) {
                            $(".js-gw-tab-pane.active .js-installments-cft-value").text("0,00%");
                            $(".js-gw-tab-pane.active .js-installments-tea").text("0,00%");
                            $(".js-gw-tab-pane.active ." + installment_value + " .js-installment-price").text(LS.currency.display_short + (total_value_one_payment/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
                            $(".js-gw-tab-pane.active .js-installment-without-int-text").show();
                        }
                    }

                    function priceToFloat(price){
                        return parseFloat(price.replace(/[^\d,]/g,'').replace(/[,]/g,'.'));
                    }

                {% endif %}

          {% endif %}

      });
    });

</script>

{% if show_help %}
    {% snipplet "defaults/show_help_js.tpl" %}
{% endif %}
    
{% if store.live_chat %}
    <!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
    window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
    /* custom configuration goes here (www.olark.com/documentation) */
    olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/</script>
    <!-- end olark code -->
{% endif %}

{# External store codes #}

<script>
    LS.ready.then(function() {
        var trackingCode = $.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
        $('body').append(trackingCode);
    });
</script>
</body>
</html>
