<div class="page-content">
	<div id="single-product" itemscope itemtype="http://schema.org/Product">
		<div class="headerBox">
			<h2 class="title">{{ category.name }}</h2>
		</div>	
							
		<div class="contentBox productContainer">
            <div id="fauxContainer">
                <div class="imagecol">
                    <div class="imagecolContent">
                        {% if product.featured_image %}
                            <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                {{ product.featured_image | product_image_url('medium') | img_tag(product.featured_image.alt) }}
                            </a>
                        {% else %}
                            {{ product.featured_image | product_image_url('medium') | img_tag(product.featured_image.alt) }}
                        {% endif %}
                    </div>
                    <div class="zoom-instructions">{{ "Mueve el mouse sobre la foto para hacer zoom" | translate }}</div>
                    {% if product.images_count > 1 %}
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

                    {% if settings.payments %}
                    <div class="container-box {% if not product.display_price%}hidden{% endif %}">
                        <h3>{{ "Medios de pago" | translate }}</h3>
                        {% for payment in settings.payments %}
                            {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                        {% endfor %}
                    </div>
                    {% endif %}

                    {% if settings.shipping %}
                    <div class="container-box {% if not product.display_price%}hidden{% endif %}">
                        <h3>{{ "Formas de envío" | translate }}</h3>
                        {% for shipping in settings.shipping %}
                            {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                        {% endfor %}
                    </div>
                    {% endif %}

                    <div class="container-box">
                           <h3>{{ "Comparte este producto" | translate }}</h3>
                           <div class="shareLinks">
                                  <div class="shareItem twitter">
                                        {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                                  </div>
                                  <div class="shareItem google">
                                        {{product.social_url | g_plus('medium') }}
                                  </div>
                                  <div class="shareItem facebook">
                                       {{product.social_url | fb_like('store-product', 'button_count')}}
                                  </div>
                           </div>
                           <div class="clear"></div>
                    </div>
                </div>
                <div class="descriptioncol">
                    <div class="descriptioncolContent">
                        {% snipplet "breadcrumbs.tpl" %}
                        <div class="title">
                            <h2 itemprop="name">{{ product.name }}</h2>
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
                            <div itemprop="offers" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                                <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                                <meta itemprop="value" content="{{ product.weight}}" />
                            </div>
                        {% endif %}
                        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                            <del class="price">
                                <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money_long }}</span>
                            </del>
                            <div class="price">
                                <span id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money_long }}</span>
                                <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                {% if product.stock_control %}
                                    <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                    <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                                {% endif %}
                            </div>
                        </div>
                        <div class="installments {% if not product.display_price or product.installments <= 1 %}hidden{% endif %}">
                            {% set installments %}<span id="installments_number">{{ product.installments }}</span>{% endset %}
                            {% if settings.no_interest %}
                                {% set installment_amount %}<span id="installments_amount">{{ (product.price / product.installments) | money }}</span>{% endset %}
                                {{ "En hasta {1} cuotas de {2} sin interés" | translate(installments, installment_amount) }}
                            {% else %}
                                {{ "En hasta {1} cuotas en tarjeta de crédito" | translate(installments) }}
                            {% endif %}
                        </div>

                        <form id="product_form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />

                            {% if product.variations %}
                                <div class="fancyContainer">
                                {% for variation in product.variations %}
                                    <div class="attributeLine">
                                        <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
                                        <select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant)">
                                        {% for option in variation.options %}
                                            <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                        {% endfor %}
                                        </select>
                                    </div>
                                {% endfor %}
                                </div>
                            {% endif %}

                            <div class="addToCartButton">
                                {% set state = product.available ? product.display_price ? 'cart' : 'contact' : 'nostock' %}
                                {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock"} %}
                                <input type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" />
                            </div>
                        </form>

                        <div class="description user-content">
                            {{ product.description }}
                        </div>
                        {% if settings.show_product_fb_comment_box %}
                            <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                        {% endif %}
                    </div>
                </div>
                <div class="clear"></div>
            </div>
		</div>
	</div>
</div>