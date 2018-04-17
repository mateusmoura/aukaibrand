{% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
{% if product.compare_at_price > product.price %}
    {% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
<a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" data-path-hover="M 180,400 0,400 0,140 180,160 z" itemscope itemtype="http://schema.org/Product" class="js-masonry-grid-item item-container"> 
    <div class="item">
        <div class="labels-floating">
            {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and not product.promotional_offer.script.is_discount_for_quantity %}
                <div class="label label-circle label-secondary" {% if not product.display_price %} style='display: none'{% endif %}>
                {% if store.country == 'BR' %}
                    {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                {% else %}
                    {{ product.promotional_offer.script.type }}
                {% endif %}
                </div>
            {% elseif product.compare_at_price or product.promotional_offer.script.type == '%off' or product.promotional_offer.script.is_discount_for_quantity %}
                <div class="label label-circle label-secondary" {% if not product.display_price %} style='display: none'{% endif %}>{{ settings.offer_text }}</div>
            {% endif %}
            {% if not product.has_stock %}
                <div class="label label-circle label-primary label-overlap">{{ settings.no_stock_text }}</div>
            {% endif %}
            {% if product.free_shipping %}
                <div class="label label-circle label-primary-dark label-overlap">{{ settings.free_shipping_text }}</div>
            {% endif %}
        </div>
        <div class="p-relative overflow-none">
            <meta itemprop="url" content="{{ product.url }}" />
            <div class="item-image-container" style="padding-bottom: {{ product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100}}%;">
                <img alt="{{ product.featured_image.alt }}" title="{{ product.name }}" src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ product.featured_image | product_image_url('medium')}}" class="lazyload js-lazy-loading item-image" data-expand="1000"/>
                <div class="js-lazy-loading-preloader item-preloader-container">
                    <div class="item-preloader rotate svg-text-fill">
                        {% include "snipplets/svg/spinner.tpl" %}
                    </div>
                </div>
                <div class="item-overlay"></div>
                <meta itemprop="image" content="https:{{ product.featured_image | product_image_url("medium") }}" />
            </div>
        	<div class="item-info-container">
        		<div class="item-info">
                    <h2 class="item-name" itemprop="name">{{ product.name }}</h2>
                    <div class="item-price-container {% if not product.display_price%}hidden{% endif %}" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        			    <span class="{% if not product.compare_at_price %}hidden{% endif %} item-price-compare price-compare">
                            {% if product.compare_at_price %}
                                {{ product.compare_at_price | money }}
                            {% endif %}
                        </span>
                        <span class="m-left-half font-small"{% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                            <span>{{ price_discount_percentage |round }}</span>% OFF
                        </span>
                        <div class="price item-price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>
                        {% if product.display_price %}
                            {{ product.price | money }}
                        {% endif %}
                        </div>
                        
                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                        {% if product_can_show_installments %}
                            {% set max_installments_without_interests = product.get_max_installments(false) %}
                            {% if store.installments_on_steroids_enabled and store.country == 'AR' %}
                                {% set max_installments_with_interests = product.get_max_installments %}
                                {% if store.has_new_installmentsv2_ab %}
                                    {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                        <div class="installments font-small-xs m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% else %}
                                        {% if max_installments_with_interests %}
                                            <div class="installments font-small-xs m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% endif %}
                                    {% endif %}
                                {% else %}
                                    {% if max_installments_with_interests %}
                                        <div class="installments font-small-xs m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% endif %}
                                {% endif %}
                            {% else %}
                                {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                    <span class="installments font-small-xs item-installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                                {% else %}
                                    {% set max_installments_with_interests = product.get_max_installments %}
                                    {% if max_installments_with_interests %}
                                        <span class="installments font-small-xs item-installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                                    {% endif %}
                                {% endif %}
                            {% endif %}
                        {% endif %}
                    </div>
        		</div>
        	</div>
        </div>
    </div>
</a>
