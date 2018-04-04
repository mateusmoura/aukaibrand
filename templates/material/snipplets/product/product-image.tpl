<div class="product-image-container col-xs-12 col-sm-12 {% if settings.show_description_bottom %} col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 p-none-xs {% else %}col-md-7 col-lg-7{% endif %}">
    <div class="product-name-container {% if not settings.show_description_bottom %}visible-xs{% endif %}">
        {#  **** Product Name ****  #}
        <div class="product-name-container text-center">
            <div class="breadcrumbs-container text-center m-half-bottom product-breadcrumb hidden-xs">
                {% snipplet "navigation/breadcrumbs.tpl" %}
            </div>
            {#  **** Product Title ****  #}
            <h1 class="m-half-top clear-both" itemprop="name">{{ product.name }}</h1>
        </div>
        {#  **** Product Meta Info ****  #}
        <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}">
        <meta itemprop="url" content="{{ product.social_url }}">
        {% if page_description %}
            <meta itemprop="description" content="{{ page_description }}">
        {% endif %}
        {% if product.sku %}
            <meta itemprop="sku" content="{{ product.sku }}">
        {% endif %}
        {% if product.weight %}
            <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}">
                <meta itemprop="value" content="{{ product.weight}}">
            </div>
        {% endif %}
    </div>
    <div class="product-slider p-relative clearfix {% if product.images_count == 1 %}material-card m-bottom{% endif %}">
        {% if product.images_count > 1 %}
            <ul class="bxslider" id="productbxslider">
                {% for image in product.images %}
                  <li class="product-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}">{{ image | product_image_url('big') | img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</li>
                {% endfor %}
            </ul>  
            <div class="spinner spinner-xl contrast p-absolute">
                <div class="spinnerContainer active common full-height full-width p-absolute">
                    <div class="spinner-layer layer-1 common full-height full-width p-absolute">
                        <div class="circle-clipper left common">
                            <div class="circle common"></div>
                        </div><div class="gap-patch common full-height"><div class="circle common"></div></div><div class="circle-clipper right common full-height"><div class="circle common full-height"></div>
                        </div>
                    </div>
                </div>
            </div>
        {% else %}
            {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt, {class: 'img-responsive m-auto product-single-image'}) }}
        {% endif %}
        <div class="labels-container p-absolute">
            <h4 class="m-none-top offer-product text-uppercase" {% if not product.compare_at_price %}style="display:none;"{% endif %}><div class="label label-warning label-offer font-weight-normal border-radius-none">{{ "Oferta" | translate }}</div></h4>
            {% if product.free_shipping %}
                <h4 class="m-none-top text-uppercase"><div class="label label-info label-shipping font-weight-normal border-radius-none text-uppercase"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h4>
            {% endif %}
        </div>
        <div class="product-social-likes-desktop {% if settings.show_description_bottom %}product-social-likes-desktop-right{% else %} product-social-likes-desktop-left{% endif %} p-absolute text-center hidden-xs">
             <!-- Facebook button -->
            <a class="share-btn share-btn-facebook product-share-button btn-circle {% if not settings.show_description_bottom %}btn-circle-xs{% endif %} pull-right clear-both m-half-bottom no-link bg-facebook" data-network="facebook" target="_blank"
               href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
               title="Share on Facebook">
                <i class="fa fa-facebook"></i>
            </a>
             <!-- Twitter button -->
            <a class="share-btn share-btn-twitter product-share-button btn-circle {% if not settings.show_description_bottom %}btn-circle-xs{% endif %} pull-right clear-both m-half-bottom no-link bg-twitter" data-network="twitter" target="_blank"
               href="https://twitter.com/share?url={{ product.social_url }}"
               title="Share on Twitter">
                <i class="fa fa-twitter"></i>
            </a>
            <!--Google+ button -->
            <a class="share-btn share-btn-googleplus product-share-button btn-circle {% if not settings.show_description_bottom %}btn-circle-xs{% endif %} pull-right clear-both m-half-bottom no-link bg-google" data-network="gplus" target="_blank"
               href="https://plus.google.com/share?url={{ product.social_url }}"
               title="Share on Google+">
                <i class="fa fa-google-plus"></i>
            </a>
            <!-- Pinterest button that triggers real pin button hidden with CSS -->
            <a class="share-btn share-btn-branded product-share-button share-btn-pinterest btn-circle {% if not settings.show_description_bottom %}btn-circle-xs{% endif %} pull-right clear-both m-half-bottom no-link bg-pinterest c-pointer" target="_blank">
                 <i class="fa fa-pinterest"></i>
            </a>
             <div class="pinterest-hidden hidden" data-network="pinterest">
                {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
            </div>
        </div>
        {% if product.images_count > 1 %}
            <div class="product-detail-pager bx-pager text-center m-half-bottom-xs p-half-bottom-xs m-half-top">
                 {% for image in product.images %}
                    <a data-slide-index="{{loop.index0}}" class="d-inline-block hidden-xs pager-image" href="">{{ image | product_image_url('thumb') | img_tag(image.alt, {class: 'img-responsive m-auto'}) }}
                    </a>
                     <div class="slider-circles">
                        <span class="circle-pager"></span>
                    </div>
                 {% endfor %}
            </div>
        {% endif %}
    </div>
</div>

