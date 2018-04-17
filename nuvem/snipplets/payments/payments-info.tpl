{% set installments_data = installmentsv2['methods'][method] %}

{# Gateways without banks: cards only #}

{% if installments_data['cards'] %}

    {# Credit cards #}

    <div class="box-title">{{'Tarjetas de crédito' | translate }}</div>
    <div id="installment-credit-card-option-{{ method }}" class="box-container">

        {# Credit cards max installments only for AR stores #}

        {% if store.country == 'AR' %}

            {% if installments_data['max_without_interests'] != '0' %}
                <h4 class="h5-xs m-top-none m-bottom-quarter">
                    {{ installments_data['max_without_interests'] }}
                    {{ 'cuotas' | translate }}
                    {{ 'sin interés de' | t }}
                    <span class="js-installment-price-v2 text-primary weight-strong" data-installment="{{ installments_data['max_without_interests'] }}"> {{ (product.price / installments_data['max_without_interests']) | money }}</span>
                </h4>
                <div class="legal-info p-bottom-half">
                    <span class="m-right-quarter">
                        <span>{{ 'CFT: ' | translate }}</span><span class="weight-strong">0,00%</span>
                    </span>
                    <span class="m-right-quarter">
                        <span>{{ 'Total: ' | translate }}</span><span class="js-installments-one-payment weight-strong">{{ product.price | money }}</span>
                    </span>
                    <span class="m-right-quarter">
                        <span>{{ 'En 1 pago: ' | translate }}</span><span class="js-installments-one-payment weight-strong">{{ product.price | money }}</span>
                    </span>
                </div>
            {% elseif installments_data['max_with_interests'] > 0 %}
                <h4 class="h5-xs m-top-none m-bottom-quarter">
                    {{ 'Hasta' | translate }}
                    {{ installments_data['max_with_interests'] }}
                    {{ 'cuotas' | translate }}
                </h4>
                <div class="legal-info p-bottom-half">
                    <span class="m-right-quarter">
                        <span>{{ 'En 1 pago: ' | translate }}</span><span class="js-installments-one-payment weight-strong">{{ product.price | money }}</span>
                    </span>
                </div>
            {% else %}
                <h4 class="h5-xs m-top-none p-bottom-half">
                    <span>{{ 'En 1 pago: ' | translate }}</span><span class="js-installments-one-payment text-primary">{{ product.price | money }}</span>
                </h4>
            {% endif %}

        {% endif %}

        {# Credit cards flags #}

        {% for logo in installments_data['cards'] %}
            <span class="installments-card ">
                <img src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-medium">
            </span>
        {% endfor %}

        {% if store.country != 'AR' %}

            {# Installments list for non AR stores #}

            <div class="divider m-bottom-half"></div>

            <table class="table table-striped m-none">
                <thead>
                    <tr>
                        <th colspan="2">{{ 'Cuotas ' | translate }}</th>
                        <th class="text-right">{{ 'Total' | translate }}</th>
                    </tr>
                </thead>
                <tbody>
                    {% for installment, data_installment in installments %}
                        {% set rounded_installment_value = data_installment.installment_value | round(2) %}
                        {% set total_value = (data_installment.without_interests ? data_installment.total_value : installment * data_installment.installment_value) %}
                        {% set total_value_in_cents = total_value  | round(2) * 100 %}
                        <tr id="installment_{{ method }}_{{ installment }}">

                            {# Installment amount #}

                            <td class="p-right-none-xs">
                                <strong><span class="js-installment-amount">{{ installment }}</span></strong>
                                </span>{% if installment > 1 %}{{ 'cuotas' | translate }}{% else %}{{ 'cuota' | translate }}{% endif %}</span>
                            </td>

                            {# Installment price #}

                            <td class="p-right-none-xs">
                                <span>{{ 'de ' | translate }}</span>
                                <strong><span class="js-installment-price text-primary">{{ (rounded_installment_value * 100) | money }}</span> </strong>

                                {% if data_installment.without_interests or installments_data['max_with_interests'] == 0 %}
                                    {{ 'sin interés' | t }}
                                {% endif %}
                            </td>

                            {# Total price #}

                            <td class="js-installment-total-price text-right">
                                {{ total_value_in_cents | money }}
                            </td>
                        </tr>
                    {% endfor %}
                </tbody>
            </table>
        {% endif %}
    </div>
{% endif %}

{# Cash methods #}

{% if installments_data['direct'] %}

    {# Cash module title #}

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

    {# If has debit card or cash #}

    <div id="installment-cash-option-{{ method }}" class="box-container">

        {# Cash flags #}

        <div>
            {% for logo in installments_data['direct'] %}
                <span class="installments-card ">
                    <img src="{{ 'img/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-medium">
                </span>
            {% endfor %}

        </div>

        <div class="divider"></div>

        {# Cash total #}

        <h5 class="m-top-quarter">
            <span class="m-right-quarter">{{ 'Total:' | translate }}</span><span class="js-installments-one-payment weight-strong text-primary">{{ product.price | money }}</span>
        </h5>

        {# Boleto message #}

        {% if method in ['boleto_paghiper'] and discount > 0.0 %}
            <div class="m-top-half"> {{'Boleto Paghiper tiene un' | translate }} <strong>{{discount}}% {{'de descuento' | translate }}</strong> {{'que será aplicado sobre el costo total de la compra al finalizar la misma.' | translate }}</div>
        {% endif %}
    </div>
{% endif %}
