{% paginate by 9 %}
<div class="page-content">
	<div id="product-listing">	
		<div class="headerBox">
			<h2>{{ category.name }}</h2>
		</div>
		<div class="contentBox fullWidth">
			<div class="crumbPaginationContainer top">
                {% snipplet "breadcrumbs.tpl" %}
				<div class='pagination'>
					{% snipplet "pagination.tpl" %}
				</div>
			</div>

            {% if "banner-products.jpg" | has_custom_image %}
                <div class="banner">
                    {% if settings.banner_products_url != '' %}
                        {{ "banner-products.jpg" | static_url | img_tag | a_tag(settings.banner_products_url) }}
                    {% else %}
                        {{ "banner-products.jpg" | static_url | img_tag }}
                    {% endif %}
                </div>
            {% endif %}

            {% if products %}
            <div class="product-table">
                {% snipplet "product_grid.tpl" %}
            </div>
            {% endif %}
			
			<div class="crumbPaginationContainer bottom">
				<div class='pagination'>
					{% snipplet "pagination.tpl" %}
				</div>
			</div>
		</div>
	</div>
</div>