<!-- START TITLE -->
<div id="title" class="clear">
	<h1>{{'Tu Carrito' | translate}}</h1>
</div>
<!-- END TITLE -->
{% if not cart.items %}
<p id="empty">{{ 'Tu carrito está vacío.' | translate }} <a href="{{store.products_url}}">{{'Seguir comprando...' | translate }}</a></p>
{% else %}
{% if error.add %}
	<div class="error">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
{% endif %}
{% for error in error.update %}
	<div class="error">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
{% endfor %}
	
<form action="" method="post" name="cartform">
	<!-- START TABLE -->
	<table cellpadding="0" cellspacing="0">
		<!-- START HEADERS -->
		<tr>
			<th colspan="2" class="start">{{'Descripción' | translate }}</th>
			<th>{{'Precio' | translate }}</th>
			<th>{{'Cantidad' | translate}}</th>
			<th>{{'Eliminar' | translate }}</th>
			<th>{{'Subtotal' | translate}}</th>
		</tr>
		<!-- END HEADERS -->{% for item in cart.items %}
		<!-- START PRODUCT {{ forloop.index }} -->
		<tr {% if loop.index % 2 == 0 %}class="even"{% else %}class="odd"{% endif %} >
			<td class="pic">
				<div><a href="{{ item.url }}">{{ item.featured_image | product_image_url("tiny") | img_tag(item.name) }}</a></div>
			</td>
			<td>
				<h3><a href="{{ item.url }}">{{ item.name }}</a></h3>
			</td>
			<td>{{ item.unit_price | money }}</td>
			<td><input type="text" class="field" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" /></td>
			<td class="remove"><a href="#" onclick="LS.removeItem({{ item.id }})">{{ "Eliminar" | translate }}</a></td>
			<td><strong>{{ item.subtotal | money }}</strong></td>
		</tr>
		<!-- END PRODUCT {{ forloop.index }} -->{% endfor %}
	</table>
	<!-- END TABLE -->
	<!-- START TOTAL -->
	<div id="total" class="clear">
		<!-- START CONTINUE -->
		<div id="continue">
			<p>{{'¿No estás listo para finalizar la compra?' | translate}} <a href="{{ store.products_url }}" class="button">{{ "Seguir comprando..." | translate }}</a></p>
		</div>
		<!-- END CONTINUE -->
		<!-- START PRICE -->
		<div id="price"> 
			<h3>{{ "Total" | translate }}: <span>{{ cart.total | money }}</span></h3>
		</div>
		<!-- END PRICE -->
	</div>
	<!-- END TOTAL -->
	{% if settings.shipping_calculator %}
	<div id="shipping-calculator">
		<span>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</span>
		<input type="text" name="zipcode" id="shipping-zipcode"/>
		<button id="calculate-shipping-button" class="button">{{ "Calcular costo de envío" | translate }}</button>
		<span class="hidden loading"></span>
		<span class="hidden" id="invalid-zipcode">{{ "El código postal es inválido." | translate }}</span>
	</div>
	{% endif %}
	<!-- START COMPLETE -->
	<div id="complete" class="clear">
		<!-- START CHECKOUT -->

<div id="checkout">
	<input class="update" type="submit" name="update" value="{{ 'Cambiar Cantidades' | translate }}" id="change-quantities"/> {{ 'o' | translate }}
	<input class="checkout" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
</div>
		<!-- END CHECKOUT -->
	</div>
	<!-- END COMPLETE -->
</form>{% endif %}

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

