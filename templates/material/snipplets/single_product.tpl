{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% if product.compare_at_price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

<div class="product-grid-single-product col-tight m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3">
    <div class="material-card">
        <div class="single-product-image p-relative card-radius pull-left full-width">
            {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
            {% if not product.available %}
                <a href="{{ product_url_with_selected_variant }}" class="label-no-stock p-absolute overlay text-center card-radius no-link"><h4 class="text-uppercase">{{ "Sin stock" | translate }}</h4></a>
            {% endif %}
            {% if product.free_shipping or product.compare_at_price %}
                <div class="labels-container p-absolute">
                {% if product.compare_at_price %}
                    <h4 class="m-none-top"><div class="label label-warning label-offer pull-left font-weight-normal border-radius-none text-uppercase">
                        {% if store.country == 'BR' %}
                            <strong>-{{ price_discount_percentage |round }}%</strong></div>
                        {% else %}
                            <strong>{{ price_discount_percentage |round }}%</strong> OFF</div>
                        {% endif %}
                    </h4>
                {% endif %}
                 {% if product.free_shipping %}
                    <h4 class="m-none-top"><div class="label label-info label-shipping font-weight-normal border-radius-none text-uppercase pull-left"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h4>
                {% endif %}
                </div>
            {% endif %}
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image pull-left">
                {{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt, {class: 'img-responsive full-width'}) }}
            </a>
            {# Quick shop allows to add the product to the cart directly from a listing #}
            {% if settings.quick_shop %}
                {% snipplet "product-grid/quick-shop.tpl" %}
            {% endif %}
        </div>
        <div class="single-product-info text-center row container-fluid clear-both" itemscope itemtype="http://schema.org/Product">
            <div class="p-half-bottom p-half-top title-price-container container-fluid clear-both p-left-none p-right-none">
                <div class="product-title container-fluid" itemprop="name">
                    <h5 class="m-none-top text-uppercase">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                            {% if product.name | length > 40 %}
                                {{ product.name | truncate(40) }}<span>...</span>
                            {% else %}
                                {{ product.name }}
                            {% endif %}
                        </a>
                    </h5>
                </div>
                <div class="price" {% if not product.display_price%}style="display:none;"{% endif %} itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                    <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                    <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right" {% if not product.compare_at_price %}style="display:none;"{% endif %}>
                        <span id="compare_price_display" class="text-line-through opacity-80">{{ product.compare_at_price | money }}</span>
                    </span>
                    <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 {% if not product.compare_at_price %}m-none-top{% else %}m-none-top-xs{% endif %} m-bottom-half text-center-sm p-half-left p-half-right text-center" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</h4>
                    {% if product.show_installments %}
                        {% set max_installments_without_interests = product.get_max_installments(false) %}
                        {% if max_installments_without_interests %}
                            <span class="max_installments col-xs-12 col-sm-12 col-md-12 col-lg-12">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong> sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                        {% else %}
                            {% set max_installments_with_interests = product.get_max_installments %}
                            {% if max_installments_with_interests %}
                                <span class="max_installments col-xs-12 col-sm-12 col-md-12 col-lg-12">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                            {% endif %}
                        {% endif %}
                    {% endif %}
                </div>
            </div>
            {# Full overlay link for mobile #}
            <a href="{{ product_url_with_selected_variant }}" class="mobile-products-link visible-xs full-width full-height p-absolute"></a>
        </div>
    </div>
</div>
