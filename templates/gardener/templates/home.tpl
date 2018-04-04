<!-- Slider -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}
{% if "default-background.jpg" | has_custom_image %}
	{% if settings.bg_position_x == "left" %}
	<div class="user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:left;">
	{% elseif settings.bg_position_x == "center" %}
	<div class="user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:center;">
	{% else %}
	<div class="user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:right;">
	{% endif %}
{% else %}
<div class="pattern-background">
{% endif %}
	<div class="container">
		<div class="row slider-wrapper theme-default {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
	        <i class="fa fa-spin fa-circle-o-notch"></i>
			<div id="slider" class="homeslider">
				{% if settings.slider %}
	                {% for slide in settings.slider %}
	                    {% set slide_img = slide.image | static_url %}
	                    {% if slide.link is empty %}
	                        <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" style="visibility: hidden;" />
	                    {% else %}
	                        <a href="{{ slide.link }}"><img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" /></a>
	                    {% endif %}
	                {% endfor %}
				{% endif %}
			</div>
		</div>
	</div>
</div>
{% if settings.banner_services_home %} 
	{% include 'snipplets/banner-services.tpl' %}
{% endif %} 
<div class="container">
	{% if settings.welcome_message %}
	<div class="row text-center welcome-message">
		<h2>{{ settings.welcome_message }}</h2>
		<hr />
	</div>
	{% endif %}

	{% if sections.primary.products %}
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<h2 class="title">{{"Productos Destacados" | translate}}</h2>
				<hr class="line" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<section id="grid" class="grid clearfix">
			{% for product in sections.primary.products %}
				{% if loop.index % 4 == 1 %}
				<div class="row">
				{% endif %}
					{% include 'snipplets/single_product.tpl' %}
				{% if loop.index % 4 == 0 or loop.last %}
			    </div>
			    {% endif %}
			{% endfor %}
			</section>
		</div>
	</div>
	{% endif %}
	<div class="row">
		{% set blocksCount = 0 %}
		{% if settings.show_footer_fb_like_box and store.facebook %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if settings.twitter_widget %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}

		{% if settings.show_footer_fb_like_box and store.facebook %}
		{% if blocksCount == 1 %}
		<div class="col-md-12">
		{% elseif blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div>
		{% endif%}
			<div class="section-title">
				<h2 class="title">{{"Estamos en Facebook" | translate}}</h2>
				<hr class="line" />
			</div>
            <div class="facebook-home-widget">
                {{ store.facebook | fb_page_plugin(340,200) }}
            </div>
		</div>
		{% endif %}
		{% if settings.twitter_widget %}
		{% if blocksCount == 1 %}
		<div class="col-md-12">
		{% elseif blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div>
		{% endif%}
			<div class="section-title">
				<h2 class="title">{{"Estamos en Twitter" | translate}}</h2>
				<hr class="line" />
			</div>
			<div class="twitter-home-widget">
				{{ settings.twitter_widget | raw }}
			</div>
		</div>
		{% endif %}
	</div>
</div>
