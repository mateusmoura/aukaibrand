{% paginate by 32 %}

{% if not category.products %}
	<strong>{{ "No hay productos en esta categoría." | translate }}</strong>
{% else %}

	<h2 class="light">
		{{ category.name }}
	</h2>
	
	{{ category.description }}

    {% snipplet "pagination.tpl" %}

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
        <table id="collection" class="product-grid" cellpadding="0" cellspacing="0">
            {% snipplet "product_grid.tpl" %}
        </table>
    {% endif %}

    {% snipplet "pagination.tpl" %}
{% endif %}


