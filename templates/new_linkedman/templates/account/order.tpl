<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span8">
                <h1>{{ 'Orden {1}' | translate(order.number) }}</h1>
            </div>
            <div class="span4 breadcrumbs-wrapper hidden-tablet hidden-phone">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="row-fluid">
            <div class="details-box span4">
                {% if log_entry %}
                    <h3>{{ 'Estado actual del envío' | translate }}:</h3><span>{{ log_entry }}</span>
                {% endif %}
                <h3>{{ 'Detalles' | translate }}</h3>
                <div><strong>{{'Fecha' | translate}}:</strong> {{ order.date | i18n_date('%d/%m/%Y') }}</div>

                <div><strong>{{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</div>

                <div class="st"><strong>{{'Pago' | translate}}:</strong> {{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</div>
                <div><strong>{{'Medio de pago' | translate}}:</strong> {{ order.payment_name }}</div>

                {% if order.address %}
                    <div class="st"><strong>{{'Envío' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</div>

                    <div><strong>{{ 'Dirección de envío' | translate }}:</strong></div>
                    <div class="address">
                        {{ order.address | format_address }}
                    </div>
                {% endif %}
            </div>
            <div class="order-box span8" id="orderDetailsDesk">
                <h3>{{ 'Productos' | translate }}</h3>
                <table class="table">
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
                            <td data-label="{{ 'Producto' | translate }}">{{ item.featured_image | product_image_url("tiny") | img_tag(item.featured_image.alt) }} {{ item.name }}</td>
                            <td data-label="{{ 'Precio' | translate }}">{{ item.unit_price | money }}</td>
                            <td data-label="{{ 'Cantidad' | translate }}" class="c">{{ item.quantity }}</td>
                            <td data-label="{{ 'Total' | translate }}" class="r">{{ item.subtotal | money_long }}</td>
                        </tr>
                    {% endfor %}
                    {% if order.shipping or order.discount %}
                        <tr class="oneliner">
                            <td class="r" colspan="3">{{ 'Subtotal' | translate }}:</td>
                            <td class="r">{{ order.subtotal | money_long }}</td>
                        </tr>
                    {% endif %}
                    {% if order.shipping %}
                        <tr class="oneliner">
                            <td class="r" colspan="3">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</td>
                            <td class="r">{{ order.shipping | money_long }}</td>
                        </tr>
                    {% endif %}
                    {% if order.discount %}
                        <tr class="oneliner">
                            <td class="r" colspan="3">{{ 'Descuento ({1})' | translate(order.coupon) }}:</td>
                            <td class="r success">- {{ order.discount | money_long }}</td>
                        </tr>
                    {% endif %}
                    <tr class="oneliner">
                        <td class="r" colspan="3"><strong>{{ 'Total' | translate }}:</strong></td>
                        <td class="r"><strong>{{ order.total | money_long }}</strong></td>
                    </tr>
                    </tbody>
                </table>
                <div class="sst ssb oh">
                    {% if order.pending %}
                        <a href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago >' | translate }}</a>
                    {% endif %}
                </div>
            </div>
            <div class="hidden-desktop order-detail">
                 {% for item in order.items %}
                    <div id="orderDetailsMobile" class="order-box col-md-8 col-sm-8 col-xs-12 dos">
                        <div class="wrapper">
                            <div class="row no-gutter head">
                                <div class="data-left order-product">
                                    <strong>{{ item.name }}</strong>
                                </div>
                                <div class="data-right product-quantity">
                                    <p class="text-right">x{{ item.quantity }}</p>
                                </div>
                            </div>
                            <div class="no-gutter order-image">
                               {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt) }} 
                            </div>
                            <div class="row no-gutter prata">
                                <strong>{{ 'Precio' | translate }}</strong> {{ item.subtotal | money_long }}
                            </div>
                        </div>     
                    </div>
                {% endfor %}
                {% if order.shipping %}
                    <div class="oneliner col-xs-12 col-sm-12 text-center">
                        {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                        {{ order.shipping | money_long }}
                    </div>
                {% endif %}
                {% if order.discount %}
                    <div class="oneliner col-xs-12 col-sm-12 text-center">
                       {{ 'Descuento ({1})' | translate(order.coupon) }}:
                        - {{ order.discount | money_long }}
                    </div>
                {% endif %}
                {% if order.shipping or order.discount %}
                    <div class="oneliner col-xs-12 col-sm-12 text-center">
                        {{ 'Subtotal' | translate }}:
                        {{ order.subtotal | money_long }}
                    </div>
                {% endif %}  
                <div class="oneliner col-xs-12 col-sm-12 text-center order-total">
                   <strong>{{ 'Total' | translate }}:</strong>
                    <strong>{{ order.total | money_long }}</strong>
                </div>
                <a class="checkout-link button" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
              </div>  
        </div>
    </div>
</div>
