<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title bottom-0">
				<h2 class="title">{{ product.category.name }}</h2>
				<hr class="line" />
			</div>
		</div>
	</div>
	{% snipplet "breadcrumbs.tpl" %}
	<div id="single-product" class="row" data-variants="{{product.variants_object | json_encode }}" itemscope itemtype="http://schema.org/Product">
       <div class="mobile-bxslider">             
            {% if product.images_count > 1 %}
                <ul class="bxslider" id="productbxslider">
                    {% for image in product.images %}
                      <li class="product-slider" data-image="{{image.id}}" data-image-position="{{loop.index0}}">{{ image | product_image_url('big') | img_tag(image.alt) }}</li>
                    {% endfor %}
                </ul>
            {% else %}
                {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
            {% endif %}
            <div class="mobile-product-labels">
	          		{% if not product.available %}
	                    <div class="product-related-button">
	                        <p>{{ settings.no_stock_text }}</p>
	                    </div>
	                 {% endif %}
	                {% if product.free_shipping %}
	                    <div class="free-shipping">
	                        <p>{{ settings.free_shipping_text }}</p>
	                    </div>
	                {% endif %}
                    <div class="offer" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>
                        <p>{{ settings.offer_text }}</p>
                    </div>
	         </div>   
        </div>
		<div class="col-md-6 col-sm-12 col-xs-12 product-photos desktop-featured-product">
			<div class="row">
				<div class="current-photo no-gutter">
					<div class="current-photo-container">
					{% if product.featured_image %}
						<a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
							{{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
						</a>
					{% else %}
						{{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
					{% endif %}
                        <div class="product-boxes">
                            <div class="offer" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}><p>{{ settings.offer_text }}</p></div>
                            {% if not product.available %}
                                <div class="product-related-button"><p>{{ settings.no_stock_text }}</p></div>
                            {% endif %}
                            {% if product.free_shipping %}
                                <div class="free-shipping"><p>{{ settings.free_shipping_text }}</p></div>
                            {% endif %}
                        </div>
					</div>
				</div>
			</div>
			<div class="row">
				{% if product.images_count > 1 %}
				<div class="thumb-container">
					{% for image in product.images %}
						{% if loop.index % 4 == 1 %}
		    				<div class="row">
		    			{% endif %}
							<a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' " data-image="{{image.id}}">
								{{ image | product_image_url('thumb') | img_tag(image.alt) }}
							</a>
						{% if loop.index % 4 == 0 or loop.last %}
					    	</div>
					    {% endif %}
					{% endfor %}
				</div>
				{% endif %}
			</div>
		</div>
		<div class="col-md-6 col-sm-12 col-xs-12">
			<h1 class="product-title" itemprop="name">{{ product.name }}</h1>
			<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
				<div class="price-container">
					<p id="compare_price_display" class="big-old-price" {% if not product.compare_at_price %}style="display:none;"{% else %} style="display:block;"{% endif %}> {{ product.compare_at_price | money }}</p>
					<p class="big-price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</p>
					<meta itemprop="priceCurrency" content="{{ product.currency }}" />
					{% if product.stock_control %}
                        <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                        <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                    {% endif %}
				</div>
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
                <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                    <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                    <meta itemprop="value" content="{{ product.weight}}" />
                </div>
            {% endif %}
            {% snipplet "installments_in_product.tpl" %}
            {% if product.show_installments and product.display_price %}
                {% set installments_info = product.installments_info %}
                {% if installments_info %}
                <div class="row-fluid">
                    <a id="button-installments" href="#InstallmentsModal" role="button" data-toggle="modal">{{ "Ver el detalle de las cuotas" | translate }}</a>
                </div>
                {% endif %}
            {% endif %}
			<form id="product_form" method="post" action="{{ store.cart_url }}">
				<input type="hidden" name="add_to_cart" value="{{product.id}}" />
				{% if product.variations %}
					<div class="variant-container">
						{% for variation in product.variations %}
							<div class="variant">
								<label class="variation-label" for="variation_{{loop.index}}"><h3>{{variation.name}}:</h3></label>
								<div class="custom-select">
									{% if variation.options | length > 1 %}
										<select class="form-control on-steroids" id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#single-product')">
											{% for option in variation.options %}
												<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
											{% endfor %}
										</select>
									{% else %}
										<p>{{ variation.options[0].name }}</p>
										<input type="hidden" name="variation[{{ variation.options[0].id }}]" value="{{variation.options[0].id}}">
									{% endif %}
								</div>							
							</div>
						{% endfor %}
					</div>
				{% endif %}				
				{% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'catalog': "Consultar", 'nostock' : settings.no_stock_text} %}
                <input type="submit" class="addToCart big-button big-product-related-button {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />
			</form>
			{% if settings.shipping_calculator %}
				 {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
			{% endif %}
			<div class="shareLinks">
				<div class="shareLinksContainer">
					<div class="shareItem facebook product-share-button" data-network="facebook">
						{{product.social_url | fb_like('store-product', 'button_count')}}
					</div>
					<div class="rest-of-social">
						<div class="shareItem twitter product-share-button" data-network="twitter">
							{{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
						</div>
						<div class="shareItem google product-share-button" data-network="gplus">
							{{product.social_url | g_plus('medium') }}
						</div>
						<div class="shareItem pinterest product-share-button" data-network="pinterest">
							{{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
						</div>
					</div>
				</div>
			</div>
            {% if not settings.show_description_bottom %}
                <div class="description user-content">
                    {{ product.description }}
                </div>
            {% endif %}
		</div>
	</div>
	<div class="row">
	{% if settings.show_description_bottom %}
		<div class="description user-content">
			{{ product.description }}
		</div>
	{% endif %}
	</div>
	<div class="row">
		<div class="comments-area">
            {% if settings.show_product_fb_comment_box %}
			    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
            {% endif %}
        </div>
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
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h2 class="title">{{"Productos relacionados" | translate}}</h2>
                        <hr class="line" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <section id="grid" class="grid clearfix">
                        <div class="row">
                        {% for related in related_products %}
                            {% if product.id != related.id %}
                                {% include 'snipplets/single_product.tpl' with {product : related} %}
                            {% endif %}
                        {% endfor %}
                        </div>
                    </section>
                </div>
            </div>
        {% endif %}
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
		                        <div class="tab-pane row{% if loop.first %} active{% endif %}" id="installment_{{ method }}_{{ installment }}">
		                        	<div class="col-md-8">
		                            {% for installment, data_installment in installments %}
		                                <span id="installment_{{ method }}_{{ installment }}">
		                                    <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                            {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
		                                </span>
		                                {% if installment == 12 %}</div><div class="col-md-8">{% endif %}
		                            {% endfor %}
		                        	</div>
		                        </div>
		            {% endfor %}
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
{% endif %}
