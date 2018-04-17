<div class="hamburger-panel-first-row">
    <span class="btn-hamburger-close p-absolute full-width">
        <span class="js-toggle-hamburger-panel btn-hamburger-close-icon pull-right p-all-half">
            <i class="fa fa-lg fa-times"></i>
        </span>
    </span>
    {% if languages | length > 1 %}
        <div class="languages full-width pull-left p-left-quarter p-top-half p-right-double border-box">
            {% for language in languages %}
                {% set class = language.active ? "" : "opacity-50" %}
                <a href="{{ language.url }}" class="{{ class }} pull-left p-all-half border-top-none-xs border-bottom-none-xs">{{ language.country | flag_url | img_tag(language.name) }}</a>
            {% endfor %}
        </div>
    {% endif %}
    <ul class="hamburger-panel-list">
        {% if not customer %}
            {% if store.customer_accounts != 'mandatory' %}
                <li class="hamburger-panel-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'hamburger-panel-link border-none') }}</li>
            {% endif %}
            <li class="hamburger-panel-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'hamburger-panel-link border-none') }}</li>
        {% else %}
            <li class="hamburger-panel-item">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'hamburger-panel-link border-none') }}</li>
            <li class="hamburger-panel-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'hamburger-panel-link border-none') }}</li>
        {% endif %}
    </ul>
</div>
<ul class="hamburger-panel-list">
    {% snipplet "navigation/navigation-hamburger-list.tpl" %}
</ul>
