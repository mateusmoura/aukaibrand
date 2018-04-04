<!-- Modal -->
<div class="modal fade quickshop" id="quick{{ product.id }}" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-body">
                <div class="quick-content" data-product="{{product.id}}">
                    <div class="productContainer" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="imagecolContent">
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
                                    {% if product.compare_at_price %}
                                        <div class="offer2">
                                            <p>{{ "Oferta" | translate }}</p>
                                        </div>
                                    {% endif %}
                                    {% if product.featured_image %}
                                        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                                    {% else %}
                                        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                                    {% endif %}
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="descriptioncol">
                                    <div class="descriptioncolContent">
                                        <div class="row-fluid">
                                            <div class="titles">
                                                <h2 itemprop="name">{{ product.name }}</h2>
                                            </div>
                                            <div class="price-holder" >
                                                <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                    <span id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</span>
													<span class="price-compare">
													<span id="compare_price_display" {% if not product.compare_at_price %}style="display:none;"{% endif %}>{{ product.compare_at_price | money }}</span>
													</span>
                                                    <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                                    {% if product.stock_control %}
                                                        <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                                        <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                                                    {% endif %}
                                                </div>
                                                  {% if product.show_installments and product.display_price %}
                                                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                                                    {% if max_installments_without_interests %}
                                                        <div class="max_installments">{{"<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                                    {% else %}
                                                        {% set max_installments_with_interests = product.get_max_installments %}
                                                        {% if max_installments_with_interests %}
                                                            <div class="max_installments">{{"<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                                        {% endif %}
                                                    {% endif %}
                                                {% endif %}
                                            </div>
                                            <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                                            <meta itemprop="url" content="{{ product.social_url }}" />
                                            {% if page_description %}
                                                <meta itemprop="description" content="{{ page_description }}" />
                                            {% endif %}
                                        </div>
                                        <form id="product_form" method="post" action="{{ store.cart_url }}">
                                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                            {% if product.variations  %}
                                                <div class="fancyContainerQuickshop">
                                                    {% for variation in product.variations %}
                                                        <div class="col-md-12">
                                                            <div class="attributeLineQuickshop attributeLine">
                                                                <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                                                <select id="variation_{{ loop.index }}" class="form-control input-sm quantity" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .productContainer');">
                                                                    {% for option in variation.options %}
                                                                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                                    {% endfor %}
                                                                </select>
                                                            </div>
                                                        </div>
                                                    {% endfor %}
                                                </div>
                                            {% endif %}
                                            {% set stepslength = product.variations | length  %}
                                            <div class="productCTAContainer">
                                                {% if product.available %}
                                                    <div class="col-md-3 col-xs-12">
                                                        <label class="variation-label">{{ "Cantidad" | translate }}</label>
                                                        <input class="spinner" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                                    </div>
                                                {% endif %}
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="addToCartButton">
                                                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                                        <input type="submit" class="addbutton button addToCart {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="col-md-12 col-xs-12">
                                            <div class="description user-content">
                                                <h5>{{ "Descripción" | translate }}</h5>
                                                {% if product.description != '' %}
                                                    {{ product.description | plain | truncateWords(20) }} ...
                                                    <div class="quick">
                                                        <a href="{{ product.url }}" title="{{ product.name }}">{{ "Ver descripción completa" | translate }}</a>
                                                    </div>
                                                {% endif %}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <!-- /.modal-body -->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->