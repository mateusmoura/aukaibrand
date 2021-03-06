<div class="content-fluid" id="prod-page" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
    <div class="row-fluid">
        <div class="span10 offset1"> {% snipplet "breadcrumbs.tpl" %} </div>
    </div>
    <div class="row-fluid">
        <div class="span10 offset1">
            <div class="title">
                <h1 itemprop="name">{{ product.name }}</h1>
            </div>
        </div>
    </div>
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
                <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
            {% endif %}
            {% if product.free_shipping %}
                <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
            {% endif %}
            <div class="offer-product"{% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{{ "Oferta" | translate }}</div>
    </div>
    <div class="desktop-featured-product">
        <div class="row-fluid">
            <div class="span10 offset1" id="prod-image">
                {% if product.featured_image %}
                    <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                        {% if not product.available %}
                            <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
                        {% endif %}
                        {% if product.free_shipping %}
                            <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
                        {% endif %}
                         <div class="offer-product"{% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{{ "Oferta" | translate }}</div>
                        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                    </a>
                {% else %}
                    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                        {% if not product.available %}
                            <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
                        {% endif %}
                        {% if product.free_shipping %}
                            <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
                        {% endif %}
                        {% if product.compare_at_price %}
                            <div class="offer-product">{{ "Oferta" | translate }}</div>
                        {% endif %}
                {% endif %}
            </div>
        </div>
        {% if product.images_count > 1 %}
            <div class="row-fluid">
                <div class="span8 offset2">
                    {% if product.images_count > 6 %}
                        <div id="tS2" class="jThumbnailScroller">
                            <div class="jTscrollerContainer">
                                <div class="jTscroller">
                                    {% for image in product.images %}
                                        <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                            {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                                        </a>
                                    {% endfor %}
                                </div>
                            </div>
                            <a href="#" class="jTscrollerPrevButton"></a>
                            <a href="#" class="jTscrollerNextButton"></a>
                        </div>
                    {% else %}
                        <div class="thumb-center">
                            {% for image in product.images %}
                                <li>
                                    <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                        {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                                    </a>
                                </li>
                            {% endfor %}
                        </div>
                    {% endif %}
                </div>
            </div>
        {% endif %}
    </div>
    <div class="row-fluid sharing-row">
        <div class="shareLinks">
            <div class="shareItem twitter product-share-button" data-network="twitter">
                {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
            </div>
            <div class="shareItem google product-share-button" data-network="gplus">
                {{product.social_url | g_plus('medium') }}
            </div>
            <div class="shareItem facebook product-share-button" data-network="facebook">
                {{product.social_url | fb_like('store-product', 'button_count')}}
            </div>
            <div class="shareItem pinterest product-share-button" data-network="pinterest">
                {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
            </div>
        </div>
    </div>
    <div class="row-fluid" id="shop_bar">
        <div class="span10 offset1">
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
            <form id="product_form" method="post" action="{{ store.cart_url }}">
                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                {% if product.variations %}
                    <div class="fancyContainer">
                        {% for variation in product.variations %}
                            <div class="attributeLine">
                                <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                <select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#prod-page')">
                                    {% for option in variation.options %}
                                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                    {% endfor %}
                                </select>
                            </div>
                        {% endfor %}
                    </div>
                {% endif %}
                <div class="price-display price-holder">
                    {% include 'snipplets/product-price.tpl' with { schema: true } %}
                </div>
                {% snipplet "installments_in_product.tpl" %}
                {% if product.show_installments and product.display_price %}
                    {% set installments_info = product.installments_info %}
                        {% if installments_info %}
                        <div class="fancyContainer">
                            <a id="button-installments" href="#InstallmentModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                        </div>
                        {% endif %}
                {% endif %}
                <div class="addToCartButton">
                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Agregar al carrito +", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                    <input type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                </div>
                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
            </form>
        </div>
    </div>
    <div class="row-fluid" id="descrip-sector">
        <div class="span8 offset2">
            <div id="single-product">
                <div class="productContainer">
                    <div class="description user-content">
                        {{ product.description }}
                    </div>
                    {% if settings.show_product_fb_comment_box %}
                        <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                    {% endif %}
                </div>
            </div>
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
        <div class="headerBox relacionados">
            <h2>{{ "Productos Relacionados" | translate }}</h2>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="dest-list">
                    {% for related in related_products %}
                        {% if product.id != related.id %}
                            {% include 'snipplets/single_product.tpl' with {product : related} %}
                        {% endif %}
                    {% endfor %}
                </div>
            </div>
        </div>
    {% endif %}
</div>
{% if installments_info %}
 {% set gateways = installments_info | length %}
<div id="InstallmentModal" class="modal hide fade{% if gateways <= '3' %} two-gates{% endif %}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <div class="tab-pane{% if loop.first %} active{% endif %}" id="installment_{{ method }}_{{ installment }}">
                        <div class="span2">
                            {% for installment, data_installment in installments %}
                                <span id="installment_{{ method }}_{{ installment }}">
                                    <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                    {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                </span>
                                 {% if installment == 12 %}</div><div class="span2">{% endif %}
                            {% endfor %}
                            </div>    
                        </div>
            {% endfor %}
            </div>
        </div>
    </div>
</div>
{% endif %}

