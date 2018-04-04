{% if settings.home_slider %}
    <div class="contentBox slider-wrapper theme-light">
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
<div id="showcase">
{% if sections.primary.products %}
	{% set product = sections.primary.products | first %}
    {% if product %}
	<h1>{{ product.name }}</h1>
	<div id="image" class="clear">
		<a href="{{ product.url }}">
			{{ product.featured_image | product_image_url("original") | img_tag(product.featured_image.alt) }}
		</a>
	</div>
	<h3>{{ settings.solo_product_message }}</h3>
	<div id="buy" class="clear">
        <a class="button" id="buy-this" href="{{ product.url }}">
        	{{ "Ver Detalles" | translate }}
        </a>
        {% if product.display_price %}
            {% if product.compare_at_price %}
            <del>
                <span>{{ product.compare_at_price | money }}</span>
            </del>
            {% endif %}
        	<span>{{ product.price | money }}</span>
        {% endif %}
	</div>
	{% endif %}
{% else %}
	<p><a href="/admin/themes/settings/">{{ "El diseño Unico te permite elegir tu mejor producto y destacarlo junto con otros productos secundarios." | translate }}</a></p>
{% endif %}
</div>

{% if "banner-home.jpg" | has_custom_image %}
    <div class="banner">
        {% if settings.banner_home_url != '' %}
            {{ "banner-home.jpg" | static_url | img_tag | a_tag(settings.banner_home_url) }}
        {% else %}
            {{ "banner-home.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}

{% snipplet "related.tpl" %}