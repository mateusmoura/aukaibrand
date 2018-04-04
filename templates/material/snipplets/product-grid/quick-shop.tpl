<h3 class="btn-quickshop hidden-xs hidden-sm d-none p-absolute m-none-top m-none-bottom">
    <a class="label label-default d-block p-half-all font-weight-normal border-radius-none" data-toggle="modal"
   data-target="#quick{{ product.id }}" href="#">
    {{ settings.quick_shop_label }}
    </a>
</h3>
<div class="mobile-quickshop p-absolute visible-xs">
     <a class="btn btn-circle btn-circle-primary {% if not product.available %} hidden{% endif %}" data-toggle="modal" data-target="#quick{{ product.id }}" href="#">
        <i class="material-icons add-cart">&#xE417;</i>
    </a>
</div>
<div class="modal modal-mobile fade bottom product-container" id="quick{{ product.id }}" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-dialog modal-lg modal-mobile-dialog">
        <div class="modal-content modal-mobile-content">
            <div class="modal-body">
                <span class="btn btn-default btn-close pull-right" data-dismiss="modal" aria-label="Close"><i class="material-icons">&#xE5CD;</i></span>
                <div id="quick{{ product.id }}" class="quick-content">
                    <div class="productContainer row" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
                        {% snipplet "product-grid/quick-shop-image.tpl" %}
                        {% snipplet "product-grid/quick-shop-description.tpl" %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>