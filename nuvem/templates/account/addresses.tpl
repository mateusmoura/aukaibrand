<div class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Mis direcciones" | translate }}</h1>
    </div>
    <ul class="addresses list-unstyled row visible-when-content-ready">
        {% for address in customer.addresses %}
            <li class="col-xs-12 col-sm-3 col-md-3 col-lg-3 m-bottom">
                <div class="address">{{ address | format_address }}</div>
                <div>
                    {{ 'Editar' | translate | a_tag(store.customer_address_url(address), {class: 'text-primary'}) }} -
                    {% if address.main %}
                        <strong>{{ 'Principal' | translate }}</strong>
                    {% else %}
                        {{ 'Principal' | translate | a_tag(store.customer_set_main_address_url(address), {class: 'text-primary'}) }}
                    {% endif %}
                </div>
            </li>
        {% endfor %}
    </ul>
    <div class="visible-when-content-ready">
        {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, {class: 'btn btn-primary pull-right full-width-xs'}) }}
    </div>
</div>
