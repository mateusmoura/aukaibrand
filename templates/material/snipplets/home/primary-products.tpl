<section class="products-grid container m-top m-bottom p-quarter-left-xs p-quarter-right-xs">
    <div class="products-row masonry-grid">
    {% for product in sections.primary.products %}
            {# ** the following number defines the amount of products per row ** #}
            {% if loop.index % 4 == 1 %}
            <div class="row">
            {% endif %}
            {% include 'snipplets/single_product.tpl' %}
            {# ** the following number closes the div when the the amount of products per row is achieved ** #}
            {% if loop.index % 4 == 0 or loop.last %}
            </div>
            {% endif %}
        {% else %}
    {% endfor %}
    </div>
</section>