{% for product in products %}

<li {% if loop.index0 % 3 == 0 %}class="start"{% endif %} {% if loop.index % 3 == 0 %}class="end"{% endif %}>
    <!-- START IMAGE -->
    <div class="image">
        <div class="overflow">
            <div class="align">
            {% if product.display_price %}
                <h6>{{ product.price | money }}</h6>
            {% endif %}

                <div><a href="{{ product.url}}">{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}</a></div>
            </div>
        </div>
    </div>
    <!-- END IMAGE -->
    <p><a href="{{ product.url}}">{{ product.name }}</a></p>
</li>

{% endfor %}