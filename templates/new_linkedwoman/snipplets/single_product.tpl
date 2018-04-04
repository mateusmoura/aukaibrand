<div class="span3">
    <div class="dest-gral">
        <div class="head">
            {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
            {% if not product.available %}
                <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
            {% endif %}
            {% if product.free_shipping %}
                <div class="free-shipping-product {% if product.available %}shipping-product-bottom{% endif %}">{{ "Envío sin cargo" | translate }}</div>
            {% endif %}
            {% if product.compare_at_price %}
                  <div class="offer-product {% if not product.available and not product.free_shipping %}offer-product-bottom{% elseif product.available and product.free_shipping %}offer-product-bottom {% elseif product.available and not product.free_shipping %}offer-product-bottomest{% endif %}">{{ "Oferta" | translate }}</div>
            {% endif %}
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image">{{ product.featured_image | product_image_url("large") | img_tag(product.featured_image.alt) }}</a>
            {% if settings.quick_shop %}
                <a class="product-details-overlay fancybox" href="#quick{{ product.id }}">
                    <span>{{ settings.quick_shop_label }}</span>
                </a>
                {% snipplet "quick-shop.tpl" %}
            {% endif %}
        </div>
        <div class="bajada {% if product.show_installments %}bajada_instalments{% endif %}" itemscope itemtype="http://schema.org/Product">
            <div class="title" itemprop="name">
                <h3>
                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">
                        {% if product.name | length > 40 %}
                            {{ product.name | truncate(40) }}<span>...</span>
                        {% else %}
                            {{ product.name }}
                        {% endif %}
                    </a>
                </h3>
            </div>
            <div class="price {% if not product.display_price%}hidden{% endif %}" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                <span class="price-compare">
                    <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
                </span>
                <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</span>
                {% if product.show_installments %}
                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                    {% if max_installments_without_interests %}
                        <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                    {% else %}
                        {% set max_installments_with_interests = product.get_max_installments %}
                        {% if max_installments_with_interests %}
                            <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                        {% endif %}
                    {% endif %}
                {% endif %}
            </div>
        </div>
    </div>
</div>
