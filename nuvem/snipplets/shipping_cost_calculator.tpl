{% if shipping_calculator_show %}
<div class="js-shipping-calculator shipping-calculator full-width visible-when-content-ready">
    <div class="js-shipping-calculator-form shipping-calculator-form" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
    	<div class="row">
	   		<span class="col-xs-12"> {{ "Calculá el costo de tu envío" | translate }}:</span>
	   		<div class="col-xs-6 {% if calculator_big %} col-sm-4 {% else %} col-sm-2 {% endif %} p-right-none">
			    <input type="tel" placeholder="{{ 'Código postal' | translate }}" name="zipcode" autocorrect="off" autocomplete="postal-code" class="js-shipping-input form-control form-control-small input-prepend shipping-zipcode" value="{{ cart.shipping_zipcode }}">
			</div>
		    {% if shipping_calculator_variant %}
		    <input type="hidden" name="variant_id" id="shipping-variant-id" class="form-control" value="{{ shipping_calculator_variant.id }}">
		    {% endif %}
		    <div class="col-xs-6 {% if calculator_big %} col-sm-3 {% else %} col-sm-2 {% endif %} p-left-none">
			    <button class="js-calculate-shipping btn btn-secondary btn-append btn-small btn-block">{{ "Calcular" | translate }}</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 {% if calculator_big %} col-sm-12 {% else %} col-sm-5 {% endif %} m-top-half">
			    <div class="js-shipping-loading container-fluid m-top m-bottom text-center-xs" style="display:none;">
			    	<i class="fa fa-circle-o-notch fa-lg fa-spin"></i>
			    </div>
			    <div class="js-ship-calculator-error invalid-zipcode alert alert-danger" style="display: none;">{{ "El código postal es inválido. Por favor intentá de nuevo usando otro." | translate }}</div>
				<div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
				<div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="js-shipping-calculator-response shipping-calculator-response m-top-half col-xs-12 {% if not calculator_big %} col-sm-8 col-md-6 {% endif %}" style="display: none;"></div>
	</div>
</div>
{% endif %}
