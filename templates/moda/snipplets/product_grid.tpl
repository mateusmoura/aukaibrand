{% if products and pages.is_last %}
    <div class="last-page" style="display:none;"></div>
{% endif %}
{% for product in products %}

    {% if loop.index % 4 == 1 %}
    <div class="product-row">
    {% endif %}

        <a class="product" href="{{ product.url }}" title="{{ product.name }}" itemscope itemtype="http://schema.org/Product">
            <meta itemprop="name" content="{{ product.name }}" />
            <span class="head">
                {{ product.featured_image | product_image_url("small") | img_tag(product.featured_image.alt) }}
                <meta itemprop="image" content="https:{{ product.featured_image | product_image_url("small") }}"/>
                <meta itemprop="url" content="{{ product.url }}"/>
            </span>
              {% if product.free_shipping %}
                <div class="free-shipping-product">{{ "Frete grátis" | translate }}</div>
            {% endif %}
            <span class="bajada">
                <h3>{{ product.name }}</h3>
                {% if product.display_price %}
                    {% if product.compare_at_price %}
                        <del class="price"><span class="compare_price">{{ product.compare_at_price | money }}</span></del>
                    {% endif %}
                    <span class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        {{ product.price | money }}
                        <meta itemprop="price" content="{{ product.price / 100 }}"/>
                        <meta itemprop="priceCurrency" content="{{ product.currency }}"/>
                    </span>
                    {% if product.show_installments %}
                        {% set max_installments_without_interests = product.get_max_installments(false) %}
                        {% if max_installments_without_interests %}
                            <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong> sem juros" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</span>
                        {% else %}
                            {% set max_installments_with_interests = product.get_max_installments %}
                            {% if max_installments_with_interests %}
                                <span class="max_installments">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</span>
                            {% endif %}
                        {% endif %}
                    {% endif %}
                {% endif %}
            </span>
        </a>


    {% if loop.index % 4 == 0 or loop.last %}
    </div>
    {% endif %}

{% endfor %}