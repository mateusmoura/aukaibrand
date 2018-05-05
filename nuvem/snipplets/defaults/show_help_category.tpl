{# Products that work as examples #}
<div class="banner">
    {{ "images/banner-category.svg" | static_url | img_tag }}
</div>
<div class="row-fluid">
    <div class="row-fluid" id="products-example">
        <div class="container">
            <div class="dest-list overlay">
                <h1>{{"Productos de ejemplo" | translate}}</h1>
                <div class="product-row">
                    <!-- Product 01 -->
                    <div class="container">
                        <div class="span3">
                            {% snipplet 'sort_by.tpl' %}
                        </div>
                    </div>
                    <div class="dest-gral">
                        <div class="head">
                            <div class="circle offer">
                                <p>{{ "Oferta" | translate }}</p>
                            </div>
                            <a href="/product/example" title="{{ product.name }}" class="product-image">
                                {{ "images/help-product-2.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="1000">{{"100000" | money }}</span>
								<span class="price-compare">
								<span id="compare_price_display" >{{"150000" | money }}</span>
								</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 02 -->
                    <div class="dest-gral">
                        <div class="head">
                            <div class="circle free-shipping shipping-top">
                                <p>{{ "Envío sin cargo" | translate }}</p>
                            </div>
                            <a href="/product/example" title="{{ product.name }}" class="product-image">
                                {{ "images/help-product-1.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="442">{{"44200" | money }}</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 03 -->
                    <div class="dest-gral">
                        <div class="head">
                            <a href="/product/example" title="{{ product.name }}" class="product-image">
                                {{ "images/help-product-9.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="102">{{"10200" | money }}</span>
								<span class="price-compare">
								<span id="compare_price_display" >{{"13200" | money }}</span>
								</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 04 -->
                    <div class="dest-gral">
                        <div class="head">
                            <div class="circle out-of-stock">
                                <p>{{ "Sin stock" | translate }}</p>
                            </div>
                            <a href="/product/example" title="{{ product.name }}" class="product-image out-stock-img">
                                {{ "images/help-product-3.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="442">{{"44200" | money }}</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 05 -->
                    <div class="dest-gral">
                        <div class="head">
                            <a href="/product/example" title="{{ product.name }}" class="product-image">
                                {{ "images/help-product-4.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="112">{{"11200" | money }}</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 06 -->
                    <div class="dest-gral">
                        <div class="head">
                            <a href="/product/example" title="{{ product.name }}" class="product-image">
                                {{ "images/help-product-8.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="1430">{{"143000" | money }}</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 07 -->
                    <div class="dest-gral">
                        <div class="head">
                            <a href="/product/example">
                                {{ "images/help-product-6.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="132">{{"13200" | money }}</span>
                            </div>
                        </div>
                    </div>
                    <!-- Product 08 -->
                    <div class="dest-gral">
                        <div class="head">
                            <a href="/product/example">
                                {{ "images/help-product-7.svg" | static_url | img_tag }}
                            </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "Categoría de ejemplo" | translate }}</a>
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                            <div class="price">
                                <span class="price" id="price_display" itemprop="price" content="1100">{{"110000" | money }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>