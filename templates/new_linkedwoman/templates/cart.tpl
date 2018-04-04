<div id="shoppingCartPage" class="page-cart" data-minimum="{{ settings.cart_minimum_value }}">
	<div class="headerBox-Page">
		<h1>{{ "Carrito de Compras" | translate }}</h1>
	</div>
	{% if cart.items %}
        {% if error.add %}
            <div class="centered alert alert-warning alert-dismissible fade in">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
        {% endif %}
        {% for error in error.update %}
            <div class="centered alert alert-warning alert-dismissible fade in">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
        {% endfor %}
		
		<form action="" method="post">

			<div class="cart-contents">
				
                <ul class="firstrow">
					<li class="col-product span6">{{ "Producto" | translate }}</li>
					<li class="col-quantity span2">{{ "Cantidad" | translate }}</li>
					<li class="col-price span2">{{ "Precio" | translate }}</li>
					<li class="col-subtotal span2 last">{{ "Subtotal" | translate }}</li>
				</ul>

				{% for item in cart.items %}
				<ul class="productrow row" data-item-id="{{ item.id }}" >
                    <a class="name cart-name-mobile" href="{{ item.url }}">{{ item.name }}</a>
                    <li class="col-product span6">
                    	<div class="span1">
                            <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                    	</div>
                    	<div class="span4">
                            <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                    	</div>
                    </li>
                    <li class="col-quantity span2">
                    	<div class="row-fluid">
                            <button type="button" 
                                class="item-minus minus-mobile" 
                                onclick="LS.minusQuantity({{ item.id }})">
                                <i class="fa fa-minus"></i></button>
                        	<div class="span6 quantity-input">
                                <input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" />
                            </div>
                            <div class="span6 text-center">
                                <button 
                                    type="button"
                                    class="item-plus" 
                                    onclick="LS.plusQuantity({{ item.id }})">
                                    <i class="fa fa-plus"></i></button>
                                <button 
                                    type="button" 
                                    class="item-minus minus-desktop" 
                                    onclick="LS.minusQuantity({{ item.id }})">
                                    <i class="fa fa-minus"></i></button>
                            </div>
                    	</div>
                    </li>
                    <li class="col-price span2">
                        <span>{{ item.unit_price | money }}</span>
                    </li>
                    <li class="col-subtotal span2 hidden-phone">
                        <span data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
                    </li>
                    <li class="col-delete last span1">
                        <button type="button" class="item-delete" onclick="LS.removeItem({{ item.id }})">&times;</button>
                    </li>
				</ul>
                {% endfor %}
				
                <div class="totals-container">
                	<div class='subtotal-price span7' data-priceraw="{{ cart.total }}">
	                    <p>{{ "Subtotal" | translate }}: {{ cart.total | money }}</p>
	                </div>

					<div class='total-price' data-priceraw="{{ cart.total }}">
						<p>{{ "Total" | translate }}: {{ cart.total | money }}</p>
					</div>
                </div>
				
                {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
		
			</div>

			<div id="error-ajax-stock" class="container hidden">
                <div class='alert alert-warning alert-dismissible fade in' role='alert'>
                <button type='button' class='close' onclick="jQuery(this).parent().parent().hide();">
                    <span aria-hidden='true'>×</span></button>
                <strong>Error</strong> {{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
                </div>
            </div>
            {% if cart.items and settings.continue_buying %}
                {% set last_item_added = (cart.items | first) %}
                    <a href="{{ last_item_added.product.category.url }}" class="button continue-buying">{{ 'Seguir comprando' | translate }}</a>    
            {% endif %}
            <div class="go-to-checkout">
            {% set cart_total = (settings.cart_minimum_value * 100) %}
            {% if cart.total >= cart_total %}
               <input id="go-to-checkout" class="button" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
            {% else %}
                <h3 class="lessthan pull-right">{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h3>
            {% endif %}					
			</div>

		</form>
	{% else %}
		<div class="emptyCart centered alert st">
			{% if error %}
				{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
			{% else %}
				{{ "El carrito de compras está vacío." | translate }}
			{% endif %}
			{{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
		</div>
	{% endif %}
</div>
