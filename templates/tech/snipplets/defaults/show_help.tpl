{# Only remove this if you want to take away the theme onboarding advices #}
{# Products that work as examples #}
<div class="row-fluid">
	<div class="row-fluid" id="products-example">
		<div class="container">
			<div class="products">
				<div class="clear"></div>
				<div class="titles">
					<h1>{{"Productos de ejemplo" | translate}}</h1> 
				</div>
					<!-- Product 01 -->
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 single-product-container">
						<div class="single-product-item">
							<div class="photo" itemscope itemtype="http://schema.org/Product" >
								<a href="/product/example" title="{{ product.name }}">
									<img src="{{ "images/help-product-2.svg" | static_url }}" class="img-responsive"> 
								</a> 
					                <span class="free-shipping">{{ "Envío sin cargo" | translate }}</span> 
					        </div> 
					        <h3 class="product-header-margin-top">
					        	<a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
					        </h3>

					        <div class="price"> 
				                <del id="compare_price_display">
				                    <span class="offer">{{"100000" | money }}</span>
				                </del>
				                <span id="price_display">{{"150000" | money }}</span>
				            </div> 
						</div>
					</div>
					<!-- Product 02 -->
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 single-product-container">
						<div class="single-product-item">
							<div class="photo" itemscope itemtype="http://schema.org/Product" >
								<a href="/product/example" title="{{ product.name }}">
									<img src="{{ "images/help-product-4.svg" | static_url }}" class="img-responsive"> 
								</a> 
					                <span class="offer2">{{ "Oferta" | translate }}</span> 
					        </div> 
					        <h3 class="product-header-margin-top">
					        	<a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
					        </h3>

					        <div class="price"> 
				                <del id="compare_price_display">
				                    <span class="offer">{{"30000" | money }}</span>
				                </del>
				                <span id="price_display">{{"35000" | money }}</span>
				            </div> 
						</div>
					</div>
					<!-- Product 03 -->
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 single-product-container">
						<div class="single-product-item">
							<div class="photo" itemscope itemtype="http://schema.org/Product" >
								<a href="/product/example" title="{{ product.name }}">
									<img src="{{ "images/help-product-1.svg" | static_url }}" class="img-responsive"> 
								</a>  
					        </div> 
					        <h3 class="product-header-margin-top">
					        	<a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
					        </h3>

					        <div class="price"> 
				                <del id="compare_price_display">
				                    <span class="offer">{{"180000" | money }}</span>
				                </del>
				                <span id="price_display">{{"170000" | money }}</span>
				            </div> 
						</div>
					</div>
					<!-- Product 02 -->
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 single-product-container">
						<div class="single-product-item">
							<div class="photo" itemscope itemtype="http://schema.org/Product" >
								<span class="nostock-image">{{ "Sin stock" | translate }}</span> 
								<a href="/product/example" title="{{ product.name }}">
									<img src="{{ "images/help-product-3.svg" | static_url }}" class="img-responsive"> 
								</a>  
					        </div> 
					        <h3 class="product-header-margin-top">
					        	<a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
					        </h3>

					        <div class="price"> 
				                <del id="compare_price_display">
				                    <span class="offer">{{"8000" | money }}</span>
				                </del>
				                <span id="price_display">{{"6000" | money }}</span>
				            </div> 
						</div>
					</div>
			</div>
		</div> 
			<!-- end scroller-->
	</div>
</div> 