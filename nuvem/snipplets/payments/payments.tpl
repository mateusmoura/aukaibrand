{% if installments_info %}
{% set gateways = installments_info | length %}
    <div id="installments-modal" class="modal fade js-mobile-installments-panel modal-xs modal-xs-right bottom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

        <a class="js-mobile-toggle-installments modal-xs-header visible-xs" href="#" data-dismiss="modal">
            <i class="fa fa-2x fa-angle-left modal-xs-header-icon"></i>
            <span class="modal-xs-header-text modal-xs-right-header-text">
                {% if store.installments_on_steroids_enabled %}
                    {{ 'Medios de pago' | translate }}
                {% else %}
                    {{ 'Detalles de las cuotas' | translate }}
                {% endif %}
            </span>
        </a>
        <div class="modal-dialog modal-lg modal-xs-dialog">
            <div class="js-installments-details-container modal-content">

                <div class="modal-body modal-xs-body">
                
                    {# Modal header and gateways tab links #}

                    <div class="nav-tabs-container horizontal-container overide-container-width">
                        <ul class="nav nav-tabs m-right-double m-none-xs">
                            {% for method, installments in installments_info %}
                                <li id="method_{{ method }}" class="js-refresh-installment-data js-installments-gw-tab tab m-bottom-none {% if loop.first %} active {% endif %}" data-code="{{ method }}">
                                    <a href="#installment_{{ method }}_{{ installment }}" class="tab-link" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method == 'boleto_paghiper'? 'BOLETO PAGHIPER' : method | upper) }}</a>
                                </li>

                                {# Custom payment method #}

                                {% if store.has_new_installmentsv2_ab %}

                                    {% if loop.last and custom_payment is not null and store.installments_on_steroids_enabled %}
                                      <li id="method_{{ custom_payment.code }}" class="js-refresh-installment-data js-installments-gw-tab tab m-bottom-none {% if loop.first %} active {% endif %}" data-code="{{ custom_payment.code }}">
                                          <a href="#installment_{{ custom_payment.code }}" class="tab-link" data-toggle="tab">{{ custom_payment.name | upper }}</a>
                                      </li>
                                    {% endif %}

                                {% endif %}
                            {% endfor %}
                        </ul>
                         <span class="btn btn-floating pull-right hidden-xs" data-dismiss="modal" aria-label="Close">
                          <i class="fa fa-times fa-lg pull-left m-none"></i>
                        </span>
                    </div>


                    {# Gateways tab content #}

                    <div class="tab-content m-top-half">
                        {% for method, installments in installments_info %}
                            {% set discount = product.get_gateway_discount(method) %}
                            <div class="tab-pane{% if loop.first %} active {% endif %} js-gw-tab-pane" id="installment_{{ method }}_">
                                <div class="full-width pull-left">

                                    {# Payment method details #}

                                    {% if store.installments_on_steroids_enabled %}

                                        {% if store.has_new_installmentsv2_ab %}

                                            {# Payments info with readonly #}

                                            {% if method == 'mercadopago' and store.country == 'AR' %}

                                                {# Payments Gateways with banks: at the moment only MP AR #}

                                                {% include 'snipplets/payments/payments-info-banks.tpl' %}
                                            {% else %}

                                                {# Payments Gateways with cards only #}

                                                {% include 'snipplets/payments/payments-info.tpl' %}
                                            {% endif %}

                                        {% else %}

                                            {# Payments info with selectable items #}

                                            {% include 'snipplets/payments/payments-form.tpl' %}

                                        {% endif %}

                                    {% else %}

                                        {# Old feature that lists the installments #}

                                        {% for installment, data_installment in installments %}
                                            <div class="m-bottom-quarter p-left-quarter" id="installment_{{ method }}_{{ installment }}">
                                                {% set rounded_installment_value = data_installment.installment_value | round(2) %}
                                                {% set total_value = (data_installment.without_interests ? data_installment.total_value : installment * data_installment.installment_value) %}
                                                {% set total_value_in_cents = total_value  | round(2) * 100 %}
                                                <strong class="js-installment-amount installment-amount">{{ installment }}</strong> {% if store.country == 'AR' %}cuota{% if installment > 1 %}s{% endif %} de{% else %}x{% endif %} <strong class="js-installment-price">{{ (rounded_installment_value * 100) | money }}</strong>
                                                {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                                {% if store.country == 'AR' and installment > 1 %}
                                                    - Precio Final: <strong class="js-installment-total-price">
                                                        {{ total_value_in_cents | money }}
                                                    </strong>
                                                {% endif %}
                                            </div>
                                        {% endfor %}
                                    {% endif %}
                                </div>
                            </div>

                            {# Custom payment method #}

                            {% if store.has_new_installmentsv2_ab %}
                                {% if loop.last and custom_payment is not null and store.installments_on_steroids_enabled %}
                                  <div class="tab-pane{% if loop.first %} active {% endif %} js-gw-tab-pane" id="installment_{{ custom_payment.code }}">
                                      <div class="box-container">

                                        {# Custom method instructions #}

                                        <p class="weight-strong m-bottom-half">{{ 'Cuando termines la compra vas a ver la información de pago en relación a esta opción.' | translate }}</p>

                                        {# Price total #}

                                        <h4 class="m-top-quarter">
                                            <span class="m-right-quarter">{{ 'Total:' | translate }}</span><span class="js-installments-one-payment weight-strong text-primary">{{ product.price | money }}</span>
                                        </h4>

                                        {% if custom_payment.discount > 0 %}
                                            <div class="m-top-half"> {{ custom_payment.name }}: {{ 'tiene un' | translate }} <strong>{{ custom_payment.discount }}% {{'de descuento' | translate }}</strong> {{'que será aplicado sobre el costo total de la compra al finalizar la misma.' | translate }}</div>
                                        {% endif %}
                                        
                                      </div>
                                  </div>
                                {% endif %}
                            {% endif %}
                        {% endfor %}
                    </div>

                </div>

                {# Modal footer and close button #}

                {% if store.installments_on_steroids_enabled %}

                    {% if store.has_new_installmentsv2_ab %}
                        <div class="modal-footer p-top-none-xs">
                            <a href="#" class="btn-link pull-right pull-left-xs p-none" data-dismiss="modal"><i class="fa fa-chevron-left visible-xs d-inline-block-xs m-right-quarter" aria-hidden="true"></i>{{ 'Volver al producto' | translate }}</a>
                        </div>
                    {% else %}
                        <div class="modal-footer hidden-xs">
                            <div class="pull-left full-width">
                                <a href="#" class="btn-link js-installments-accept-button pull-right" data-dismiss="modal">{{ 'Cerrar' | translate }}</a>
                            </div>
                        </div>
                    {% endif %}

                {% endif %}
            </div>
        </div>
    </div>
{% endif %}


