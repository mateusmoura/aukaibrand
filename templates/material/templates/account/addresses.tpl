<div id="account-addresses" class="container">
    {% snipplet "page-header.tpl" with page_header_title =  "Mis direcciones" | translate %}
    <div class="addresses-container row m-top m-bottom">
        <ul class="list-style-none p-left">
            {% for address in customer.addresses %}
                <li class="m-bottom">
                    <div class="address">{{ address | format_address }}</div>
                    <div>
                        {{ 'Editar' | translate | a_tag(store.customer_address_url(address)) }} -
                        {% if address.main %}
                            <strong>{{ 'Principal' | translate }}</strong>
                        {% else %}
                            {{ 'Principal' | translate | a_tag(store.customer_set_main_address_url(address)) }}
                        {% endif %}
                    </div>
                </li>
            {% endfor %}
        </ul>
        <div class="container-fluid">
            <a class="btn btn-info col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }} </a>
        </div>
    </div>
</div>
