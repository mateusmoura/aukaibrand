{% set price_html %}
<div class="price">
    <span class="price-compare">
        <span id="compare_price_display" {% if not product.compare_at_price %}style="display:none;"{% endif %}>{{ product.compare_at_price | money }}</span>
    </span>
    <span class="price" id="price_display" {% if schema %}itemprop="price" content="{{ product.price / 100 }}"{% endif %} {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</span>
    {% if schema %}
        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
        {% if product.stock_control %}
            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
        {% endif %}
    {% endif %}
</div>
{% endset %}
{% if schema %}
    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        {{ price_html }}
    </div>
{% else %}
    {{ price_html }}
{% endif %}