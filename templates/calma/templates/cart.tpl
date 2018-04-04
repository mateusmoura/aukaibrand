<h2 class="light">{{ "Carrito de Compras" | translate }}</h2>

{% if not cart.items %}
	<p class="box"><strong>{{ "El carrito de compras está vacío." | translate }}</strong></p>
{% else %}
{% if error.add %}
	<div class="error">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
{% endif %}
{% for error in error.update %}
	<div class="error">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
{% endfor %}
			
	<form action="" method="post" id="cartform">
		<table id="cart">
			<tr>
				<th>&nbsp;</th>
				<th class="alt">{{ "Producto" | translate }}</th>
				<th class="alt r">{{ "Cantidad" | translate }}</th>
				<th class="alt r">{{ "Precio" | translate }}</th>
				<th class="action-col">&nbsp;</th>
			</tr>
			
			{% for item in cart.items %}
				<tr class="row-{% if loop.index % 2 == 0 %}odd{% else %}even{% endif %} ">
					<td class="product-image-cell">
						<a href="{{ item.url }}" title="{{ item.title | escape }}">
							{{ item.featured_image | product_image_url("tiny") | img_tag(item.featured_image.alt) }}
						</a>
					</td>
					<td>
						<a href="{{ item.url }}" class="alt-link bold">{{ item.name }}</a>
						<br/>
						{{ item.unit_price | money }}
					</td>
					<td class="r">
						<input type="text" size="4" name="quantity[{{ item.id }}]" 
							id="updates_{{ item.variant.id }}" value="{{ item.quantity }}" onfocus="this.select();"/>
					</td>
					<td class="r">{{ item.subtotal | money }}</td>
					<td>
						<a href="#" onclick="LS.removeItem({{ item.id }});return false;">{{ 'eliminar' | translate }}</a>
					</td>
				</tr>
			{% endfor %}
			
			<tr id="subtotal">
				<td class="r" colspan="3">{{ 'Subtotal' | translate }}</td>
				<td class="r">{{ cart.total | money }}</td>
				<td>&nbsp;</td>
			</tr>
			
		</table>
		
		{% if settings.shipping_calculator %}
		<div id="shipping-calculator">
			<span>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</span>
			<input type="text" name="zipcode" id="shipping-zipcode"/>
			<button id="calculate-shipping-button" class="button">{{ "Calcular costo de envío" | translate }}</button>
			<span class="hidden loading"></span>
			<span class="hidden" id="invalid-zipcode">{{ "El código postal es inválido." | translate }}</span>
		</div>
		{% endif %}
		
		<div id="checkout">
		    <input type="submit" class="button" name="update" value="{{ 'Cambiar Cantidades' | translate }}" />
		    <input type="submit" class="button" name="go_to_checkout" value="{{ "Iniciar compra" | translate }}" />
		</div>
		
	</form>

{% endif %}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$("#calculate-shipping-button").click(function() {
			params = {'zipcode': $("#shipping-zipcode").val()};
			$("#shipping-calculator .loading").show();
			$("#invalid-zipcode").hide();
			$.post('{{store.shipping_calculator_url | escape('js')}}', params, function(data) {
				$("#shipping-calculator .loading").hide();
				if(data.success) {
					$("#shipping-calculator").html(data.html);
				} else {
					$("#invalid-zipcode").show();
				}
			}, 'json');
			return false;
		});
		$("#shipping-calculator .loading").hide();
	});
</script>
