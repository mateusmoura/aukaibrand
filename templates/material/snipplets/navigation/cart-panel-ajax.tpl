<div id="ajax-cart-details" class="z-index-above col-xs-12 col-sm-8 col-md-6 col-lg-6 p-top p-bottom {% if store.has_accounts or languages | length > 1 %} with-top-bar{% endif %}" style="display: none;">
  <button type="button" class="close-cart js-toggleCart js-toggleCart-ajax btn btn-default btn-xs pull-left p-quarter-top p-quarter-bottom p-left-none"><i class="material-icons pull-left">&#xE314;</i><span class="pull-left">{{ "Volver" | translate }}</span></button>
  <div id="store-curr" class="hidden">{{ store.currency }}</div>
  <div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>
  <div class="row">
    <h3 class="pull-left container-fluid clear-both">{{ "Resumen del carrito de compras" | translate }}</h3>
  </div>
  <table id="cart-table" class="table table-striped m-top m-bottom">
    <thead>
      <tr>
        <th>{{ "Producto" | translate }}</th>
        <th>{{ "Cantidad" | translate }}</th>
        <th>{{ "Precio" | translate }}</th>
        <th class="text-right">{{ "Subtotal" | translate }}</th>
      </tr>
    </thead>
    <tbody id="cart-table-body">
      {% if cart.items %}
        {% for item in cart.items %}
        <tr>
          <td><a href="{{ item.url }}">{{ item.name }}</a></td>
          <td>{{ item.quantity }}</td>
          <td>{{ item.unit_price | money }}</td>
          <td class="text-right">{{ item.subtotal | money }}</td>
        </tr>
        {% endfor %}
      {% endif %}
    </tbody>
    <tfoot>
      <tr class="ajax-total-row">
        <th><h3 class="m-none">{{ "Total" | translate }}</h3></th>
        <th></th>
        <th></th>
        <th class="text-right" id="cart-table-total"><h3 class="m-none">{{ cart.total | money }}</h3></th>
      </tr>
    </tfoot>
  </table>
  <div id="ajax-cart-shipping" class="m-top">
    <div class="row">
      <div class="container-fluid">
        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
      </div>
    </div>
  </div>
  <div id="ajax-cart-totalwshipping" class="total-price text-center"></div>
  <div class="row clear-both m-double-bottom ajax-cart-submit">
    <div class="{% if cart.total >= cart_total %}col-xs-6 col-sm-6{% else %}col-xs-12 col-sm-12{% endif %} col-tight-xs edit-cart m-top">
      <a href="{{ store.cart_url }}" class="btn btn-info btn-block">{{ 'Editar carrito' | translate }}</a>
    </div>
    <div class="{% if cart.total >= cart_total %}col-xs-6 col-sm-6{% else %}col-xs-12 col-sm-12{% endif %} col-md-6 col-lg-6 col-tight-xs m-top m-bottom">
      {% set cart_total = (settings.cart_minimum_value * 100) %}
      <div {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">
        <form action="{{ store.cart_url }}" method="post">
          <input class="button btn btn-primary btn-block" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
        </form>
      </div>
       <div {{ cart.total >= cart_total ? 'style="display:none"' }} id="ajax-cart-minumum-div">
         <h4 class="text-center m-none-top">{{ "El monto mínimo de compra (subtotal) es de" | translate }} <strong>{{ cart_total | money }}</strong></h4>
       </div>
      <input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>
    </div>
  </div>
</div>
<div id="ajax-cart-backdrop" class="js-toggleCart js-toggleCart-ajax full-width full-height {% if store.has_accounts or languages | length > 1 %} with-top-bar{% endif %}" style="display: none;"></div>