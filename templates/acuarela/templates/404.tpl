<div class="page-content">
	<div class="headerBox">
		<h2>{{ "Error" | translate }}</h2>
        <p>{{ "La página que estás buscando no existe." | translate }} <small>{{ "Quizás te interesen los siguientes productos." | translate }}</small></p>
	</div>
	<div class="contentBox fullWidth">
		<ul id="products" class="product-grid">
			{% snipplet "product_grid.tpl" with 'products' = sections.primary.products %}
		</ul>
	</div>
</div>