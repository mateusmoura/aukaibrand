<div class="page-content">
    <div class="headerBox-Page">
        <h1>{{ "Mis direcciones" | translate }}</h1>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="addresses">
        <ul>
            {% for address in customer.addresses %}
                <li class="ssb">
                    <div class="address">{{ address | format_address }}</div>
                    <div class="small">
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
        <a class="submit_button" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }} </a>
    </div>
</div>
