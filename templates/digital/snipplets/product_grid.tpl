{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}
{% for product in products %}
	{% if loop.index % cols|default(3) == 1 %}
	<div class="row">
	{% endif %}
	
	<div class="item">
		<div class="data" itemscope itemtype="http://schema.org/Product">
            <meta itemprop="name" content="{{ product.name }}" />
			<div class="thumb">
			
					<a href="{{ product.url }}" title="{{ product.name }}">
						{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
                        <meta itemprop="image" content="https:{{ product.featured_image | product_image_url("medium") }}"/>
					</a>

			</div>
			 {% if product.free_shipping %}
                <div class="free-shipping-product">{{ "Frete grátis" | translate }}</div>
            {% endif %}
			<h3 class="title">
				<a itemprop="url" href="{{ product.url }}">{{ product.name }}</a>
				{% if product.display_price %}
                    {% if product.compare_at_price %}
                        <del>{{ product.compare_at_price | money }}</del>
                    {% endif %}
					<small itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        {{ product.price | money }}
                        <meta itemprop="price" content="{{ product.price / 100 }}"/>
                        <meta itemprop="priceCurrency" content="{{ product.currency }}"/>
                    </small>
				{% endif %}
			</h3>
					{% if product.show_installments and product.display_price %}
                        {% set max_installments_without_interests = product.get_max_installments(false) %}
                        {% if max_installments_without_interests %}
                            <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong> sem juros" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                        {% else %}
                            {% set max_installments_with_interests = product.get_max_installments %}
                            {% if max_installments_with_interests %}
                                <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                            {% endif %}
                        {% endif %}
                    {% endif %}
		</div><!--data-->
	</div><!--Item-->
	
	{% if loop.index % cols|default(3) == 0 %}
	</div>
	{% endif %}
{% endfor %}
