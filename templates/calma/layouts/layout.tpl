<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
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
<title>{{ page_title }}</title>

{{ 'screen.css' | static_url | css_tag }}
{{ 'fancy.css'  | static_url | css_tag }}
{{ 'slider/slider.css' | static_url | css_tag }}
{{ 'ie.css'     | static_url | css_tag }}
{{ 'style.css.tpl'   | static_url | css_tag }}
{% head_content %}

    <style>
        {{ settings.css_code }}
    </style>

<!--[if lte IE 6]>
	{{ 'ie6.css'  | static_url | css_tag }}
<![endif]-->

{{ 'pngfix.js' | static_url | script_tag }}
{{ 'cloud-zoom.1.0.2.min.js' | static_url | script_tag }}


<!--[if lte IE 6]>
  {{ 'supersleight.js' | static_url | script_tag }}
  <script type="text/javascript" charset="utf-8">
  $(document).ready(function() {
    $('.supersleight').supersleight();
  });
  </script>
<![endif]-->
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
<div class="container">

  <div id="header" class="span-24 last">
    
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
			
    <div class="span-17">
  		<div id="logo">
  			<h1>
  			  <a href="{{ store.url }}" title="{{ shop.name }}">
  			    {% if has_logo %}
  			    	{{ store.logo | img_tag }}
  			    {% else %}  			  
		  			{{ store.name }}  
  			    {% endif %}
  			  </a>
  			</h1>
  		</div>
	</div>
	
	{% snipplet "languages.tpl" %}
  </div>
  
  <div id="subheaderbar" class="span-24 last">    
    <div id="subheaderbar-content">
      <div class="inner">
        {% if not store.is_catalog %}
		    {% snipplet "cart.tpl" %}
        {% endif %}
		        
        <div id="home-btn">
          <a href="{{ store.url }}">{{ "home.gif" | static_url | img_tag }}</a>
        </div>
        
        <div id="breadcrumb" class="alt" itemprop="breadcrumb">
			{% if template == "category" or template == "product" %}
				{% snipplet "breadcrumbs.tpl" %}
			{% elseif template == "contact" %}
				&raquo; {{ "Contacto" | translate }}
			{% elseif template == "home" %}
				&raquo; {{ "Inicio" | translate }}
			{% elseif template == "page" %}
				&raquo; {{ page.name }}
			{% elseif template == "cart" %}
				&raquo; {{ "Carrito" | translate }}
			{% elseif template == "404" %}
				&raquo; {{ "Error" | translate }}
			{% elseif template == "search" %}
				&raquo; {{ "Buscador" | translate }}
			{% endif %}
        </div>
        
  		</div>
    </div>
  </div>
  
  <div id="sidebar" class="span-7">
		<div id="search-box">
			<form action="{{ store.search_url }}" method="get">
			  <input type="text" id="q" name="q" onblur="if( this.value == '' ) {this.value = '{{ 'Buscar...' | translate }}';};" onclick="if( this.value == '{{ 'Buscar...' | translate }}' ) {this.value = '';};" size="23" value="{{ 'Buscar...' | translate }}"/>
				<input type="image" src="{{ 'search.gif' | static_url }}" value="Search" id="search" />
			</form>
		</div>
		
	<div id="navigation">
		{% snipplet "navigation.tpl" %}
	</div>
	
	{% if template != "cart" %}      
	  <div class="sidebar-box">
      <div class="inner">
		<div class="store_social_buttons addthis_toolbox addthis_default_style addthis_32x32_style">
			<a class="addthis_button_facebook_like"></a>
			<a class="addthis_button_google_plusone"></a>
		</div>
      </div>
    </div>
   	{% endif %}

    {% if "banner-sidebar.jpg" | has_custom_image %}
      <div class="banner-sidebar">
          {% if settings.banner_sidebar_url != '' %}
              {{ "banner-sidebar.jpg" | static_url | img_tag | a_tag(settings.banner_sidebar_url) }}
          {% else %}
              {{ "banner-sidebar.jpg" | static_url | img_tag }}
          {% endif %}
      </div>
    {% endif %}

  </div>

	
	<div class="span-17 last">
    <div id="content">
      	{% template_content %}
    </div>
	</div>

  <div class="span-24 contact-details">
      <ul>
          {% if store.address %}
          <li><strong>{{ "Dirección" | translate }}:</strong> {{ store.address }}</li>
          {% endif %}
          {% if store.email %}
          <li><strong>{{ "Email" | translate }}:</strong> <a href="mailto:{{ store.email }}">{{ store.email }}</a></li>
          {% endif %}
          {% if store.phone %}
          <li><strong>{{ "Teléfono" | translate }}:</strong> {{ store.phone }}</li>
          {% endif %}
          {% if store.blog %}
          <li><strong>{{ "Blog" | translate }}:</strong> {{ store.blog | a_tag_blank(store.blog) }}</li>
          {% endif %}
         {% if store.twitter or store.facebook or store.google_plus or store.pinterest or store.instagram %}
        <li class="social">
          <strong style="float:left">{{ "Síguenos en" | translate }} </strong>
          {% if store.facebook %}
          <a href="{{ store.facebook }}" title="Facebook" class="social-icon" id="fb-icon">Facebook</a>
          {% endif %}
          {% if store.twitter %}
          <a href="{{ store.twitter }}" title="Twitter" class="social-icon" id="twitter-icon">Twitter</a>
          {% endif %}
          {% if store.google_plus %}
          <a href="{{ store.google_plus }}" title="Google Plus" class="social-icon" id="gplus-icon" rel="publisher">Google Plus</a>
          {% endif %}
          {% if store.pinterest %}
          <a href="{{ store.pinterest }}" title="Pinterest" class="social-icon" id="pinterest-icon">Pinterest</a>
          {% endif %}
          {% if store.instagram %}
          <a href="{{ store.instagram }}" title="Instagram" class="social-icon" id="instagram-icon">Instagram</a>
          {% endif %}
        </li>
        {% endif %}
      </ul>
  </div>
  <div class="span-24 last">
		<div id="footer">
            {% if settings.show_footer_fb_like_box and store.facebook %}
                <div style="margin:10px 0;">
                    {{ store.facebook | fb_page_plugin(921,190) }}
                </div>
            {% endif %}
  		<p>{{ "Copyright &copy; {1} {2}. Todos los derechos reservados." | translate("now" | date("Y"), ( store.business_name ? store.business_name : store.name ) ~ ' ' ~ store.business_id) }}</p>
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
  		<p class="tiendanube alt">{{ powered_by_link }}</p>
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
  </div>

</div>

{{ 'slider/slider.js' | static_url | script_tag }}
<script type="text/javascript">
    function changeVariant(variant){
		if (variant.price_long){
			$('#price-field').text(variant.price_long).show();
		} else {
			$('#price-field').hide();
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

		var button = $('.addToCart');
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
	    $('#navigation a[href=#]').click(function(){
		    return false;
		});
	
        $('.nivoSlider').nivoSlider({
            animSpeed: 250,
            manualAdvance: {{ settings.slider_auto ? 'false' : 'true' }}
        });

        if({{ settings.slider | length == 1 ? 'true' : 'false' }}) {
            $('.nivo-directionNav, .nivo-controlNav').remove();
        }

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

{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
<script type="text/javascript">
    $(function() {
        new LS.infiniteScroll({
            afterSetup: function() {
                $('.paginate').hide();
            },
            productGridClass: 'product-grid',
            productsPerPage: 32,
            loadingElement: '<tr class="infinite-scroll-loading"><td colspan="2"></td><tr/>'
        });
    });

</script>
{% endif %}


<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
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
