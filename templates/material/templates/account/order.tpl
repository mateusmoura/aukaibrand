<div id="account-order-detail" class="container">
    {% snipplet "page-header.tpl" with page_header_title =  'Orden {1}' | translate(order.number)  %}
    <div class="single-order-container row">
        <div class="single-order-details container-fluid text-center-xs">
            {% if log_entry %}
                <h3>{{ 'Estado actual del envío' | translate }}:</h3>{{ log_entry }}
            {% endif %}
            <h3 class="text-center">{{ 'Detalles' | translate }}</h3>
            <div class="material-card text-center p-all">
                <div class="clearboth">
                    {{'Fecha' | translate}}: {{ order.date | i18n_date('%d/%m/%Y') }}
                </div>
                <div class="clearboth">
                    {{'Estado' | translate}}: {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}
                </div>
                <div class="clearboth">
                    {{'Pago' | translate}}: {{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}
                </div>
                <div class="clearboth">
                    {{'Medio de pago' | translate}}: {{ order.payment_name }}
                </div>
                {% if order.address %}
                <div class="clearboth m-top">
                    {{'Envío' | translate}}: {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}
                    {{ 'Dirección de envío' | translate }}:
                    <div class="address">
                        {{ order.address | format_address }}
                    </div>
                </div>
                {% endif %}
            </div>
        </div>
        <div class="single-order-table container-fluid">
            <h3>{{ 'Productos' | translate }}</h3>
            <table class="table table-striped material-card">
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
                        <td>- {{ order.discount | money_long }}</td>
                    </tr>
                {% endif %}
                <tr>
                    <td colspan="3"><strong>{{ 'Total' | translate }}:</strong></td>
                    <td><strong>{{ order.total | money_long }}</strong></td>
                </tr>
                </tbody>
            </table>
            {% if order.pending %}
                <a class="btn btn-primary col-xs-12 col-sm-12 col-md-3 col-lg-3 pull-right" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago >' | translate }}</a>
            {% endif %}
        </div>
    </div>
</div>
