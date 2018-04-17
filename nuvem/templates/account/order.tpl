<div class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ 'Orden {1}' | translate(order.number) }}</h1>
    </div>
    <div class="row visible-when-content-ready">
        <div class="col-md-4 col-sm-4 col-xs-12 m-bottom">
            {% if log_entry %}
                <h4 class="h5-xs">{{ 'Estado actual del envío' | translate }}:</h4>{{ log_entry }}
            {% endif %}
            <h4 class="h5-xs">{{ 'Detalles' | translate }}</h4>
            <div>
                <strong>{{'Fecha' | translate}}:</strong> {{ order.date | i18n_date('%d/%m/%Y') }}
            </div>
            <div>
                <strong>{{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}
            </div>
            <div>
                <strong>{{'Pago' | translate}}:</strong> {{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}
            </div>
            <div>
                <strong>{{'Medio de pago' | translate}}:</strong> {{ order.payment_name }}
            </div>
            {% if order.address %}
            <div class="m-top">
                <strong>{{'Envío' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}
                {{ 'Dirección de envío' | translate }}:
                <div class="address">
                    {{ order.address | format_address }}
                </div>
            </div>
            {% endif %}
        </div>
        <div class="col-md-8 col-sm-8 col-xs-12">
            <h4 class="h5-xs">{{ 'Productos' | translate }}</h4>
            <table class="table hidden-xs">
                <thead>
                <tr>
                    <th>{{ 'Producto' | translate }}</th>
                    <th>{{ 'Precio' | translate }}</th>
                    <th>{{ 'Cantidad' | translate }}</th>
                    <th>{{ 'Total' | translate }}</th>
                </tr>
                </thead>
                <tbody>
                {% for item in order.items %}
                    <tr>
                        <td data-label="{{ 'Producto' | translate }}">{{ item.featured_image | product_image_url("tiny") | img_tag(item.name) }} {{ item.name }}</td>
                        <td data-label="{{ 'Precio' | translate }}">{{ item.unit_price | money }}</td>
                        <td data-label="{{ 'Cantidad' | translate }}" class="c">{{ item.quantity }}</td>
                        <td data-label="{{ 'Total' | translate }}" class="r">{{ item.subtotal | money_long }}</td>
                    </tr>
                {% endfor %}
                {% if order.shipping or order.discount %}
                    <tr>
                        <td colspan="3">{{ 'Subtotal' | translate }}:</td>
                        <td>{{ order.subtotal | money_long }}</td>
                    </tr>
                {% endif %}
                {% if order.shipping %}
                    <tr>
                        <td colspan="3">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</td>
                        <td>{{ order.shipping | money_long }}</td>
                    </tr>
                {% endif %}
                {% if order.discount %}
                    <tr>
                        <td colspan="3">{{ 'Descuento ({1})' | translate(order.coupon) }}:</td>
                        <td class="success">- {{ order.discount | money_long }}</td>
                    </tr>
                {% endif %}
                <tr class="oneliner">
                    <td colspan="3"><strong>{{ 'Total' | translate }}:</strong></td>
                    <td><strong>{{ order.total | money_long }}</strong></td>
                </tr>
                </tbody>
            </table>
            <div class="visible-xs order-detail">
                {% for item in order.items %}
                    <div class="panel">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <strong>{{ item.name }}</strong>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <p>x{{ item.quantity }}</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body text-center">
                           {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'img-responsive m-auto'}) }} 
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-xs-6">
                                    <strong>{{ 'Precio' | translate }}</strong>
                                </div>
                                <div class="col-xs-6 text-right">
                                    {{ item.subtotal | money_long }}
                                </div>
                            </div>
                        </div>
                    </div>     
                {% endfor %}
                {% if order.shipping %}
                    <h5>
                        {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                        {{ order.shipping | money_long }}
                    </h5>
                {% endif %}
                {% if order.discount %}
                    <h5>
                       {{ 'Descuento ({1})' | translate(order.coupon) }}:
                        - {{ order.discount | money_long }}
                    </h5>
                {% endif %}
                {% if order.shipping or order.discount %}
                    <h5>
                        {{ 'Subtotal' | translate }}:
                        {{ order.subtotal | money_long }}
                    </h5>
                {% endif %}  
                <h3 class="text-primary">
                   <strong>{{ 'Total' | translate }}:</strong>
                    <strong>{{ order.total | money_long }}</strong>
                </h3>
                {% if order.pending %}
                    <a class="checkout-link btn btn-primary full-width-xs m-top" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                {% endif %}
            </div>  
            {% if order.pending %}
                <a class="btn btn-primary pull-right hidden-xs" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago >' | translate }}</a>
            {% endif %}
        </div>
    </div>
    </div>
