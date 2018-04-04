<div id="ajax-cart" class="cart-summary">
    <a href="#" class="js-toggleCart">
      <span class="items">
        <span id="cart-amount">{{ "{1}" | translate(cart.items_count ) }}</span> 
        <small>x</small> 
        <span id="cart-total">{{ cart.total | money }}</span>
      </span>
      <span class="item-img"><i class="fa fa-shopping-cart"></i></span>
    </a>
</div>
<div id="ajax-cart-details" style="display: none;">
  <div id="store-curr" class="hidden">{{ store.currency }}</div>
  <div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>
  <button type="button" class="button close-cart js-toggleCart">
    <i class="fa fa-angle-left" aria-hidden="true"></i> {{ "Seguir comprando" | translate }}</button>
  <h2>{{ "Carrito de Compras" | translate }}</h2>
  <table id="cart-table" class="table table-striped">
    <thead>
      <tr>
        <th>{{ "Producto" | translate }}</th>
        <th>{{ "Cantidad" | translate }}</th>
        <th>{{ "Precio" | translate }}</th>
        <th>{{ "Subtotal" | translate }}</th>
      </tr>
    </thead>
    <tbody id="cart-table-body">
      {% if cart.items %}
        {% for item in cart.items %}
        <tr>
          <td>{{ item.name }}</td>
          <td>{{ item.quantity }}</td>
          <td>{{ item.unit_price | money }}</td>
          <td>{{ item.subtotal | money }}</td>
        </tr>
        {% endfor %}
      {% endif %}
    </tbody>
    <tfoot>
      <tr>
        <th></th>
        <th></th>
        <th>{{ "Total" | translate }}</th>
        <th id="cart-table-total">{{ cart.total | money }}</th>
      </tr>
    </tfoot>
  </table>
  <div id="ajax-cart-shipping">
    {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
  </div>
  <div id="ajax-cart-totalwshipping" class="total-price"></div>
  <div class="row-fluid clearfix ajax-cart-bottom">
    <div class="span6 edit-cart">
      <a href="{{ store.cart_url }}" class="btn btn-link sst ssb">{{ 'Editar carrito' | translate }}</a>
    </div>
    {% set cart_total = (settings.cart_minimum_value * 100) %}
    <div class="span6" {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">
      <form action="{{ store.cart_url }}" method="post">
        <input class="button pull-right" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
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
<div id="ajax-cart-backdrop" class="js-toggleCart" style="display: none;"></div>