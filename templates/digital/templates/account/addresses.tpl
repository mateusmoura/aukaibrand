{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ "Meus Endereços" | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="addresses">
        <ul>
            {% for address in customer.addresses %}
                <li class="sst">
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
        <div class="sst">
            {{ 'Adicionar um novo endereço' | translate | a_tag(store.customer_new_address_url) }}
        </div>
    </div>
</div>
