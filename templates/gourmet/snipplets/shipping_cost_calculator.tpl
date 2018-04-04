{% if shipping_calculator_show %}
<div class="col-xs-12 col-sm-12{% if template == 'cart' %} col-md-6 col-lg-6{% else %} col-md-12 col-lg-12{% endif %}">
	<div id="shipping-calculator" class="left_disp">
	    <div id="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
	    <p>{{ "Ingresa aquí tu código postal para calcular tu costo de envío" | translate }}:</p>
	    <p>
		    <input type="text" name="zipcode" id="shipping-zipcode" class="form-control" value="{{ cart.shipping_zipcode }}">
		    {% if shipping_calculator_variant %}
		    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
		    {% endif %}
		    <button id="calculate-shipping-button" class="btn">{{ "Calcular costo de envío" | translate }}</button>
        	<span class="loading" style="display: none;"><i class="fa fa-refresh fa-spin"></i></span>
		    <p id="invalid-zipcode" style="display: none;">{{ "El código postal es inválido." | translate }}</p>
		</p>
	</div>
	<div id="shipping-calculator-response" style="display: none;"></div>
	</div>
</div>
{% endif %}