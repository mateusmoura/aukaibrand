<div class="dest-gral">
    <div class="head">
        {% if not product.available %}
            <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
        {% endif %}
        {% if product.free_shipping %}
            <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
        {% endif %}
        {% if product.compare_at_price %}
            <div class="offer-product">{{ "Oferta" | translate }}</div>
        {% endif %}
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image">{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}</a>
        {% if settings.quick_shop %}
            <a class="product-details-overlay fancybox" href="#quick{{ product.id }}">
                <span>{{ settings.quick_shop_label }}</span>
            </a>
            {% snipplet "quick-shop.tpl" %}
        {% endif %}
    </div>
    <div class="bajada" itemscope itemtype="http://schema.org/Product">
        <div class="title" itemprop="name"><h3><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{ product.name }}</a></h3></div>
        <meta itemprop="image" content="https:{{ product.featured_image | product_image_url("medium") }}" />
        <meta itemprop="url" content="{{ product.social_url }}" />
        {% include 'snipplets/product-price.tpl' with {schema: true} %}
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
    </div>
</div>

