<div style="display: none;">
    <div id="quick{{ product.id }}" class="quick-content">
        <div class="productContainer" data-variants="{{product.variants_object | json_encode }}">
            <div class="row-fluid">
                <div class="span5">
                    <div class="imagecol">
                        <div class="span12">
                            <div class="imagecolContent">
                                {% if not product.available %}
                                    <div class="out-of-stock-product">{{ "Sin stock" | translate }}</div>
                                {% endif %}
                                {% if product.free_shipping %}
                                    <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
                                {% endif %}
                                {% if product.compare_at_price %}
                                    <div class="offer-product">{{ "Oferta" | translate }}</div>
                                {% endif %}
                                {% if product.featured_image %}
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                                {% else %}
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span7">
                    <div class="descriptioncol">
                        <div class="descriptioncolContent">
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="title">
                                        <h2>{{ product.name }}</h2>
                                    </div>
                                    {% include 'snipplets/product-price.tpl' with { schema: false } %}
                                    {% snipplet "installments_in_product.tpl" %}
               
                                </div>
                            </div>
                            <form id="product_form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
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
                                         {% set stepslength = product.variations | length  %}
                                             {% if product.available %}
                                                <div class="attributeLineQuickshop">
                                                        <label class="variation-label">
                                                            <div class="number">{{ stepslength + 1 }}</div> 
                                                                <span>{{ "Elegir" | translate }} </span>
                                                                <strong>{{ "Cantidad" | translate }}</strong></label>
                                                                <input id="spinner" value="1" type="text" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                                </div>
                                            {% endif %}  
                                    </div>
                                {% endif %}
                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
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