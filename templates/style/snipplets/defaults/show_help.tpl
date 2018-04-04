{# Only remove this if you want to take away the theme onboarding advices #}
{# Products that work as examples #}
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title section-title-large featured-prods">
				<fieldset><legend><h2>{{"Productos de ejemplo" | translate}}</h2></legend></fieldset>
			</div>
		</div>
	</div>
	<div class="row">
		<section id="grid" class="grid clearfix">  
			<!-- Product 01 -->
			<a href="/product/example" title="{{ product.name }}" class="product-image">
				<div class="pills">
					<div class="offer-pill">{{ "Oferta" | translate }}</div> 
				</div>
				<div class="figure">
					{{ "img/help-product-2.svg" | static_url | img_tag }}
					<div class="figure-overlay"></div> 
					<div class="caption">  
						<h2>{{ "Producto de ejemplo" | translate }}</h2> 
						<div class="price-container">
							<p class="old-price">{{"150000" | money }}</p>
        					<p class="price">{{"100000" | money }}</p> 
						</div>
					</div>
				</div>
			</a> 
			<!-- Product 02 --> 
			<a href="/product/example" title="{{ product.name }}" class="product-image"> 
				<div class="figure">
					{{ "img/help-product-4.svg" | static_url | img_tag }}
					<div class="figure-overlay"></div> 
					<div class="caption">  
						<h2>{{ "Producto de ejemplo" | translate }}</h2> 
						<div class="price-container">
							<p class="old-price">{{"150000" | money }}</p>
        					<p class="price">{{"100000" | money }}</p> 
						</div>
					</div>
				</div>
			</a> 
			<!-- Product 03 --> 
			<a href="/product/example" title="{{ product.name }}" class="product-image">
				<div class="pills">
					<div class="offer-pill">{{ "Sin stock" | translate }}</div> 
				</div>
				<div class="figure">
					{{ "img/help-product-1.svg" | static_url | img_tag }}
					<div class="figure-overlay"></div> 
					<div class="caption">  
						<h2>{{ "Producto de ejemplo" | translate }}</h2> 
						<div class="price-container">
							<p class="old-price">{{"150000" | money }}</p>
        					<p class="price">{{"100000" | money }}</p> 
						</div>
					</div>
				</div>
			</a> 
			<!-- Product 04 --> 
			<a href="/product/example" title="{{ product.name }}" class="product-image">
				<div class="pills">
					<div class="offer-pill">{{ "Envío gratis" | translate }}</div> 
				</div>
				<div class="figure">
					{{ "img/help-product-3.svg" | static_url | img_tag }}
					<div class="figure-overlay"></div> 
					<div class="caption">  
						<h2>{{ "Producto de ejemplo" | translate }}</h2> 
						<div class="price-container">
							<p class="old-price">{{"150000" | money }}</p>
        					<p class="price">{{"100000" | money }}</p> 
						</div>
					</div>
				</div>
			</a>
		</section>
	</div>
</div>