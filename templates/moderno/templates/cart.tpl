{% if cart.items %}
	<div id="content" class="carrito">
		
		<h1 class="title">{{ "Carrito de Compras" | translate }}</h1>
		<div class="button iniciar" id="sup">
			<a href="{{ store.checkout_url }}">{{ "Iniciar compra" | translate }}</a>
		</div>
		{% if error.add %}
			<div class="error">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</div>
		{% endif %}
		{% for error in error.update %}
			<div class="error">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
		{% endfor %}
		<form action="" method="post">
			<input type="hidden" name="mwp_change_quantities" value="1" />
			<ul class="productos">
				{% for item in cart.items %}
				<li>
					<div class="thumb">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</div>
					<h3 class="title">{{ item.name }}</h3>
					<div class="cantidad">
						<label>{{ "Cantidad" | translate }}</label>
						<input type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" />
					</div>
					
					<a href="#" class="delete" onclick="LS.removeItem({{ item.id }})">{{ "Eliminar" | translate | lower }}</a>
					<!-- <input type="submit" class="delete tooltip" title="{{ 'Eliminar' | translate }}" name="remove[{{ item.id }}]" value="{{ 'Eliminar' | translate }}" />  -->
					<span class="price">{{ item.subtotal | money }}</span>
					<div class="clear"></div>
				</li>
				{% endfor %}
			</ul>
		
			<span class="total"><strong>{{ "Total" | translate }}:</strong> {{ cart.total | money }}</span>
			
            {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
            	{% if settings.continue_buying %}
            		<div class="button continue-shopping">
						<a href="{{ store.products_url }}">{{ "Seguir comprando" | translate }}</a>
					</div>
				{% endif %}
             {% set cart_total = (settings.cart_minimum_value * 100) %}
                {% if cart.total >= cart_total %}	
                	<div class="button iniciar">
						<input type="submit" name="go_to_checkout" value="{{ "Iniciar compra" | translate }}" />
						<!--<a href="{{ store.checkout_url }}">{{ "Iniciar compra" | translate }}</a>-->
					</div>						
				{% else %}
					<h3 class="lessthan pull-right">{{ "El monto mínimo de compra es de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                {% endif %}
			<input type="submit" name="update" class="iniciar" value="{{ 'Cambiar Cantidades' | translate }}" id="change-quantities"/>
		</form>

		<div class="clear"></div>
				
	</div><!--content-->
	
{% else %}
				
	<div id="content" class="listado">
		<h1 class="title">{{ (error ? "No hay suficiente stock para agregar este producto al carrito." : "El carrito de compras está vacío.") | translate }} <small>{{ "Tal vez te interesen estos productos." | translate }}</small></h1>
		{% snipplet "product_grid.tpl" with products = sections.slider.products %}
		<div class="clear"></div>
	</div><!--content-->
	
{% endif %}
