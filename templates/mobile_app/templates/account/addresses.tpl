<div class="container">
    <div class="page-header-container container">
        <div class="col-md-8 col-sm-12 col-xs-12 page-header">
            <h1>{{ "Mis direcciones" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-phone hidden-tablet">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
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
    <div class="clear">
        {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, {class: 'btn'}) }}
    </div>
</div>
