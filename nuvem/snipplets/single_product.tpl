<div class="dest-gral {% if product.images[0].id == 0 %}no-image{% endif %}">
    <div class="head">
        {% if not product.available %}

            <div class="circle out-of-stock">
            	<p>{{ "Sin stock" | translate }}</p>
			</div>
        {% endif %}
        {% if product.free_shipping %}
            <div class="circle free-shipping {% if not product.compare_at_price %}shipping-top{% endif %}">
                <p>{{ "Envío sin cargo" | translate }}</p>
            </div>
        {% endif %}
        {% if product.compare_at_price %}
            <div class="circle offer {% if not product.available %}offer-right{% endif %}">
            	<p>{{ "Oferta" | translate }}</p>
            </div>
        {% endif %}
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">
        	{% if not product.available %}
                <div class="out-stock-img">
                	{{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                </div>
			{% else %}
            	{{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
            {% endif %}
        </a>
        {% if settings.quick_shop %}
            	<div class="product-details-overlay">
                    <a class="fancybox" href="#quick{{ product.id }}">
                    	{{ settings.quick_shop_label }}
                    </a>
                </div>
            {% snipplet "quick-shop.tpl" %}
        {% endif %}
    </div>
    <div class="bajada" itemscope itemtype="http://schema.org/Product" >
        {% if product.category.id != 0 %}
        <div class="category">
        	<a href="{{ product.category.url }}" title="{{ product.category.name }}">{{ product.category.name }}</a>
        </div>
        {% endif %}
        <div class="title">
        	<h3 itemprop="name"><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{ product.name }}</a></h3>
        </div>
        <div class="price {% if not product.display_price%}hidden{% endif %} " itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</span>
            <meta itemprop="priceCurrency" content="{{ product.currency }}" />
			<span class="price-compare">
                <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
            </span>
            {% if product.show_installments %}
                {% set max_installments_without_interests = product.get_max_installments(false) %}
                {% if max_installments_without_interests %}
                    <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                {% else %}
                    {% set max_installments_with_interests = product.get_max_installments %}
                    {% if max_installments_with_interests %}
                        <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                    {% endif %}
                {% endif %}
            {% endif %}
        </div>
    </div>
</div>

