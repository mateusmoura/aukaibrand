{# Payments info with selectable items #}

<h6 class="m-bottom">{{ 'Conocé las opciones de pago con' | translate}} {{ method == 'paypal_multiple' ? 'Paypal' : (method == 'itaushopline'? 'Itau shopline' : method == 'boleto_paghiper'? 'Boleto paghiper' : method | capitalize) }}</h6>
{% set first_installment_info = installments_interest_info[method]['cft'] %}
{% set found_credit_card = false %}
{% set found_direct_payment = false %}
{% for card,card_data in first_installment_info %}
    {% if card_data.type == "cc" %}
        {% set found_credit_card = true %}
    {% elseif card_data.type == "direct" %}
        {% set found_direct_payment = true %}
    {% endif %}
{% endfor %}

{# Credit card or debit tab links #}

<div class="horizontal-container">
    <ul class="js-installments-credit-cards-list nav-tabs-links nav nav-tabs m-top-quarter-xs">
        {% if found_credit_card %}
            {% if not found_direct_payment %}
                <div class="box-title">{{'Tarjeta de crédito' | translate }}</div>
            {% else %}
                <li class="active tab-check horizontal-container-item">
                    <a href="#installment-credit-card-option-{{ method }}" class="tab-check-link tab-check-link-text js-payment-option-tab" data-toggle="tab">
                        {{'Tarjeta de crédito' | translate }}
                        <span class="tab-check-icon fa-stack fa-min">
                          <i class="fa fa-circle fa-stack-2x"></i>
                          <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                        </span>
                    </a>
                </li>
            {% endif %}
        {% endif %}
        {% if found_direct_payment %}
            {% if not found_credit_card %}
                <div class="box-title">
                    {% if store.country == 'BR' %}
                        {% if wording_method_only_cash %}
                            {{'Efectivo' | translate }}
                        {% elseif wording_method_only_debit %}
                            {{'Débito online' | translate }}
                        {% else %}
                            {{'Efectivo / Débito online' | translate }}
                        {% endif %}
                    {% else %}
                        {{'Tarjeta de débito y efectivo' | translate }}
                    {% endif %}
                </div>
            {% else %}
                <li class="tab-check horizontal-container-item">
                    <a href="#installment-cash-option-{{ method }}" class="tab-check-link tab-check-link-text js-payment-option-tab" data-toggle="tab">
                        {% set wording_method_only_cash = method in ['mercadopago', 'boleto_paghiper'] %}
                        {% set wording_method_only_debit = method in ['cielo'] %}
                        {% if store.country == 'BR' %}
                            {% if wording_method_only_cash %}
                                {{'Efectivo' | translate }}
                            {% elseif wording_method_only_debit %}
                                {{'Débito online' | translate }}
                            {% else %}
                                {{'Efectivo / Débito online' | translate }}
                            {% endif %}
                        {% else %}
                            {{'Tarjeta de débito y efectivo' | translate }}
                        {% endif %}
                        <span class="tab-check-icon fa-stack fa-min">
                          <i class="fa fa-circle fa-stack-2x"></i>
                          <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                        </span>
                    </a>
                </li>
            {% endif %}
        {% endif %}
    </ul>
</div>

{# Credit card or debit tab content #}

<div class="tab-content box-container m-top-half">

    {# If has credit card #}

    {% if found_credit_card %}
        <div id="installment-credit-card-option-{{ method }}" class="tab-pane active">
            <div class="pull-left full-width border-box">
                <div>
                    <ul class="js-installments-credit-cards-list nav-tabs-links nav nav-tabs m-top-quarter-xs">

                        {# Credit cards flags #}

                        {% for card,card_data in first_installment_info %}
                            {% if card_data.type == 'cc' %}
                                <li id="js-installments-card-{{method}}-{{ card }}" class="js-refresh-installment-data installments-card js-installments-flag-tab js-installments-credit-tab tab-check {% if loop.first %} active {% endif %}" data-type="{{ card_data.type }}" data-code="{{ card }}">
                                        <a href="#credit_card_{{method}}_{{ card }}" class="tab-check-link" data-toggle="tab">
                                            {{ card_data.logo | payment_logo | img_tag('',{class: 'payments-card-img'}) }}
                                            <span class="tab-check-icon fa-stack fa-min">
                                              <i class="fa fa-circle fa-stack-2x"></i>
                                              <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                    </li>
                            {% endif %}
                        {% endfor %}
                    </ul>
                </div>
                <div class="tab-content">

                    {# Credit cards selects #}

                    {% for card,card_data in first_installment_info %}
                        <div class="js-credit-cart-tab-pane tab-pane {% if loop.first %} active {% endif %} pull-left full-width" id="credit_card_{{method}}_{{ card }}" >

                            {# Credit cards bank selects #}

                            {% if card_data.banks %}
                                <div class="pull-left full-width m-top-half" {% if card_data.banks['generic'] is not null %}style="display: none"{% endif %}>
                                    <label class="form-label">{{'Bancos con' | translate }} {{ card_data.name }}</label>
                                    <div class="installments-container">
                                        <select data-card="{{ card }}" class="js-refresh-installment-data js-installments-bank-select m-none" {% if card_data.banks['generic'] is not null %}style="display:none;"{% endif %}>
                                            {% if card_data.banks['generic'] is null %}
                                                <option selected disabled>{{ 'Elegir' | translate }}</option>
                                                {% for installment, installment_data in installments_info[method]|reverse(true) %}
                                                    {% if card_data.max_no_interest >= installment %}
                                                        <optgroup label="{% if installment > 1 %}{{ installment }} {{ 'cuotas sin interés'|translate }}{% else %}{{ 'Otros bancos'|translate }}{% endif %}">
                                                            {% for bank,bankdata in card_data['banks'] %}
                                                                {% if (installments_interest_info[method]['cft'][card]['max_no_interest'] == installment and installments_interest_info[method]['cft'][card]['banks'][bank][installment] == 0) or (installments_interest_info[method]['cft'][card]['max_no_interest'] > installment and installments_interest_info[method]['cft'][card]['banks'][bank][installment] == 0 and installments_interest_info[method]['cft'][card]['banks'][bank][previous_installment] > 0) %}
                                                                    <option {% for installment_number, installment_data in installments_info[method] %} data-cft-{{ installment_number }}="{{ installments_interest_info[method]['cft'][card]['banks'][bank][installment_number] }}" data-tea-{{ installment_number }}="{{ installments_interest_info[method]['tea'][card]['banks'][bank][installment_number] }}" {% endfor %}>{{ bank }}</option>
                                                                {% endif %}
                                                            {% endfor %}
                                                        </optgroup>
                                                    {% endif %}
                                                    {% set previous_installment = installment %}
                                                {% endfor %}
                                            {% else %}
                                                <option selected {% for installment_number, installment_data in installments_info[method] %} data-cft-{{ installment_number }}="{{ installments_interest_info[method]['cft'][card]['banks']['generic'][installment_number] }}" data-tea-{{ installment_number }}="{{ installments_interest_info[method]['tea'][card]['banks']['generic'][installment_number] }}" {% endfor %}>generic</option>
                                            {% endif %}
                                        </select>

                                        {# Bank not selected error #}

                                        <div class="text-danger js-bank-not-selected-error m-top-quarter" style="display:none";>{{ 'Elegí un banco para poder elegir las cuotas' | translate }}</div>
                                    </div>
                                </div>

                                {# No interest message blow credit card that has no bank #}

                                {% if card_data.banks['generic'] is not null and card_data.max_no_interest > 1 %}
                                    <div class="pull-left full-width m-top-half m-none-xs">
                                        <label class="weight-strong">
                                            {{ "¡{1} cuotas sin interés!" | translate(card_data.max_no_interest) }}
                                        </label>
                                    </div>
                                {% endif %}
                            {% endif %}
                        </div>
                    {% endfor %}
                </div>
            </div>
            <div class="divider"></div>

            {# Credit card total info #}

            <div class="pull-left full-width js-installments-final-info">
                <h5 class="js-installments-container m-bottom-half">
                    <span class="m-bottom-quarter">{{ 'Pagás' | translate }}</span>
                    {# Installments selects for each credit card #}
                    <div class="p-relative d-inline-block">
                        {% for card,card_data in first_installment_info %}
                            <select class="js-refresh-installment-data js-installment-select js-installment-multiple-select width-auto m-none js-installments-card-{{ card }} js-installments-card-{{method}}-{{ card }} {% if loop.first %} active {% endif %}" {% if not loop.first %}style="display:none;"{% endif %} {% if card_data.banks['generic'] is null %}disabled{% endif %}>

                                {# Installments select #}

                                {% for installment, data_installment in installments %}
                                    {% if card_data.banks|first[installment] is defined %}
                                    <option value="js-installment-number-{{loop.index0}}" class="{% if loop.first %} js-amount-selected {% endif %} {% if data_installment.without_interests %}js-installment-without-int{% endif %}" data-number="{{ installment }}">
                                        {{ installment }}
                                        {% if store.country != 'BR' %}
                                            {% if installment > 1 %}
                                                {{'cuotas' | translate }}
                                            {% else %}
                                                {{'cuota' | translate }}
                                            {% endif %}
                                        {% endif %}
                                    </option>
                                    {% endif %}
                                {% endfor %}
                            </select>

                            {# Installments error trigger when bank not selected #}

                            <div class="js-installment-select-container p-absolute full-width full-height payments-disabled-select js-installments-card-{{method}}-{{ card }} {% if card_data.banks['generic'] is not null %} hidden {% endif %}" {% if not loop.first %}style="display:none;"{% endif %}></div>
                        {% endfor %}
                    </div>

                    {# Installments prices #}

                    {% for installment, data_installment in installments %}
                        {% set rounded_installment_value = data_installment.installment_value | round(2) %}
                        {% set total_value = (data_installment.without_interests ? data_installment.total_value : installment * data_installment.installment_value) %}
                        {% set total_value_in_cents = total_value | round(2) * 100 %}
                         <span id="installment_{{ method }}_{{ installment }}" class="js-installment-number-{{loop.index0}} js-installment-price-container" data-method="{{ method }}" {% if not loop.first %}style="display:none";{% endif %}>
                            {% if store.country != 'BR' %}
                                {{ 'de' | translate }} 
                            {% else %}
                                x
                            {% endif %}
                            <span class="js-installment-price weight-strong" data-value="{{ data_installment.installment_value }}">{{ (rounded_installment_value * 100) | money }}</span>
                        </span>
                    {% endfor %}
                    <small class="js-installment-without-int-text"> {{ 'sin interés' | translate }}</small>
                </h5>

                {# Payment total cost and legal info #}

                <div class="js-installment-legal-info opacity-80 clear-both">
                    {% if store.country == 'AR' %}
                        <h3 class="payment-cft js-installment-cft-container weight-normal m-bottom-quarter m-top-quarter" style="display:none;">{{'CFT:' | translate}} <span class="js-installments-cft-value">0,00%</span></h3>
                        <p class="m-none">{{'Precio en 1 pago:' | translate}}<strong class="js-installments-one-payment" data-value="{{  product.price/100 }}"> {{ product.price | money }}
                            </strong>
                        </p>
                        <p class="js-installment-ptf-container m-none" style="display:none;">{{'PTF:' | translate}} <strong class="js-installments-ptf">{{ product.price | money }}</strong></p>
                        <p class="js-installment-tea-container" style="display:none;">{{'TEA:' | translate}} <strong class="js-installments-tea">0,00%</strong></p>
                    {% else %}
                        <p class="m-top-quarter">{{'Total:' | translate}}
                            <strong class="js-installments-ptf"> {{ product.price | money }}
                            </strong>
                        </p>
                    {% endif %}
                </div>
            </div>
        </div>
    {% endif %}

    {# If has debit card or cash #}

    {% if found_direct_payment %}
        <div id="installment-cash-option-{{ method }}" class="tab-pane {% if not found_credit_card %} active {% endif %}">
            <div class="pull-left full-width">
                <ul class="nav-tabs-links nav nav-tabs m-top-quarter-xs">

                    {# Cash flags #}

                    {% for card,card_data in first_installment_info if card_data.type != 'cc' %}
                        <li class="installments-card js-installments-flag-tab js-installments-cash-tab tab-check {% if loop.first %} active {% endif %}" data-type="dd" data-code="{{ card }}">
                            <a href="#credit_debit_{{ card }}" class="tab-check-link js-installments-flag-tab" data-toggle="tab">
                                {{ card_data.logo | payment_logo | img_tag('',{class: 'payments-card-img'}) }}
                                <span class="tab-check-icon fa-stack fa-min">
                                  <i class="fa fa-circle fa-stack-2x"></i>
                                  <i class="fa fa-check fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
            <div class="divider"></div>

            {# Debit card and cash total info #}

            <div class="m-bottom-half">
                 <h5><span>{{'Pagás' | translate }}:</span>
                    <span class="js-installments-one-payment">{{ product.price | money }}
                    </span>
                </h5>
                {% if method in ['boleto_paghiper'] and discount > 0.0 %}
                    <div class="m-top-half m-bottom p-bottom-half"> {{'Boleto Paghiper tiene un' | translate }} <strong>{{discount}}% {{'de descuento' | translate }}</strong> {{'que será aplicado sobre el costo total de la compra al finalizar la misma.' | translate }}</div>
                {% endif %}
            </div>
        </div>
    {% endif %}
</div>