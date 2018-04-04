{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}
{% for product in products %}
	<div class="item {{ ['col0', 'col1', 'col2'] | cycle }}">
		<div class="data" itemscope itemtype="http://schema.org/Product">
            <meta itemprop="name" content="{{ product.name }}" />
			<div class="thumb">
				{% if product.other_images %}
					<a class="primary" href="{{ product.url }}" title="{{ product.name }}">
						{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
					</a>
					<a class="secondary" href="{{ product.url }}" title="{{ product.name }}">
						{{ product.other_images | first | product_image_url("medium") | img_tag(attribute(product.other_images | first, 'alt')) }}
					</a>
				{% else %}
					<a href="{{ product.url }}" title="{{ product.name }}">
						{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
					</a>
				{% endif %}
                <meta itemprop="image" content="https:{{ product.featured_image | product_image_url("medium") }}"/>
			</div>
			<h3 class="title">
				<a itemprop="url" href="{{ product.url }}">{{ product.name }}</a>
				 {% if product.free_shipping %}
	                <div class="free-shipping-product">{{ "Envío sin cargo" | translate }}</div>
	            {% endif %}
				{% if product.display_price %}
					<small itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        {{ product.price | money }}
                        <meta itemprop="price" content="{{ product.price / 100 }}"/>
                        <meta itemprop="priceCurrency" content="{{ product.currency }}"/>
                    </small>
                    {% if product.show_installments %}
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
				{% endif %}
			</h3>
		</div><!--data-->
	</div><!--Item-->
{% endfor %}