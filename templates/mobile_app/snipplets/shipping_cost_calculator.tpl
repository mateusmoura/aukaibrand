{% if shipping_calculator_show %}
    <div id="shipping-calculator" class="col-md-9 col-sm-12 col-xs-12">
        <div id="shipping-calculator-form" class="row" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
            <span class="col-md-12 col-sm-12 col-xs-12 margin-bottom">{{ "Ingresá acá tu código postal para calcular el costo del envío" | translate }}:</span>
        <div class="calculator-container">
            <div class="col-md-7 col-sm-6 col-xs-6">
                <input type="text" name="cep" class="input input-big col-md-12 col-sm-12 col-xs-12" id="shipping-cep" value="{{ cart.shipping_zipcode }}">
            </div>
            {% if shipping_calculator_variant %}
                <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
            {% endif %}
            <div class="col-md-5 col-sm-6 col-xs-6 padding-left-none">
                <button id="calculate-shipping-button" class="btn btn-tertiary col-sm-12 col-xs-12">{{ "Calcular costo de envío" | translate }}</button>
            </div>
         </div>   
            <span class="loading" style="display: none;"><i class="fa fa-cog fa-spin"></i></span>
            <span id="invalid-cep" class='alert alert-error' style="display: none;">{{ "El código postal es inválido." | translate }}</span>
        </div>
        <div id="shipping-calculator-response" style="display: none;"></div>
    </div>
{% endif %}