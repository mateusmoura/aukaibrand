{% paginate by 9 %}

{% if category.id != 0 %}
    {% snipplet "breadcrumbs.tpl" %}
{% endif %}

<div id="excerpt">
	<h1 class="title">{{ category.name }}</h1>
</div>

{% if "banner-products.jpg" | has_custom_image %}
    <div class="banner">
        {% if settings.banner_products_url != '' %}
            {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
        {% else %}
            {{ "banner-products.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}

{% if category.subcategories %}
    <ul id="products" class="clear">
	    {% snipplet "product_grid.tpl" with products = category.subcategories, hide_prices = true %}
    </ul>
{% else %}
	{% if products %}
        <ul id="products" class="product-grid clear">
		    {% snipplet "product_grid.tpl" %}
        </ul>
		{% snipplet "pagination.tpl" %}
	{% else %}
		<p id="empty">{{ "No hay productos en esta categoría." | translate }}</p>
	{% endif %}
{% endif %}