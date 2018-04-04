{% for product in products %}
    <li class="{{ loop.index % 3 ? '' : 'end' }}">
        <div class="image">
            <div class="align">
                <div>
                    <a href="{{ product.url }}">
                        {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                    </a>
                </div>
            </div>
        </div>

        <h3><a href="{{ product.url }}">{{ product.name }}</a></h3>
        <p>
            {% if not hide_prices %}
                {% if product.display_price %}
                    {{ product.price | money }}
                {% else %}
                    {{ "Consultar precio" | translate }}
                {% endif %}
            {% endif %}
        </p>
    </li>
{% endfor %}