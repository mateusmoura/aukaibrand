<!-- Modal -->
<div class="modal fade" id="quick{{ product.id }}" tabindex="-1" role="dialog" q-hidden="true">
    <div class="productContainer quick-content" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5">
                            <figure>
                                 {% if not product.available %}
                                    <div class="out-of-stock">{{ "Sin stock" | translate }}</div>
                                {% endif %}
                                {% if product.free_shipping %}
                                    <div class="free_shipping sst">{{ "Envío sin cargo" | translate }}</div>
                                {% endif %}
                                {% if product.compare_at_price %}
                                    <div class="offer sst">{{ "Oferta" | translate }}</div>
                                {% endif %}
                                {% if product.featured_image %}
                                    {{ product.featured_image | product_image_url('original') | img_tag(product.featured_image.alt) }}
                                {% else %}
                                    {{ product.featured_image | product_image_url('original') | img_tag(product.featured_image.alt) }}
                                {% endif %}
                            </figure>

                        </div>
                        <div class="col-md-7">
                                <div class=".col-md-4 .col-md-offset-4">
                                    <button type="button" class="close text-right" data-dismiss="modal"
                                            aria-hidden="true">&times;</button>
                                </div>

                            <div class="row">
                                <div class="title col-md-7">
                                    <h2 itemprop="name">{{ product.name }}</h2>
                                </div>

                                <div class="price-holder col-md-7">
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
                                <!-- price-holder -->
                            </div>

                            <hr class="featurette-divider"></hr>

                            <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}"/>
                            <meta itemprop="url" content="{{ product.social_url }}"/>
                            {% if page_description %}
                                <meta itemprop="description" content="{{ page_description }}"/>
                            {% endif %}

                            <form method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{ product.id }}"/>

                                {% if product.variations %}
                                    <div class="fancyContainer">
                                        <ul class="list-inline">
                                            {% for variation in product.variations %}
                                                <li class="attributeLine">
                                                   <label class="variation-label">
                                                    <div class="number">{{ loop.index }}</div>
                                                    <span>{{ "Elegir" | translate }} </span>
                                                    <strong>{{variation.name}}</strong></label>
                                                    <select id="variation_{{ loop.index }}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .productContainer');">
                                                        {% for option in variation.options %}
                                                            <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                        {% endfor %}
                                                    </select>
                                                </li>
                                             {% endfor %}
                                        </ul>
                                    </div>
                                {% endif %}
                                {% set stepslength = product.variations | length  %}
                                 {% if product.available %}
                                    <ul class="list-inline">
                                        <li class="attributeLine">
                                            <label class="variation-label">
                                                <div class="number">{{ stepslength + 1 }}</div>
                                                    <span>{{ "Elegir" | translate }} </span>
                                                    <strong>{{ "Cantidad" | translate }}</strong></label>
                                                    <input class="spinner" value="1" type="text" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                        </li>
                                    </ul>
                                 {% endif %}
                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="btn btn-primary btn-lg addToCart js-addtocart {{ state }}"
                                           value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                </div>
                            </form>
                            <div class="description user-content">
                                {% if product.description != '' %}
                                    <h4>{{ "Descripción" | translate }}</h4>
                                    {{ product.description | plain | truncateWords(30) }} ...
                                    <a class="quick" href="{{ product.url }}" title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
                                {% endif %}
                            </div>
                        </div>
                        <!-- col-md-6 -->
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div><!-- /.modal -->
