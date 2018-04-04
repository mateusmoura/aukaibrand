<div class="page-account container page">
    <div class="row">
        <div class="col-md-12">
            <div class="section-title bottom-0">
                <h1 class="title">{{ "Mi cuenta" | translate }}</h1>
                <hr class="line" />
            </div>
        </div>
    </div>
    <ul class="breadcrumb-custom">
        {% snipplet "breadcrumbs.tpl" %}
    </ul>
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
        {{ 'Agregar una nueva dirección' | translate | a_tag(store.customer_new_address_url, {class: 'big-button big-product-related-button'}) }}
    </div>
</div>