<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>{{ page_title }}</title>
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
			<meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Sí' | translate }}" />
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

        {{ "//fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic|Bitter:400,700|Oswald:400,300,700|Montserrat:400,700|Droid+Serif:400,700|Lato:300,400,500,700,900|Open+Sans:400italic,700italic,400,700|Nunito:400,700,300" | css_tag }}
		{{ "//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" | css_tag }}
        {{ '//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css' | css_tag }}
        {{ 'js/pushy/pushy.css' | static_url | css_tag }}
		{{ 'css/style.css' | static_url | css_tag }}
		{{ 'css/main-color.scss.tpl' | static_url | css_tag }}
		{{ 'css/style-media.css' | static_url | css_tag }}

        {% set nojquery = true %}
        {{ "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" | script_tag }}
        {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}

        <!-- TODO: incluir sólo si es preview o si está siendo llamado desde un iframe -->
        {{ 'js/instatheme.js' | static_url | script_tag }}

        {% head_content %}
        <!--[if lt IE 9]>
        {{ '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js' | script_tag }}
        <![endif]-->

		<style>
			{{ settings.css_code | raw }}
		</style>
    </head>
    {# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
    {% if "default-background.jpg" | has_custom_image %}
    	<body class="user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:{{ settings.bg_position_x }};">
	{% else %}
	<body class="pattern-background">
    <div  id="container">
	{% endif %}
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
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
			<div class="header-bar">
				{% if settings.fixed_menu %}
				<div class="header-bar-fixed">
					<div class="container">
						<div class="row">
							<div class="col-sm-3 logo-container">
								{% if "fixed_menu_logo.jpg" | has_custom_image %}
									<div id="logo" class="img">
										{{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name) | a_tag(store.url) }}
									</div>
								{% else %}
									<div id="logo">
										<div class="logo-wrapper img {% if not has_logo %}hidden{% endif %}">
											{{ store.logo | img_tag(store.name) | a_tag(store.url) }}
										</div>
										<a id="no-logo" href="{{ store.url }}" class="no-logo {% if has_logo %}hidden{% endif %}">{{ store.name }}</a>
									</div>
								{% endif %}
							</div>
							<nav class="col-sm-6 text-center">
								<ul id="menu-fixed" class="sf-menu">
								{% snipplet "navigation.tpl" %}
								</ul>
							</nav>
							<div class="col-sm-3 no-gutter">
								<div class="searchbox">
									<form action="{{ store.search_url }}" method="get" role="form">
										<div class="form-group">
											<input class="form-control text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
											<button class="submit-button" type="submit"><i class="fa fa-search"></i></button>
										</div>
									</form>
								</div>
								{% if not store.is_catalog %}
									{% snipplet "cart_fixed.tpl" as "cart" %}
								{% endif %}	
							</div>
						</div>
					</div>
				</div>
				{% endif %}
				<div class="header-bar-top">
					<div class="container">
						<div class="row">
                            
                            <div class="col-sm-2 mobile mobile-nav">
                                <div class="menu-btn"><i class="fa fa-bars"></i></div>
                            </div>
                            
							<div class="col-sm-6 text-left">
								{% if languages | length > 1 %}
								<div class="languages dropdown">
									{% for language in languages %}
									{% if language.active %}
									<a  class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
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
								</div>
								{% endif %}
								{% if store.phone %}
									<p class="phone">
										{{ store.phone }}
										{% if store.email %}
										&nbsp;|&nbsp;
										{% endif %}
									</p>
								{% endif %}
								{% if store.email %}
									<p class="mail">{{ store.email | mailto }}</p>
								{% endif %}
							</div>
							<div class="col-sm-6 text-right">
							{% if store.has_accounts %}
								<div id="auth">
									{% if not customer %}
										{% if 'mandatory' not in store.customer_accounts %}
										{{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
										<span>&nbsp;|&nbsp;</span>
										{% endif %}
										{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
									{% else %}
										{{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
										<span>&nbsp;|&nbsp;</span>
										{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
									{% endif %}
								</div>
							{% endif %}						
							</div>
						</div>
					</div>
				</div>
				<div class="header-bar-main container">
					<div class="row">
						<div class="col-sm-3 logo-container">
							{% if template == 'home' %}
							    <h1 class="img logo">
							{% else %}
							    <div class="img logo">
							{% endif %}
									<div class="logo-wrapper img {% if not has_logo %}hidden{% endif %}">
							            {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
									</div>
							        <a id="no-logo" class="no-logo {% if has_logo %}hidden{% endif %}" href="{{ store.url }}">{{ store.name }}</a>
							{% if template == 'home' %}
							    </h1>
							{% else %}
							    </div>
							{% endif %}
						</div>
						<nav class="col-sm-6 text-center">
							<ul id="menu" class="sf-menu">
							{% snipplet "navigation.tpl" %}
							</ul>
						</nav>
						<div class="col-sm-3 no-gutter">
							<div class="searchbox">
								<form action="{{ store.search_url }}" method="get" role="form">
									<div class="form-group">
										<input class="form-control text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
										<button class="submit-button" type="submit"><i class="fa fa-search"></i></button>
									</div>
								</form>
							</div>
							{% if not store.is_catalog %}
								{% snipplet "cart.tpl" as "cart" %}
							{% endif %}						
						</div>
					</div>
				</div>
			</div>
			{% template_content %}
			{% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
			<div class="container">
				<div class="row social-networks">
					<div class="col-md-12">
						<div class="section-title">
							<fieldset><legend><h2>{{"Seguinos" | translate}}</h2></legend></fieldset>
						</div>
                        <ul class="text-center list-inline">
                            {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                                {% set sn_url = attribute(store,sn) %}
                                {% if sn_url %}
                                    <li>
                                        <a class="social-button soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                                    </li>
                                {% endif %}
                            {% endfor %}
                        </ul>
					</div>
				</div>
			</div>
			{% endif %}
			<div class="banner-services-footer">
				{% if settings.banner_services %}
					{% include 'snipplets/banner-services.tpl' %}
				{% endif %}
			</div>
			<div class="footer">
				<div class="footer-main">
					<div class="container">
						{% set has_seals = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
						<div class="row">
							<div class="col-md-{% if has_seals %}3{% else %}4{% endif %}">
								<h3>{{ settings.footer_menu_title }}</h3>
								<ul class="footer-menu">
									{% snipplet "navigation-foot.tpl" %}
								</ul>
							</div>
							{% if not has_products %}
						        {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
						           {% snipplet "defaults/show_help_footer.tpl" %} 
							{% elseif settings.payments or settings.shipping %}
								<div class="payment-send col-md-{% if has_seals %}3{% else %}4{% endif %}">
									{% if settings.payments %}
										<h3>{{ 'Medios de pago' | translate }}</h3>
		                                <div class="align-pay-ship">
											{% for payment in settings.payments %}
												{{ payment | payment_logo | img_tag('', {'height' : 30}) }}
											{% endfor %}
										</div>
									{% endif %}
									{% if settings.shipping %}
									<h3>{{ 'Formas de envío' | translate }}</h3>
		                                <div class="align-pay-ship">
		                                    {% for shipping in settings.shipping %}
		                                        {{ shipping | shipping_logo | img_tag('', {'height' : 30}) }}
		                                    {% endfor %}
		                                </div>
									{% endif %}
								</div>
							{% endif %}	
							{% if store.phone or store.email or store.blog or store.address %}
								<div class="col-md-{% if has_seals %}3{% else %}4{% endif %} contact-data">
									<h3>{{ 'Contactanos' | translate }}</h3>
									<ul class="footer-contact">
									{% if store.phone %}
										<li><i class="fa fa-phone"></i>{{ store.phone }}</li>
									{% endif %}
									{% if store.email %}
										<li><i class="fa fa-envelope"></i>{{ store.email | mailto }}</li>
									{% endif %}
									{% if store.blog %}
										<li><a target="_blank" href="{{ store.blog }}"><i class="fa fa-comments"></i>{{ "Visita nuestro Blog!" | translate }}</a></li>
									{% endif %}
									{% if store.address %}
										<li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
									{% endif %}								
									</ul>
								</div>
							{% endif %}
							{% if has_seals %}
								<div class="col-md-3 seals">
									<h3>{{ 'Información legal' | translate }}</h3>
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
				<div class="footer-bottom">
					<div class="container">
						<div class="row">
							<div class="col-md-6 copyright">
								<p class="text-left">{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
							</div>
							<div class="col-md-6 powered-by text-right">
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
            <!-- Pushy Menu -->
            <nav class="pushy pushy-left">
                <ul>
                     {% snipplet "navigation-mobile.tpl" %}
                </ul>
            </nav>
            <!-- Site Overlay -->
            <div class="site-overlay"></div>
        {{ "//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js" | script_tag }}
        {{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
		{% set gmap_url = "//maps.google.com/maps/api/js" ~ (store.gmap_api_key and store.can_show_google_map ? "?key=#{store.gmap_api_key}" : "") %}
        {{ gmap_url | script_tag }}
		{{ 'js/style.js' | static_url | script_tag }}
        <script type="text/javascript">
        	
        {% if settings.show_news_box %}
    	$('#newsletter-popup').submit(function(){
	    $(".loading-modal").show();
	    $("#newsletter-popup .general-button").prop("disabled", true);
        ga_send_event('contact', 'newsletter', 'popup');
		});
        LS.newsletter('#newsletter-popup', '#newsModal', '{{ store.contact_url | escape('js') }}', function(response){
        	$(".loading-modal").hide();
            var selector_to_use = response.success ? '.contact-ok' : '.contact-error';
            $(this).find(selector_to_use).fadeIn( 100 ).delay( 1300 ).fadeOut( 500 );
            if($("#newsletter-popup .contact-ok").css("display") == "block"){
        		setTimeout(function(){ $("#newsModal").modal('hide'); }, 2500);
	        }else{
	            {# nothing happens here #}
	        }
            $('#newsletter-popup input[type="email"]').val('');
            $("#newsletter-popup .general-button").prop("disabled", false);
    	});
		$(document).ready(function(){ 
		    LS.newsletterPopup();
		});
        {% endif %}

        //Hamburguer Menu Javascript
        $(".mobile-dropdown").click(function(){
            $(this).next("#accordion").slideToggle(300);
            $(this).toggleClass("dropdown-selected");
        });
        </script>
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

		        if (variant.compare_at_price_long){
		            parent.find('#compare_price_display').text(variant.compare_at_price_long).show();
		        } else {
		            parent.find('#compare_price_display').hide();
		        }
		        var button = parent.find('.addToCart');
				button.removeClass('cart').removeClass('contact').removeClass('nostock');
		        {% if not store.is_catalog %}
                var $shipping_calculator_form = $("#shipping-calculator-form");
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
		</script>
		<script type="text/javascript">
			$(document).ready(function(){

				LS.registerOnChangeVariant(function(variant){
					$('img', ".cloud-zoom-gallery[data-image="+variant.image+"]").click();
				});

                if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
                    $('select.on-steroids').removeClass('on-steroids');
                }

				$('#menu').supersubs({
					minWidth:    9,
					maxWidth:    40,
					extraWidth:  1.3
				}).superfish({
					autoArrows: false,
					dropShadows: false,
					speed: 'fast',
					delay: 200
				});
				{% if settings.fixed_menu %}
					$('#menu-fixed').supersubs({
						minWidth:    9,
						maxWidth:    40,
						extraWidth:  1.3
					}).superfish({
						autoArrows: false,
						dropShadows: false,
						speed: 'fast',
						delay: 200
					});
				{% endif %}
				$(".pagination li.disabled a").click(function(event) {
					event.preventDefault();
				});
                $(".contact-form").submit(function(){
                    if ($('input#winnie-pooh').val().length != 0){
                        return false;
                    }
                });

                {% if settings.fixed_menu %}
                var menu = $('.header-bar-main');
                var fixedMenu = $('.header-bar-fixed');
                var pos = menu.offset();

                $(window).scroll(function(){
                    if($(this).scrollTop() > pos.top + menu.height() && !fixedMenu.hasClass('fixed')){
                        fixedMenu.animate({top:'0'},200).addClass('fixed');
                    } else if($(this).scrollTop() <= pos.top && fixedMenu.hasClass('fixed')){
                        fixedMenu.animate({top:'-140px'},200,function(){
                            $(this).removeClass('fixed');
                        });
                    }
                });
                {% endif %}

                {% if contact and contact.success %}
                    {% if contact.type == 'newsletter' %}
                        ga_send_event('contact', 'newsletter', 'standard');
                    {% elseif contact.type == 'contact' %}
                        ga_send_event('contact', 'contact-form');
                    {% endif %}
                {% endif %}

			    window.homeSlider = {
			        getSliderConfiguration: function() {
			            return {
			            	//JS For home slider Preloader - hides the images until loaded
			    	         onSliderLoad: function(){
					            $(".homeslider img" ).css("visibility", "visible");
					            $(".homeslider li").css("visibility", "visible");
					            $(".slider-wrapper .fa-circle-o-notch").hide();
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
			                prevText: '<i class="fa fa-angle-left"></i>',
			                nextText: '<i class="fa fa-angle-right"></i>',
			                pager: false
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




                var $bx_controls = $(".bx-wrapper .bx-prev,.bx-wrapper .bx-next");
                $bx_controls.hide();
                $(".bx-wrapper")
                        .mouseover(function(){$bx_controls.toggle();})
                        .mouseout(function(){$bx_controls.toggle();});

                $(".direction-nav .next").click(function(e){
                    e.preventDefault();
                    var current = $(".mousetrap").prev().attr("href");
                    /*alert(current);
                     alert($("[href='" + current + "']").html());
                     $("a.cloud-zoom-gallery[href='" + current + "']").children("img").css("border","solid 1px red");*/
                    var tmp = $("a.cloud-zoom-gallery[href='" + current + "']").next();

                    if(tmp.length) {
                        tmp.click();
                    } else {
                        $("a.cloud-zoom-gallery:first-child").click();
                    }
                });
                $(".direction-nav .prev").click(function(e) {
                    e.preventDefault();
                    var current = $(".mousetrap").prev().attr("href");
                    var tmp = $("a.cloud-zoom-gallery[href='" + current + "']").prev();

                    if(tmp.length) {
                        tmp.click();
                    } else {
                        $("a.cloud-zoom-gallery:last-child").click();
                    }
                });

                $("#product_form").submit(function(e){
                	var button = $(this).find(':submit');
                    button.attr('disabled', 'disabled');
                    if (button.hasClass('cart')){
                        button.val('{{ "Agregando..." | translate }}');
                    }
                    if($(this).find('input.contact').length) {
                        e.preventDefault();
                        window.location = "{{ store.contact_url | escape('js') }}?product=" + LS.product.id;
                    }
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
			});
		</script>
		{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
	    <script type="text/javascript">
	        $(function() {
	            new LS.infiniteScroll({
	                afterSetup: function() {
	                    $('.crumbPaginationContainer').hide();
	                },
	                productGridClass: 'product-grid',
	                productsPerPage:8,
	                finishData: function() {
                    	$('#loadMoreBtn').remove();
                	},
	                bufferPx: 550,
	                loadingElement:'<div class="col-sm-12 text-center infinite-scroll-loading" style="margin-top:10px;"><i class="fa fa-refresh fa-spin"></i></div>'
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
			        $(".offer-pill").hide();
			    }
			    else {
			        $(".offer-pill").show();
			    }
			    $("#product_form select").change(function(){
			        if ($("#compare_price_display").css("display") == "none") {
			            $(".offer-pill").hide();
			        }
			        else {
			            $(".offer-pill").show();
			        }
			    });

				$('.product-share-button').click(function(){
					ga_send_event('social-sharing-product', $(this).data('network'))
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
		        $(".quantity-input input").focusout(function(e){
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
		{{ store.assorted_js | raw }}
    </body>
</html>
