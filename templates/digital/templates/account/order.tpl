{% snipplet "sidebar.tpl" %}
<div id="content" class="single order-details">
    <h1 class="title">{{ 'Pedido {1}' | translate(order.number) }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="row-bs">
        <div class="details-box col-md-3">
            {% if log_entry %}
                <h3>{{ 'Estado atual do frete' | translate }}:</h3><span>{{ log_entry }}</span>
            {% endif %}
            <h3>{{ 'Detalhes do Pedido' | translate }}</h3>
            <div><strong>{{'Data' | translate}}:</strong> {{ order.date | i18n_date('%d/%m/%Y') }}</div>

            <div><strong>{{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Aberto' : (order.status == 'closed'? 'Finalizado' : 'Cancelado')) | translate }}</div>

            <div class="st"><strong>{{'Pagamento' | translate}}:</strong> {{ (order.payment_status == 'pending'? 'Pendente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Confirmado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Estornado' : 'Abandonado'))))) | translate }}</div>
            <div><strong>{{'Forma de pagamento' | translate}}:</strong> {{ order.payment_name }}</div>

            {% if order.address %}
                <div class="st"><strong>{{'Frete' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'Não Enviado') | translate }}</div>

                <div><strong>{{ 'Endereço de Envio' | translate }}:</strong></div>
                <div class="address">
                    {{ order.address | format_address }}
                </div>
            {% endif %}
        </div>
        <div class="order-box col-md-8">
            <h3>{{ 'Produtos' | translate }}</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>{{ 'Produto' | translate }}</th>
                    <th>{{ 'Preço' | translate }}</th>
                    <th>{{ 'Quantidade' | translate }}</th>
                    <th>{{ 'Total' | translate }}</th>
                </tr>
                </thead>
                <tbody>
                {% for item in order.items %}
                    <tr>
                        <td data-label="{{ 'Produto' | translate }}">{{ item.featured_image | product_image_url("tiny") | img_tag(item.featured_image.alt) }} {{ item.name }}</td>
                        <td data-label="{{ 'Preço' | translate }}">{{ item.unit_price | money }}</td>
                        <td data-label="{{ 'Quantidade' | translate }}" class="c">{{ item.quantity }}</td>
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
                        <td class="r" colspan="3">{{ 'Frete ({1})' | translate(order.shipping_name) }}:</td>
                        <td class="r">{{ order.shipping | money_long }}</td>
                    </tr>
                {% endif %}
                {% if order.discount %}
                    <tr class="oneliner">
                        <td class="r" colspan="3">{{ 'Desconto ({1})' | translate(order.coupon) }}:</td>
                        <td class="r success">- {{ order.discount | money_long }}</td>
                    </tr>
                {% endif %}
                <tr class="oneliner">
                    <td class="r" colspan="3"><strong>{{ 'Total' | translate }}:</strong></td>
                    <td class="r"><strong>{{ order.total | money_long }}</strong></td>
                </tr>
                </tbody>
            </table>
            <div class="sst oh">
                {% if order.pending %}
                    <a href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar o pagamento >' | translate }}</a>
                {% endif %}
            </div>
        </div>
    </div>
</div>
