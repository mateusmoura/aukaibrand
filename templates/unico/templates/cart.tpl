<h1>{{ "Carrito de Compras" | translate }}</h1>

{% if cart.items %}
	{% if error.add %}
		<div class="error">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
	{% endif %}
	{% for error in error.update %}
		<div class="error">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
	{% endfor %}
			
	<form action="" method="post">
	
		<table cellpadding="0" cellspacing="0">
			<tr>
				<th colspan="2" class="start">{{ "Descripción" | translate }}</th>
				<th>{{ "Precio" | translate }}</th>
				<th>{{ "Cantidad" | translate }}</th>
				<th>{{ "Eliminar" | translate }}</th>
				<th>{{ "Total" | translate }}</th>
			</tr>
			
			{% for item in cart.items %}
				<tr class="{% if loop.index % 2 == 0 %}odd{% else %}even{% endif %}">
					<td class="pic">
						<div>
							<a href="{{ item.url }}">
								{{ item.featured_image | product_image_url("tiny") | img_tag(item.featured_image.alt) }}
							</a>
						</div>
					</td>
					<td class="title">
						<h3><a href="{{ item.url }}">{{ item.name }}</a></h3>
					</td>
					<td>{{ item.unit_price | money }}</td>
					<td class="col-quantity"><input type="text" class="field" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" /></td>
					<td class="remove">
						<a href="#" onclick="LS.removeItem({{ item.id }});return false;">{{ "Eliminar" | translate }}</a>
					</td>
					<td><strong>{{ item.subtotal | money }}</strong></td>
				</tr>
			{% endfor %}
		</table>
		
		<div id="complete" class="clear">
			<div id="total">
				<h3>{{ "Total" | translate }}: <span>{{ cart.total | money }}</span></h3>
				{% if settings.shipping_calculator %}
					<div id="shipping-calculator">
						<span>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</span>
						<input type="text" name="zipcode" id="shipping-zipcode"/>
						<button id="calculate-shipping-button" class="button">{{ "Calcular costo de envío" | translate }}</button>
						<span class="hidden loading"></span>
						<span class="hidden" id="invalid-zipcode">{{ "El código postal es inválido." | translate }}</span>
					</div>
				{% endif %}
				<div id="checkout" class="clear">
					<input class="button bigger green-gradient" type="submit" name="go_to_checkout" value="{{ "Iniciar Compra" | translate }}" />
					<input class="button bigger gray-gradient" type="submit" name="update"
						id="change-quantities" value="{{ 'Actualizar Cantidades' | translate }}" style="display:none;"/>
				</div>
			</div>
		</div>
	
	</form>

{% else %}				
	<p id="empty">{{ (error.add ? "No hay suficiente stock para agregar este producto al carrito." : "El carrito de compras está vacío.") | translate }}
	<a href="{{ store.products_url }}">{{ "Seguir comprando..." | translate }}</a></p>
{% endif %}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$(".col-quantity input").keypress(function(){
			$('#change-quantities').show();
		});
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
