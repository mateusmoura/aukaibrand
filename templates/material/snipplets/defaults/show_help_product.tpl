{# Single product that works as an example #}

<div class="container-fluid product-hero">
     {{ "images/help-product-2.svg" | static_url | img_tag }}
     <div class="overlay"></div>
</div>
<div id="product-detail" class="container">
    <div id="single-product" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        {# productContainer class is important to change the images depending on the variant chosen #}
        <div id="single-product-container"  class="productContainer row" data-variants="{{product.variants_object | json_encode }}">
             {#  **** Product Image and thumbnails ****  #}
            <div class="product-image-container col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 p-none-xs">
                <div class="product-name-container">
                    {#  **** Product Name and Price ****  #}
                    <div class="product-name-container text-center">
                        {#  **** Product Title ****  #}
                        <h1 class="m-top p-top clear-both" itemprop="name">{{ "Producto de ejemplo" | translate }}</h1>
                    </div>
                </div>
                <div class="slider p-relative clearfix m-bottom {% if product.images_count == 1 %}material-card{% endif %}">             
                    <ul class="bxslider" id="productbxslider">
                         <li class="product-slide" data-image="0" data-image-position="0">{{ "images/help-product-2.svg" | static_url |  img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</li>
                        <li class="product-slide" data-image="1" data-image-position="1">{{ "images/help-product-44.jpg" | static_url | img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</li>
                        <li class="product-slide" data-image="2" data-image-position="2">{{ "images/help-product-45.jpg" | static_url |  img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</li>
                    </ul>
                    <div class="labels-container p-absolute">
                        <h4 class="m-none-top offer-product text-uppercase"><div class="label label-warning label-offer font-weight-normal border-radius-none">{{ "Oferta" | translate }}</div></h4>
                        <h4 class="m-none-top text-uppercase"><div class="label label-info label-shipping font-weight-normal border-radius-none"><i class="fa fa-truck"></i>{{ "Gratis" | translate }}</div></h4>
                    </div>
                    <div class="product-social-likes-desktop product-social-likes-desktop-right p-absolute text-center hidden-xs">
                         <!-- Facebook button -->
                        <a class="share-btn share-btn-facebook product-share-button btn-circle pull-right clear-both m-half-bottom no-link bg-facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                         <!-- Twitter button -->
                        <a class="share-btn share-btn-twitter product-share-button btn-circle pull-right clear-both m-half-bottom no-link bg-twitter">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <!--Google+ button -->
                        <a class="share-btn share-btn-googleplus product-share-button btn-circle pull-right clear-both m-half-bottom no-link bg-google">
                            <i class="fa fa-google-plus"></i>
                        </a>
                        <a class="share-btn share-btn-branded product-share-button btn-circle pull-right clear-both m-half-bottom no-link bg-pinterest c-pointer">
                             <i class="fa fa-pinterest"></i>
                        </a>
                    </div>
                    <div id="bx-pager" class="product-detail-pager bx-pager text-center m-half-bottom-xs p-half-bottom-xs m-half-top">
                        <a data-slide-index="0" class="d-inline-block hidden-xs" href="">{{ "images/help-product-2.svg" | static_url |  img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</a>
                         <div class="slider-circles">
                            <span class="circle-pager"></span>
                        </div>
                        <a data-slide-index="1" class="d-inline-block hidden-xs" href="">{{ "images/help-product-44.jpg" | static_url | img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</a>
                        <div class="slider-circles">
                            <span class="circle-pager"></span>
                        </div>
                        <a data-slide-index="2" class="d-inline-block hidden-xs" href="">{{ "images/help-product-45.jpg" | static_url |  img_tag(image.alt, {class: 'img-responsive m-auto'}) }}</a>
                        <div class="slider-circles">
                            <span class="circle-pager"></span>
                        </div>
                    </div>
                </div>
            </div>
            {#  **** Product detail, variants, description and social widgets ****  #}
            <div class="product-description-column col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                <div class="product-description m-double-bottom">
                   {#  **** Product Price ****  #}
                   <div class="product-price-container col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="price-container">
                            <h3 class="price-compare d-inline-block text-line-through  m-none-top">
                                 <span id="compare_price_display" class="opacity-50 p-half-right">{{ "56000" | money }}</span>
                            </h3>
                            <h2 class="price final-price d-inline-block m-none-top p-half-left p-half-right border-left-dark">{{ "82000" | money }}</h2>
                        </div>
                    </div>
                    {#  **** Product submit form ****  #}
                    <form id="product-form" class="m-half-top row">
                        <input type="hidden" name="add_to_cart" value="{{product.id}}">
                        {#  **** Product Variants ****  #}
                       <div class="product">
                              <div class="col-xs-12 col-sm-12 col-lg-12 col-md-12">
                              <!-- Color and size variants -->
                                    <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} row-fluid text-center m-half-bottom">
                                      <label  class="variation-label" for="variation_{{loop.index}}">
                                        <span>{{ "Color" | translate }}</span>
                                      </label>
                                      <div class="row text-center">
                                           <a class="insta-variations blue">
                                            <span style="background: lightblue;"></span>
                                          </a>
                                           <a class="insta-variations pink">
                                            <span style="background: pink;"></span>
                                          </a>
                                           <a class="insta-variations green">
                                            <span style="background: green;"></span>
                                          </a>
                                      </div>
                                    </div>

                                <!-- custom variants -->
                               
                                  <div class="row">
                                    <div class="form-group text-left col-xs-12 col-sm-12 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
                                          <label class="variation-label">
                                              <span>{{ "Material" | translate }}</span>
                                          </label>
                                          <select class="variation-option form-control">
                                                <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                                                <option value="Ganchito">{{ "Algodón" | translate }}</option>
                                          </select>
                                    </div>
                                  </div>
                              </div>
                        </div>    
                        {#  **** Product Add to Cart button ****  #}
                        <div class="add-to-card-container">
                          <div class="product-add-to-cart product-add-to-cart-mobile m-half-top col-xs-12 col-sm-12 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
                              <span class="main-add-to-cart add-to-cart btn btn-primary js-addtocart cart col-xs-12 col-sm-12 col-md-12 col-lg-12">{{ "Agregar al carrito" | translate }}</span>
                          </div>
                      </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

{% if show_help %}
    <script type="text/javascript">
        $(document).ready(function(){
          $("#main-content").addClass("no-margin");
          {# Mobile Products Slider #}
            var slider = $('#productbxslider').bxSlider({
                nextText:'<i class="material-icons">&#xE315;</i>',
                prevText:'<i class="material-icons">&#xE314;</i>',
                adaptiveHeight: true,
                startSlide: 0,
                pagerCustom: '#bx-pager',
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
            $(".insta-variations.blue").click(function(){
              slider.goToSlide(0);
            });
            $(".insta-variations.pink").click(function(){
              slider.goToSlide(1);
            });
            $(".insta-variations.green").click(function(){
              slider.goToSlide(2);
            });

        });
    </script>
{% endif %}