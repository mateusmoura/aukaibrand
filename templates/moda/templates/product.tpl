{% snipplet "sidebar.tpl" %}
<div id="content" class="single" itemscope itemtype="http://schema.org/Product">
    <h1 class="title">{{ category.name }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="contentBox productContainer">
        <div class="imagecol">
            <div class="imagecolContent">
                {% if product.featured_image %}
                    <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Carregando...' | translate }}'"> {{ product.featured_image | product_image_url('medium') | img_tag(product.featured_image.alt) }}</a>
                {% else %}
                    {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
                {% endif %}
            </div>
            <div class="zoom-instructions">{{ "Passe o mouse e veja mais detalhes" | translate }}<span class="zoom"></span></div>
            {% if product.images_count > 1 %}
                <div class="thumbnail-container">
                    {% for image in product.images %}
                        <div class="single-thumb">
                            <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
                                <div class="head">{{ image | product_image_url('thumb') | img_tag(image.alt) }}</div>
                            </a>
                        </div>
                    {% endfor %}
                </div>
            {% endif %}
        </div>
        <div class="data">
            <h1 class="title" itemprop="name">{{ product.name }}</h1>
            <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
            <meta itemprop="url" content="{{ product.social_url }}" />
            {% if page_description %}
                <meta itemprop="description" content="{{ page_description }}" />
            {% endif %}
            {% if product.sku %}
                <meta itemprop="sku" content="{{ product.sku }}" />
            {% endif %}
            {% if product.weight %}
                <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                    <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                    <meta itemprop="value" content="{{ product.weight}}" />
                </div>
            {% endif %}
            {% if product.free_shipping %}
                <div class="free-shipping-product">{{ "Frete grátis" | translate }}</div>
            {% endif %}
            <del class="price">
                <span id="compare_price_display" class="compare_price {% if not product.compare_at_price %}hidden{% endif %}">{{ product.compare_at_price | money_long }}</span>
            </del>
            <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <span id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money_long }}</span>
                <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                {% if product.stock_control %}
                    <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                    <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                {% endif %}
            </div>
                {% snipplet "installments_in_product.tpl" %}
                {% if product.show_installments and product.display_price %}
                    {% set installments_info = product.installments_info %}
                    {% if installments_info %}
                    <div class="row-fluid">
                        <a id="button-installments" class="button secondary" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver detalhes das parcelas" | translate }}</a>
                    </div>
                    {% endif %}
                {% endif %}
            <form id="product_form" method="post" action="{{ store.cart_url }}">
                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                {% if product.variations %}
                    <div class="fancyContainer">
                        {% for variation in product.variations %}
                            <div class="attributeLine">
                                <label for="{{ variation.name }}">{{ variation.name }}</label>
                                <select name="variation[{{ variation.id }}]">
                                    {% for option in variation.options %}
                                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                    {% endfor %}
                                </select>
                            </div>
                        {% endfor %}
                    </div>
                {% endif %}
                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
                <div class="addToCartButton"> {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Comprar", 'contact': "Preço sob Consulta", 'nostock': "Esgotado", 'catalog': "Consultar"} %}
                    <input type="submit" class="button addToCart {{state}}" value="{{ texts[state] | translate }}" />
                </div>
            </form>
            {% if settings.payments %}
                <div class="container-box {% if not product.display_price%}hidden{% endif %}">
                    <h3>{{ "Meios de Pagamento" | translate }}</h3>
                    {% for payment in settings.payments %}
                        {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                    {% endfor %}
                </div>
            {% endif %}
            {% if settings.shipping %}
                <div class="container-box {% if not product.display_price%}hidden{% endif %}">
                    <h3>{{ "Formas de envio" | translate }}</h3>
                    {% for shipping in settings.shipping %}
                        {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                    {% endfor %}
                </div>
            {% endif %}
            <div class="share">
                <div class="shareItem twitter">{{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}</div>
                <div class="shareItem google">{{product.social_url | g_plus('medium') }}</div>
                <div class="shareItem facebook">{{product.social_url | fb_like('store-product', 'button_count')}}</div>
                <div class="shareItem pinterest">{{product.social_url | pin_it('https:' ~ product.featured_image | product_image_url('medium'))}}</div>
            </div>
        </div>
        <div class="description user-content"> {{ product.description }} </div>
        {% if settings.show_product_fb_comment_box %}
            <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        {% endif %}
        <div id="related" class="cf">
            {% set related_products_ids = product.metafields.related_products.related_products_ids %}
            {% if related_products_ids %}
                {% set related_products = related_products_ids | get_products %}
                {% set show = (related_products | length > 0) %}
            {% endif %}
            {% if not show %}
                {% set related_products = category.products | shuffle | take(4) %}
                {% set show = (related_products | length > 1) %}
            {% endif %}
            {% if show %}
                <h3 class="title">{{ "Talvez você esteja interessado..." | translate }} </h3>
                {% for related in related_products %}
                    {% if product.id != related.id %}
                        <a class="product" href="{{ related.url }}" title="{{ related.name }}">
                            <span class="head">{{ related.featured_image | product_image_url("small") | img_tag(related.featured_image.alt) }}</span>
                            {% if product.free_shipping %}
                                <div class="free-shipping-product">{{ "Frete grátis" | translate }}</div>
                            {% endif %}
                            <span class="bajada" itemscope itemtype="http://schema.org/Product">
                            <strong>{{ related.name }}</strong>
                                {% if related.display_price %}
                                    <br /> {{ related.price | money }}
                                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <meta itemprop="price" content="{{ product.price / 100 }}" content="{{ related.price | money }}" />
                                    </div>
                                {% endif %}
                            </span>
                        </a>
                    {% endif %}
                {% endfor %}
            {% endif %}
        </div>
    </div>
</div>
{% if installments_info %}
 {% set gateways = installments_info | length %}
<div id="InstallmentsModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <div class="installments">
                    <ul class="nav nav-tabs">
                        {% for method, installments in installments_info %}
                            <li id="method_{{ method }}" {% if loop.first %}class="active"{% endif %}><a href="#installment_{{ method }}_{{ installment }}" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method | upper) }}</a></li>
                        {% endfor %}
                    </ul>
                    <div class="tab-content">
                    {% for method, installments in installments_info %}
                                <div class="tab-pane{% if loop.first %} active{% endif %}" id="installment_{{ method }}_{{ installment }}">
                                    {% for installment, data_installment in installments %}
                                        <span id="installment_{{ method }}_{{ installment }}">
                                            <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                            {% if data_installment.without_interests %} {{ 'sem juros' | t }}{% endif %}
                                        </span>
                                    {% endfor %}
                                </div>
                    {% endfor %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endif %}
<script type="text/javascript">
    $(document).ready(function() {
        var n = $("#related .head").length;
        if (n >= 1) {
            $("#related .title").css("display", "block");
        }
        else {
            $("#related .title").css("display", "none");
        }
    });
</script>