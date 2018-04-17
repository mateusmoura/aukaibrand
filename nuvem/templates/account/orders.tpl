<div class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Mi cuenta" | translate }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        <div class="customer-box col-xs-12 m-bottom">
            <h4 class="h5-xs">{{ 'Datos Personales' | translate }}</h4>
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-4 m-bottom">
                            <img class="portrait" src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80" />
                        </div>
                        <div class="col-md-8">
                            <div>{{customer.name}}</div>
                            <div>{{customer.email}}</div>
                            {% if customer.cpf_cnpj %}
                            <div><strong>{{ 'CPF / CNPJ' | translate }}:</strong> {{ customer.cpf_cnpj | format_cpf_cnpj }}</div>
                            {% endif %} {% if customer.phone %}
                            <div><strong>{{ 'Teléfono' | translate }}:</strong> {{ customer.phone }}</div>
                            {% endif %}
                            <div>{{ 'Editar mis datos' | translate | a_tag(store.customer_info_url, '', 'text-primary m-bottom') }}</div>
                        </div>
                    </div>
                </div>
                {% if customer.default_address %}
                <div class="col-md-3">
                    <div>
                        {{ customer.default_address | format_address_short }}
                    </div>
                    <div class="text-primary">{{ 'Editar mis direcciones' | translate | a_tag(store.customer_addresses_url, '', 'text-primary m-bottom') }}</div>
                </div>
                {% endif %}
            </div>
        </div>
        <div class="col-xs-12">
            <h4 class="h5-xs">{{ 'Mis Órdenes' | translate }}</h4>
            <table class="table hidden-xs">
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
                    {% for order in customer.orders %}
                    {% set add_checkout_link = order.pending %}
                    <tr class="{% if order.status == 'open' %}warning{% elseif order.status == 'closed' %}success{% elseif order.status == 'cancelled' %}danger{% endif %}">
                        <td data-label="{{'Orden' | translate}}"><a class="order-number text-underline" href="{{ store.customer_order_url(order) }}">#{{order.number}}</a></td>
                        <td data-label="{{'Fecha' | translate}}">{{ order.date | i18n_date('%d/%m/%Y') }}</td>
                        <td data-label="{{'Estado' | translate}}">{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</td>
                        <td data-label="{{'Pago' | translate}}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</td>
                        <td data-label="{{'Envío' | translate}}">{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</td>
                        <td data-label="{{'Total' | translate}}" {% if not add_checkout_link %}colspan="2"{% endif %}>{{ order.total | money }}</td>
                        {% if add_checkout_link %}
                            <td><a class="checkout-link" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a></td>
                        {% endif %}
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
            {% for order in customer.orders %} 
            {% set add_checkout_link = order.pending %}
                <div class="visible-xs panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <strong>{{'Orden' | translate}}:  <a href="{{ store.customer_order_url(order) }}" class="text-primary text-underline">#{{order.number}} </a></strong>
                            </div>
                            <div class="col-xs-6 text-right">
                                <small>{{ order.date | i18n_date('%d/%m/%Y') }}</small>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body text-center">
                        <div class="m-bottom-half">
                            <i class="fa fa-info fa-lg m-right-quarter"></i>
                            <span class="d-inline-block">
                                <strong>{{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}.
                            </span>
                        </div>
                        <div class="m-bottom-half">
                            <i class="fa fa-truck fa-lg m-right-quarter"></i>
                            <span class="d-inline-block">
                                <strong>{{'Envío' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}.
                            </span>
                        </div>
                        <div class="text-center">
                            <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                        </div>
                        <div>
                            <small><strong>{{'Pago' | translate}}: </strong><span class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</span></small>
                        </div>
                    </div>    
                    <div class="panel-footer">
                        <a class="btn btn-secondary btn-block" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
