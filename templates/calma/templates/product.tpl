<div itemscope itemtype="http://schema.org/Product">
    <div id="main-product-image">
      <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
        <img src="{{ product.featured_image | product_image_url('medium')  }}" class="reflect" alt="{{ product.featured_image.alt }}" />
      </a>
    </div>

    <h2 id="product-title" itemprop="name">{{ product.name }}</h2>
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

    <div id="product-purchase">
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <div class="price">
                    <del id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money_long }}</del>
                </div>
                <div class="price">
                    <span id="price-field" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money_long }}</span>
                    <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                    {% if product.stock_control %}
                        <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                        <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                    {% endif %}
                </div>
            </div>
            {% snipplet "installments_in_product.tpl" %}

            <form id="product_form" method="post" action="{{ store.cart_url }}">
                <input type="hidden" name="add_to_cart" value="{{ product.id }}" />
                <div id="product-variants">
                    {% if product.variations %}
                        {% for variation in product.variations %}
                            <div class="variation-holder">
                                <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                <select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant)">
                                    {% for option in variation.options %}
                                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                    {% endfor %}
                                </select>
                            </div>
                        {% endfor %}
                    {% endif %}
                </div>

                {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                <input type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" />
            </form>
    </div>

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

    {% if product.other_images %}
        <div id="product-images">
            {% for image in product.images %}
                    <div class="small-image">
                        <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('medium') }}' ">
                            {{ image | product_image_url('thumb') | img_tag(image.alt) }}
                        </a>
                    </div>
            {% endfor %}
            <div class="cl"></div>
        </div>
    {% endif %}


    <div id="product-description">
        {{ product.description }}
    </div>

    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
</div>

