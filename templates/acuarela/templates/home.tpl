{% if settings.home_display == "slider" or settings.home_display == "both" %}
    <div class="slider-wrapper theme-light">
        <div class="nivoSlider">
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" />
                {% else %}
                    <a href="{{ slide.link }}"><img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" /></a>
                {% endif %}
            {% endfor %}
        </div>
    </div>
{% endif %}
{% if settings.home_display == "products" or settings.home_display == "both" %}
<div id="showcase" class="clear">
{% for product in sections.primary.products | take(1) %}
	<div id="details">
		<h3>{{ product.name }}</h3>
		{% if product.display_price %}
		<h4>{{ product.price | money }}</h4>
        {% if product.compare_at_price %}
        <h4><del>{{ product.compare_at_price | money }}</del></h4>
        {% endif %}
        {% endif %}
		<div class="share">
			<div class="shareItem twitter">
				{{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
			</div>
			<div class="shareItem google"> 
				{{product.social_url | g_plus('medium') }}
			</div>
			<div class="shareItem facebook"> 
				{{product.social_url | fb_like('store-product', 'button_count')}}
			</div>
		</div>
		<p>{{ product.description | plain | truncate(215) }}</p>
		<h5 class="clear"><a href="{{ product.url }}">{{ 'Más detalles' | translate}}</a></h5>
	</div>
	<div id="image">
		<a href="{{ product.url }}">{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}</a>
	</div>
{% endfor %}
</div>
{% endif %}

{% if "banner-home.jpg" | has_custom_image %}
    <div class="banner">
        {% if settings.banner_home_url != '' %}
            {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
        {% else %}
            {{ "banner-home.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}

{% if settings.welcome_message %}
<div id="excerpt">
	<div>
        {{ settings.welcome_message }}
	</div>
</div>
{% endif %}
<ul id="products" class="clear">
{% for otherProduct in sections.secondary.products %}
	<li {% if loop.index % 3 == 0 %}class="end"{% endif %}>
		<div class="image">
			<div class="overflow">
				<div class="align">
				{% if otherProduct.display_price %}
					<h6>{{ otherProduct.price | money }}</h6>
				{% endif %}
					
					<div><a href="{{ otherProduct.url}}">{{ otherProduct.featured_image | product_image_url("medium") | img_tag(otherProduct.featured_image.alt) }}</a></div>
				</div>
			</div>
		</div>
		<p><a href="{{ otherProduct.url}}">{{ otherProduct.name }}</a></p>
	</li>
{% endfor %}
	</ul>