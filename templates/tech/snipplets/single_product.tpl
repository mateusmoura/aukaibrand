<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 single-product-container">
    <div class="single-product-item" itemscope itemtype="http://schema.org/Product">
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
        <div class="photo">
            {{ product.featured_image | product_image_url("large") | img_tag(product.name, {class : 'img-responsive'}) | a_tag(product_url_with_selected_variant)}}
            {% if product.free_shipping %}
                <span class="free-shipping">{{ "Envío sin cargo" | translate }}</span>
            {% endif %}
            {% if product.compare_at_price and settings.sale_message %}<span class="offer2">{{ settings.sale_message }}</span>{% endif %}
            {% if not product.available %}<a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="nostock-image"><span class="nostock">{{ settings.nostock_message }}</span></a>{% endif %}
        </div>
        {% if product.name |length > 40 %}
            <h3 class="with-sidebar-product-header-margin-top"><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" itemprop="name">{{ product.name | truncate(40) }}... </a></h3>
        {% elseif product.name |length < 25 %}
             <h3 class="product-header-margin-top-more"><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" itemprop="name">{{ product.name }}</a></h3>
        {% else %}
            <h3 class="product-header-margin-top"><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" itemprop="name">{{ product.name }}</a></h3>
        {% endif %}
        {% if product.display_price %}
            <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                {% if product.show_installments %}
                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                    {% if max_installments_without_interests %}
                         <div class="max_installments">{{"<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                    {% else %}
                        {% set max_installments_with_interests = product.get_max_installments %}
                        {% if max_installments_with_interests %}
                           <div class="max_installments">{{"<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                        {% endif %}
                    {% endif %}
                {% endif %}
                <del id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>
                    <span class="offer">{{ product.compare_at_price | money_long }}</span>
                </del>
                <span id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money_long }}</span>
            </div>
        {% endif %}
        {% if settings.quick_shop %}
            <div class="product-details-overlay">
                <a class="hidden-xs hidden-sm" data-toggle="modal"
                   data-target="#quick{{ product.id }}" href="#">
                    {{ settings.quick_shop_label }}
                </a>
            </div>
            {% snipplet "quick-shop.tpl" %}
        {% endif %}
    </div>
</div>