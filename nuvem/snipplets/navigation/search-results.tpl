<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item">
            <a href="{{ product.url }}" class="search-suggest-link">
                <div class="search-suggest-image-container hidden-xs">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text text-uppercase full-width-xs">
                    <div class="search-suggest-name text-left font-small">
                        {{ product.name | highlight(query) }}
                    </div>
                    {% if product.display_price %}
                        <div class="search-suggest-price hidden-xs weight-strong">
                            {{ product.price | money }}
                        </div>
                        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                        {% if product_can_show_installments %}
                            <span class="hidden-xs font-small">
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% if store.installments_on_steroids_enabled and store.country == 'AR' %}
                                    {% set max_installments_with_interests = product.get_max_installments %}
                                    {% if store.has_new_installmentsv2_ab %}
                                        {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                            <div class="installments m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% else %}
                                            {% if max_installments_with_interests %}
                                                <div class="installments m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                            {% endif %}
                                        {% endif %}
                                    {% else %}
                                        {% if max_installments_with_interests %}
                                            <div class="installments m-top-quarter">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% endif %}
                                    {% endif %}

                                {% else %}
                                    {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                        <div class="installments m-none">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% else %}
                                        {% set max_installments_with_interests = product.get_max_installments %}
                                        {% if max_installments_with_interests %}
                                            <div class="installments m-none">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% endif %}
                                    {% endif %}
                                {% endif %}
                            </span>
                        {% endif %}
                    {% endif %}
                </div>
                <i class="search-suggest-icon fa fa-chevron-right hidden-xs"></i>
            </a>
        </li>
    {% endfor %}
    <li class="search-suggest-item hidden-xs">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
</ul>