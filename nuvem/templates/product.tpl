<section class="section-product">
    <div class="container-fluid">
        {% snipplet "breadcrumbs.tpl" %}
    </div>

    <div class="row no-gutters section-product__content section-product__viewer" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
        <div class="col-12 col-lg-6">
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
                    <div class="circle out-of-stock">
                        <p>{{ "Sin stock" | translate }}</p>
                    </div>
                {% endif %}

                {% if product.free_shipping %}
                    <div class="circle free-shipping">
                        <p>{{ "Envío sin cargo" | translate }}</p>
                    </div>
                {% endif %}

                <div class="circle offer" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>
                    <p>{{ "Oferta" | translate }}</p>
                </div>
            </div>

            <div class="imagecolContent desktop-featured-product">
                {% if not product.available %}
                    <div class="circle out-of-stock">
                        <p>{{ "Sin stock" | translate }}</p>
                    </div>
                {% endif %}

                {% if product.free_shipping %}
                    <div class="circle free-shipping">
                        <p>{{ "Envío sin cargo" | translate }}</p>
                    </div>
                {% endif %}
                
                <div class="circle offer" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>
                    <p>{{ "Oferta" | translate }}</p>
                </div>

                {% if product.featured_image %}
                    <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                    </a>
                {% else %}
                    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                {% endif %}
            </div>

            {% if product.images_count > 1 %}
                <div id="tS2" class="jThumbnailScroller desktop-featured-product">
                    <div class="jTscrollerContainer">
                        <div class="jTscroller">
                            {% for image in product.images %}
                                <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('original') }}' " data-image="{{image.id}}">
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

        <div class="col-12 col-lg-6">
            <div class="product-details">
                <h1 itemprop="name">{{ product.name }}</h1>

                <div class="product-price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                    <div class="price">
                        <span class="price-compare">
                            {# {{ "De" | translate }} #}
                            <strike>
                            <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
                            </strike>
                        </span>

                        <span>
                            {# {{ "Por" | translate }} #}
                            <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</span>
                        </span>
                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                        {% if product.stock_control %}
                            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
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


                {# {% snipplet "installments_in_product.tpl" %} #}
                {% if product.show_installments and product.display_price %}
                    {% set installments_info = product.installments_info %}
                    {% if installments_info %}
                        <a id="button-installments" class="button secondary btn-verdetalhes" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                    {% endif %}
                {% endif %}

                <div class="product-form">
                    <form method="post" action="{{ store.cart_url }}">
                        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                        {% if product.variations %}
                            {% include "snipplets/variants.tpl" with {'quickshop': false} %}
                        {% endif %}

                        <a href="https://drive.google.com/file/d/0Bw1wirL_r8UUcTNubGQtNzZBUmQ0STF3ZXhsclR0RGZPNXRZ/view" class="btn btn-link btn-sizeguide" target="_blank">{{ "Guia de tamanhos" | translate }}</a>

                        {% if product.available and product.display_price %}
                            <div class="product-quantity">
                                <label for="selectQuantity">
                                    {{ "Quantidade" | translate }}
                                </label>

                                <select class="custom-select mr-sm-2" id="selectQuantity" name="quantity{{ item.id }}">
                                    <option selected value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                </select>
                            </div>
                        {% endif %}

                        <div class="product-add-to-cart">
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                            <button type="submit" class="btn btn-dark btn-lg btn-add-to-cart button addToCart js-addtocart {{ state }}" {% if state == 'nostock' %}disabled{% endif %}>{{ texts[state] | translate }}</button>
                        </div>

                        <div class="product-shipping">
                            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
                        </div>
                    </form>

                    <div class="product-social">
                        <ul>
                            <li>
                                <a href="{{ product.social_url  }}" target="_blank"><i class="fab fa-facebook-f"></i></a>
                            </li>
                            <li>
                                <a href="/" target="_blank"><i class="fab fa-instagram"></i></a>
                            </li>
                            <li>
                                <a href="/" target="_blank"><i class="fab fa-pinterest-p"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>

                {#
                <div class="shareLinks sst">
                    <div class="shareItem facebook product-share-button" data-network="facebook">
                        {{product.social_url | fb_like('store-product', 'button_count')}}
                    </div>
                    <div class="shareItem twitter product-share-button" data-network="twitter">
                        {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                    </div>
                    <div class="shareItem google product-share-button" data-network="gplus">
                        {{product.social_url | g_plus('medium') }}
                    </div>
                    <div class="shareItem pinterest product-share-button" data-network="pinterest">
                        {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
                    </div>
                </div>
                #}

                
                {#
                {% if settings.show_product_fb_comment_box %}
                    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                {% endif %}
                #}
            </div>
        </div>
    </div>

    <div class="product-details__description">
        <div class="container no-gutters">
            <div class="row no-gutters">
                <div class="col-12 col-lg-4">
                    {{ product.description }}
                </div>
            </div>
        </div>
    </div>

    <div id="related-products" class="section-category section-related-products">
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
            <div class="section-product__content">
                <h2>{{"Productos Relacionados" | translate}}</h2>
            </div>

            <div class="row no-gutters section-product__content section-category--list">
                {% set related_products %}
                    {% for related in related_products %}
                        {% if product.id != related.id %}
                            {% include 'snipplets/product/single-product.tpl' with {product : related} %}
                        {% endif %}
                    {% endfor %}
                {% endset %}
                
                {{ related_products }}
            </div>
        {% endif %}
    </div>
</section>

{% if installments_info %}
{% set gateways = installments_info | length %}
    <div id="InstallmentsModal"  class="modal fade{% if gateways <= '3' %} two-gates{% endif %}" id="sizeGuide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detalhes das parcelas</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="installments">
                        <ul class="nav nav-tabs">
                            {% for method, installments in installments_info %}
                                <li id="method_{{ method }}" {% if loop.first %}class="active"{% endif %}><a href="#installment_{{ method }}_{{ installment }}" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method | upper) }}</a></li>
                            {% endfor %}
                        </ul>
                        <div class="tab-content">
                            {% for method, installments in installments_info %}
                                <div class="tab-pane{% if loop.first %} active{% endif %}" id="installment_{{ method }}_">
                                    <div class="span3">
                                    {% for installment, data_installment in installments %}
                                        <span id="installment_{{ method }}_{{ installment }}" >
                                            <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                            {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                        </span>
                                        {% if installment == 12 %}</div><div class="span3">{% endif %}
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
