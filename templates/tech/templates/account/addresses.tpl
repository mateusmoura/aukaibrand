<div class="row-fluid">
    <div class="container account-container">
        <div class="headerBox-List">
        <div class="path">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
            <div class="titles">
                <h1>{{ "Mis direcciones" | translate }}</h1>
            </div>        </div>
        <ul class="addresses">
            {% for address in customer.addresses %}
                <li>
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
        <div class="sst ssb clear address-btn">
            {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, {class: 'button secondary'}) }}
        </div>
    </div>
</div>
