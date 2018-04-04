{% snipplet "banner_products.tpl" %}
<div class="container">
    <div class="contenido" itemscope itemtype="http://schema.org/Product">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
        <h1 itemprop="name">{{ product.name }}</h1>
        <div id="single-product">
            <div class="productContainer" data-variants="{{ product.variants_object | json_encode }}">
                <div class="row vista_producto">
                    <div class="col-md-6 foto_producto">
                        <div class="cloud-zoom-wrap">
                            {% if product.featured_image %}
                                <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom"
                                        class="cloud-zoom" 
                                   rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
                                </a>
                            {% else %}
                                {{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
                            {% endif %}
                        </div>
                        <div class="thumb">
                            {% if product.images_count > 1 %}
                                {% for image in product.images %}
                                    <a href="{{ image | product_image_url('original') }}"
                                       class="cloud-zoom-gallery img-thumbnail"
                                       rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                        {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                                    </a>
                                {% endfor %}
                            {% endif %}
                        </div>
                    </div>
                    <div class="info_producto col-md-6 col-xs-12">
                        <form id="product_form" class="form-inline" method="post" action="{{ store.cart_url }}">
                            <div class="col-xs-12 col-sm-12" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                <div class="price">
                                   {% if product.compare_at_price %}
                                        <span class="price-compare text-right">
                                            <h3 id="compare_price_display" class='precio_oferta'>
                                             {{ product.compare_at_price | money }}</h3>
                                        </span><!-- price-compare -->
                                    {% endif %}
                                        <h3 class="price text-right" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>
                                            {{ product.price | money }}</h3>
                                        <meta itemprop="priceCurrency" content="{{ product.currency }}"/>
                                    {% if product.stock_control %}
                                        <meta itemprop="inventoryLevel" content="{{ product.stock }}"/>
                                        <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}"/>
                                    {% endif %}
                                    <div class="row-fluid">
                                        {% snipplet "installments_in_product.tpl" %}
                                            {% if product.show_installments and product.display_price %}
                                                {% set installments_info = product.installments_info %}
                                                {% if installments_info %}
                                                <div class="row-fluid">
                                                    <a id="button-installments" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                                                </div>
                                                {% endif %}
                                            {% endif %}
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12">
                                <input type="hidden" name="add_to_cart" value="{{ product.id }}"/>
                                {% if product.variations %}
                                    <div class="fancyContainer">
                                        {% for variation in product.variations %}
                                            <div>
                                                <div class="attributeLine">
                                                    <label class="variation-label"
                                                           for="variation_{{ loop.index }}">{{ variation.name }}</label>
                                                    <select class="form-control"
                                                            id="variation_{{ loop.index }}"
                                                            name="variation[{{ variation.id }}]"
                                                            onchange="LS.changeVariant(changeVariant, '#single-product .productContainer')">
                                                        {% for option in variation.options %}
                                                            <option value="{{ option.id }}"
                                                                    {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                        {% endfor %}
                                                    </select>
                                                </div>
                                            </div>
                                        {% endfor %}
                                    </div>
                                {% endif %}
                            </div>
                            <div class="col-xs-12 col-md-12">
                                 <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="btn-lg agregar addToCart {{ state }}" value="{{ texts[state] | translate }}"/>
                                </div>
                            </div>
                        </form>
                        <div class="col-xs-12 col-sm-12">
                            <meta itemprop="image"
                                  content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}"/>
                            <meta itemprop="url" content="{{ product.social_url }}"/>
                            {% if page_description %}
                                <meta itemprop="description" content="{{ page_description }}"/>
                            {% endif %}
                            {% if product.sku %}
                                <meta itemprop="sku" content="{{ product.sku }}"/>
                            {% endif %}
                            {% if product.weight %}
                                <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue"
                                     style="display:none;">
                                    <meta itemprop="unitCode"
                                          content="{{ product.weight_unit | iso_to_uncefact }}"/>
                                    <meta itemprop="value" content="{{ product.weight }}"/>
                                </div>
                            {% endif %}
                        </div>
                            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6">
            <ul class="me_gusta">
                <li class="shareItem twitter product-share-button" data-network="twitter">
                    {{ product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                </li>
                <li class="shareItem google product-share-button" data-network="gplus">
                    {{ product.social_url | g_plus('medium') }}
                </li>
                <li class="shareItem facebook product-share-button" data-network="facebook">
                    {{ product.social_url | fb_like('store-product', 'button_count') }}
                </li>
                <li class="shareItem pinterest product-share-button" data-network="pinterest">
                    {{ product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original')) }}
                </li>
            </ul>
        </div>
        {% if product.description is not empty %}
            <div class="row">
                <div class="col-xs-12 user-content">
                    <h2 class="product-description-title">{{ "Descripción del producto" | translate }}</h2>
                    <p>{{ product.description }}</p>
                </div>
            </div>
        {% endif %}
        {% if settings.show_product_fb_comment_box %}
            <h2 class="product-description-title detalle_prod">{{ "¿Qué te parecio el producto?" | translate }}</h2>
            <div class="col-xs-12 fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        {% endif %}
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
            <div class="container products-list" itemscope itemtype="http://schema.org/Product" style='margin-bottom:30px;'>
                <h2>{{ "Productos Relacionados" | translate }}</h2>
                {% for related in related_products %}
                    {% if product.id != related.id %}
                        {% include 'snipplets/single_product.tpl' with {product : related} %}
                    {% endif %}
                {% endfor %}
            </div>
        {% endif %}
    </div>
    {% if installments_info %}
    {% set gateways = installments_info | length %}
    <div id="InstallmentsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <div class="installments">
                        <ul class="nav nav-tabs">
                            {% for method, installments in installments_info %}
                                <li id="method_{{ method }}" {% if loop.first %}class="active"{% endif %}><a href="#installment_{{ method }}_{{ installment }}" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method | upper) }}</a></li>
                            {% endfor %}
                        </ul>
                        <div class="tab-content">
                        {% for method, installments in installments_info %}
                                    <div class="tab-pane row{% if loop.first %} active{% endif %}" id="installment_{{ method }}_">
                                     <div class="col-md-5">
                                        {% for installment, data_installment in installments %}
                                            <span id="installment_{{ method }}_{{ installment }}">
                                                <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                                {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                            </span>
                                             {% if installment == 12 %}</div><div class="col-md-5">{% endif %}
                                        {% endfor %}
                                    </div>
                                </div>
                        {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {% endif %}
</div>
