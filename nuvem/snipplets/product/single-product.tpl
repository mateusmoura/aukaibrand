<div class="col-6 col-lg-3">
  <div class="section__image {% if product.images[0].id == 0 %}no-image{% endif %}">
    {% if not product.available %}
      <div class="circle out-of-stock">
        <p>{{ "Esgotado" | translate }}</p>
      </div>
    {% endif %}

    {% if product.free_shipping %}
      <div class="circle free-shipping {% if not product.compare_at_price %}shipping-top{% endif %}">
        <p>{{ "Frete grátis" | translate }}</p>
      </div>
    {% endif %}

    {% if product.compare_at_price %}
      <div class="circle offer {% if not product.available %}offer-right{% endif %}">
        <p>{{ "Oferta" | translate }}</p>
      </div>
    {% endif %}

    {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
      <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="section__link product-image{% if not product.available %}out-stock-img{% endif %}">
        {% if not product.available %}
          <div class="out-stock-img">
            {{ product.featured_image | product_image_url("original") | img_tag(product.featured_image.alt) }}
          </div>
        {% else %}
          {{ product.featured_image | product_image_url("original") | img_tag(product.featured_image.alt) }}
        {% endif %}
      </a>

    <!-- <a href="/" class="section__link">
      <img src="../images/produtos/categoria_1_front.jpg" class="product-image-front" alt="Nome do produto" />
      <img src="../images/produtos/categoria_1_using.jpg" class="product-image-using" alt="Nome do produto" />
    </a> -->

    <div class="product-info-wrapper" itemscope itemtype="http://schema.org/Product">
      <p itemprop="name" class="product-name">{{ product.name }}</p>

      {% if product.category.id != 0 %}
        <div class="product-info-category">
        	<a href="{{ product.category.url }}" title="{{ product.category.name }}">{{ product.category.name }}</a>
        </div>
      {% endif %}

      <div class="product-price-wrapper {% if not product.display_price%}hidden{% endif %}" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <span class="product-price-compare {% if not product.compare_at_price %}hidden{% endif %}">
          {# {{ "De" | translate }} #}
          <span class="product-compare-price-display"><strike>{{ product.compare_at_price | money }}</strike></span>
        </span>

        <meta itemprop="priceCurrency" content="{{ product.currency }}" />

        <span class="product-price" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>
          {# {{ "Por" | translate }} #}
          <span>{{ product.price | money }}</span>
        </span>
        
        {#

        {% if product.show_installments %}
          {% set max_installments_without_interests = product.get_max_installments(false) %}
          {% if max_installments_without_interests %}
              <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
          {% else %}
              {% set max_installments_with_interests = product.get_max_installments %}
              {% if max_installments_with_interests %}
                  <div class="max_installments">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
              {% endif %}
          {% endif %}
        {% endif %}

        #}
      </div>
    </div>

    <div class="product-actions">
      {% if settings.quick_shop %}
        <div class="product-details-overlay">
          <a class="btn btn btn-outline-secondary btn-quick-viewer" data-toggle="modal" data-target="#product{{ product.id }}" href="#quick{{ product.id }}">
            {{ settings.quick_shop_label }}
          </a>

          <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="btn btn btn-outline-secondary btn-viewer-options">
            {{ "Ver opções" | translate }}
          </a>
        </div>
      {% endif %}

      <div class="product-add-cart">
        <form id="product_form" method="post" action="{{ store.cart_url }}">
          <input type="hidden" name="add_to_cart" value="{{product.id}}" />
          {% if product.variations  %}
              {% include "snipplets/variants.tpl" with {'quickshop': true} %}
          {% endif %}
          {% set stepslength = product.variations | length  %}
            {% if product.available %}
            <div class="fancyContainerQuickshop-quantity hidden">
              <div class="attributeLineQuickshop">
                <label class="variation-label">
                <div class="number">{{ stepslength + 1 }}</div>
                <span>{{ "Elegir" | translate }} </span>

                <strong>{{ "Quantidade" | translate }}</strong></label>
                <input class="spinner" type="text" name="quantity{{ item.id }}" value="1" />
              </div>
            </div>
            {% endif %}

          <div class="addToCartButton">
            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
            <button type="submit" class="btn btn-secondary btn-addToCart js-addtocart {{ state }}" {% if state == 'nostock' %}disabled{% endif %}> {{ texts[state] | translate }}</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  {% if settings.quick_shop %}
    {% snipplet "quick-shop.tpl" with product = product %}
  {% endif %}
</div>
