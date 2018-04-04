<div id="content" class="single">

	{% snipplet "breadcrumbs.tpl" %}
	
	<div class="details">
		{% if product.featured_image %}
			<div class="pictures">
				<div class="big"><a href="{{ product.featured_image | product_image_url('original') }}" class="enlarge" rel="album" title="{{ product.name }}">{{ product.featured_image | product_image_url("huge") | img_tag(product.featured_image.alt) }}</a></div>
				
				<ul class="small">
					{% for image in product.images %}
						<li>
                            <a href="{{ image | product_image_url('original') }}" title="{{ product.name }}" class="enlarge" rel="album" data-image="{{image.id}}" >
                                {{ image | product_image_url("thumb") | img_tag(image.alt) }}
                            </a>
                        </li>
					{% endfor %}
				</ul>
			</div>
		{% endif %}
		
		<div class="data" itemscope itemtype="http://schema.org/Product">
			<h1 class="title" itemprop="name">{{ product.name }}</h1>
                {% if product.free_shipping %}
                    <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
                {% endif %}
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
			
				<form id="product_form" method="post" action="{{ store.cart_url }}">
					<input type="hidden" name="add_to_cart" value="{{ product.id }}" />
					
					{% for variation in product.variations %}
                    <div>
                        <label class="variation-label" for="variation_{{loop.index}}">{{variation.name}}</label>
						<select id="variation_{{loop.index}}" name="variation[{{ variation.id }}]">
						{% for option in variation.options %}
							<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
						{% endfor %}
						</select>
                    </div>
					{% endfor %}
                    {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}

					<div class="important">
						<div class="button agregar has-stock {% if not product.available %}hidden{% endif %}">
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
							<input type="submit" class="addToCart {{state}}" value="{{ texts[state] | translate }}" />
						</div>

                        <div class="product-price-holder" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                            <del id="compare_price_display" class="price {% if not product.compare_at_price %}hidden{% endif %}">{{ product.compare_at_price | money_long }}</del>
                            <span id="price_display" itemprop="price" content="{{ product.price / 100 }}" class="price {% if not product.display_price %}hidden{% endif %}">{{ product.price | money_long }}</span>
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
                                    <a id="button-installments" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                                {% endif %}
                            {% endif %}
					</div>
				</form>
			
		</div><!--data-->
        {% if settings.payments %}
        <div class="payments logos {% if not product.display_price%}hidden{% endif %}">
            <h2>{{ "Medios de pago" | translate }}</h2>
            <div>
                {% for payment in settings.payments %}
                    {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
        </div>
        {% endif %}
        {% if settings.shipping %}
        <div class="shipping logos {% if not product.display_price%}hidden{% endif %}">
            <h2>{{ "Formas de envío" | translate }}</h2>
            <div>
                {% for shipping in settings.shipping %}
                    {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
        </div>
        {% endif %}
        <div class="share">
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

        <div class="description user-content">
            {{ product.description }}
        </div>

        <div id="related-products">
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
                <br><h3 class="title">{{ "Tal vez te interesen estos productos." | translate }} </h3><br>
                {% snipplet "product_grid.tpl" with products = related_products %}
            {% endif %}
        </div>

        {% if settings.show_product_fb_comment_box %}
            <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        {% endif %}
		<div class="clear"></div>
	</div><!--details-->

</div><!--content-->

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
                                            {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
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
