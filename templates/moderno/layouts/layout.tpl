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
        <meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Consultar' | translate }}" />
        <meta name="twitter:label1" content="{{ 'Precio' | translate | upper }}" />
        <meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Si' | translate }}" />
        <meta name="twitter:label2" content="{{ 'Stock' | translate | upper }}" />
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
    {{ 'js/bxslider/jquery.bxslider.css' | static_url | css_tag }}
    {{ 'js/fancybox/jquery.fancybox.css' | static_url | css_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/themes/smoothness/jquery-ui.css' | css_tag }}
    {{ '//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css' | css_tag }}
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

<div id="wrap">
	{% if store.has_accounts %}
		<div id="auth">
			{% if not customer %}
				{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                {% if 'mandatory' not in store.customer_accounts %}
				{{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                {% endif %}
			{% else %}
				{{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
				{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
			{% endif %}
		</div>
	{% endif %}

	<div id="top">
		{% if languages | length > 1 %}
		<div id="idioma">
			<span>{{ "País" | translate }}</span>
			{% for language in languages %}
				<a href="{{ language.url }}" class="{{ language.active ? 'selected' : '' }} ">{{ language.country | flag_url | img_tag(language.name) }}</a>
			{% endfor %}
		</div>
		{% endif %}
	
	
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
                    <h1 class="img logo">
                        <a id="no-logo" href="{{ store.url }}" >{{ store.name }}</a>
                    </h1>
                {% else %}
                    <a id="no-logo" href="{{ store.url }}" >{{ store.name }}</a>
                {% endif %}
			{% endif %}
		</div>
	    <div class="searchbox-container">
            <form action="{{ store.search_url }}" method="get" id="search">
                    {% if store.phone %}
                        <div class="header-contact-info">
                            {{ store.phone }}
                        </div>
                    {% endif %}
                    {% if store.email %}
                        <div class="header-contact-info">
                            {{ store.email }}
                        </div>
                    {% endif %}
                <input type="text" name="q" value="{{ 'Buscar' | translate }}..." onblur="if (this.value == '') {this.value = '{{ "Buscar" | translate }}...';}"  onfocus="if (this.value == '{{ 'Buscar' | translate }}...') {this.value = '';}" />
                <input type="submit" value="{{ 'Buscar' | translate }}" />
            </form>
            <div class="clear"></div>
        </div>
	</div><!--top-->
	
	<div id="bar">
		<div id="gradient" {% if store.is_catalog %}class="full-width"{% endif %}></div>
		<ul id="navigation" class="sf-menu {% if store.is_catalog %}full-width{% endif %}">
		{% for item in navigation %}
			<li class="{{ item.current ? 'selected' : '' }}">
				{% if item.subitems %}
					<a href="{{ item.url | default('#') }}" {% if item.url | is_external %}target="_blank"{% endif %} title="{{ item.name }}">{{ item.name }} <img src="{{ 'images/dropdown.png' | static_url }}" alt="" /></a>
					<ul>{% snipplet "categories.tpl" with categories = item.subitems %}</ul>
				{% else %}
					<a href="{{ item.url | default('#') }}" {% if item.url | is_external %}target="_blank"{% endif %} title="{{ item.name }}">{{ item.name }}</a>
				{% endif %}
			</li>
		{% endfor %}
		</ul>
        {% if not store.is_catalog %}
		<ul id="compra">
			<li id="ver" class="{{ template == 'cart' ? 'selected' : '' }}"><a href="{{ store.cart_url }}">{% snipplet "cart.tpl" as "cart" %}</a></li>
		</ul>
        {% endif %}
	</div><!--bar-->

	{% template_content %}
    <div class="banner-services-footer">
        {% if settings.banner_services %}
            {% include 'snipplets/banner-services.tpl' %}
        {% endif %}
    </div>
	<div id="footer">
        {% if settings.show_footer_fb_like_box and store.facebook %}
            <div style="margin:-10px -22px 30px;">
                {{ store.facebook | fb_page_plugin(962,190) }}
            </div>
        {% endif %}
            <div class="right">
                <div class="payments">
                    {% for payment in settings.payments %}
                        {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                    {% endfor %}
                </div>
                <div class="shipping">
                    {% for shipping in settings.shipping %}
                        {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                    {% endfor %}
                </div>
                <div class="seals">
                    {% if ebit %}
                    {{ ebit }}
                    {% endif %}
                    {% if store.afip %}
		            <div class="afip">
		            {{ store.afip | raw }}
		            </div>
		            {% endif %}
                </div>
            </div>
		<div id="footer-navigation">
			<ul>
				<li>{{ "Inicio" | translate | a_tag(store.url) }}</li>
				<li>{{ "Contacto" | translate | a_tag(store.contact_url) }}</li>
				{% if store.twitter %}
					<li class="twitter"><a target="_blank" href="{{ store.twitter }}">Twitter</a></li>
				{% endif %}
				{% if store.facebook %}
					<li class="facebook"><a target="_blank" href="{{ store.facebook }}">Facebook</a></li>
				{% endif %}
				{% if store.google_plus %}
					<li class="gplus"><a target="_blank" href="{{ store.google_plus }}" rel="publisher">Google+</a></li>
				{% endif %}
				{% if store.pinterest %}
					<li class="pinterest"><a target="_blank" href="{{ store.pinterest }}">Pinterest</a></li>
				{% endif %}
				{% if store.instagram %}
					<li class="instagram"><a target="_blank" href="{{ store.instagram }}">Instagram</a></li>
				{% endif %}
				{% if store.blog %}
					<li class="twitter"><a target="_blank" href="{{ store.blog }}">{{ "Blog" | translate }}</a></li>
				{% endif %}
			</ul>
			<p>{{ "Copyright {1} {2}. Todos los derechos reservados." | translate( "now" | date('Y'), ( store.business_name ? store.business_name : store.name ) ~ ' ' ~ store.business_id ) }}</p>
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
			<p>{{ powered_by_link }}</p>
		</div>
		<div id="footer-logo"></div>
	</div><!--footer-->
	
</div>
{{ "//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js" | script_tag }}
{% if settings.slider and settings.slider is not empty %}
    {{ "js/bxslider/jquery.bxslider.min.js" | static_url | script_tag }}
{% endif %}
{{ "js/jquery.cycle.js" | static_url | script_tag }}
{{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
{{ "js/jquery.tipTip.min.js" | static_url | script_tag }}
{{ "js/tipTip.css" | static_url | css_tag }}
{{ "js/superfish.js" | static_url | script_tag }}
{{ "js/hoverIntent.js" | static_url | script_tag }}
{{ 'js/fancybox/jquery.fancybox.pack.js' | static_url | script_tag }}
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
		
		$('#product_form').submit(function(){
			var button = $(this).find(':submit');
		
			button.attr('disabled', 'disabled');
			if (button.hasClass('cart')){
				button.val('{{ "Agregando..." | translate }}');
			}
		});

	});

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
	
		if (variant.compare_at_price_long){
			$('#compare_price_display').text(variant.compare_at_price_long).show();
		} else {
			$('#compare_price_display').hide();
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
		
        if(variant.contact) {
            $('.logos').hide();
        } else {
            $('.logos').show();
        }

		var button = $('.addToCart');
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
	</script>
{% endif %}
{% if template == 'cart' %}
    <script type="text/javascript">
        $(document).ready(function(){
            $(".cantidad input").keypress(function(){
                $('#change-quantities').show();
                {% if settings.cart_minimum_value %}
                   $(".button.iniciar").hide();
                {% endif %}
            });
        });
    </script>
{% endif %}
{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
<script type="text/javascript">
    $(function() {
        new LS.infiniteScroll({
            afterSetup: function() {
                $('#pages').hide();
            },
            finishData: function() {
                    $('#loadMoreBtn').remove();
                },
            productGridClass: 'product-grid',
            loadingElement:'<div class="span12 c infinite-scroll-loading" style="margin-top:10px; background-size: 5%"></div>'
        });
    });

</script>
{% endif %}
<script type="text/javascript">
    $(function() {

    LS.registerOnChangeVariant(function(variant){
        var image = $('a.enlarge[data-image='+variant.image+']', '.pictures > .small');
        var image_url = image.attr('href');
        var big_image = $('a', '.pictures > .big');
        big_image.attr('href', image_url);
        $('img', big_image).attr('src', image_url);
    });

        var $navigation = $("#navigation");
        var $navigation_a = $navigation.find('a');
        var navHeight = parseInt($navigation.css('height', 'auto').height());
        var fontSize = parseInt($navigation_a.css('font-size'));

        while (navHeight > 31 && fontSize > 9){
            $navigation_a.css('font-size', --fontSize);
            navHeight = parseInt($navigation.height());
        }

        $("ul.sf-menu").superfish();
        $(".tooltip").tipTip();

        //BEGIN Single Product
        $("a.enlarge").fancybox({
            'overlayShow'	: false,
            'transitionIn'	: 'elastic',
            'transitionOut'	: 'elastic'
        });
        //END Single Product
        /*
         $("#content .item .data .thumb").hover(function(){
         $(this).find(".primary").fadeOut(200);
         $(this).find(".secondary").fadeIn(200);
         },
         function(){
         $(this).find(".secondary").fadeOut(200);
         $(this).find(".primary").fadeIn(200);
         });
         */

        $navigation.find('a[href=#]').click(function(){
		    return false;
		});
    
        /* homepage slider parameters */
        if($.fn.cycle) {
            $('.home-slider').after('<div id="pager">').cycle({
                speed:  2000,
                timeout: {% if settings.slider_auto %}5000{% else %}0{% endif %},
                pager:  '#pager',
                pause: 1
            });
        }

        if($.fn.bxSlider) {
            var bxslider = $('.homeslider').bxSlider({
                auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
                pause: 5000,
                autoHover: true,
                adaptiveHeight: false
            });
        }

        {% if settings.slider | length == 1 %}
            $('#pager').remove();
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
