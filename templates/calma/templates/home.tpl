{% if settings.slider | length %}
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

{% if sections.main.products or sections.secondary.products %}

<h2 class="light">{{ "Destacados" | translate }}</h2>

{% set product = sections.main.products | first %}
{% if product %}
<div class="big-product">

  <div class="product-image">
    <a href="{{ product.url }}"><img src="{{ product.featured_image | product_image_url( 'medium') }}" alt="{{ product.featured_image.alt }}" /></a>
  </div>
  
  <div class="product-info">
    <h3 class="title"><a href="{{ product.url }}">{{ product.name }}</a></h3>
    <p class="price">
    	{% if product.display_price %}
			{{ product.price | money }}
		{% else %}
			{{ "Consultar precio" | translate }}
		{% endif %}
	</p>

    <p class="description">{{ product.description | plain | truncateWords(40) }}</p>

	<a href="{{ product.url }}" class="button">{{ "Ver detalles" | translate }}</a>
  </div>
  
</div>
{% endif %}

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

{% if sections.secondary.products %}
    <table id="collection" class="product-grid" cellpadding="0" cellspacing="0">
        {% snipplet "product_grid.tpl" with products = sections.secondary.products %}
    </table>
{% endif %}