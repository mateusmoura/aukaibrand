
<div id="home-slider-products" class="drop-shadow container m-top m-none-top-xs m-half-bottom-xs p-relative">
	<div itemscope itemtype="http://schema.org/Product">
		<ul class="home-products-slider-container m-none p-none p-bottom-xs">
			{% for product in sections.slider.products %}
				{% if product.compare_at_price %}
					{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
				{% endif %}
				{% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
				<li>
					<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 p-quarter-left-xs p-quarter-right-xs">
						<div class="container-fluid visible-xs">
							<h2 class="product-name product-name text-center">
								<a class="color-foreground text-underline no-link" href="{{ product.url }}">
									{% if product.name | length > 40 %}
									{{ product.name | truncate(40) }}<span>...</span>
									{% else %}
									{{ product.name }}
									{% endif %}
								</a>
							</h2>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 p-top p-bottom p-right-none-xs p-left-none-xs p-half-top-xs text-center">
							<div class="single-product-image p-relative d-inline-block">
								{% if not product.available %}
					                <a href="{{ product_url_with_selected_variant }}" class="label-no-stock p-absolute overlay text-center card-radius no-link"><h4 class="text-uppercase">{{ "Sin stock" | translate }}</h4></a>
					            {% endif %}
								<a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image material-radius d-inline-block">
									{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt, {class: 'img-responsive m-auto drop-shadow'}) }}
									{% if product.free_shipping or product.compare_at_price %}
					                <div class="labels-container p-absolute">
					                {% if product.compare_at_price %}
					                    <h3 class="m-none-top"><div class="label label-warning label-offer pull-left font-weight-normal border-radius-none text-uppercase">
					                        {% if store.country == 'BR' %}
					                            <strong>-{{ price_discount_percentage |round }}%</strong></div>
					                        {% else %}
					                            <strong>{{ price_discount_percentage |round }}%</strong> OFF</div>
					                        {% endif %}
					                    </h3>
					                {% endif %}
					                 {% if product.free_shipping %}
					                    <h3 class="m-none-top"><div class="label label-info label-shipping font-weight-normal border-radius-none text-uppercase pull-left"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h3>
					                {% endif %}
					                </div>
					            {% endif %}
								</a>
								
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 m-half-top">
							<h2 class="product-name hidden-xs">
								<a class="color-foreground text-underline no-link" href="{{ product.url }}">
									{% if product.name | length > 40 %}
									{{ product.name | truncate(40) }}<span>...</span>
									{% else %}
									{{ product.name }}
									{% endif %}
								</a>
							</h2>
					        {#  **** Product price ****  #}
					        {% if product.display_price %}
					        	<div class="row m-half-top m-none-top-xs">
							        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
							            <div class="product-price-container container-fluid">
							            	{% if product.compare_at_price %}
							                <h3 class="price-compare d-inline-block text-line-through  m-none-top">
							                     <span class="opacity-50 p-half-right compare-price-display" >{{ product.compare_at_price | money }}</span>
							                </h3>
							                {% endif %}
							                <h2 class="price final-price d-inline-block m-none-top {% if product.compare_at_price %}border-left-dark p-half-left p-none-xs{% endif %}" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</h2>
							                <meta itemprop="priceCurrency" content="{{ product.currency }}">
							                {% if product.stock_control %}
							                    <meta itemprop="inventoryLevel" content="{{ product.stock }}">
							                    <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}">
							                {% endif %}
							            </div>
							        </div>
						        </div>
								{% if product.show_installments %}
								<div class="row">
									<div class="container-fluid">	
										<div class="installments-in-product-container max_installments_container d-inline-block">
											<h4 class="m-none {% if is_link %}text-underline{% endif %}">
										    <i class="fa fa-credit-card d-inline-block m-quarter-right"></i>
										    {% set max_installments_without_interests = product.get_max_installments(false) %}
										    {% if max_installments_without_interests %}
										            <div class="max_installments d-inline">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong> sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
										    {% else %}
										        {% set max_installments_with_interests = product.get_max_installments %}
										        {% if max_installments_with_interests %}
										            <div class="max_installments d-inline">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
										        {% endif %}
										    {% endif %}
											</h4>
										</div>
									</div>
								</div>
								{% endif %}

					        {% endif %}
					        <div class="row m-top m-bottom m-half-top-xs">
					        	<div class="container-fluid">
									<a class="btn btn-primary btn-xs btn-extra-xs col-xs-12 col-sm-6 col-md-6 col-lg-6" href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{'Ver detalles' | translate}}</a>
					        	</div>
							</div>
						</div>
					</div>
				</li>
			{% endfor %}
		</ul>
		{% if sections.slider.products > 1 %}
        <div class="bx-pager home-products-pager text-center m-half-bottom visible-xs p-absolute">
             {% for product in sections.slider.products %}
                <a class="hidden" href="">
                </a>
                 <div class="slider-circles">
                    <span class="circle-pager"></span>
                </div>
             {% endfor %}
        </div>
        {% endif %}
	</div>
</div>