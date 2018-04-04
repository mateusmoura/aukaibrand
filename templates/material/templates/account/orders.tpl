<div id="account-orders" class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Mi cuenta" | translate  %}
    <div class="orders-container row">
        <div class="customer-information-container container-fluid m-bottom">
            <h3 class="text-center">{{ 'Datos Personales' | translate }}</h3>
            <div class="contact-data p-all col-xs-12 col-sm-12 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 material-card">
                <div class="text-center m-bottom">
                    <img src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80">
                </div>
                <div class="text-center">
                    <div class="clear-both">
                        {{customer.name}}
                    </div>
                    <div class="clear-both">
                        {{customer.email}}
                    </div>
                    {% if customer.cpf_cnpj %}
                    <div class="clear-both">
                        {{ 'CPF / CNPJ' | translate }}: {{ customer.cpf_cnpj | format_cpf_cnpj }}
                    </div>
                    {% endif %}
                    {% if customer.phone %}
                    <div class="clear-both">
                        {{ 'Teléfono' | translate }}: {{ customer.phone }}
                    </div>
                    {% endif %}
                    <div class="clear-both">
                        {{ 'Editar mis datos' | translate | a_tag(store.customer_info_url, '', 'btn btn-default m-half-top col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2 clear-both m-bottom') }}
                    </div>
                    {% if customer.default_address %}
                        <div class="addresses clear-both m-top">
                            <div class="address">
                                {{ customer.default_address | format_address_short }}
                            </div>
                            {{ 'Editar mis direcciones' | translate | a_tag(store.customer_addresses_url, '', 'btn btn-default m-half-top col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2') }}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
        {% if order in customer.orders%}
            <div class="orders container-fluid">
                <h3 class="text-center">{{ 'Mis Órdenes' | translate }}</h3>
                <table class="table table-striped hidden-xs material-card">
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
                            <td data-label="{{'Orden' | translate}}"><a class="order-number" href="{{ store.customer_order_url(order) }}">#{{order.number}}</a></td>
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
                {% for order in customer.orders %} {% set add_checkout_link = order.pending %}
                <div class="order-panel visible-xs panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <strong>{{'Orden' | translate}}:  <a href="{{ store.customer_order_url(order) }}">#{{order.number}} </a></strong>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <small class="text-right">{{ order.date | i18n_date('%d/%m/%Y') }}</small>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                         <div class="clearboth text-center">
                            <strong><i class="fa fa-info"></i> {{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}.
                        </div>
                        <div class="clearboth text-center">
                            <strong><i class="fa fa-truck"></i> {{'Envío' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}.
                        </div>
                        <div class="clearboth text-center">
                            <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                        </div>
                        <div class="clearboth text-center">
                            <small><strong>{{'Pago' | translate}}: </strong><span class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</span></small>
                        </div>
                    </div>
                   
                    <div class="panel-footer">
                        <div class="row m-none">
                            <a class="btn btn-default btn-block" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                        </div>
                    </div>
                </div>
                {% endfor %}
            </div>
        {% endif %}   
    </div>
</div>