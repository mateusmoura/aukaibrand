{% for product in products %}
    {% if loop.index % 3 == 1 %}
    <div class="product-row">
    {% endif %}

    <a class="product" href="{{ product.url }}" title="{{ product.name }}">
        <span class="head">
            {{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
        </span>
        <span class="bajada">
            <strong>{{ product.name }}</strong>
            {% if product.display_price %}
                <span class="price">{{ product.price | money }}</span>
            {% endif %}
        </span>
    </a>
    {% if loop.index % 3 == 0 or loop.last %}
    </div>
    {% endif %}

{% endfor %}