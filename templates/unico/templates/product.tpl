<div itemscope itemtype="http://schema.org/Product">
    <h1 itemprop="name">{{ product.name }}</h1>
    <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
    <meta itemprop="url" content="{{ product.social_url }}" />
    {% if page_description %}
        <meta itemprop="description" content="{{ page_description }}" />
    {% endif %}
    {% if product.sku %}
        <meta itemprop="sku" content="{{ product.sku }}" />
    {% endif %}
    {% if product.weight %}
        <div itemprop="offers" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
            <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
            <meta itemprop="value" content="{{ product.weight}}" />
        </div>
    {% endif %}
    <div id="summary" class="clear">

        <div id="images">
            <div id="image" class="clear">
                <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                    {{ product.featured_image | product_image_url("large") | img_tag(product.featured_image.alt) }}
                </a>
            </div>

            {% if product.other_images %}
                <div class="thumbnail-container">
                    {% for image in product.images %}
                        <div class="single-thumb {{ ['col0', 'col1', 'col2', 'col3'] | cycle }}">
                            <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' ">
                                {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                            </a>
                        </div>
                    {% endfor %}
                </div>
            {% endif %}

            <div class="shareDiv">
                <div class="shareItem facebook">
                    {{product.social_url | fb_like('store-product', 'button_count')}}
                </div>
                <div class="shareItem twitter">
                    {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                </div>
                <div class="shareItem google">
                    {{product.social_url | g_plus('medium') }}
                </div>
            </div>

        </div>

        <div id="details">
            <div id="options" class="border">
                <form id="product_form" method="post" action="{{ store.cart_url }}">
                    <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                    {% if product.variations %}
                        <div id="variants">
                            <div class="border">
                                {% for variation in product.variations %}
                                    <div class="selector-wrapper">
                                        <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                        <select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant)">
                                            {% for option in variation.options %}
                                                <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                            {% endfor %}
                                        </select>
                                    </div>
                                {% endfor %}
                                </div>
                            </div>
                        {% endif %}
                        <div id="buy" class="clear">
                            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                <h2>
                                    <del id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money_long }}</del>
                                </h2>
                                <h2 id="price">
                                    <span id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money_long }}</span>
                                </h2>
                                <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                {% if product.stock_control %}
                                    <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                    <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                                {% endif %}
                            </div>
                             {% snipplet "installments_in_product.tpl" %}

                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                            <input id="add" type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" />
                        </div>
                    </form>
                </div>
                {% if settings.payments %}
                <div class="payment border logos {% if not product.display_price%}hidden{% endif %}">
                    <h2>{{ "Medios de pago" | translate }}</h2>
                    <div>
                        {% for payment in settings.payments %}
                            {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                        {% endfor %}
                    </div>
                </div>
                {% endif %}
                {% if settings.shipping %}
                <div class="shipping border logos {% if not product.display_price%}hidden{% endif %}">
                    <h2>{{ "Formas de envío" | translate }}</h2>
                    <div>
                        {% for shipping in settings.shipping %}
                            {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                        {% endfor %}
                    </div>
                </div>
                {% endif %}
                <div id="desc">
                    {{ product.description }}
                </div>
        </div>
        {% if settings.show_product_fb_comment_box %}
            <div class="fb-comments clear" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        {% endif %}
    </div>
</div>


{% snipplet "related.tpl" %}
