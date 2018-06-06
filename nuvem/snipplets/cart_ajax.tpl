<div id="ajax-cart" class="cart-summary">
    <a href="#" class="js-toggleCart">
      <!-- <span class="items">
        <span id="cart-amount">{{ "{1}" | translate(cart.items_count ) }}</span> 
        <small>x</small> 
        <span id="cart-total">{{ cart.total | money }}</span>
      </span> -->
      
      <i class="fas fa-shopping-cart"></i>
    </a>
</div>
<div id="ajax-cart-details" class="block-cart" style="display: none;">
  <div id="store-curr" class="hidden">{{ store.currency }}</div>
  <div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>
  <button type="button" class="btn btn-link button close-cart js-toggleCart">
    <i class="fa fa-times" aria-hidden="true"></i>
  </button>
  <h2>{{ "Carrinho de Compras" | translate }}</h2>

  {% if cart.items %}
    <div class="cart-wrapper">
      <ul class="cart-list">
        {% for item in cart.items %}
          <li class="cart-list__item">
            <figure>
              {{ item.featured_image | product_image_url("thumb") | img_tag(item.featured_image.alt) }}
            </figure>

            <div class="cart-list__item-info">
              <h5>{{ item.name }}</h5>
              <ul>
                <li>{{ "Quantidade" | translate }}: {{ item.quantity }}</li>
                <li>{{ "Preço" | translate }}: {{ item.unit_price | money }}</li>
              </ul>
            </div>
          </li>
        {% endfor %}
      </ul>

      <div class="cart-footer">
        <div class="row">
          <div class="col-12">
            <div class="cart-totaly">
              <p>{{ "Total" | translate }}: {{ cart.total | money }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  {% else %}
    <p class="block-cart__empty">{{ "O carrinho de compras está vazio." | translate }}</p>
  {% endif %}
  <div id="ajax-cart-shipping">
    {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
  </div>
  
  <div id="ajax-cart-totalwshipping" class="total-price"></div>
  
  <div class="row-fluid clearfix ajax-cart-bottom">
    <div class="span6 edit-cart">
      <a href="{{ store.cart_url }}" class="btn btn-link sst ssb">{{ 'Editar carrinho' | translate }}</a>
    </div>
    {% set cart_total = (settings.cart_minimum_value * 100) %}
    <div class="span6" {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">
      <form action="{{ store.cart_url }}" method="post">
        {# <input class="button pull-right" type="submit" name="go_to_checkout" value="{{ 'Finalizar Compra' | translate }}"/> #}
        <button type="submit" name="go_to_checkout" class="btn btn-dark btn-block">{{ 'Finalizar Compra' | translate }}</button>
      </form>
    </div>
    <div class="span12" {{ cart.total >= cart_total ? 'style="display:none"' }} id="ajax-cart-minumum-div">
        <div class="alert alert-warning" role="alert">
          <h4 class="text-center">{{ "El monto mínimo de compra (subtotal) es de" | translate }} {{ cart_total | money }}</h4>
        </div>
    </div>
    <input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>
  </div>
</div>
<div id="ajax-cart-backdrop" class="block-cart__overlay js-toggleCart" style="display: none;"></div>