{% if product.show_installments and product.display_price %}
    <div class="installments max_installments_container row">
        {% set max_installments_without_interests = product.get_max_installments(false) %}
        {% if max_installments_without_interests %}
                <div class="max_installments col-md-12 col-xs-12">{{ '<strong>{1}</strong><p>cuotas sin interés de</p><strong>{2}</strong>' | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
        {% else %}
            {% set max_installments_with_interests = product.get_max_installments %}
            {% if max_installments_with_interests %}
                <div class="max_installments col-md-12 col-xs-12">{{ '<strong>{1}</strong> cuotas de <strong>{2}</strong>' | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
            {% endif %}
        {% endif %}
    </div>
{% endif %}