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
	
	{{ "reset.css" | static_url | css_tag }}
	{{ "screen.css" | static_url | css_tag }}
	{{ 'slider/slider.css' | static_url | css_tag }}
	{{ 'style.css' | static_url | css_tag }}
	{{ 'custom.css.tpl' | static_url | css_tag }}
	
	
	<!--[if lte IE 6]>{{ "ie6.css" | static_url | css_tag }}<![endif]-->
    <!--[if IE 7]>{{ "ie7.css" | static_url | css_tag }}<![endif]-->
	
	{% head_content %}

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

	<div id="container">
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
			
		{% snipplet "header.tpl" %}
		
		<div id="navigate">
			<div id="nav">&nbsp;</div>
			{% snipplet "navigation.tpl" %}
            {% if not store.is_catalog %}
			    {% snipplet "cart.tpl" %}
            {% endif %}
		</div>
		
		<div id="shadow">&nbsp;</div>
			<!-- set the id accordingly to the template to be rendered -->
			<div id="{{ template | replace('404', 'missing') }}" class="content">
				<div id="bg" class="clear">
					{% template_content %}
				</div>
			</div>
		<div id="roundup">&nbsp;</div>
		
		{% snipplet "footer.tpl" %}
	
	</div>


{{ "jquery-1-3-1.js" | static_url | script_tag }}
{{ "jquery-ui-1-7-1.js" | static_url | script_tag }}
{{ "custom.js" | static_url | script_tag }}
{{ 'cloud-zoom.1.0.2.min.js' | static_url | script_tag }}
{{ 'slider/slider.js' | static_url | script_tag }}

<script type="text/javascript">
	$('.nivoSlider').nivoSlider({
        animSpeed: 250,
        manualAdvance: {{ settings.slider_auto ? 'false' : 'true' }}
    });

    if({{ settings.slider | length == 1 ? 'true' : 'false' }}) {
        $('.nivo-directionNav, .nivo-controlNav').remove();
    }
</script>

{% if template == 'product' %}

	<script type="text/javascript">
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
			
			if (variant.installments && variant.installments > 1){
				$('#installments_number').text(variant.installments);
				$('#installments_amount').text(variant.installments_amount_short);
				$('.installments').show();
			} else {
				$('.installments').hide();
			}

            if(variant.contact) {
                $('.logos').hide();
            } else {
                $('.logos').show();
            }

			var button = $('#add');
			button.removeClass('cart').removeClass('contact').removeClass('nostock');
            {% if not store.is_catalog %}
			if (!variant.available){
				button.val('{{ "Sin stock" | translate }}');
				button.addClass('nostock');
				button.attr('disabled', 'disabled');
			} else if (variant.contact) {
				button.val('{{ "Consultar precio" | translate }}');
				button.addClass('contact');
				button.removeAttr('disabled');
			} else {
				button.val('{{ "Agregar al carrito" | translate }}');
				button.addClass('cart');
				button.removeAttr('disabled');
			}
            {% endif %}
		}
	
		$(document).ready(function(){
			$('#product_form').submit(function(){
				var button = $(this).find(':submit');
		
				button.attr('disabled', 'disabled');
				if (button.hasClass('cart')){
					button.val('{{ "Agregando..." | translate }}');
				}
			});

		    {% if provinces_json %}
	        $('select[name="country"]').change(function() {
	            var provinces = {{provinces_json | default('{}') | raw}};
	            LS.swapProvinces(provinces[$(this).val()]);
	        }).change();
		    {% endif %}
		});

	</script>
{% endif %}
{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
<script type="text/javascript">
    $(function() {
        new LS.infiniteScroll({
            afterSetup: function() {
                $('#paginate').hide();
            },
            productGridClass: 'product-grid'
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
