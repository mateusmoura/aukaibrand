
	<td class="col-{% if loop.index % 2 == 1 %}1{% else %}2{% endif %} product-listed-on-collection">
		<a href="{{ product.url }}"	title="{{ product.name | escape }} &mdash; {{ product.description | plain | truncate(50) | escape }}">
			<div class="product-image">
				<img src="{{ product.featured_image | product_image_url("thumb") }}" alt="{{ product.featured_image.alt }}" />
			</div>
			<div class="product-info">
				<p class="title">
					{{ product.name | truncate(30) }}
				</p>	
				<p class="price">
					{% if product.display_price %}
						{{ product.price | money }}
					{% else %}
						{{ "Consultar precio" | translate }}
					{% endif %}
				</p>
			</div>
		</a>
	</td>
