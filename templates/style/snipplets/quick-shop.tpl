<div style="display: none;">
    <div id="quick{{ product.id }}" class="quick-content">
        <div class="productContainer" data-variants="{{product.variants_object | json_encode }}">
            <div class="row-fluid">
                <div class="span6">
                    <div class="imagecol">
                        <div class="span12">
                            <div class="imagecolContent">
                                {% if product.featured_image %}
                                    {{ product.featured_image | product_image_url('large') | img_tag }}
                                {% else %}
                                    {{ product.featured_image | product_image_url('large') | img_tag }}
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="descriptioncol" style="margin-top:50px;">
                        <div class="descriptioncolContent">
                            <div class="row-fluid">
                                <div class="span7">
                                    <div class="title">
                                        <h2 itemprop="name">{{ product.name }}</h2>
                                    </div>
                                </div>
                                <div class="span5 price-holder">
                                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <div class="price {% if not product.display_price%}hidden{% endif %}">
											<span class="price-compare">
											<span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
											</span>
                                            <span class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</span>
                                            <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                            {% if product.stock_control %}
                                                <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                                <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                                            {% endif %}
                                        </div>
                                    </div>
                                </div>
                                <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                                <meta itemprop="url" content="{{ product.social_url }}" />
                                {% if page_description %}
                                    <meta itemprop="description" content="{{ page_description }}" />
                                {% endif %}
                            </div>
                             {% snipplet "installments_in_product.tpl" %}
                            <form id="product_form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% if product.variations %}
                                    <div class="fancyContainer">
                                        {% for variation in product.variations %}
                                            <div class="span4">
                                                <div class="attributeLine">
                                                    <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                                    <select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .productContainer');">
                                                        {% for option in variation.options %}
                                                            <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                        {% endfor %}
                                                    </select>
                                                </div>
                                            </div>
                                        {% endfor %}
                                    </div>
                                {% endif %}
                                <div class="addToCartButton">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                    <input type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" />
                                </div>
                            </form>
                            <div class="description user-content">
                                {% if product.description != '' %}
                                    {{ product.description | plain | truncateWords(50) }} ...
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