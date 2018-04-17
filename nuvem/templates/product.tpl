{% if product.compare_at_price > product.price %}
    {% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
<div class="container js-product-container js-product-detail">
    <div itemscope itemtype="http://schema.org/Product">
        <div class="row m-bottom m-bottom-half-xs">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
        <div class="row" id="single-product" data-variants="{{product.variants_object | json_encode }}">
            <div id="product-slider-container" class="js-product-image-container product-slider-container visible-xs {% if product.images_count == 1 %} product-single-image {% endif %}" {% if product.images_count > 1 %} style="visibility:hidden; height:0;"{% endif %}>      
                {% if product.images_count > 1 %}
                    <ul id="product-slider" class="slider">
                        {% for image in product.images %}
                          <li class="js-product-slide slider-slide product-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}" data-zoom-url="{{ image | product_image_url('original') }}">{{ image | product_image_url('big') | img_tag(image.alt, {class: 'js-image-open-mobile-zoom product-slider-image'}) }}</li>
                        {% endfor %}
                    </ul>
                {% else %}
                    <div class="js-product-active-image visible-when-content-ready slider" data-zoom-url="{{ product.featured_image | product_image_url('original') }}">
                        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt, {class: 'js-image-open-mobile-zoom product-slider-image'}) }}
                    </div>
                {% endif %}
                  <div class="labels-floating m-left-quarter">
                    <div class="label label-circle label-secondary {% if not product.promotional_offer %}js-offer-label{% endif %} {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off %}promo-pill{% endif %}" {% if (not product.compare_at_price and not product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %}>
                        {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and not product.promotional_offer.script.is_discount_for_quantity %}
                            {% if store.country == 'BR' %}
                                {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                            {% else %}
                                {{ product.promotional_offer.script.type }}
                            {% endif %}
                        {% else %}
                            {{ settings.offer_text }}
                        {% endif %}
                    </div>
                    <div class="label label-circle label-primary js-stock-label label-overlap" {% if product.has_stock %}style="display:none;"{% endif %}>{{ settings.no_stock_text }}</div>
                    {% if product.free_shipping %}
                        <div class=
                        "label label-circle label-primary-dark label-overlap">{{ settings.free_shipping_text }}</div>
                    {% endif %}
                </div>
                <a href="#" class="js-open-mobile-zoom visible-when-content-ready visible-xs btn-floating">
                    <div class="zoom-svg-icon svg-icon-text">
                        {% include 'snipplets/svg/arrows-alt.tpl' %}
                    </div>
                </a>
            </div>
            {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
            <div class="col-xs-12 col-sm-6 product-img-col hidden-xs visible-when-content-ready">
                <div class="row">
                    <div class="desktop-featured-product p-relative">
                        <a href="#" class="js-product-prev btn-product-slider btn-product-prev visible-when-content-ready {% if product.images_count == 1 %}hidden{% endif %}">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <div class="desktop-product-image-container">
                            <div class="labels-floating">
                                <div class="label label-circle label-secondary {% if not product.promotional_offer %}js-offer-label{% endif %} {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off %}promo-pill{% endif %}" {% if (not product.compare_at_price and not product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %}>
                                    {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and not product.promotional_offer.script.is_discount_for_quantity %}
                                        {% if store.country == 'BR' %}
                                            {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                        {% else %}
                                            {{ product.promotional_offer.script.type }}
                                        {% endif %}
                                    {% else %}
                                        {{ settings.offer_text }}
                                    {% endif %}
                                </div>
                                <div class="js-stock-label label label-circle label-primary label-overlap" {% if product.has_stock %}style="display:none;"{% endif %}>{{ settings.no_stock_text }}</div>
                                {% if product.free_shipping %}
                                    <div class="label label-circle label-primary-dark label-overlap">{{ settings.free_shipping_text }}</div>
                                {% endif %}
                            </div>
                            {% if product.featured_image %}
                                <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="visibility:hidden;">
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.name, {class: 'product-desktop-img img-responsive'}) }}
                                </a>
                            {% else %}
                                {{ product.featured_image | product_image_url('large') | img_tag(product.name, {class: 'product-desktop-img img-responsive'}) }}
                            {% endif %}
                        </div>
                        <a href="#" class="js-product-next btn-product-slider btn-product-next visible-when-content-ready {% if product.images_count == 1 %}hidden{% endif %}">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
                <div class="row">
                    {% if product.images_count > 1 %}
                        <div class="thumbs visible-when-content-ready">
                            {% for image in product.images %}
                                <a href="{{ image | product_image_url('original') }}" class="js-product-thumb-zoom cloud-zoom-gallery thumb-link" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                    <span>
                                    {{ image | product_image_url('large') | img_tag(image.alt, {class: 'thumb-image'}) }}
                                    </span>
                                </a>
                            {% endfor %}
                        </div>
                    {% endif %}
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 product-form-container">
                <h1 itemprop="name" class="product-name">{{ product.name }}</h1>
                <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                    {% if product.promotional_offer.script.is_percentage_off %}
                        <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                    {% endif %}
                    <div class="product-price-container">
                        <h4 id="compare_price_display" class="js-compare-price-display product-price-compare price-compare m-bottom-quarter-xs" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                        {% if product.compare_at_price %}
                            {{ product.compare_at_price | money }}
                        {% endif %}
                        </h4>
                        <h2 class="h1 product-price js-price-display d-inline" {% if not product.display_price %}style="display:none;"{% endif %} id="price_display" itemprop="price" {% if product.display_price %} content="{{ product.price / 100 }}"{% endif %}>
                        {% if product.display_price %}
                            {{ product.price | money }}
                        {% endif %}
                        </h2>
                        <span class="js-offer-label"{% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                            <span>
                                <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>% OFF
                            </span>
                        </span>
                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                        {% if product.stock_control %}
                            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                        {% endif %}
                    
                        {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                        <div class="row-fluid">
                            {% if product.promotional_offer.script.is_discount_for_quantity %}
                                {% for threshold in product.promotional_offer.parameters %}
                                    <h4 class="promo-title"><strong>{{ "¡{1}% OFF comprando {2} o más un.!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</strong></h4>
                                {% endfor %}
                            {% else %}
                                <h4 class="promo-title"><strong>{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</strong></h4>
                            {% endif %}
                            {% if product.promotional_offer.scope_type == 'categories' %}
                                <p class="promo-message">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:  
                                {% for scope_value in product.promotional_offer.scope_value_info %}
                                   {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
                                {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
                            {% elseif product.promotional_offer.scope_type == 'all'  %}<p class="promo-message">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
                            {% endif %}    
                        </div> 
                        {% endif %}
                    </div>
                </div>
                <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                <meta itemprop="url" content="{{ product.social_url }}" />
                {% if page_description %}
                    <meta itemprop="description" content="{{ page_description }}" />
                {% endif %}
                {% if product.sku %}
                    <meta itemprop="sku" content="{{ product.sku }}" />
                {% endif %}
                {% if product.weight %}
                    <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                        <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                        <meta itemprop="value" content="{{ product.weight}}" />
                    </div>
                {% endif %}
                {% snipplet 'placeholders/product-detail-form-placeholder.tpl' %}
                {# Product Installments button and info #}
                {% if product.show_installments and product.display_price %}
                    {% set installments_info_base_variant = product.installments_info %}
                    {% set installments_info = product.installments_info_from_any_variant %}
                    {% if installments_info %}
                        <div href="#installments-modal" data-toggle="modal" class="js-refresh-installment-data js-product-payments-container visible-when-content-ready link-modal-xs-right" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                            {% snipplet "installments_in_product.tpl" %}
                            {% if product.show_installments and product.display_price %}
                                <a id="btn-installments" class="btn-link btn-link-small-extra" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                    {% if store.installments_on_steroids_enabled %}
                                        {{ "Ver medios de pago" | translate }}
                                    {% else %}
                                        {{ "Ver el detalle de las cuotas" | translate }}
                                    {% endif %}
                                </a>
                                <div class="visible-xs link-modal-xs-right-icon">
                                    {% include "snipplets/svg/angle-right.tpl" %}
                                </div> 
                            {% endif %}
                        </div>
                    {% endif %}
                {% endif %}
                <form id="product_form" method="post" action="{{ store.cart_url }}" class="visible-when-content-ready">
                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                    <input type="hidden" name="preselected_gw_code">
                    {% if product.variations %}
                        {% include "snipplets/variants.tpl" with {'quickshop': false} %}
                    {% endif %}
                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'catalog': "Consultar", 'nostock' : settings.no_stock_text} %}
                    <input type="submit" class="js-prod-submit-form js-addtocart btn btn-primary btn-block m-top m-bottom d-inline-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />
                    {% if settings.shipping_calculator_product_page and not product.free_shipping %}
                        <div id="product-shipping-container" class="product-shipping-calculator" {% if not product.display_price %}style="display:none;"{% endif %}>
                            {% include "snipplets/shipping_cost_calculator.tpl" with {'shipping_calculator_show' : settings.shipping_calculator_product_page and not product.free_shipping, 'shipping_calculator_variant' : product.selected_or_first_available_variant, 'calculator_big': true} %}
                        </div>
                    {% endif %}
                    {% include 'snipplets/social-widgets.tpl'%}
                    {% if not settings.show_description_bottom %}
                        <div class="description user-content m-top">{{ product.description }}</div>
                    {% endif %}
                </form>
            </div>
        </div>
    </div>
	<div class="row visible-when-content-ready">
		{% if settings.show_description_bottom %}
    		<div class="col-xs-12 user-content m-top">
    			<div class="description user-content">{{ product.description }}</div>
    		</div>
		{% endif %}	
		<div class="col-xs-12 visible-when-content-ready">
			<div class="comments-area m-top">
                {% if settings.show_product_fb_comment_box %}
				    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                {% endif %}
            </div>
		</div>
	</div>
    <div id="related-products">
        {% set related_products_ids = product.metafields.related_products.related_products_ids %}
        {% if related_products_ids %}
            {% set related_products = related_products_ids | get_products %}
            {% set show = (related_products | length > 0) %}
        {% endif %}
        {% if not show %}
            {% set related_products = category.products | shuffle | take(4) %}
            {% set show = (related_products | length > 1) %}
        {% endif %}
        {% if show %}
            <div class="title-container">
                <h2 class="subtitle">{{"Productos Relacionados" | translate}}</h2>
            </div>
            <div class="row">
                <div class="col-md-12 text-center-xs">
                    <section id="grid" class="js-masonry-grid grid clearfix">
                        <div class="js-masonry-grid">
                            {% for related in related_products %}
                                {% if product.id != related.id %}
                                    {% include 'snipplets/single_product.tpl' with {product : related} %}
                                {% endif %}
                            {% endfor %}
                        </div>
                    </section>
                </div>
                </div>
        {% endif %}
    </div>
</div>

{# Payments details #}

{% include 'snipplets/payments/payments.tpl' %}

<div class="js-mobile-zoom-panel mobile-zoom-panel">
    <i class="js-mobile-zoom-spinner mobile-zoom-spinner fa fa-circle-o-notch fa-spin fa-2x"></i>
    <div class="js-mobile-zoomed-image mobile-zoom-image-container">
       {# Container to be filled with the zoomable image #}
    </div>
    <a class="js-close-mobile-zoom btn btn-default btn-floating">
        <i class="fa fa-times fa-2x"></i>
    </a>
</div>
