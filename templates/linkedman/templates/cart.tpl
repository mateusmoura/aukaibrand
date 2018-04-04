<div id="shoppingCartPage">
	<div class="headerBox">
		<h2>{{ "Carrito de Compras" | translate }}</h2>
	</div>
	
	<div class="contentBox">
		{% if cart.items %}
			{% if error.add %}
				<div class="error centered">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
			{% endif %}
			{% for error in error.update %}
				<div class="error centered">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
			{% endfor %}
			
			<form action="" method="post">
	
				<div class="cart-contents">
					<ul class="firstrow">
						<li class="col-product">{{ "Producto" | translate }}</li>
						<li class="col-quantity">{{ "Cantidad" | translate }}</li>
						<li class="col-price">{{ "Precio" | translate }}</li>
						<li class="col-subtotal last">{{ "Subtotal" | translate }}</li>
					</ul>
	
					{% for item in cart.items %}
						<ul class="productrow">
							<li class="col-image">
								<a href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
							</li>
							<li class="col-name">
								<a href="{{ item.url }}">{{ item.name }}</a>
							</li>
							<li class="col-quantity">
								<input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" />
							</li>
							<li class="col-price">
								<span>{{ item.unit_price | money }}</span>
							</li>
							<li class="col-subtotal">
								<span>{{ item.subtotal | money }}</span>
							</li>
							<li class="col-delete last">
								<a href="#" onclick="LS.removeItem({{ item.id }})">{{ "eliminar" | translate }}</a>
							</li>
						</ul>
					{% endfor %}
			
					<div class='total-price'>
						{{ "Total" | translate }}: {{ cart.total | money }}
					</div>
					
					{% if settings.shipping_calculator %}
					<div id="shipping-calculator">
						<span>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</span>
						<input type="text" name="zipcode" id="shipping-zipcode"/>
						<button id="calculate-shipping-button" class="button">{{ "Calcular costo de envío" | translate }}</button>
						<span class="hidden loading"></span>
						<span class="hidden" id="invalid-zipcode">{{ "El código postal es inválido." | translate }}</span>
					</div>
					{% endif %}
			
				</div>
				
				<div class="go-to-checkout">
					<a href="{{ store.products_url }}" class="button">{{ "Seguir comprando" | translate }}</a>
					<input class="button hidden" type="submit" name="update" value="{{ 'Cambiar Cantidades' | translate }}" id="change-quantities"/>
					<input class="button" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
				</div>
			</form>
		{% else %}
			<div class="emptyCart">
				{% if error %}
					{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
				{% else %}
					{{ "El carrito de compras está vacío." | translate }}
				{% endif %}
				{{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
			</div>
		{% endif %}
	</div>
</div>


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
