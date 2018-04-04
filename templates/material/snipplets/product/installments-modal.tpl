{% set gateways = installments_info | length %}
<div id="installments-modal" class="modal fade modal-mobile js-modal-mobile bottom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-mobile-dialog">
        <div class="modal-content modal-mobile-content">
            <div class="modal-body modal-mobile-body">
                <span class="btn btn-default btn-close pull-right" data-dismiss="modal" aria-label="Close">
                  <i class="material-icons">&#xE5CD;</i>
                </span>
                <div class="installments">
                    <ul class="nav nav-tabs">
                        {% for method, installments in installments_info %}
                            <li id="method_{{ method }}" {% if loop.first %}class="active"{% endif %}><a href="#installment_{{ method }}_{{ installment }}" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method | upper) }}</a></li>
                        {% endfor %}
                    </ul>
                    <div class="tab-content m-top">
                    {% for method, installments in installments_info %}
                                <div class="tab-pane{% if loop.first %} active{% endif %}" id="installment_{{ method }}_{{ installment }} installments-column">
                                    <div class="installments-column row m-none">
                                    {% for installment, data_installment in installments %}
                                        <span id="installment_{{ method }}_{{ installment }}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-bottom p-half-top">
                                            <strong class="installment-amount">{{ installment }}</strong> x <strong class="installment-price">{{ data_installment.installment_value_cents | money }}</strong>
                                            {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                        </span>
                                        {% if installment == 12 %}</div><div class="installment-column">{% endif %}
                                    {% endfor %}
                                    </div>
                                </div>
                    {% endfor %}
                    </div>
                </div>
            </div>
            <div class="modal-footer modal-mobile-footer">
                <span class="btn btn-default pull-right" data-dismiss="modal" aria-label="Close">{{ 'Cerrar' | translate }}<span>
            </div>
        </div>
    </div>
</div>