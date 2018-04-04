{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}
{% for product in products %}
	{% if loop.index % 4 == 1 %}
    	<div class="product-row row">
    {% endif %}
    {% include 'snipplets/single_product.tpl' %}
    {% if loop.index % 4 == 0 or loop.last %}
        </div>
    {% endif %}    
{% endfor %}
