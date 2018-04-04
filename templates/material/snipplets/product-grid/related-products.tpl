<div id="related-products" class="container m-top m-bottom">
    {% set related_products_ids = product.metafields.related_products.related_products_ids %}
    {% if related_products_ids %}
        {% set related_products = related_products_ids | get_products %}
        {% set show = (related_products | length > 0) %}
    {% endif %}
    {% if not show %}
        {% set related_products = category.products | shuffle | take(4) %}
        {% set show = (related_products | length > 1) %}
    {% endif %}
    {% if show %}
        <div class="related-products-header m-bottom m-none-xs">
            <h2>{{ "Productos Relacionados" | translate }}</h2>
        </div>
        <div class="product-row row horizontal-container horizontal-products-container">
            <div class="horizontal-products-scroller">
            {% for related in related_products %}
                {% if product.id != related.id %}
                    {% include 'snipplets/single_product.tpl' with {product : related} %}
                {% endif %}
            {% endfor %}
        </div>
        </div>
    {% endif %}
</div>