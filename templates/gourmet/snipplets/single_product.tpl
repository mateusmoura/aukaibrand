<div class="producto" itemscope itemtype="http://schema.org/Product">
    {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image">
        <div class='elementos_foto_prod'>
            <img itemprop="image" src="{{ product.featured_image | product_image_url("small")}}" class="img-thumbnail" alt="{{ product.name }}">
            {% if not product.available %}
                <div class="sin_stock">{{ settings.out_of_stock_text }}</div>
            {% endif %}
            {% if product.compare_at_price %}
                <div class="oferta">{{ settings.offer_text }}<i></i></div>
            {% endif %}
            {% if product.free_shipping %}
            <div class="envios_gratis"><span>{{ settings.free_shipping_text }}</span></div>
            {% endif %}
            
            <div class="quick_view">
                {% if settings.quick_shop %}
                    <a class="hidden-xs hidden-sm product-details-overlay" data-toggle="modal" data-target="#quick{{ product.id }}">
                        <span>{{ settings.quick_shop_label }}</span>
                    </a>
                {% endif %}
            </div>
        </div>
        <div class="product_description">
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image">
                <div itemprop="name" class="des_producto">{{ product.name }}</div>
                <meta itemprop="url" content="{{ product.url }}" />
                {% if not product.compare_at_price %}
                    <div class='precio_producto'class="hidden" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        {% if product.display_price %} {{ product.price | money }} {% endif %}
                        <meta itemprop="price" content="{{ product.price / 100 }}" />
                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                    </div>
                    {% else %}
                    <div class='precio_producto en_oferta' class="hidden">
                        {{ product.compare_at_price | money }}
                    </div>
                    <div class='precio_producto'class="hidden">
                        {% if product.display_price %} {{ product.price | money }} {% endif %}
                    </div>
                {% endif %}
            </a>
        </div>
        {% if product.show_installments and product.display_price %}
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
    </a>
</div>
{% if settings.quick_shop %}
    {% snipplet "quick-shop.tpl" %}
{% endif %}
