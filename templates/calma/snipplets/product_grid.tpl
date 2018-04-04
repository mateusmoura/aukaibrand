{% for product in products %}
    {% if loop.index % 2 == 1 %}
        <tr class="row{{ loop.index }}">
            {% snipplet "product_on_category.tpl" %}
    {% else %}
            {% snipplet "product_on_category.tpl" %}
    {% endif %}

    {% if loop.index % 2 == 0 %}
        </tr>
    {% endif %}
{% endfor %}