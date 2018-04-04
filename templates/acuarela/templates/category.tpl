{% paginate by 9 %}
<div id="excerpt">
	<h1>{{ category.name }}</h1>
</div>

{% snipplet "breadcrumbs.tpl" %}

{% if "banner-products.jpg" | has_custom_image %}
    <div class="banner">
        {% if settings.banner_products_url != '' %}
            {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
        {% else %}
            {{ "banner-products.jpg" | static_url | img_tag }}
        {% endif %}
    </div>
{% endif %}

{% if products %}
<ul id="products" class="product-grid clear">
    {% snipplet "product_grid.tpl" %}
</ul>
{% endif %}

<div id="paginate">
	<div>
		{% snipplet "pagination.tpl" %}
	</div>
</div>