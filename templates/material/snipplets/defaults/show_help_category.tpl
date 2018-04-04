{# Only remove this if you want to take away the theme onboarding advices #}
{# Products that work as examples #}
<section class="products-grid container m-top" id="products-example">
    <div class="page-title-container row m-bottom">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h1 class="clear-both">{{"Productos de ejemplo" | translate}}</h1> 
        </div>
    </div>
    <div class="row">
        {% snipplet 'sort-by.tpl' %}
    </div>
    <div class="masonry-grid">
        <div class="products-row row">
            {# Product 1 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                            <h4 class="m-none-top"><div class="label label-warning label-offer font-weight-normal border-radius-none text-uppercase">60% OFF</div></h4>
                        </div>
                        <a href="/product/example" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-0.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center text-center-sm p-half-left p-half-right">
                                    <span  class="text-line-through opacity-80">{{"150000" | money }}</span>
                                </span>
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right m-bottom-half text-center-sm">{{"100000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            {# Product 2 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                             <h4 class="m-none-top"><div class="label label-info label-shipping font-weight-normal border-radius-none text-uppercase"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h4>
                        </div>
                        <a href="/product/example" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-1.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 m-none-top m-bottom-half text-center p-half-left p-half-right">{{"442000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            {# Product 3 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                            <h4 class="m-none-top"><div class="label label-warning label-offer font-weight-normal border-radius-none text-uppercase">68% OFF</div></h4>
                        </div>
                        <a href="/product/example" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-2.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right">
                                    <span class="text-line-through opacity-80">{{"82000" | money }}</span>
                                </span>
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-left p-half-right text-center m-bottom-half text-center-sm">{{"56000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            {# Product 4 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <a href="/product/example" title="{{ product.name }}" class="product-image">
                            {{ "images/help-product-3.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                        <a href="/product/example" title="{{ product.name }}" class="label-no-stock p-absolute overlay text-center card-radius no-link">
                            <h4 class="text-uppercase">{{ "Sin stock" | translate }}</h4>
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right">
                                    <span class="text-line-through opacity-80">{{"50000" | money }}</span>
                                </span>
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-left p-half-right text-center m-bottom-half">{{"43000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <div class="products-row row">
            {# Product 5 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                            <h4 class="m-none-top"><div class="label label-warning label-offer font-weight-normal border-radius-none text-uppercase">60% OFF</div></h4>
                        </div>
                        <a href="/product/example" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-4.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right">
                                    <span class="text-line-through opacity-80">{{"150000" | money }}</span>
                                </span>
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-left p-half-right text-center m-bottom-half">{{"100000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            {# Product 6 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                             <h4 class="m-none-top"><div class="label label-info label-shipping font-weight-normal border-radius-none text-uppercase"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h4>
                        </div>
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-5.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="/product/example" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-left p-half-right m-bottom-half text-center">{{"65000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            {# Product 7 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                            <h4 class="m-none-top"><div class="label label-warning label-offer font-weight-normal border-radius-none text-uppercase">70% OFF</div></h4>
                        </div>
                        <a href="/product/example" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-6.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="/product/example" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right">
                                    <span class="text-line-through opacity-80">{{"13200" | money }}</span>
                                </span>
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-left p-half-right text-center m-bottom-half">{{"10200" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            {# Product 8 #}
            <div class="product-grid-single-product col-tight-xs m-bottom col-xs-6 col-sm-4 col-md-3 col-lg-3 col-tight">
                <div class="material-card">
                    <div class="single-product-image p-relative card-radius">
                        <div class="labels-container p-absolute">
                            <h4 class="m-none-top"><div class="label label-warning label-offer font-weight-normal border-radius-none text-uppercase">70% OFF</div></h4>
                        </div>
                        <a href="/product/example" title="{{ product.name }}" class="product-image pull-left">
                            {{ "images/help-product-7.svg" | static_url | img_tag("", {class: 'img-responsive'}) }}
                        </a>
                    </div>
                    <div class="single-product-info text-center row container-fluid" itemscope itemtype="http://schema.org/Product">
                        <div class="p-half-bottom p-half-top title-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12 p-left-none p-right-none col-tight">
                            <div class="product-title col-xs-12 col-sm-12 col-md-12 col-lg-12" itemprop="name">
                                <h5 class="m-none-top text-uppercase">
                                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="line-height-initial">
                                        {{ "Producto de ejemplo" | translate }}
                                    </a>
                                </h5>
                            </div>
                            <div class="price">
                                <span class="price-compare col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center p-half-left p-half-right">
                                    <span class="text-line-through opacity-80">{{"132000" | money }}</span>
                                </span>
                                <h4 class="price col-xs-12 col-sm-12 col-md-12 col-lg-12 p-half-left p-half-right text-center m-bottom-half">{{"102000" | money }}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>
</section>