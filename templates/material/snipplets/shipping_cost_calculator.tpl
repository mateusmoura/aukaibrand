{% if shipping_calculator_show %}
	<div class="shipping-calculator">
	    <div class="shipping-calculator-form form-group" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
		    <label>{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</label>
		    <div class="input-group">
			    <input type="text" name="zipcode" autocorrect="off" autocomplete="postal-code" class="shipping-zipcode form-control form-control-big col-lg-6 col-md-6 col-sm-12 col-xs-12" value="{{ cart.shipping_zipcode }}">
			    {% if shipping_calculator_variant %}
			    <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
			    {% endif %}
			     <span class="input-group-btn">
				    <button class="button btn btn-info calculate-shipping-button">{{ "Calcular costo de envío" | translate }}</button>
				</span>
			</div>
		    <div class="loading container-fluid m-top m-bottom text-center" style="display: none;">
	   		    <div class="spinner contrast">
			        <div class="spinnerContainer active common full-height full-width">
			            <div class="spinner-layer layer-1 common full-height full-width p-absolute">
			                <div class="circle-clipper left common">
			                    <div class="circle common"></div>
			                </div><div class="gap-patch common full-height"><div class="circle common"></div></div><div class="circle-clipper right common full-height"><div class="circle common full-height"></div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </div>
		    <span class="invalid-zipcode" class="alert alert-danger container-fluid text-center m-half-top" style="display: none;">{{ "El código postal es inválido." | translate }}</span>
		</div>
		<div class="shipping-calculator-response" style="display: none;"></div>
	</div>
{% endif %}