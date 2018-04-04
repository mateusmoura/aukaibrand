{% if sections.secondary.products %}
	<div id="related">
		
		<h6>
			{{ settings.related_product_message }}
		</h6>
		
		<div id="slider" class="clear">
			{% if sections.secondary.products | length > 5 %}
			<div id="prev">
				<p><a href="{{ store.products_url }}" class="inactive">{{ "Anterior" | translate }}</a></p>
			</div>
			{% endif %}
			<div id="window">
				<ul class="clear">
					{% for product in sections.secondary.products %}
						<li>
							<div class="image clear">
								<a href="{{ product.url }}">
									{{ product.featured_image | product_image_url("thumb") | img_tag(product.featured_image.alt) }}
								</a>
							</div>
							<h4>
								<a href="{{ product.url }}">{{ product.name }}</a>
							</h4>
							{% if product.display_price %}
								<p>{{ product.price | money }}</p>
							{% else %}
								<p>{{ "Consultar precio" | translate }}</p>
							{% endif %}
						</li>
					{% endfor %}
				</ul>
			</div>
			{% if sections.secondary.products | length > 5 %}
			<div id="next">
				<p><a href="{{ store.products_url }}">{{ "Siguiente" | translate }}</a></p>
			</div>
			{% endif %}
		</div>
		
	</div>
{% endif %}
