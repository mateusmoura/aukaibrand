<section class="section-orders">
    <div class="container">
        <div class="section-title">
            <h1>{{ "Mi cuenta" | translate }}</h1>
        </div>

        {% snipplet "breadcrumbs.tpl" %}
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12 col-md-4">
                <div class="card text-center card-dados">
                    <div class="card-header">
                        <h3>{{ 'Datos Personales' | translate }}</h3>
                    </div>
                    <div class="card-body">
                        <div class="profile-image">
                            <img class="portrait" src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80" />
                        </div>
                        <div class="personal-data">
                            <ul class="list-group">
                                <li class="list-group-item">{{customer.name}}</li>
                                <li class="list-group-item">{{customer.email}}</li>
                                {% if customer.cpf_cnpj %}
                                    <li class="list-group-item"><strong>{{ 'CPF / CNPJ' | translate }}:</strong> {{ customer.cpf_cnpj | format_cpf_cnpj }}</li>
                                {% endif %} 
                                {% if customer.phone %}
                                    <li class="list-group-item"><strong>{{ 'Teléfono' | translate }}:</strong> {{ customer.phone }}</li>
                                {% endif %}
                                
                                <li class="list-group-item">
                                    {{ 'Editar mis datos' | translate | a_tag(store.customer_info_url) }}
                                </li>
                                {% if customer.default_address %}
                                <li class="list-group-item">{{ customer.default_address | format_address_short }}</li>
                                <li class="list-group-item">
                                    {{ 'Editar mis direcciones' | translate | a_tag(store.customer_addresses_url) }}
                                </li>
                                {% endif %}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 hidden-desktop">
                <div class="card card-pedidos">
                    <div class="card-header">
                        {{ 'Mis Órdenes' | translate }}
                    </div>

                    {% for order in customer.orders %} {% set add_checkout_link = order.pending %}
                    <div class="card-body">
                        <div class="wrapper">
                            <div class="row no-gutter head">
                                <div class="data-left">
                                    <label>
                                        <strong>{{'Orden' | translate}}:  <a href="{{ store.customer_order_url(order) }}">#{{order.number}} </a></strong>
                                    </label>
                                </div>
                                <div class="data-right">
                                    <div><small class="text-right">{{ order.date | i18n_date('%d/%m/%Y') }}</small>
                                    </div>
                                </div>
                            </div>
                            <div class="row no-gutter">
                                <label><strong><i class="fa fa-info"></i> {{'Estado' | translate}}:</strong></label> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}.
                            </div>
                            <div class="row no-gutter">
                                <label><strong><i class="fa fa-truck"></i> {{'Envío' | translate}}:</strong></label> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}.
                            </div>
                            <div class="row no-gutter prata">
                                <label><strong>{{'Total' | translate}}</strong></label> {{ order.total | money }}
                            </div>
                            <div class="row no-gutter pagamento">
                                <label><strong>{{'Pago' | translate}}: </strong></labe> <small><span class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</span></small>
                            </div>
                            <div class="row no-gutter last">
                                <a class="checkout-link btn btn-info" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                            </div>
                        </div>
                    </div>
                    {% endfor %}
                </div>
            </div>

            <div class="col-12 col-md-8 hidden-mobile">
                <div class="order-box col-md-8 col-sm-8 col-xs-12">
                    <h3>{{ 'Mis Órdenes' | translate }}</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>{{'Orden' | translate}}</th>
                                <th>{{'Fecha' | translate}}</th>
                                <th>{{'Estado' | translate}}</th>
                                <th>{{'Pago' | translate}}</th>
                                <th>{{'Envío' | translate}}</th>
                                <th>{{'Total' | translate}}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for order in customer.orders %} {% set add_checkout_link = order.pending %}
                            <tr class="{% if order.status == 'open' %}warning{% elseif order.status == 'closed' %}success{% elseif order.status == 'cancelled' %}error{% endif %}">
                                <td data-label="{{'Orden' | translate}}"><a href="{{ store.customer_order_url(order) }}">#{{order.number}}</a>
                                </td>
                                <td data-label="{{'Fecha' | translate}}">{{ order.date | i18n_date('%d/%m/%Y') }}</td>
                                <td data-label="{{'Estado' | translate}}">{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</td>
                                <td data-label="{{'Pago' | translate}}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</td>
                                <td data-label="{{'Envío' | translate}}">{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</td>
                                <td data-label="{{'Total' | translate}}" {% if not add_checkout_link %}colspan="2" {% endif %}>{{ order.total | money }}</td>
                                {% if add_checkout_link %}
                                <td><a class="checkout-link" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                                </td>
                                {% endif %}
                            </tr>
                            {% endfor %}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>