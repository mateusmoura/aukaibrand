<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
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
        <meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Sob Consulta' | translate }}" />
        <meta name="twitter:label1" content="{{ 'Preço' | translate | upper }}" />
        <meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'Não' | translate) : 'Sim' | translate }}" />
        <meta name="twitter:label2" content="{{ 'Estoque' | translate | upper }}" />
        {# Facebook #}
        {{ product.social_url | og('url') }}
        {{ product.name | og('title') }}
        {{ page_description | og('description') }}
        {{ "#{fb_app.namespace}:product" | og('type') }}
        {{ ('http:' ~ product.featured_image | product_image_url('medium')) | og('image') }}
        {{ ('https:' ~ product.featured_image | product_image_url('medium')) | og('image:secure_url') }}
        {% if product.display_price %}
            {{ (product.price / 100) | og_fb_app('price') }}
        {% endif %}
        {% if product.stock_control %}
            {{ product.stock | og_fb_app('stock') }}
        {% endif %}
    {% endif %}

	{{ '//fonts.googleapis.com/css?family=Open+Sans:400,600,300,300italic,400italic,600italic,700,700italic' | css_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/themes/smoothness/jquery-ui.css' | css_tag }}
    {{ "js/tipTip.css" | static_url | css_tag }}
    {{ 'js/bxslider/jquery.bxslider.css' | static_url | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css' | css_tag }}
    {{ "style.css" | static_url | css_tag }}
    {{ 'custom.css.tpl' | static_url | css_tag }}
    {% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag }}
    {% head_content %}
    <!--[if lt IE 9]>
    {{ '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js' | script_tag }}
    <![endif]-->

    <style>
        {{ settings.css_code }}
    </style>
</head>

<body>
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

<div id="wrapper" class="cf">
	<div id="top">
    {% if store.has_accounts %}
    <div id="auth">
    {% if not customer %}
    {{ "Login" | translate | a_tag(store.customer_login_url) }}
    {% if 'mandatory' not in store.customer_accounts %}
    {{ "Cadastre-se" | translate | a_tag(store.customer_register_url) }}
    {% endif %}
    {% else %}
    {{ "Minha conta" | translate | a_tag(store.customer_home_url) }}
    {{ "Sair" | translate | a_tag(store.customer_logout_url) }}
    {% endif %}
    </div>
    {% endif %}
    
		{% if languages | length > 1 %}
		<div id="idioma">
			<span>{{ "País" | translate }}</span>
			{% for language in languages %}
				<a href="{{ language.url }}" class="{{ language.active ? 'selected' : '' }} ">{{ language.country | flag_url | img_tag(language.name) }}</a>
			{% endfor %}
		</div>
		{% endif %}
		<div id="social-top">
        <ul class="socialIcon">
                   {% if store.facebook %}
					<li><a href="{{ store.facebook }}" target="_blank"><img src="{{ "/social/mini-face.png" | static_url }}" alt="facebook"  title="Facebook "name="Facebook" width="17" height="17" border="0" id="facebook-top" /></a></li>
					{% endif %}
					{% if store.twitter %}
					<li><a href="{{ store.twitter }}" target="_blank"><img src="{{ "/social/mini-twitter.png" | static_url }}" alt="twitter"  title="Twitter" name="Twitter" width="17" height="17" border="0" id="twitter-top" /></a></li>
					{% endif %}
                    {% if store.google_plus %}
                        <li><a href="{{ store.google_plus }}" target="_blank" rel="publisher"><img src="{{ "/social/mini-gplus.png" | static_url }}" alt="Google Plus"  title="Google Plus" name="Google Plus" width="16" height="16" border="0" id="gplus-top" /></a></li>
                    {% endif %}                     
                    {% if store.pinterest %}
                        <li><a href="{{ store.pinterest }}" target="_blank"><img src="{{ "/social/mini-pinterest.png" | static_url }}" alt="Pinterest"  title="Pinterest" name="Pinterest" width="16" height="16" border="0" id="pinterest-top" /></a></li>
                    {% endif %}                     
                    {% if store.instagram %}
                        <li><a href="{{ store.instagram }}" target="_blank"><img src="{{ "/social/mini-instagram.png" | static_url }}" alt="Instagram"  title="Instagram" name="Instagram" width="16" height="16" border="0" id="twitter-top" /></a></li>
                    {% endif %}
          </ul>
    	</div>
	
		<div class="logo-container">
			{% if has_logo %}
                {% if template == 'home' %}
                    <h1 class="img logo">
                        <a id="logo" href="{{ store.url }}" >{{ store.logo | img_tag }}</a>
                    </h1>
                {% else %}
                    <a id="logo" href="{{ store.url }}" >{{ store.logo | img_tag }}</a>
                {% endif %}
            {% else %}
                {% if template == 'home' %}
                    <h1>
                        <a id="no-logo" href="{{ store.url }}" >{{ store.name }}</a>
                    </h1>
                {% else %}
                    <a id="no-logo" href="{{ store.url }}" >{{ store.name }}</a>
                {% endif %}
			{% endif %}
		</div>
        <div id="header-info">
		{% if store.phone %}
					<div class="header-contact-info right">
						<span class="phone"></span>{{ store.phone }} 
			  		</div>
				{% endif %}
				{% if store.email %}
					<div class="header-contact-info">
						<a href="mailto:{{ store.email }}">{{ store.email }}</a> 
					</div>
				{% endif %}
          </div>
		<div id="search-cart">
        <form action="{{ store.search_url }}" method="get" id="search" {% if store.is_catalog %}class="catalog-search"{% endif %}>
				
			<input type="text" name="q" value="{{ 'Buscar' | translate }}..." onblur="if (this.value == '') {this.value = '{{ "Buscar" | translate }}...';}"  onfocus="if (this.value == '{{ 'Buscar' | translate }}...') {this.value = '';}" />
			<input type="submit" value="{{ 'Buscar' | translate }}" />
		</form>

        {% if not store.is_catalog %}
        <ul id="compra">
			<li id="ver"><a href="{{ store.cart_url }}"><img src="{{ "bag.png" | static_url }}" width="24" height="27"  /> {% snipplet "cart.tpl" as "cart" %}</a></li>
		</ul>
        {% endif %}
        </div>
        
		<div class="clear"></div>
	</div>
	
    
    
	<div id="bar">
		<ul id="navigation" class="sf-menu">
		{% for item in navigation %}
			<li class="{{ item.current ? 'selected' : '' }}">
				<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} title="{{ item.name }}">{{ item.name }}</a>
			</li>
		{% endfor %}
		</ul>	
	</div>
	
	{% template_content %}
    {% if store.facebook and settings.fb_sidebar_likebox %}
        <div class="facebook-like-widget">
            {{ store.facebook | fb_page_plugin(930,200) }}
        </div>
    {% endif %}
</div>
{% if settings.banner_services %}
<div class="banner-services-footer">
     {% include 'snipplets/banner-services.tpl' %}
 </div>
{% endif %} 

<div id="footer">
    <div class="f1">
          <h4>{{ "Mapa do site" | translate }}</h4>
            <ul>
            {% for item in menus[settings.footer_menu] %}
                <li><a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} title="{{ item.name }}">{{ item.name }}</a></li>
            {% endfor %}

            </ul>
    </div>
    <div class="f2">
    {% if (store.phone or store.email or store.address ) %}
    <h4>{{ "Contato" | translate }}</h4>
        <ul class="icon">
            {% if store.phone %}
                <li class="telefono">{{ store.phone }} </li>
            {% endif %}
            {% if store.email %}
                <li class="mail">
                <a href="mailto:{{ store.email }}">{{ store.email }}</a>
                </li>
            {% endif %}
            {% if store.blog %}
                    <li class="blog"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
            {% endif %}
            {% if store.address %}
                <li class="direccion">
            {{ store.address }} </li>
            {% endif %}
    </ul>
    {% endif %}
    {% if store.facebook or store.twitter %}
    <h4>{{ "Social" | translate }}</h4>
     <ul class="socialIcon">
               {% if store.facebook %}
                <li><a href="{{ store.facebook }}" target="_blank"><img src="{{ "social/logo-face.png" | static_url }}" alt="facebook"  title="Facebook "name="Facebook" width="28" height="28" border="0" id="facebook-bottom" /></a></li>
                {% endif %}
                {% if store.twitter %}
                <li><a href="{{ store.twitter }}" target="_blank"><img src="{{ "social/logo-twitter.png" | static_url }}" alt="twitter"  title="Twitter" name="Twitter" width="28" height="28" border="0" id="twitter-bottom" /></a></li>
                {% endif %}
                {% if store.google_plus %}
                <li><a href="{{ store.google_plus }}" target="_blank"><img src="{{ "social/logo-gplus.png" | static_url }}" alt="Google Plus"  title="Google Plus" name="Google Plus" width="29" height="29" border="0" id="gplus-bottom" /></a></li>
                {% endif %}                 
                {% if store.pinterest %}
                <li><a href="{{ store.pinterest }}" target="_blank"><img src="{{ "social/logo-pinterest.png" | static_url }}" alt="Pinterest"  title="Pinterest" name="Pinterest" width="29" height="29" border="0" id="pinterest-bottom" /></a></li>
                {% endif %}                 
                {% if store.instagram %}
                <li><a href="{{ store.instagram }}" target="_blank"><img src="{{ "social/logo-instagram.png" | static_url }}" alt="Instagram"  title="Instagram" name="Instagram" width="29" height="29" border="0" id="instagram-bottom" /></a></li>
                {% endif %}
      </ul>
    {% endif %}
    </div>
  <div class="f3">
   {% if settings.payments %}
            <div class="payments">
            <h4>{{ "Meios de Pagamento" | translate }}</h4>
                {% for payment in settings.payments %}
                    {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
        {% endif %}
         {% if settings.shipping %}
            <div class="shipping">
              <h4>{{ "Formas de envio" | translate }}</h4>
                {% for shipping in settings.shipping %}
                    {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
         {% endif %}
  </div>

  <div class="f4 seals" {% if not ebit %}style="display: none;"{% endif %}>
    <h4>{{ "Segurança e Certificações" | translate }}</h4>
    {% if ebit %}
        {{ ebit }}
    {% endif %}
    </div>
    <div id="powered">
		{% if store.afip %}
            <div class="afip">
            {{ store.afip | raw }}
            </div>
        {% endif %}
        {{ "Copyright {1} {2}. Todos os direitos reservados." | translate( "now" | date('Y'), ( store.business_name ? store.business_name : store.name ) ~ ' ' ~ store.business_id ) }}
        <p>{{ powered_by_link }}</p>
    </div>
</div>
{{ "//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js" | script_tag }}
{{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
{{ 'js/bxslider/jquery.bxslider.min.js' | static_url | script_tag }}
{{ "js/jquery.tipTip.min.js" | static_url | script_tag }}
{{ "js/jquery.easing.1.3.js" | static_url | script_tag }}
{{ "js/superfish.js" | static_url | script_tag }}
{{ "js/hoverIntent.js" | static_url | script_tag }}
{{ "js/cloud-zoom.1.0.2.min.js" | static_url | script_tag }}
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
		if (variant.price_long){
			$('#price_display').text(variant.price_long).show();
		} else {
			$('#price_display').hide();
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
                $installments_modal_link.hide();
            } else {
                $installments_container.show();
                $installments_modal_link.show();
                installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
            }
        }
		
		if (variant.compare_at_price_long){
			$('#compare_price_display').text(variant.compare_at_price_long).show();
		} else {
			$('#compare_price_display').hide();
		}

        if(variant.contact) {
            $('.container-box').hide();
        } else {
            $('.container-box').show();
        }

		var button = $('.addToCart');
		button.removeClass('cart').removeClass('contact').removeClass('nostock');
        {% if not store.is_catalog %}
		if (!variant.available){
			button.val('{{ "Esgotado" | translate }}');
			button.addClass('nostock');
			button.attr('disabled', 'disabled');
            $("#shipping-calculator-form").hide();
		} else if (variant.contact) {
			button.val('{{ "Preço sob Consulta" | translate }}');
			button.addClass('contact');
            button.removeAttr('disabled');
            $("#shipping-calculator-form").hide();
		} else {
			button.val('{{ "Comprar" | translate }}');
			button.addClass('cart');
            button.removeAttr('disabled');
            $("#shipping-calculator-form").show();
		}
        {% endif %}
	}
	
	$(document).ready(function(){

        LS.registerOnChangeVariant(function(variant){
            $(".cloud-zoom-gallery[data-image="+variant.image+"] >> img").click();
        });

        $('.home-slider').bxSlider({
            auto: {% if settings.slider_auto and sections.slider.products | length > 1 %}true{% else %}false{% endif %},
            pause: 5000,
            autoHover: true,
            adaptiveHeight: false
        });
		$('#product_form').submit(function(){
			var button = $(this).find(':submit');
		
			button.attr('disabled', 'disabled');
			if (button.hasClass('cart')){
				button.val('{{ "Incluindo..." | translate }}');
			}
		});
        var bxslider = $('.homeslider').bxSlider({
            auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
            pause: 5000,
            autoHover: true,
            adaptiveHeight: false
        });

        // This condition works because in moda you cannot have a product slider and an images slider at the same time.
        {% if (settings.home_display == 'slider' and settings.slider | length == 1) or
                (settings.home_display == 'products' and sections.slider.products | length == 1) %}
            $('.bx-pager').remove();
        {% endif %}

        {% if provinces_json %}
        $('select[name="country"]').change(function() {
            var provinces = {{provinces_json | default('{}') | raw}};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}

        $(".col-quantity input").keypress(function(){
            $('#change-quantities').show();
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
	});
</script>

<!-- cÃ³digo para habilitar el scroll infinito -->
{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
<script type="text/javascript">
    $(function() {
        new LS.infiniteScroll({
            afterSetup: function() {
                $('.crumbPaginationContainer').hide();
            },
            afterLoaded: function() {
                //$('.fancybox').fancybox(fancybox_options);
            },
            finishData: function() {
                $('#loadMoreBtn').remove();
            },
            productGridClass: 'product-table',
            bufferPx: 600,
            productsPerPage: 12
        });
    });
	
</script>
{% endif %}

{% if template == 'cart' %}
{{ 'js/jquery.livequery.min.js' | static_url | script_tag }}
<script type="text/javascript">
    $(document).ready(function(){
        
        // Key pressed in quantity input
        $(".cantidad input").keypress(function(e){
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });

        // Quantity input focus out
        $(".cantidad input").focusout(function(e){
            var itemID = $(this).attr("data-item-id");
            var itemVAL = $(this).val();
            if(itemVAL==0) {
                var r = confirm("{{ 'Tem certeza de que deseja excluir este item?' | translate }}");
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
            var shippingPrice = $(this).attr("data-price");            
            $(this).click(function() { 
                LS.addToTotal(shippingPrice);               
            }); 
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
	$(function() {
		$('#content.single form select').selectmenu({
		    style:'popup',
		    width: 250,
		    maxHeight:300,
		    wrapperElement: '<div class="select-wrap"/>',
		    change: function(){
		        LS.changeVariant(changeVariant);
		    }
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
