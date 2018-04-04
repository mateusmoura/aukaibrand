{# Only remove this if you want to take away the theme onboarding advices #}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}
{# Products that works as example #}
<div class="row-fluid">
    <div class="container">
        <div class="span4">
            <div class="dest-list line-sec">
                <h2>{{"Productos recientes" | translate}}</h2>
                <div id="tS3-recent" class="jThumbnailScroller hidden-phone">
                    <div class="jTscrollerContainer">
                        <div class="jTscroller">
                             <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="#" class="product-image">
                                       {{ "images/help-product-0.svg" | static_url | img_tag }}
                                    </a>
                                </div>
                                <div class="bajada">
                                    <div class="category">
                                        <a href="#">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                                    </div>
                                    <div class="title">
                                        <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                    </div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="112">{{"11200" | money }}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="/product/example">{{'images/help-product-1.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                                    <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="102">{{"10200" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"13200" | money }}</span>
                                        </span>
                                </div>
                                </div>
                            </div>
                            <div class="dest-sec show_help">
                                 <div class="head">
                                    <a href="/product/example">{{'images/help-product-2.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">
                                       {{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                                    </div>
                                    <div class="title">
                                        <a href="#">{{ "Producto de ejemplo" | translate }}</a>
                                    </div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="1000">{{"100000" | money }}</span>
                                        <span class="price-compare">
                                        <span id="compare_price_display" >{{"150000" | money }}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="/product/example">{{'images/help-product-3.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                                    <div class="title"><a href="/product/example">{{ "Producto de ejemplo" | translate }}</a></div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="80">{{"8000" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"7200" | money }}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="jTscrollerPrevButton"><i class="fa fa-angle-up fa-3x"></i></a>
                    <a href="#" class="jTscrollerNextButton"><i class="fa fa-angle-down fa-3x"></i></a>
                </div>
                <div class="visible-phone">
                    <div class="dest-sec">
                        <div class="head">
                            <a href="/product/example">{{'images/help-product-4.svg' | static_url | img_tag}}</a>
                        </div>
                        <div class="bajada">
                            <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                            <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                                <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="102">{{"10200" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"13200" | money }}</span>
                                        </span>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span4">
            <div class="dest-list line-sec">
                <h2>{{"Productos en oferta" | translate}}</h2>
                <div id="tS3-offer" class="jThumbnailScroller hidden-phone">
                    <div class="jTscrollerContainer">
                        <div class="jTscroller">
                            <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="/product/example">{{'images/help-product-6.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                                    <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="80">{{"8000" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"7200" | money }}</span>
                                        </span>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="/product/example">{{'images/help-product-7.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                                    <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="102">{{"10200" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"13200" | money }}</span>
                                        </span>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   <a href="#" class="jTscrollerPrevButton"><i class="fa fa-angle-up fa-3x"></i></a>
                    <a href="#" class="jTscrollerNextButton"><i class="fa fa-angle-down fa-3x"></i></a>
                </div>
                <div class="visible-phone">
                    <div class="dest-sec">
                        <div class="head">
                            <a href="/product/example">{{'images/help-product-8.svg' | static_url | img_tag}}</a>
                        </div>
                        <div class="bajada">
                            <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                            <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                            <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="80">{{"8000" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"7200" | money }}</span>
                                        </span>
                                    </div>
                        </div>
                    </div>
                    <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="/product/example">{{'images/help-product-9.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                                    <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                                    <div class="price">
                                        <span class="price" id="price_display" itemprop="price" content="102">{{"10200" | money }}</span>
                                        <span class="price-compare">
                                            <span id="compare_price_display">{{"13200" | money }}</span>
                                        </span>
                                </div>
                                </div>
                            </div>
                </div>
            </div>
        </div>
        <div class="span4">
            <div class="dest-list line-sec">
                <h2>{{"Próximamente" | translate}}</h2>
                <div id="tS3-coming" class="jThumbnailScroller hidden-phone">
                    <div class="jTscrollerContainer">
                        <div class="jTscroller">
                            <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="{{ help_url }}" target="_top">{{'images/help-product-6.svg' | static_url | img_tag}}</a>
                                </div>
                                <div class="bajada">
                                    <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                                    <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                                </div>
                            </div>
                            <div class="dest-sec show_help">
                                <div class="head">
                                    <a href="#" class="product-image">
                                       {{ "images/help-product-8.svg" | static_url | img_tag }}
                                    </a>
                                </div>
                                <div class="bajada">
                                    <div class="category">
                                      {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                    </div>
                                    <div class="title">
                                        <a href="/product/exampĺe">{{ "Producto de ejemplo" | translate }}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <a href="#" class="jTscrollerPrevButton"><i class="fa fa-angle-up fa-3x"></i></a>
                    <a href="#" class="jTscrollerNextButton"><i class="fa fa-angle-down fa-3x"></i></a>
                </div>
                <div class="visible-phone">
                    <div class="dest-sec show_help">
                        <div class="head">
                            <a href="/product/example">{{'images/help-product-6.svg' | static_url | img_tag}}</a>
                        </div>
                        <div class="bajada">
                            <div class="category">{{ "CATEGORÍA DE EJEMPLO" | translate }}</div>
                            <div class="title"><a href="/product/example">{{"Producto de ejemplo" | translate}}</a></div>
                        </div>
                    </div>
                     <div class="dest-sec show_help">
                        <div class="head">
                                <a href="#" class="product-image">
                                   {{ "images/help-product-8.svg" | static_url | img_tag }}
                                </a>
                        </div>
                        <div class="bajada">
                            <div class="category">
                                {{ "CATEGORÍA DE EJEMPLO" | translate }}
                            </div>
                            <div class="title">
                                <a href="/product/example" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>