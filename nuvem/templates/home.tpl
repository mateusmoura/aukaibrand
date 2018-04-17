<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

<div class="top-shadow"></div>
<div class="js-home-slider-container slider-wrapper m-bottom m-bottom-half-xs {% if not settings.slider or settings.slider is empty %} hidden {% endif %}">
    {% snipplet 'placeholders/home-slider-placeholder.tpl' %}
    <div class="js-home-slider-preloader slider-loading-icon svg-secondary-fill rotate">
        {% include "snipplets/svg/spinner.tpl" %}
    </div>
    <ul class="js-home-slider slider" style="visibility:hidden; height:0;">
        {% if settings.slider %}
	        {% for slide in settings.slider %}
	            <li class="slider-slide">
	                {% set slide_img = slide.image | static_url %}
	                {% if slide.link is empty %}
                        {{ slide_img | img_tag('', {class: 'slider-image', style: "visibility:hidden;"}) }}
	                {% else %}
	                    <a href="{{ slide.link }}">{{ slide_img | img_tag('', {class: 'slider-image', style: "visibility:hidden;"}) }}</a>
	                {% endif %}
	            </li>
	        {% endfor %}
		{% endif %}
    </ul>
</div>
{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services/banner-services.tpl' %}
{% endif %} 

{% if categories %}
    {% include 'snipplets/home-categories.tpl' %}
{% endif %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    {% snipplet 'defaults/show_help.tpl' %}
{% endif %}
{# END of show default products in the home page #}
 
<div class="container">
	{% if sections.primary.products %}
	<div class="title-container row m-top">
   		<h2 class="title h1 h5-xs">{{"Destacados" | translate}}</h2>
    </div>
	<div class="row text-center-xs">
		<section id="grid" class="js-masonry-grid grid clearfix">
			<div class="js-masonry-grid" >
				{% for product in sections.primary.products %}
					{% include 'snipplets/single_product.tpl' %}
				{% endfor %}
			</div>
		</section>
	</div>
    <div class="row">
        <div class="text-center p-left-half p-right-half full-width d-inline-block m-bottom m-top">
	        <a href="{{ store.products_url }}" class="btn btn-secondary col-xs-12 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4">{{ "Ver todos los productos" | translate }}</a>
	    </div>
    </div>
	{% endif %}
	<div class="row home-widgets m-top m-none-xs">
		{% set blocksCount = 1%}
		{% if settings.show_footer_fb_like_box and store.facebook %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if settings.twitter_widget %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if blocksCount == 1 %}
		<div class="col-xs-12 col-md-4 col-md-offset-4 p-bottom-xs">
		{% elseif blocksCount == 2 %}
		<div class="col-xs-12 col-md-6 p-bottom-xs">
		{% else %}
		<div class="col-xs-12 col-md-4 p-bottom-xs">
		{% endif%}
			<div class="title-container">
		   		<h4 class="subtitle h5-xs">{{"Nuestro Newsletter" | translate}}</h4>
		    </div>
			{% snipplet "newsletter.tpl" %}
		</div>
		{% if settings.show_footer_fb_like_box and store.facebook %}
		{% if blocksCount == 2 %}
		<div class="col-xs-12 col-md-6">
		{% else %}
		<div class="col-xs-12 col-md-4">
		{% endif%}
			<div class="title-container">
		   		<h4 class="subtitle h5-xs">{{"Estamos en Facebook" | translate}}</h4>
		    </div>
            <div class="followus-container">
                {{ store.facebook | fb_page_plugin(340,200) }}
            </div>
		</div>
		{% endif %}
		{% if settings.twitter_widget %}
		{% if blocksCount == 2 %}
		<div class="col-xs-12 col-md-6">
		{% else %}
		<div class="col-xs-12 col-md-4">
		{% endif%}
			<div class="title-container">
		   		<h4 class="subtitle h5-xs">{{"Estamos en Twitter" | translate}}</h4>
		    </div>
			{{ settings.twitter_widget | raw }}
		</div>
		{% endif %}
	</div>
</div>
