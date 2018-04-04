<div id="cart-summary" class="cart-summary">
    {% if cart.items_count > 0 %}
    	<a class="cart-widget-container main-fg-color" id="cart-widget-container" href="{{ store.cart_url }}"> 
             <span class="item-img"><i class="fa fa-shopping-cart"></i></span>
             <span class="items"><span class="item-number main-bg-color-darker">{{ "{1}" | translate(cart.items_count ) }}</span> <span class="hidden-xs"><small>=</small> {{ cart.total | money_nocents }}</span></span>
		</a>
         <ul class="cart-preview">
        {% for item in cart.items %}
            <li class="productrow" data-item-id="{{ item.id }}" >
                <div class="cart-widget-thumb">
                     <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}</a>
                </div>
                <div class="cart-name-price">
                     <div class="cart-widget-name">
                            <a class="name" href="{{ item.url }}">{{ item.name }}</a>
                    </div>
                    <div class="cart-widget-price main-fg-color">
                        <span>{{ item.unit_price | money }}</span>
                    </div>
                    <div class="item-quantity">
                        <p>x{{ item.quantity }}</p>
                    </div>
                </div>
            </li>
        {% endfor %}
         <li class="productrow" >
            <div class="col-md-12 col-sm-12 col-xs-12">
                <a class="cart-widget-button btn btn-primary col-md-12 col-sm-12 col-xs-12 margin-bottom margin-top" href="{{ store.cart_url }}">
                   {{ "Ir al carrito" | translate }}
                </a>
            </div>
        </li>
      </ul>
      <a class="cart-widget-container cart-widget-container-hidden" href="{{ store.cart_url }}"> 
             <span class="item-img"><i class="fa fa-shopping-cart main-fg-color"></i></span>
             <span class="items"><span class="item-number main-bg-color-darker">{{ "{1}" | translate(cart.items_count ) }}</span> <span class="hidden-xs"><small>=</small> {{ cart.total | money_nocents }}</span></span>
     </a>

    {% else %}
        <div class="empty-cart">
           <span class="item-img"><i class="fa fa-shopping-cart"></i></span>
           <span class="items"><span class="item-number main-bg-color-darker">0</span></span>
         </div> 
    {% endif %}
</div>
