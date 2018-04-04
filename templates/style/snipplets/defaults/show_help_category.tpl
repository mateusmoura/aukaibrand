{# Products that work as examples #}
<div class="banner">
    <div class="banner-shadow"></div>
    {{ "img/banner-category.svg" | static_url | img_tag }}
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="section-title">
                <fieldset><legend><h1>{{ "Productos de ejemplo" | translate }}</h1></legend></fieldset>
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
                            <p class="old-price">{{"90000" | money }}</p>
                            <p class="price">{{"80000" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a> 
            <!-- Product 02 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image">
                <div class="pills">
                    <div class="offer-pill">{{ "Oferta" | translate }}</div> 
                </div>
                <div class="figure">
                    {{ "img/help-product-4.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"50000" | money }}</p>
                            <p class="price">{{"45000" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a> 
            <!-- Product 03 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image">  
                <div class="figure">
                    {{ "img/help-product-1.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"180000" | money }}</p>
                            <p class="price">{{"170000" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a> 
            <!-- Product 04 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image">
                <div class="pills">
                    <div class="offer-pill">{{ "Sin stock" | translate }}</div> 
                </div>
                <div class="figure">
                    {{ "img/help-product-3.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"30000" | money }}</p>
                            <p class="price">{{"25000" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a>
            <!-- Product 05 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image"> 
                <div class="figure">
                    {{ "img/help-product-8.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"418000" | money }}</p>
                            <p class="price">{{"315500" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a>
            <!-- Product 06 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image">
                <div class="pills">
                    <div class="offer-pill">{{ "Oferta" | translate }}</div> 
                </div>
                <div class="figure">
                    {{ "img/help-product-6.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"90000" | money }}</p>
                            <p class="price">{{"60000" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a>
            <!-- Product 07 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image">
                <div class="pills">
                    <div class="offer-pill">{{ "Oferta" | translate }}</div> 
                </div>
                <div class="figure">
                    {{ "img/help-product-5.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"50000" | money }}</p>
                            <p class="price">{{"45000" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a>
            <!-- Product 08 --> 
            <a href="/product/example" title="{{ product.name }}" class="product-image"> 
                <div class="figure">
                    {{ "img/help-product-9.svg" | static_url | img_tag }}
                    <div class="figure-overlay"></div> 
                    <div class="caption">  
                        <h2>{{ "Producto de ejemplo" | translate }}</h2> 
                        <div class="price-container">
                            <p class="old-price">{{"228000" | money }}</p>
                            <p class="price">{{"226500" | money }}</p> 
                        </div>
                    </div>
                </div>
            </a>
        </section>
    </div>
</div>