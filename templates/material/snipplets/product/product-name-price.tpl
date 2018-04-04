
{#  **** Product Price ****  #}
<div class="product-price-container text-center">
    {% if not product.available %}
        <h4><span class="label label-default label-no-stock text-center font-weight-normal border-radius-none text-uppercase">{{ "Sin stock" | translate }}</span></h4>
    {% endif %}
    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <div class="price-container">
			<h3 class="price-compare text-line-through">
			     <span id="compare_price_display" class="compare-price-display" {% if not product.compare_at_price %}style="display:none;"{% endif %}>{{ product.compare_at_price | money }}</span>
            </h3>
            <h2 class="price m-none-top m-bottom" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</h2>
            <meta itemprop="priceCurrency" content="{{ product.currency }}">
            {% if product.stock_control %}
                <meta itemprop="inventoryLevel" content="{{ product.stock }}">
                <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}">
            {% endif %}
        </div>
    </div>
</div>