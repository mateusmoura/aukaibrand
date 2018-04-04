<div class="page-account container page">
    <div class="headerBox-Page row">
        <div class="col-md-8 col-sm-8 col-xs-12">
            <h1>{{ "Mis direcciones" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
    <hr class="featurette-divider">
    <ul class="addresses list-unstyled row">
        {% for address in customer.addresses %}
            <li class="col-md-4 col-sm-4 col-xs-12">
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
    <div class="new-address">
        {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, {class: 'btn btn-primary btn-lg'}) }}
    </div>
</div>