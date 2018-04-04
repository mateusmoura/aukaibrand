 {% if cart.items_count > 0 %}
    <span class="paradeiser-dropdown mobile-cart-widget cart-summary {% if template == 'cart' %} active{% endif %}">
        <a href="#paradeiser-more" class="cart-button paradeiser-dropdown-anchor" >
            <div class="paradeiser-icon-canvas main-fg-color">
                <i class="fa fa-shopping-cart"></i>
            </div>
             <span class="items">
                <span class="item-number main-bg-color">{{ "{1}" | translate(cart.items_count ) }}</span> 
                <span>{{ cart.total | money_nocents }}</span>
            </span>
        </a>
        <ul class="paradeiser_children cart-summary {% if store.phone or store.email %} paradeiser_children-with-top{% endif %}">
              {% for item in cart.items %}
                <li class="productrow" data-item-id="{{ item.id }}" >
                    <div class="cart-widget-thumb">
                         <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                    </div>
                    <div class="cart-name-price">
                         <div class="cart-widget-name">
                                <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                        </div>
                        <div class="cart-widget-price">
                            <span>{{ item.unit_price | money }}</span>
                        </div>
                        <div class="item-quantity">
                            <p>x{{ item.quantity }}</p>
                        </div>
                    </div>
                </li>
            {% endfor %}
            <li>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <a class="cart-widget-button btn btn-primary col-md-12 col-sm-12 col-xs-12 margin-bottom margin-top" href="{{ store.cart_url }}">
                       {{ "Ir al carrito" | translate }}
                    </a>
                </div>
            </li>
            <li id="greybox" class="greybox"><a href="#!"></a></li>
        </ul>
    </span>
{% else %}
    <a href="{{ store.cart_url }}" class="cart-summary empty-cart {% if template == 'cart' %} active{% endif %}">
        <div class="paradeiser-icon-canvas main-fg-color">
            <i class="fa fa-shopping-cart main-fg-color"></i>
        </div>
        <span>{{ "Carrito" | translate }}</span>
         <span class="items">
            <span class="item-number main-bg-color">0</span> 
        </span>
    </a>
{% endif %}