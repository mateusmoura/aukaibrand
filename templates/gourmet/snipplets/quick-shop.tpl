<!-- Modal -->
<div class="modal fade" id="quick{{ product.id }}" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-dialog" data-variants="{{ product.variants_object | json_encode }}">
        <div class="modal-content">
            <div class="modal-body contenido"> 
                <div class="quick-content" data-product="{{product.id}}">
                     <button type="button" class="close text-right" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div class="productContainer vista_producto" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
                        <div class="row">
                            <div class="col-md-6 ">
                                {% if product.featured_image %}
                                    {{ product.featured_image | product_image_url('original') | img_tag(product.name) }}
                                {% else %}
                                   {{ product.featured_image | product_image_url('original') | img_tag(product.name) }}
                                {% endif %}
                            </div>
                            <div class="info_producto-quickshop">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h2 itemprop="name"> {{ product.name }}</h2>
                                            <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
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
                                                {% snipplet "installments_in_product.tpl" %}
                                            </div><!-- price -->
                                        <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}"/>
                                        <meta itemprop="url" content="{{ product.social_url }}"/>
                                        {% if page_description %}
                                            <meta itemprop="description" content="{{ page_description }}"/>
                                        {% endif %}

                                        <form id="product_form" method="post" action="{{ store.cart_url }}">
                                            <input type="hidden" name="add_to_cart" value="{{ product.id }}"/>
                                            {% if product.variations  %}
                                                <div class="fancyContainer">
                                                    {% for variation in product.variations %}
                                                        <div class="attributeLineQuickshop">
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
                                                            <div class="attributeLineQuickshop">
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
                                                <input type="submit" class="btn-lg agregar addToCart {{ state }}"
                                                value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-6 detalle_prod-Quickshop">
                                            {% if product.description != '' %}
                                             <h5>{{ "Descripción" | translate }}</h5>
                                                <p>{{ product.description | plain | truncateWords(30) }} ...</p>
                                                <a class="quick" href="{{ product.url }}"
                                                   title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
                                            {% endif %}
                                    </div>
                                </div>
                            </div>
                            <!-- col-md-6 -->
                        </div>
                     </div>
                 </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
<!-- /.modal -->

