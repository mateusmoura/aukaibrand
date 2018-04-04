{% paginate by 16 %}
<div class="row-fluid">
    <div class="container product-list">
        <div class="dest-list">
            {% set primary_section_products %}
                    {% for product in sections.primary.products %}
                        {% include 'snipplets/single_product.tpl' %}
                    {% endfor %}
            {% endset %}
            {{ primary_section_products }}
        </div>
    </div>
</div>



