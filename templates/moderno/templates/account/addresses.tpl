<div id="content" class="single">
    {% snipplet "breadcrumbs.tpl" %}
    <h1 class="title ssb">{{ "Mis direcciones" | translate }}</h1>
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
        <div>
            {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url) }}
        </div>
    </div>
</div>
