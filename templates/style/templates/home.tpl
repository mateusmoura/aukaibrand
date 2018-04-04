<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if settings.slider %}
<div class="slider-shadow"></div>
{% endif %}
<div class="slider-wrapper theme-default {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
	<i class="fa fa-spin fa-circle-o-notch"></i>
	<ul id="slider" class="homeslider">
		{% if settings.slider %}
	        {% for slide in settings.slider %}
	            <li>
	                {% set slide_img = slide.image | static_url %}
	                {% if slide.link is empty %}
	                    <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" style="visibility:hidden;"/>
	                {% else %}
	                    <a href="{{ slide.link }}"><img src="{{ slide_img }}" style="visibility:hidden;" data-thumb="{{ slide_img }}" alt="" /></a>
	                {% endif %}
	            </li>
	        {% endfor %}
		{% endif %}
	</ul>
</div>
{% if settings.banner_services_home %} 
	{% include 'snipplets/banner-services.tpl' %}
{% endif %} 

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    <div class="hidden-phone">
            {% snipplet 'defaults/show_help.tpl' %}
    </div>
{% endif %}
{# END of show default products in the home page #}
 
<div class="container">
	{% if sections.primary.products %}
	<div class="row">
		<div class="col-md-12">
			<div class="section-title section-title-large featured-prods">
				<fieldset><legend><h2>{{"Destacados" | translate}}</h2></legend></fieldset>
			</div>
		</div>
	</div>
	<div class="row">
		<section id="grid" class="grid clearfix">
		{% for product in sections.primary.products %}
			{% include 'snipplets/single_product.tpl' %}
		{% endfor %}
		</section>
	</div>
	{% endif %}
	<div class="row">
		{% set blocksCount = 1%}
		{% if settings.show_footer_fb_like_box and store.facebook %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if settings.twitter_widget %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if blocksCount == 1 %}
		<div class="col-md-12">
		{% elseif blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-4">
		{% endif%}
			<div class="section-title">
				<fieldset><legend><h2>{{"Nuestro Newsletter" | translate}}</h2></legend></fieldset>
			</div>
			{% snipplet "newsletter.tpl" %}
		</div>
		{% if settings.show_footer_fb_like_box and store.facebook %}
		{% if blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-4">
		{% endif%}
			<div class="section-title">
				<fieldset><legend><h2>{{"Estamos en Facebook" | translate}}</h2></legend></fieldset>
			</div>
            <div style="margin:10px 0;" class="followus-container">
                {{ store.facebook | fb_page_plugin(340,200) }}
            </div>
		</div>
		{% endif %}
		{% if settings.twitter_widget %}
		{% if blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-4">
		{% endif%}
			<div class="section-title">
				<fieldset><legend><h2>{{"Estamos en Twitter" | translate}}</h2></legend></fieldset>
			</div>
				{{ settings.twitter_widget | raw }}
		</div>
		{% endif %}
	</div>
</div>
