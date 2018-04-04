{# Single product that works as an example #}
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="section-title">
                <fieldset><legend><h1 itemprop="name">{{ "Producto de ejemplo" | translate }}</h1></legend></fieldset>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="mobile-bxslider">  
            <ul class="bxslider" id="productbxslider"> 
                <li class="product-slider" data-image="{{image.id}}" data-image-position="{{loop.index0}}">{{ "img/help-product-2.svg" | static_url | img_tag }}</li> 
            </ul> 
            <div class="pills">
                <div class="offer-pill">{{ "Oferta" | translate }}</div>
            </div>
        </div>
        <div class="col-md-6 product-photos desktop-featured-product">
            <div class="row">
                <div class="direction-nav no-gutter">
                    <a href="#" class="prev">&nbsp;</a>
                </div>
                <div class="current-photo no-gutter">
                    <div class="current-photo-container">
                        <div class="pills">
                            <div class="offer-pill">{{ settings.offer_text }}</div>
                        </div> 
                            <a
                            href="{{ "img/help-product-2.svg" | static_url }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                {{ "img/help-product-2.svg" | static_url | img_tag }}
                            </a> 
                    </div>
                </div>
                <div class="direction-nav right no-gutter">
                    <a href="#" class="next">&nbsp;</a>
                </div>
            </div>
            <div class="row"> 
                <div class="thumb-container">   
                    <a id="red" href="{{ "img/help-product-44.svg" | static_url }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-44.svg" | static_url }}' ">
                        <span>
                        {{ "img/help-product-44.svg" | static_url | img_tag }}
                        </span>
                    </a> 
                    <a id="red" href="{{ "img/help-product-45.svg" | static_url }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-45.svg" | static_url }}' ">
                        <span>
                        {{ "img/help-product-45.svg" | static_url | img_tag }}
                        </span>
                    </a> 
                    <a id="red" href="{{ "img/help-product-2.svg" | static_url }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-2.svg" | static_url }}' ">
                        <span>
                        {{ "img/help-product-2.svg" | static_url | img_tag }}
                        </span>
                    </a> 
                </div> 
            </div>
        </div>
        <div class="col-md-6 description-col">
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <div class="price-container">
                    <p id="compare_price_display" class="big-old-price">{{ "1200.50" | money }}</p>
                    <p class="big-price" id="price_display">{{ "1890.00" | money }}</p>
                </div>
            </div>
            <div class="row-fluid">
                <h5>{{ "En hasta 12 cuotas con tarjeta de crédito" | translate }}</h5>
            </div>
            <form id="product_form" method="post" action="">
                <input type="hidden" name="add_to_cart" value="2243561">
                <div class="variant-container">
                    <div class="variant col-md-4 col-sm-4 col-xs-12"> 
                        <label class="variation-label" for="variation_1">{{ "Talle" | translate }}</label>
                        <select id="variation_1" class="form-control on-steroids" name="variation[0]">
                            <option value="s" selected="selected">{{ "S" | translate }}</option>
                            <option value="m">{{ "M" | translate }}</option>
                            <option value="l">{{ "L" | translate }}</option>
                            <option value="xl">{{ "XL" | translate }}</option>
                        </select> 
                    </div>
                    <div class="variant col-md-4 col-sm-4 col-xs-12"> 
                        <label class="variation-label" for="color_variant">{{ "Color" | translate }}</label>
                        <select id="color_variant" class="form-control on-steroids" name="color_variant">
                            <option value="blue" selected="selected">{{ "Azul" | translate }}</option>
                            <option value="green">{{ "Verde" | translate }}</option>
                            <option value="red">{{ "Rojo" | translate }}</option>
                        </select> 
                    </div>
                    <div class="variant col-md-4 col-sm-4 col-xs-12"> 
                        <label class="variation-label" for="variation_3">{{ "Material" | translate }}</label>
                        <select id="variation_3" class="form-control on-steroids" name="variation[2]">
                            <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                            <option value="Ganchito">{{ "Algodón" | translate }}</option>
                        </select> 
                    </div>
                </div>
                <div class="quantity">
                    <label class="variation-label" for="variation_3">{{ "Cantidad" | translate }}</label>
                    <input class="spinner form-control" value="1" type="text" name="quantity{{ item.id }}" value="1">
                </div>
                {% if store.country == 'BR' %}
                <div id="shipping-calculator" class="row text-center">
                    <div class="col-md-12"> 
                        <div id="shipping-calculator-form-example" class="cart-detail-shipping"> 
                            <p> {{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</p>
                            <input type="text" name="zipcode" value="{{ cart.shipping_zipcode }}"  class="form-control" >
                            <button class="general-button calculate-shipping-button">{{ "Calcular costo de envío" | translate }}</button>
                            <p class="loading" style="display:none;"><i class="fa fa-refresh fa-spin"></i></p>
                            <p id="invalid-zipcode" style="display:none;">{{ "El código postal es inválido." | translate }}</p>
                        </div>
                    </div>
                    {# response #}
                    <div id="shipping-calculator-response-example" style="display: none;">
                        <span>{{ "Este es un ejemplo de opciones de envío para un código postal" | translate }}</span>
                        <ul class="shipping-list">
                            <li>
                                <label for="shipping-1">
                                    <span><img src="https://d26lpennugtm8s.cloudfront.net/assets/common/img/logos/shipping/br/correios/pac@2x.png">Correios - PAC - 6 dias úteis - R$19,10</span>
                                </label>
                            </li>
                            <li>
                                <label for="shipping-2">
                                    <span><img src="https://d26lpennugtm8s.cloudfront.net/assets/common/img/logos/shipping/br/correios/sedex@2x.png">Correios - SEDEX - 1 dia útil - R$43,00</span>
                                </label>
                            </li>
                        </ul>
                        <input type="hidden" name="after_calculation" value="1">
                        <input type="hidden" name="zipcode" value="32682558">
                    </div>
                </div>
                {% endif %}
                <div class="addToCartButton">
                    <input type="submit" href="#" class="addToCart big-product-related-button" value="{{ "Agregar al carrito" | translate }}" disabled>
                </div>
            </form> 
        </div>
        <div class="row"> 
            <div class="col-md-12 user-content">
                <p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
                    <a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
                </p>
            </div>  
        </div>
    </div>
</div>
{% if show_help %}
    <script type="text/javascript">
        $(document).ready(function(){
            var $shipping_calculator = $("#shipping-calculator");
            var $invalid_zipcode = $("#invalid-zipcode");
            var $shipping_calculator_loading = $shipping_calculator.find(".loading")
            $("#calculate-shipping-button-example").click(function() {
                $invalid_zipcode.hide(1);
                $shipping_calculator_loading.show( 1 ).delay( 1800 ).hide(1);
                event.preventDefault(); // cancel default behavior
                if( $("#shipping-zipcode").val().length === 8 || $("#shipping-zipcode").val().length === 9 ) {
                    $("#shipping-calculator-form-example, #shipping-calculator-response-example").toggle();
                } else {
                    $("#invalid-zipcode").delay( 1800 ).show(1);
                }
            });



            $('#color_variant').change(function(){
                var $values_color = $( "select#color_variant option:selected" ).val();
                $('#' + $values_color).click();
                if ( $values_color == 'green'){
                    $(".price02").show();
                    $(".price01").hide();
                } else {
                    $(".price02").hide();
                    $(".price01").show();
                }
            });

        });


    </script>
{% endif %}