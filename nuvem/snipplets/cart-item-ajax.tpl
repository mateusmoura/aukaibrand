<div class="cart-table-row js-cart-item ajax-cart-item row" data-item-id="{{ item.id }}">

  {# Cart item image #}
  <div class="col-xs-2 ajax-cart-item-image-col p-right-none p-left-half-xs">
    <img src="{{ item.featured_image | product_image_url('medium') }}" class="img-responsive" />
  </div>
  <div class="col-xs-10 col-sm-5 col-md-5 col-lg-5 p-right-half-xs">

    {# Cart item name #}
    <a class="ajax-cart-item-link cart-item-name text-underline h5-xs" href="{{ item.url }}">
      {{ item.short_name }}
    </a>
    <small class="pull-left full-width">{{ item.short_variant_name }}</small>

    {# Cart item unit price #}
    <div class="ajax-cart-item-unit-price hidden-xs">
      {{ item.unit_price | money }}
    </div>

    {# Cart item quantity controls #}
    <div class="pull-left m-top-half">
      <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-left small" onclick="LS.minusQuantity({{ item.id }}, true)">
        <div class="cart-quantity-svg-icon">
          {% include "snipplets/svg/minus.tpl" %}
        </div>
      </button>
      <div class="cart-quantity-input-container d-inline-block">
        <input type="number" name="quantity[{{ item.id }}]" data-item-id="{{ item.id }}" value="{{ item.quantity }}" class="js-cart-quantity-input cart-quantity-input small"/>
      </div>
      <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-right small" onclick="LS.plusQuantity({{ item.id }}, true)">
        <div class="cart-quantity-svg-icon">
          {% include "snipplets/svg/plus.tpl" %}
        </div>
      </button>
    </div>

    {# Cart item mobile subtotal #}
    <div class="visible-xs cart-item-subtotal h5-xs weight-strong pull-right p-top-quarter">
      <span class="js-cart-item-subtotal" data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
    </div>
  </div>

  {# Cart item subtotal #}
  <div class="col-xs-4 ajax-cart-item-subtotal cart-item-subtotal h6-xs weight-strong text-right hidden-xs">
    <span class="js-cart-item-subtotal" data-item-variant="{{ item.product.selected_or_first_available_variant.id }}">{{ item.subtotal | money }}</span>
  </div>

  {# Cart item delete #}
  <div class="col-xs-1 cart-delete-container text-right">
    <button type="button" class="cart-btn-delete ajax-cart-btn-delete pull-right p-top-none" onclick="LS.removeItem({{ item.id }}, true)">
      <div class="cart-delete-svg-icon small svg-icon-text">
        {% include "snipplets/svg/trash-o.tpl" %}
      </div>
    </button>
  </div>
</div>