{% snipplet "breadcrumbs.tpl" %}
<div id="overview" class="clear" itemscope itemtype="http://schema.org/Product">
	<p id="image">
		{% if product.featured_image %}
		<a href="{{ product.featured_image | product_image_url('original') }}" rel="lightbox-images" id="zoom" class="cloud-zoom">
			{{ product.featured_image | product_image_url('medium') | img_tag(product.featured_image.alt) }}
		</a>
		{% else %}
			{{ product.featured_image | product_image_url('medium') | img_tag(product.featured_image.alt) }}
		{% endif %}
	</p>
	<h1 id="title" itemprop="name">{{ product.name }}</h1>
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

    <div class="product-price-holder" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <h2 class="price"><del id="compare_price_display" class="{% if not product.compare_at_price %}hidden{% endif %}">{{ product.compare_at_price | money_long }}</del></h2>
        <h2 class="price"><span id="price_display" itemprop="price" content="{{ product.price / 100 }}" class="{% if not product.display_price %}hidden{% endif %}">{{ product.price | money_long }}</span></h2>
        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
        {% if product.stock_control %}
            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
        {% endif %}
    </div>
     {% snipplet "installments_in_product.tpl" %}

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
	{{ product.description }}
			<div id="options">	
						<form id="product_form" method="post" action="{{ store.cart_url }}">
							<input type="hidden" name="add_to_cart" value="{{product.id}}" />
							{% if product.variations %}
								<div id="variants">
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
							{% endif %}
							<div id="buy" class="clear">
								{% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
								{% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
								<input type="submit" class="{{state}}" value="{{ texts[state] | translate }}" />
							</div>
						</form>
	</div>
</div>
{% if product.images_count > 1 %}
<div id="images">
	<div>
		<h6>{{'Más imágenes' | translate}} <span>({{'click para agrandar' | translate}})</span></h6>{% for image in product.other_images %}
		<a href="{{ image | product_image_url('original') }}" rel="lightbox-images">
		{{ image | product_image_url('thumb') | img_tag(image.alt) }}
		</a>{% endfor %}
	</div>
</div>
{% endif %}

{% if settings.show_product_fb_comment_box %}
    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
{% endif %}

{% if sections.secondary.products %}
<div id="related">
	<h4>{{'Si te gustó este producto tal vez te gusten estos otros:' | translate}}</h4>
	<ul id="products" class="clear">
	{% for otherProduct in sections.secondary.products %}
		{% if product.id != otherProduct.id %}
		<li {% if loop.index % 3 == 0 %}class="end"{% endif %}>
			<div class="image">
				<div class="overflow">
					<div class="align">
					{% if otherProduct.display_price %}
						<h6>{{ otherProduct.price | money }}</h6>
					{% endif %}
						<div><a href="{{ otherProduct.url}}">{{ otherProduct.featured_image | product_image_url("medium") | img_tag(otherProduct.featured_image.alt) }}</a></div>
					</div>
				</div>
			</div>
			<p><a href="{{ otherProduct.url}}">{{ otherProduct.name }}</a></p>
		</li>
		{% endif %}
	{% endfor %}
	</ul>
</div>
{% endif %}
