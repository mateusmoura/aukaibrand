{% if product.show_installments and product.display_price %}
<div class="row-fluid">
    <div class="installments">
        {% set max_installments_without_interests = product.get_max_installments(false) %}
        {% if max_installments_without_interests %}
                <div class="max_installments">{{ 'En hasta {1} cuotas de {2} sin interés' | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
        {% else %}
            {% set max_installments_with_interests = product.get_max_installments %}
            {% if max_installments_with_interests %}
                <div class="max_installments">{{ 'En hasta {1} cuotas de {2}' | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
            {% endif %}
        {% endif %}
    </div>
</div>
{% endif %}