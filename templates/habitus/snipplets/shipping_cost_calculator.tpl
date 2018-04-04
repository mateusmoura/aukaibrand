{% if shipping_calculator_show %}
<div class="shipping-calculator">
    <div class="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
    <p>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</p>
    <p>
	    <input type="text" name="zipcode" class="form-control shipping-zipcode" value="{{ cart.shipping_zipcode }}">
	    {% if shipping_calculator_variant %}
	    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
	    {% endif %}
	    <button class="btn calculate-shipping-button">{{ "Calcular costo de envío" | translate }}</button>
        <span class="loading" style="display: none;"><i class="fa fa-refresh fa-spin"></i></span>
	    <p class="invalid-zipcode" style="display: none;">{{ "El código postal es inválido." | translate }}</p>
	</p>
</div>
<div class="shipping-calculator-response" style="display: none;"></div>
</div>
{% endif %}