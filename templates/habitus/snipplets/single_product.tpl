<div class="col-md-3 col-sm-6 col-xs-12">
    {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
    <div class="thumbnail">
        <div class="head">
            {% if not product.available %}
                <div class="out-of-stock">{{ "Sin stock" | translate }}</div>
            {% endif %}
            {% if product.free_shipping %}
                <div class="free_shipping sst">{{ "Envío sin cargo" | translate }}</div>
            {% endif %}
            {% if product.compare_at_price %}
                <div class="offer sst">{{ "Oferta" | translate }}</div>
            {% endif %}
            <figure class="image-wrap">
                <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}"
                   class="product-image">{{ product.featured_image | product_image_url("original") | img_tag(product.featured_image.alt) }}</a>
            </figure>
        </div>

        <div class="caption" itemscope itemtype="http://schema.org/Product">
            <h3 itemprop="name" class="title"><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{ product.name }}</a></h3>

            <div class="row">

                <div class="col-md-8  price {% if not product.display_price %}invisible{% endif %}" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                    <span class="price-compare">
                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                        <span id="compare_price_display"
                              {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
                    </span>
                    <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}"
                          {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</span>
                </div>

                <div lass="col-md-4 ">
                    {% if settings.quick_shop %}
                        <a class="hidden-xs hidden-sm product-details-overlay" data-toggle="modal"
                           data-target="#quick{{ product.id }}">
                            <span><i class="fa fa-search"></i>{{ settings.quick_shop_label }}</span>
                        </a>
                        {% snipplet "quick-shop.tpl" %}
                    {% endif %}
                </div>

            </div>
                    {% if product.show_installments and product.display_price %}
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
