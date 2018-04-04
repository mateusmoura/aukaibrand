<div class="quick-shop-image-container col-xs-12 col-sm-12 col-md-6 col-lg-6 m-top m-bottom">
    {% if product.featured_image %}
        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt, {class: 'img-responsive material-card'}) }}
    {% else %}
        {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt, {class: 'img-responsive material-card'}) }}
    {% endif %}
    <div class="labels-container p-absolute">
        <h3 class="m-none-top offer-product text-uppercase" {% if not product.compare_at_price %}style="display:none;"{% endif %}><div class="label label-warning label-offer font-weight-normal border-radius-none">{{ "Oferta" | translate }}</div></h3>
        {% if product.free_shipping %}
            <h3 class="m-none-top text-uppercase"><div class="label label-info label-shipping font-weight-normal border-radius-none text-uppercase"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h3>
        {% endif %}
    </div>
</div>
