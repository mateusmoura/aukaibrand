<!-- Modal -->
<div class="product-modal modal fade" id="product{{ product.id }}" tabindex="-1" role="dialog" aria-labelledby="sizeGuide" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{ product.name }}</h5>

            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div id="quick{{ product.id }}" class="section-product quick-content" data-product="{{product.id}}">
                <div itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
                    <div class="product-image-content">
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
                            <div class="circle offer">
                                <p>{{ "Oferta" | translate }}</p>
                            </div>
                        {% endif %}

                        <div class="product-image">
                            {% if product.featured_image %}
                                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                            {% else %}
                                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                            {% endif %}
                        </div>
                    </div>

                    <div class="product-details">
                        <div class="product-price">
                            <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</span>
                                <span class="price-compare">
                                    <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
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
                                    <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                {% else %}
                                    {% set max_installments_with_interests = product.get_max_installments %}
                                    {% if max_installments_with_interests %}
                                        <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% endif %}
                                {% endif %}
                            {% endif %}
                        </div>

                        <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                        <meta itemprop="url" content="{{ product.social_url }}" />
                        {% if page_description %}
                            <meta itemprop="description" content="{{ page_description }}" />
                        {% endif %}

                        <div class="product-description user-content">
                            {% if product.description != '' %}
                                <h5>{{ "Descrição" | translate }}</h5>
                                {{ product.description | plain | truncateWords(20) }} ...
                            {% endif %}
                        </div>

                        <div class="product-form">
                            <form id="product_form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% if product.variations  %}
                                    {% include "snipplets/variants.tpl" with {'quickshop': true} %}
                                {% endif %}
                                
                                {% set stepslength = product.variations | length  %}
                                {% if product.available %}
                                    <div class="product-quantity">
                                        <label for="selectQuantity">
                                            <!-- <div class="number">{{ stepslength + 1 }}</div>
                                            <span>{{ "Escolher" | translate }} </span> -->
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

                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <button type="submit" class="btn btn-dark btn-lg btn-add-to-cart button addToCart js-addtocart {{ state }}" {% if state == 'nostock' %}disabled{% endif %}>{{ texts[state] | translate }}</button>

                                    <div class="quick">
                                        <a href="{{ product.url }}" class="btn btn-link" title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
                                    </div>
                                </div>

                                <div class="product-social">
                                    <ul>
                                        <li>
                                        <a href="/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li>
                                        <a href="/" target="_blank"><i class="fab fa-instagram"></i></a>
                                        </li>
                                        <li>
                                        <a href="/" target="_blank"><i class="fab fa-twitter"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>