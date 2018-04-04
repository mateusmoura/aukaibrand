<div class="container product-detail-container clear">
    <div id="single-product" itemscope itemtype="http://schema.org/Product">
        <div id="single-product-container" class="productContainer" data-variants="{{product.variants_object | json_encode }}">
            <div class="col-md-7 col-sm-12 col-xs-12 imagecol">
                <!--bx slider-->
                 <div class="col-xs-12 col-sm-12 hidden-md hidden-lg">
                    <h1 class="main-fg-color" itemprop="name">{{ product.name }}</h1>
                </div>
                <div class="mobile-bxslider box-shadow contrast-bg-color">             
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
                                <div class="label free-shipping main-bg-color">
                                    <p>{{ "Envío sin cargo" | translate }}</p>
                                </div>
                            {% endif %}
                            {% if product.compare_at_price %}
                                <div class="circle offer">
                                    <p>{{ "Oferta" | translate }}</p>
                                </div>
                        {% endif %}
                </div>
                <div class="social-desktop hidden-xs">
                    <div class="product-social-networks-desktop col-md-6 col-sm-6 col-xs-12 social-share">
                        <div class="social-icon row text-center">
                            <h4 class="box-shadow contrast-bg-color main-fg-color"><i class="fa fa-share-alt"></i></h4>
                        </div>
                        <div class="row text-center" >
                            <!-- Twitter button -->
                            <a class="share-btn share-btn-twitter product-share-button" data-network="twitter" target="_blank"
                               href="https://twitter.com/share?url={{ product.social_url }}"
                               title="Share on Twitter">
                                <i class="fa fa-twitter"></i>
                                <span class="share-btn-text">Twitter</span>
                            </a>
                            <!-- Facebook button -->
                            <a class="share-btn share-btn-facebook product-share-button" data-network="facebook" target="_blank"
                               href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
                               title="Share on Facebook">
                                <i class="fa fa-facebook"></i>
                                <span class="share-btn-text">Facebook</span>
                            </a>
                            <!--Google+ button -->
                            <a class="share-btn share-btn-googleplus product-share-button" data-network="gplus" target="_blank"
                               href="https://plus.google.com/share?url={{ product.social_url }}"
                               title="Share on Google+">
                                <i class="fa fa-google-plus"></i>
                                <span class="share-btn-text">Google+</span>
                            </a>
                        </div>
                    </div>
                    <div class="product-social-networks-desktop col-md-6 col-sm-6 col-xs-12 social-like">
                        <div class="social-icon row text-center">
                            <h4 class="box-shadow contrast-bg-color main-fg-color"><i class="fa fa-thumbs-up"></i></h4>
                        </div>
                        <div class="row text-center like-btn-container" >
                            <!-- Twitter button -->
                           <div class="like-btn facebook">
                                {{product.social_url | fb_like('store-product', 'button_count')}}
                            </div>
                            <div class="like-btn twitter">
                                {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                            </div>
                            <div class="like-btn google">
                                {{product.social_url | g_plus('medium') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5 col-sm-12 col-xs-12 product-description">
                <div class="descriptioncol">
                    <div class="descriptioncolContent">
                        <div class="row">
                            <div class="bread-container pull-left col-md-12 col-xs-12 visible-md visible-lg">
                                {% snipplet "breadcrumbs.tpl" %}
                            </div>
                            <div class="margin-bottom col-md-12 col-xs-12 hidden-xs hidden-sm">
                                <h1 class="main-fg-color" itemprop="name">{{ product.name }}</h1>
                            </div>
                            <div class="price-holder col-md-12 col-xs-12 " itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                <div class="price {% if not product.display_price %}hidden{% endif %}">
                                     <span class="price-compare">
                                        <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
                                    </span>
                                    <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{%
                                    endif %}>{{ product.price | money }}</span>                 
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
                        </div>
                        {% snipplet "installments_in_product.tpl" %}
                        {% if product.show_installments and product.display_price %}
                                {% set installments_info = product.installments_info %}
                                {% if installments_info %}
                                    <a id="button-installments" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                                {% endif %}
                        {% endif %}
                        <form id="product_form" class="row" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% if product.variations %}
                                <div class="fancyContainer row">
                                    {% for variation in product.variations %}
                                        <div class="col-md-4 col-xs-12">
                                            <div class="attributeLine">
                                                <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                                <select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#single-product-container')">
                                                    {% for option in variation.options %}
                                                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                    {% endfor %}
                                                </select>
                                            </div>
                                        </div>
                                    {% endfor %}
                                </div>
                            {% endif %}
                            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
                            <div class="buy-container col-md-12 col-sm-12 col-xs-12 margin-bottom margin-top">
                                {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                <input type="submit" class="btn btn-secondary addToCart  col-md-9 col-sm-12 col-xs-12 {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                            </div>
                        </form>
                        {% if product.available and product.display_price %}
                            <form id="product_form_1_click" class="row" method="post" action="{{ store.cart_url }}">
                            <div class="one-click-buy col-md-12 col-xs-12">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                <input type="hidden" name="buy_now" value="1" />
                                <input type="submit" id="go-to-checkout" name="buy_now"  class="btn btn-primary {{state}} col-md-9 col-sm-12 col-xs-12" value="{{ 'Comprar en 1 clic' | translate }}" {% if state == 'nostock' %}style="display:none;"{% endif %}/>
                            </div>
                            <form>
                        {% endif %}
                    </div>
                </div>
                <div class="user-description hidden-sm hidden-md hidden-lg">
                    <div class="description user-content col-md-12 col-sm-12 col-xs-12">
                        {{ product.description }}
                    </div>
                     {% if store.phone %}
                        <div class="whatsapp-question col-sm-12 col-xs-12 margin-bottom-x2">
                            <a class="col-sm-12 col-xs-12 whatsapp-question btn btn-tertiary margin-bottom" href="whatsapp://send?text={{ 'Hola, quería hacer una consulta del siguiente producto:' | translate }}{{ product.social_url }}">{{ 'Hacer una consulta' | translate }}<i class="fa fa-paper-plane"></i></a>  
                            <p>{{ 'Para hacer consultas agreganos a WhatsApp:' | translate }} - <strong><a href="tel:{{ store.phone }}">{{ store.phone }}</a></strong></p>
                        </div>
                    {% endif %}
                    <div class="social-share mobile col-md-5 col-sm-12 col-xs-12 text-center">
                             <div class="social-icon row text-center">
                                <h4 class="box-shadow contrast-bg-color"><i class="fa fa-share-alt main-fg-color"></i></h4>
                            </div>
                            <!-- Facebook button -->
                            <a class="share-btn share-btn-facebook" target="_blank"
                               href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
                               title="Share on Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                            <!-- Whatsapp button -->
                            <a class="share-btn share-btn-whatsapp" href="whatsapp://send?text={{ product.social_url }}">
                                {{ "images/whatsapp.png" | static_url | img_tag }} 
                            </a>
                            <!-- Twitter button -->
                            <a class="share-btn share-btn-twitter" target="_blank"
                               href="https://twitter.com/share?url={{ product.social_url }}"
                               title="Share on Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                    </div>
                </div>  
            </div>
            <div class="user-description hidden-xs">
                <div class="description user-content col-md-12 col-sm-12 col-xs-12">
                    {{ product.description }}
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
        <div class="row-fluid">
            <div class="container">
                <div class="dest-list">
                    {% set related_products %}
                        {% for related in related_products %}
                            {% if product.id != related.id %}
                                {% include 'snipplets/single_product.tpl' with {product : related} %}
                            {% endif %}
                        {% endfor %}
                    {% endset %}
                    <h2>{{"Productos relacionados" | translate}}</h2>
                    <div id="tS1" class="jThumbnailScroller hidden-xs">
                        <div class="jTscrollerContainer">
                            <div class="jTscroller">
                                {{ related_products }}
                            </div>
                        </div>
                        <a href="#" class="jTscrollerPrevButton"></a>
                        <a href="#" class="jTscrollerNextButton"></a>
                    </div>

                    <div class="visible-xs">
                        {{ related_products }}
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
</div>

{% if installments_info %}
 {% set gateways = installments_info | length %}
<div id="InstallmentsModal" class="modal fade{% if gateways <= '3' %} two-gates{% endif %}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                            <div class="tab-pane{% if loop.first %} active{% endif %}" id="installment_{{ method }}_">
                                <div class="col-md-12">
                                {% for installment, data_installment in installments %}
                                    <span id="installment_{{ method }}_{{ installment }}" >
                                        <strong>{{ installment ~ ' x ' ~ data_installment.installment_value_cents | money }}</strong>
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
{% endif %}
