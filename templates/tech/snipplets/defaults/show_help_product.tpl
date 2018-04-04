{# Single product that works as an example #}
<div class="container prod_detail">
    <div class="titles">
        <h1>{{ "Producto de ejemplo" | translate }}</h1>
    </div>
    <div id="single-product" itemscope itemtype="http://schema.org/Product">
        <div id="single-product-container" class="productContainer" data-variants="{{product.variants_object | json_encode }}">
            <!--start product image-->
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="imagecol">
                    <div class="imagecolContent">
                        <div class="offer2">
                            <p>{{ "Oferta" | translate }}</p>
                        </div>
                        <a href="{{ "images/help-product-2.svg" | static_url }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                           {{ "images/help-product-2.svg" | static_url | img_tag }}
                        </a> 
                    </div>
                    <div id="my-thumbs-list" class="thumbnails-hide-arrow show-thumbs"> 
                        <ul class="helper-list-thumb">
                            <li> 
                                <a id="red"  href="{{ "images/help-product-44.svg" | static_url }}" class="cloud-zoom-gallery img-thumbnail" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-44.svg" | static_url }}' " >
                                    {{ "images/help-product-44.svg" | static_url | img_tag }}
                                </a>
                            </li>
                            <li> 
                                <a id="green"  href="{{ "images/help-product-45.svg" | static_url }}" class="cloud-zoom-gallery img-thumbnail" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-45.svg" | static_url }}' " >
                                    {{ "images/help-product-45.svg" | static_url | img_tag }}
                                </a>
                            </li>
                            <li> 
                                <a id="blue"  href="{{ "images/help-product-2.svg" | static_url }}" class="cloud-zoom-gallery img-thumbnail" rel="useZoom: 'zoom', smallImage: '{{ "images/help-product-2.svg" | static_url }}' " >
                                        {{ "images/help-product-2.svg" | static_url | img_tag }}
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="col-md-6 col-sm-12 col-xs-12 descriptioncol">
                <div class="row-fluid clear left price-container">
                    <div class="price-holder price left">
                        <div class="price">
                            <span class="price-compare">
                                <span id="compare_price_display">{{ "1000.50" | money }}</span>
                            </span>
                            <span class="price" id="price_display">{{ "1890.00" | money }}</span>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="installments">
                    <h5>{{ "En hasta 12 cuotas con tarjeta de crédito" | translate }}</h5>
                </div>
                <div class="clear"></div>
                <div class="addtocart row-fluid clear">
                    <form id="product_form" method="post" action="">
                        <input type="hidden" name="add_to_cart" value="2243561">
                        <div class="fancyContainer row">
                            <div class="col-md-4 col-xs-12">
                                <div class="attributeLine">
                                    <label class="variation-label" for="variation_1">{{ "Talle" | translate }}</label>
                                    <select id="variation_1" class="form-control input-sm" name="variation[0]">
                                        <option value="s" selected="selected">{{ "S" | translate }}</option>
                                        <option value="m">{{ "M" | translate }}</option>
                                        <option value="l">{{ "L" | translate }}</option>
                                        <option value="xl">{{ "XL" | translate }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <div class="attributeLine">
                                    <label class="variation-label" for="color_variant">{{ "Color" | translate }}</label>
                                    <select id="color_variant"  class="form-control input-sm" name="color_variant">
                                        <option value="blue" selected="selected">{{ "Azul" | translate }}</option>
                                        <option value="green">{{ "Verde" | translate }}</option>
                                        <option value="red">{{ "Rojo" | translate }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <div class="attributeLine">
                                    <label class="variation-label" for="variation_3">{{ "Material" | translate }}</label>
                                    <select id="variation_3" class="form-control input-sm" name="variation[2]">
                                        <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                                        <option value="Ganchito">{{ "Algodón" | translate }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        {% if store.country == 'BR' %}
                            <div id="shipping-calculator">
                                <div id="shipping-calculator-form-example">
                                    <span class="shipping-label">{{ "Ingrese aquí su código postal para calcular su costo de envío" | translate }}:</span>
                                    <div class="shipping-input-container">
                                        <input type="text" name="zipcode" value="{{ cart.shipping_zipcode }}">
                                        <button class="button calculatorButton">{{ "Calcular costo de envío" | translate }}</button>
                                        <span class="loading" style="display: none;"><i class="fa fa-circle-o-notch fa-spin"></i></span>
                                        <span id="invalid-zipcode" class="alert alert-danger" style="display: none;">{{ "El código postal es inválido." | translate }}</span>
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
                        
                        <div class="productCTAContainer">
                            <div class="col-md-2 col-xs-12 quantity">
                                <label class="variation-label">{{ "Cantidad" | translate }}</label>
                                <input class="spinner" value="1" type="text" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                            </div>
                        </div> 

                        <div class="col-md-10 col-xs-12">
                            <div class="addToCartButton"> 
                                <input type="submit" class="addbutton button addToCart" value="{{ 'Agregar al carrito' | translate }}" disabled/>
                            </div>
                        </div> 
                    </form> 
                </div>
                <div class="clear"></div>
                <div class="user-product-description user-content">
                    <p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
                            <a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
                        </p>
                </div>
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

            $('#my-thumbs-list.show-thumbs ul').css({'display': '-webkit-box'});

        });


    </script>
{% endif %}