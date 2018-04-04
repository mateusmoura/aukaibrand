{% if shipping_calculator_show %}
<div id="shipping-calculator">
    <div id="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
    <p class="left">{{ "Digite aqui o seu CEP para calcular o frete" | translate }}:</p>
    <p class="left stt">
    	<input type="text" name="zipcode" id="shipping-zipcode" value="{{ cart.shipping_zipcode }}">
	    {% if shipping_calculator_variant %}
	    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
	    {% endif %}
	    <button id="calculate-shipping-button" class="button">{{ "Calcular Frete" | translate }}</button>
	    
		    <span class="loading" style="display: none;"></span>
		    <p id="invalid-zipcode" style="display: none;">{{ "O CEP está inválido." | translate }}</p>
	</p>
</div>
<div id="shipping-calculator-response" style="display: none;"></div>
</div>
{% endif %}