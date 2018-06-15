<section class="section-orders">
    <div class="container">
        <div class="section-title">
            <h1>{{ 'Orden {1}' | translate(order.number) }}</h1>
        </div>

        {% snipplet "breadcrumbs.tpl" %}
    </div>

    <div class="container">
        {% if log_entry %}
            <h3>{{ 'Estado actual del envío' | translate }}:</h3><span>{{ log_entry }}</span>
        {% endif %}
        <h3>{{ 'Detalles' | translate }}</h3>

        <div class="row">
            <div class="col-6 col-md-3">
                <label><strong>{{'Fecha' | translate}}</strong>:</label>
                <span>{{ order.date | i18n_date('%d/%m/%Y') }}</span>
            </div>

            <div class="col-6 col-md-3">
                <label><strong>{{'Estado' | translate}}</strong>:</label>
                <span>{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</span>
            </div>

            <div class="col-6 col-md-3">
                <label><strong>{{'Pago' | translate}}</strong>:</label>
                <span>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</span>
            </div>

            <div class="col-6 col-md-3">
                <label><strong>{{'Medio de pago' | translate}}</strong>:</label>
                <span>{{ order.payment_name }}</span>
            </div>
        </div>

        {% if order.address %}
            <div class="row">
                <div class="col-12 col-md-6">
                    <label><strong>{{ 'Dirección de envío' | translate }}</strong>:</label>

                    <div class="address">
                        {{ order.address | format_address }}
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <label><strong>{{'Envío' | translate}}</strong>:</label>
                    <span>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</span>
                </div>
            </div>
        {% endif %}

        <div class="row">
            <div class="col-12">
                <div class="order-box">
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
                            <a href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank" class="btn btn-black">{{ 'Realizar el pago >' | translate }}</a>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
