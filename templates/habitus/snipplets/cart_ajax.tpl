<div id="store-curr" class="hidden">{{ store.currency }}</div>
<div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>
<div id="ajax-cart" class="cart-summary">
    <i class="fa fa-shopping-cart"></i>
    <a href="#" class="js-toggleCart">
    	<span>{{ "Carrito" | translate }}</span>
    	(<span id="cart-amount">{{ "{1}" | translate(cart.items_count ) }}</span>)
    	<span id="cart-total" class='badge'>{{ cart.total | money }}</span></a>
</div>
<div id="ajax-cart-details" style="display: none;">
	<button type="button" class="btn btn-primary close-cart js-toggleCart">
		<i class="fa fa-angle-left" aria-hidden="true"></i> {{ "Seguir comprando" | translate }}</button>
	<h2>{{ "Carrito de Compras" | translate }}</h2>
	<table id="cart-table" class="table table-striped">
		<thead>
			<tr>
				<th>{{ "Producto" | translate }}</th>
				<th>{{ "Cantidad" | translate }}</th>
				<th>{{ "Precio" | translate }}</th>
				<th>{{ "Subtotal" | translate }}</th>
			</tr>
		</thead>
		<tbody id="cart-table-body">
			{% if cart.items %}
				{% for item in cart.items %}
				<tr>
					<td>{{ item.name }}</td>
					<td>{{ item.quantity }}</td>
					<td>{{ item.unit_price | money }}</td>
					<td>{{ item.subtotal | money }}</td>
				</tr>
				{% endfor %}
			{% endif %}
		</tbody>
		<tfoot>
			<tr>
				<th></th>
				<th></th>
				<th>{{ "Total" | translate }}</th>
				<th id="cart-table-total">{{ cart.total | money }}</th>
			</tr>
		</tfoot>
	</table>
	<div id="ajax-cart-shipping">
		{% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
	</div>
	<div id="ajax-cart-totalwshipping" class="total-price"></div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<a href="{{ store.cart_url }}" class="btn btn-default edit-cart">{{ 'Editar carrito' | translate }}</a>
		</div>
		 {% set cart_total = (settings.cart_minimum_value * 100) %}
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">
				<form action="{{ store.cart_url }}" method="post">
					<input class="btn btn-primary pull-right" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
				</form>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" {{ cart.total >= cart_total ? 'style="display:none"' }} id="ajax-cart-minumum-div">
				<div class="alert alert-warning" role="alert">
			  		<h4 class="text-center">{{ "Monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h4>
			  	</div>
			</div>
		<input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>
	</div>
</div>
<div id="ajax-cart-backdrop" class="js-toggleCart" style="display: none;"></div>
