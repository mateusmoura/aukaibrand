{% if product.show_installments and product.display_price %}
<div class="installments-in-product-container max_installments_container d-inline-block">
	<h4 class="m-none {% if is_link %}text-underline{% endif %}">
    <i class="fa fa-credit-card d-inline-block m-half-right"></i>
    {% set max_installments_without_interests = product.get_max_installments(false) %}
    {% if max_installments_without_interests %}
            <div class="max_installments d-inline">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong> sin interés" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
    {% else %}
        {% set max_installments_with_interests = product.get_max_installments %}
        {% if max_installments_with_interests %}
            <div class="max_installments d-inline">{{ "<strong class='installment-amount'>{1}</strong>x de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
        {% endif %}
    {% endif %}
	</h4>
</div>
{% endif %}