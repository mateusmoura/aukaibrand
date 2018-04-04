<div class="dest-gral {% if product.images[0].id == 0 %}no-image{% endif %} col-md-3 col-sm-4 col-xs-6">
    <div class="product-item" itemscope itemtype="http://schema.org/Product">
        <a href="{{ product.url }}" title="{{ product.name }}" class="product-image{% if not product.available %}out-stock-img{% endif %}">
        {% if product.free_shipping %}
            <div class="label free-shipping main-bg-color">
                <p>{{ "Envío sin cargo" | translate }}</p>
            </div>
            {% endif %}
            {% if product.compare_at_price %}
                <div class="circle offer">
                    <p>{{ "Oferta" | translate }}</p>
                </div>
            {% endif %}
        	{% if not product.available %}
                <div class="out-stock-img">
                	{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
                </div>
    		{% else %}
            	{{ product.featured_image | product_image_url("medium") | img_tag(product.featured_image.alt) }}
            {% endif %}
        </a>
       {% if not product.available %}
            <a href="{{ product.url }}">
                <div class="circle out-of-stock">
                    <p>{{ "Sin stock" | translate }}</p>
                </div>
            </a>
        {% endif %}
        <div class="single-item-share social-share mobile col-md-5 col-sm-12 col-xs-12 text-center visible-xs">
            <!-- Facebook button -->
            <a class="share-btn share-btn-facebook" target="_blank"
               href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
               title="Share on Facebook">
                <i class="fa fa-facebook"></i>
            </a>
            <!-- Whatsapp button -->
            <a class="share-btn share-btn-whatsapp" href="whatsapp://send?text={{ product.social_url }}">
                {{ "images/whatsapp.png" | static_url | img_tag }} 
            </a>
        </div>
        <div class="product-label">
             <div class="product-name">
                <div class="title">
                    <a href="{{ product.url }}" title="{{ product.name }}" itemprop="name">{{ product.name }}</a>
                </div>
            </div>    
             <div class="price{% if not product.display_price%}hidden{% endif %}">
                <h4 class="price-compare {% if not product.compare_at_price%}hidden{% endif %}">
                    <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>{{ product.compare_at_price | money }}</span>
                </h4>
                <h2 class="price main-fg-color" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</h2>
            </div>
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
        </div>
    </div>
</div>

