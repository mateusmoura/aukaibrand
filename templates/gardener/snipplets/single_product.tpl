<div class="single-product" itemscope itemtype="http://schema.org/Product">
	<div class="product-boxes">
		{% if product.compare_at_price %}
		<div class="offer"><p>{{ settings.offer_text }}</p></div>
		{% endif %}
		{% if not product.available %}
	     <div class="product-related-button"><p>{{ settings.no_stock_text }}</p></div>
		{% endif %}
        {% if product.free_shipping %}
            <div class="free-shipping"><p>{{ settings.free_shipping_text }}</p></div>
        {% endif %}
	</div>
	<figure>
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
        <a itemprop="url" href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}</a>
        <meta itemprop="image" content="https:{{ product.featured_image | product_image_url("medium") }}" />
        <figcaption>
			{% if product.category.id != 0 %}
				<h4><a href="{{ product.category.url }}">{{ product.category.name }}</a></h4>
			{% endif %}

            {% set product_name_length = product.name|length %}
            {% set new_font_size = product_name_length < 32 ? null : (product_name_length < 60 ? 13 : (product_name_length < 84 ? 11 : 9) ) %}
            <h3 itemprop="name" {% if new_font_size %}style="font-size: {{ new_font_size }}px"{% endif %}><a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">{{ product.name }}</a></h3>

            <div class="price-container {% if not product.display_price%}hidden{% endif %}" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            	<a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}">
					<p {% if not product.compare_at_price %}class="hidden"{% endif %}class="old-price"> {{ product.compare_at_price | money }}</p>
		            <p class="price" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</p>
                    <meta itemprop="priceCurrency" content="{{ product.currency }}" />
		        </a>
            </div>
             {% if product.show_installments and product.display_price %}
                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                    {% if max_installments_without_interests %}
                        <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                    {% else %}
                        {% set max_installments_with_interests = product.get_max_installments %}
                        {% if max_installments_with_interests %}
                            <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                        {% endif %}
                    {% endif %}
                {% endif %}
		</figcaption>
	</figure>
</div>