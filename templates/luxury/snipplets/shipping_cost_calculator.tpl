{% if shipping_calculator_show %}
    <div class="shipping-calculator">
        <div class="shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
            <div class="ssb">{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</div>
            <input type="text" name="zipcode" value="{{ cart.shipping_zipcode }}" class="shipping-zipcode">
            {% if shipping_calculator_variant %}
                <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
            {% endif %}
            <button class="button calculate-shipping-button">{{ "Calcular costo de envío" | translate }}</button>
            <span class="loading" style="display: none;"><i class="fa fa-circle-o-notch fa-spin"></i></span>
            <span class='alert alert-error invalid-zipcode' style="display: none;">{{ "El código postal es inválido." | translate }}</span>
        </div>
        <div class="shipping-calculator-response" style="display: none;"></div>
    </div>
{% endif %}