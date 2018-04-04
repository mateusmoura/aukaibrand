<div class="page-product container page">
    <div class="row">
        <div id="single-product" itemscope itemtype="http://schema.org/Product">
            <div class="productContainer" data-variants="{{ product.variants_object | json_encode }}">
                <div class="col-md-5">
                    <div class="row imagecol">
                        <div class="mobile-bxslider">             
                            {% if product.images_count > 1 %}
                                <ul class="bxslider" id="productbxslider">
                                    {% for image in product.images %}
                                      <li class="product-slider" data-image="{{image.id}}" data-image-position="{{loop.index0}}">{{ image | product_image_url('big') | img_tag(image.alt) }}</li>
                                    {% endfor %}
                                </ul>
                            {% else %}
                                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                            {% endif %}
                              {% if not product.available %}
                                    <div class="out-of-stock">
                                        {{ "Sin stock" | translate }}
                                    </div>
                                 {% endif %}
                                {% if product.free_shipping %}
                                    <div class="free_shipping sst">
                                        {{ "Envío sin cargo" | translate }}
                                    </div>
                                {% endif %}
                                <div class="offer sst" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>
                                    {{ "Oferta" | translate }}
                                </div>
                        </div>
                        <div class="col-md-12 desktop-featured-product">
                            <div class="imagecolContent">
                                {% if not product.available %}
                                    <div class="out-of-stock">{{ "Sin stock" | translate }}</div>
                                {% endif %}
                                {% if product.free_shipping %}
                                    <div class="free_shipping sst">{{ "Envío sin cargo" | translate }}</div>
                                {% endif %}
                                 <div class="offer sst" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{{ "Oferta" | translate }}</div>
                                {% if product.featured_image %}
                                    <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom"
                                       class="cloud-zoom"
                                       rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                                    </a>
                                {% else %}
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                                {% endif %}
                            </div>
                            <div class="col-md-12">
                                {% if product.images_count > 1 %}
                                    <div id="tS3" class="jThumbnailScroller">
                                        <div class="jTscrollerContainer">
                                            <div class="jTscroller">
                                                {% for image in product.images %}
                                                    <a href="{{ image | product_image_url('original') }}"
                                                       class="cloud-zoom-gallery"
                                                       rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                                        {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                                                    </a>
                                                {% endfor %}
                                            </div>
                                        </div>
                                        <a href="#" class="jTscrollerPrevButton"></a>
                                        <a href="#" class="jTscrollerNextButton"></a>
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                        <div class="social-container-box col-md-12">
                                <hr class="featurette-divider">
                                 <div class="shareLinks">
                                    <div class="shareItem facebook product-share-button" data-network="facebook">
                                        {{product.social_url | fb_like('store-product', 'button_count')}}
                                    </div>
                                    <div class="shareItem product-share-button" data-network="twitter">
                                        {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                                    </div>
                                    <div class="shareItem product-share-button" data-network="gplus">
                                        {{product.social_url | g_plus('medium') }}
                                    </div>
                                    <div class="shareItem pinterest product-share-button" data-network="pinterest">
                                        {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="descriptioncol">
                        <div class="descriptioncolContent">
                            {% snipplet "breadcrumbs.tpl" %}
                            <div class="row title-wrapper">
                                <div class="title">
                                    <h1 itemprop="name">{{ product.name }}</h1>
                                </div>
                                <div class="price-holder">
                                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <div class="price">
                                        <span class="price-compare">
                                            <span id="compare_price_display" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{{ product.compare_at_price | money }}</span>
                                        </span>
                                        <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}"
                                              {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</span>
                                        <meta itemprop="priceCurrency" content="{{ product.currency }}"/>
                                        {% if product.stock_control %}
                                            <meta itemprop="inventoryLevel" content="{{ product.stock }}"/>
                                            <meta itemprop="availability"
                                                  href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}"
                                                  content="{{ product.stock ? 'In stock' : 'Out of stock' }}"/>
                                        {% endif %}
                                        </div>
                                    </div>
                                </div>
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
                            {% snipplet "installments_in_product.tpl" %}
                            {% if product.show_installments and product.display_price %}
                                    {% set installments_info = product.installments_info %}
                                    {% if installments_info %}
                                    <div class="row-fluid">
                                        <a id="button-installments" class="button secondary pull-right" data-target="#InstallmentsModal" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    {% endif %}
                            {% endif %}
                            <form class='form-inline' method="post" action="{{ store.cart_url }}">

                                <input type="hidden" name="add_to_cart" value="{{ product.id }}"/>
                                {% if product.variations %}
                                    <div class="fancyContainer row">
                                        {% for variation in product.variations %}
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="attributeLine">
                                                    <label class="variation-label"
                                                           for="variation_{{ loop.index }}">{{ variation.name }}</label>

                                                    <select class="btn btn-default dropdown-toggle col-md-12 col-sm-12 col-xs-12"
                                                            data-toggle="dropdown" id="variation_{{ loop.index }}"
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
                                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}

                                <hr class="featurette-divider">

                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="btn btn-primary btn-lg addToCart js-addtocart {{ state }}"
                                           value="{{ texts[state] | translate }}"/>
                                </div>
                            </form>

                        </div>
                    </div>
                    {% if settings.product_description_position == "above" and product.description is not empty %}
                        <div class="row product-description-wrap">
                            <h3 class="product-description-title">{{ "Descripción del producto" | translate }}</h3>
                            <p>{{ product.description }}</p>
                        </div>
                    {% endif %}
                </div> <!-- col-md-7 -->
            </div>
        </div>
    </div> <!-- row -->
    {% if settings.product_description_position == "below" and product.description is not empty %}
        <div class="row">
            <div class="col-xs-12">
                <div class="product-description-wrap">
                    <h3 class="product-description-title">{{ "Descripción del producto" | translate }}</h3>
                    <p>{{ product.description }}</p>
                </div>
            </div>
        </div>
    {% endif %}
    {% if settings.show_product_fb_comment_box %}
        <div class="row">
            <div class="col-xs-12 fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        </div>
    {% endif %}
</div> <!-- container -->
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
        <div class="container products-list">
            <div class="products-header">
                <h3>{{ "Productos Relacionados" | translate }}</h3>
            </div>
            <div class="row product-row">
                {% for related in related_products %}
                    {% if product.id != related.id %}
                        {% include 'snipplets/single_product.tpl' with {product : related} %}
                    {% endif %}
                {% endfor %}
            </div>
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
