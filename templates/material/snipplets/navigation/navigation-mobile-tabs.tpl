<div class="mobile-tabs">
    <a href="{{ store.url }}" class="{% if not store.is_catalog %}col-xs-4 col-sm-4 col-md-4 col-lg-4{% else %}col-xs-6 col-sm-6 col-md-6 col-lg-6{% endif %} tab text-center no-link{% if template == 'home' %} selected current-page{% endif %}">
        <i class="material-icons full-width p-none">&#xE88A;</i>
        <span class="text-uppercase">{{ 'Inicio' | translate }}</span>
    </a>
    <a href="" id="mobile-categories-btn" class="{% if not store.is_catalog %}col-xs-4 col-sm-4 col-md-4 col-lg-4{% else %}col-xs-6 col-sm-6 col-md-6 col-lg-6{% endif %} tab text-center no-link {% if template == 'category' or template == 'product' %} selected current-page{% endif %}">
        <i class="material-icons full-width p-none">&#xE871;</i>
        <span class="text-uppercase">{{ 'Productos' | translate }}</span>
    </a>
    {% if not store.is_catalog %}
        {% if settings.ajax_cart %}
            <a href="#" class="js-toggleCart js-toggleCart-ajax cart-summary p-relative col-xs-4 col-sm-4 col-md-4 col-lg-4 text-center no-link tab {% if template == 'cart' %} selected current-page{% endif %}">
                {% if template != 'cart' %}
                    <span id="mobile-cart-amount" class="cart-amount p-absolute">{{ "{1}" | translate(cart.items_count ) }}</span>
                {% endif %}
                <i class="material-icons full-width p-none">&#xE8CC;</i>
                <span class="text-uppercase">{{ 'Carrito' | translate }}</span>
            </a>
        {% else %}
            <div class="p-relative col-xs-4 col-sm-4 col-md-4 col-lg-4 cart-summary text-center no-link tab {% if template == 'cart' %} selected current-page{% endif %}">
            {% if cart.items_count > 0 %}
            <a href="{{ store.cart_url }}">
            {% endif %}
                <div class="cart-summary-widget d-inline-block">
                    <i class="material-icons full-width p-none">&#xE8CC;</i>
                    {% if template != 'cart' %}
                       <span id="mobile-cart-amount" class="cart-amount p-absolute">{{ "{1}" | translate(cart.items_count ) }}</span>
                    {% endif %}
                    <span class="text-uppercase">{{ 'Carrito' | translate }}</span>
                </div>
            {% if cart.items_count > 0 %}
            </a>
            {% endif %}
            </div>
        {% endif %}
    {% endif %}
</div>