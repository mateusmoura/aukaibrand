<div class="page-account container page">
    <div class="headerBox-Page row">
        <div class="col-md-12">
            <div class="section-title">
                <fieldset><legend><h1>{{ "Mis direcciones" | translate }}</h1></legend></fieldset>
            </div>
        </div>
        {% snipplet "breadcrumbs.tpl" %}
    </div>
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
        {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, {class: 'product-related-button'}) }}
    </div>
</div>