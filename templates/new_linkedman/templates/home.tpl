{% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and (not has_products or not sections.primary.products) %}
<div class="sections {% if show_help %}no-products{% endif %}">
    {% if show_help %}
    <div class="headerBox-Page">
        <h2>{{"¡Bienvenido a tu tienda!" | translate}}</h2>
    </div>  
    {% endif %}
</div>

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    <div class="hidden-phone">
        {% snipplet 'defaults/show_help.tpl' %}
    </div>
    <div class="visible-phone">
        {% snipplet 'defaults/show_help_category.tpl' %}
    </div>
{% endif %}
{# END of show default products in the home page #}

<div class="row-fluid">
    <div class="contentBox slider-wrapper theme-light {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
        <i class="fa fa-spin fa-refresh"></i>
        <ul class="homeslider bxslider">
            {% if settings.slider and settings.slider is not empty %}
                {% for slide in settings.slider %}
                    {% set slide_img = slide.image | static_url %}
                    {% if slide.link is empty %}
                        <li><img src="{{ slide_img }}" style="visibility: hidden;"/></li>
                    {% else %}
                        <li><a href="{{ slide.link }}"><img src="{{ slide_img }}" style="visibility: hidden;"/></a></li>
                    {% endif %}
                {% endfor %}
            {% endif %}
        </ul>
    </div>
</div>
{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services.tpl' %}
{% endif %} 
{% if settings.welcome_message %}
	<div class="row-fluid">
    	<div class="headerBox">
			<h2>{{ settings.welcome_message }}</h2>
		</div>
	</div>
{% endif %}


{% if sections.primary.products %}
    <div class="row-fluid">
        {% for product in sections.primary.products %}
            {% if loop.index % 4 == 1 %}
            <div class="product-row">
            {% endif %}

            {% include 'snipplets/single_product.tpl' %}

            {% if loop.index % 4 == 0 or loop.last %}
                </div>
            {% endif %}
        {% else %}

            {% if show_help %}
                {% for i in 1..4 %}
                    {% if loop.index % 4 == 1 %}
                        <div class="product-row">
                    {% endif %}

                    <div class="span3">

                        <div class="dest-gral" style="opacity:0.5;">
                            <div class="head">
								<a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                            </div>
                            <div class="bajada">
                                <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                                <div class="price">{{"$0.00" | translate}}</div>
                            </div>
                        </div>

                	</div>

                    {% if loop.index % 4 == 0 or loop.last %}
                        </div>
                    {% endif %}
                {% endfor %}
            {% endif %}
        {% endfor %}
    </div>
{% endif %}


<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{% if "banner-home.jpg" | has_custom_image %}
	<div class="row-fluid">
        <div class="banner">
            {% if settings.banner_home_url != '' %}
                {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
            {% else %}
                {{ "banner-home.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    </div>
{% endif %}

<div class="row-fluid sb facebook-widget-row">

    {% if settings.show_footer_fb_like_box and store.facebook %}
        <div class="span{% if settings.twitter_widget %}6{% else %}12{% endif %}" style="overflow:hidden;">
            <div class="social-title">
                <h2>{{"Síguenos en Facebook" | translate}}</h2>
            </div>
            <div style="margin:10px 0;">
                {{ store.facebook | fb_page_plugin(980,200) }}
            </div>
        </div>
    {% endif %}

    {% if settings.twitter_widget %}
		<div class="span{% if settings.show_footer_fb_like_box and store.facebook %}6{% else %}12{% endif %}">
            <div class="social-title">
                <h2>{{"Síguenos en Twitter" | translate}}</h2>
            </div>

			<div class="row-fluid tw">
            	<div class="twitter-time">
                    {{ settings.twitter_widget | raw }}
				</div>
			</div>
  		</div>
    {% endif %}
</div>
