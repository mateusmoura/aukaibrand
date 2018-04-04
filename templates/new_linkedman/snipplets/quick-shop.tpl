<div style="display: none;">
    <div id="quick{{ product.id }}" class="quick-content">
        <div class="productContainer" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
            <div class="row-fluid">
                <div class="span6">
                    <div class="imagecol">
                        <div class="span11">
                            <div class="imagecolContent">
                                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="descriptioncol">
                        <div class="descriptioncolContent">
                            <div class="row-fluid">
                                <div class="span10">
                                    <div class="title">
                                        <h2 itemprop="name">{{ product.name }}</h2>
                                    </div>
                                    <div class="span7">
                                         {% if product.free_shipping %}
                                        <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
                                        {% endif %}
                                        {% if product.compare_at_price %}
                                            <div class="offer-product">{{ "Oferta" | translate }}</div>
                                        {% endif %}
                                    </div>
                                </div>
                                <div class="span10">
                                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <div class="price">
                                            <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</span>
                                            <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                            {% if product.stock_control %}
                                                <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                                <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                                            {% endif %}
                                            <span class="price-compare">
                                            <span id="compare_price_display" {% if not product.compare_at_price %}style="display:none;"{% endif %}>{{ product.compare_at_price | money }}</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                     {% if product.show_installments and product.display_price %}
                                     <div class="span10">
                                        {% set max_installments_without_interests = product.get_max_installments(false) %}
                                        {% if max_installments_without_interests %}
                                            <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money ) }}</div>
                                        {% else %}
                                            {% set max_installments_with_interests = product.get_max_installments %}
                                            {% if max_installments_with_interests %}
                                                <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                            {% endif %}
                                        {% endif %}
                                     </div>
                                    {% endif %}
                                <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                                <meta itemprop="url" content="{{ product.social_url }}" />
                                {% if page_description %}
                                    <meta itemprop="description" content="{{ page_description }}" />
                                {% endif %}
                            </div>
                            <div class="line"></div>
                            <form id="product_form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% if product.variations  %}
                                    <div class="fancyContainer">
                                        {% for variation in product.variations %}
                                                <div class="attributeLine-quickshop">
                                                    <label class="variation-label">
                                                    <div class="number">{{ loop.index }}</div> 
                                                    <span>{{ "Elegir" | translate }} </span>
                                                    <strong>{{variation.name}}</strong></label>
                                                    <select id="variation_{{ loop.index }}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .productContainer');">
                                                        {% for option in variation.options %}
                                                            <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                        {% endfor %}
                                                    </select>
                                                </div>
                                        {% endfor %}
                                    </div>
                                {% endif %}
                                {% set stepslength = product.variations | length  %}
                                             {% if product.available %}
                                                <div class="attributeLine-quickshop">
                                                        <label class="variation-label">
                                                            <div class="number">{{ stepslength + 1 }}</div> 
                                                                <span>{{ "Elegir" | translate }} </span>
                                                                <strong>{{ "Cantidad" | translate }}</strong></label>
                                                                <input class="spinner" value="1" type="text" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                                </div>
                                            {% endif %} 
                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="button addToCart js-addtocart {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                </div>
                            </form>
                            <div class="description user-content">
                                {% if product.description != '' %}
                                <h5>{{ "Descripción" | translate }}</h5>
                                    {{ product.description | plain | truncateWords(30) }} ...
                                    <a class="quick" href="{{ product.url }}" title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>