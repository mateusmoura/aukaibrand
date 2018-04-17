{# Mobile product detail placeholder: to be hidden after content loaded #}
<div class="js-product-slider-placeholder mobile-placeholder product-placeholder-container {% if product.images_count == 1 %}hidden-when-content-ready{% endif %} p-relative m-bottom">
    <div class="product-placeholder-figures-container full-width border-box">
        <div class="product-placeholder-preloader">
            {% include "snipplets/svg/shopping-bag.tpl" %}
        </div>
    </div>
    <div class="shine p-absolute full-width full-height">
    </div>
    <div class="js-product-detail-loading-icon p-absolute product-loading-icon-container full-width {% if product.images_count == 1 %}hidden-when-content-ready{% endif %}">
        <div class="product-loading-icon svg-secondary-fill opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
</div>