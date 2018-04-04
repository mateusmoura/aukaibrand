<div class="product-hero {% if not settings.show_description_bottom %}product-hero-short{% endif %}">
     {{ product.featured_image | product_image_url('large') | img_tag(product.featured_image.alt) }}
     <div class="overlay"></div>
     {% if not settings.show_description_bottom %}
        <div class="product-name-container side-description hidden-xs text-center p-absolute">
        {#  **** Product Name ****  #}
            <div class="product-name-container text-center">
                <div class="breadcrumbs-container text-center m-half-bottom product-breadcrumb hidden-xs">
                    {% snipplet "navigation/breadcrumbs.tpl" %}
                </div>
                {#  **** Product Title ****  #}
                <h2 class="m-half-top clear-both">{{ product.name }}</h1>
            </div>
        </div>
    {% endif %}
</div>
<div id="product-detail" class="container product-container">
    <div id="single-product" class="row {% if not settings.show_description_bottom %}less-margin{% endif %}" itemscope itemtype="http://schema.org/Product">
        {# productContainer class is important to change the images depending on the variant chosen #}
        <div id="single-product-container"  class="productContainer container" data-variants="{{product.variants_object | json_encode }}">
             {#  **** Product Image and thumbnails ****  #}
            {% include 'snipplets/product/product-image.tpl' %}
            {#  **** Product detail, variants, description and social widgets ****  #}
            <div class="product-description-column p-none-xs  {% if settings.show_description_bottom %}text-center container-fluid clear-both{% else %}text-left text-center-sm text-center-xs col-xs-12 col-sm-12 col-md-5 col-lg-5{% endif %}">
                <div class="product-description m-bottom {% if settings.show_description_bottom %}m-top{% endif %} m-half-top-xs">
                    {#  **** Product price ****  #}
                    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        <div class="product-price-container {% if not settings.show_description_bottom %}side-description{% endif %}">
                            <h3 class="price-compare d-inline-block text-line-through m-none-top">
                                 <span id="compare_price_display" class="opacity-50 p-half-right compare-price-display" {% if not product.compare_at_price %}style="display:none;"{% endif %}>{{ product.compare_at_price | money }}</span>
                            </h3>
                            <h2 class="price final-price d-inline-block m-none-top {% if product.compare_at_price %}border-left-dark p-half-left{% endif %}" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}style="display:none;"{% endif %}>{{ product.price | money }}</h2>
                            <meta itemprop="priceCurrency" content="{{ product.currency }}">
                            {% if product.stock_control %}
                                <meta itemprop="inventoryLevel" content="{{ product.stock }}">
                                <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}">
                            {% endif %}
                        </div>
                    </div>
                    {#  **** Product Installments button and info ****  #}
                    
                    
                    {% if product.show_installments and product.display_price %}
                        <div class="insallments-container d-inline-block">
                            {% set installments_info = product.installments_info %}
                            {% if installments_info %}
                                <a class="text-left p-quarter-all d-inline-block" href="#installments-modal" data-toggle="modal">{% include "snipplets/product/installments-in-product.tpl" with { is_link: true} %}</a>
                            {% else %} 
                                {% snipplet "product/installments-in-product.tpl" %}   
                            {% endif %}
                        </div>
                    {% endif %}
                    {#  **** Product submit form ****  #}
                    {% snipplet 'product/product-form.tpl' %}
                </div>
                {#  **** Product Description  ****  #}
                {% if product.description != '' %}
                <div class="product-user-description clear-both {% if not settings.show_description_bottom %}m-top col-xs-12 p-none{% endif %}">
                    <a href="#" id="see-description" class="btn btn-default btn-xs btn-block m-bottom visible-xs">
                        <span class="see-description-text">{{ "Ver descripción" | translate }}</span> 
                        <i class="material-icons see-description-icon pull-right">&#xE313;</i>
                        <span class="hide-description-text" style="display:none;">{{ "Esconder descripción" | translate }}</span> 
                        <i class="material-icons hide-description-icon pull-right" style="display:none;">&#xE316;</i>
                    </a>
                    <div class="user-content container-fluid clear-both m-bottom">
                        {{ product.description }}
                    </div>
                </div>
                {% endif %}
            </div>
             {% if settings.show_product_fb_comment_box %}
                 <div class="row">
                    <div class="facebook-comments-user-description-container container-fluid">
                        {#  **** Facebook Comments Box  ****  #}
                        <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                    </div>
                </div>
             {% endif %}
        </div>
    </div>
</div>
{#  **** Related Products ****  #}
{% include 'snipplets/product-grid/related-products.tpl' %}

{#  **** Installments Modal ****  #}
{% if installments_info %}
    {% include 'snipplets/product/installments-modal.tpl' %}
{% endif %}

{# **** Sharing mobile modal *** #}
{% include 'snipplets/product/mobile-sharing.tpl' %}
