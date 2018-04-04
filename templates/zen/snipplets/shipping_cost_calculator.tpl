{% if shipping_calculator_show %}
<div id="shipping-calculator">
    <div id="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
    <span>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</span>
    <input type="text" name="zipcode" id="shipping-zipcode" value="{{ cart.shipping_zipcode }}">
    {% if shipping_calculator_variant %}
    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
    {% endif %}
    <button id="calculate-shipping-button" class="button"><span class="loading" style="display: none;"><i class="fa fa-circle-o-notch fa-spin"></i></span>{{ "Calcular costo de envío" | translate }}</button>
    <span id="invalid-zipcode" style="display: none;">{{ "El código postal es inválido." | translate }}</span>
</div>
<div id="shipping-calculator-response" style="display: none;"></div>
</div>
{% endif %}