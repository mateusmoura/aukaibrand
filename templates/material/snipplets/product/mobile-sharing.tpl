{# Mobile Sharing #}
<div class="modal fade bottom modal-mobile js-modal-mobile" id="sharing-mobile" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-dialog modal-lg modal-mobile-dialog">
        <div class="modal-content modal-mobile-content">
	         <div class="modal-header">
                <span class="btn btn-default btn-close pull-right" data-dismiss="modal" aria-label="Close">
                  <i class="material-icons">&#xE5CD;</i>
                </span>
                <h4 class="modal-title modal-title col-xs-10 p-none m-half-top">{{ 'Compartir ' | translate }}<strong>{{ product.name }}</strong>{{ ' en:' | translate }}</h4>
  	      	</div>
            <div class="modal-body modal-mobile-body">
                  <div class="product-social-likes-mobile text-center m-double-top">
                       <!-- Whatsapp button -->
                      <a class="share-btn share-btn-whatsapp product-share-button btn-circle no-link bg-whatsapp d-inline-block m-half-all" data-network="facebook" target="_blank"
                         href="whatsapp://send?text={{ product.social_url }}">
                          <i class="fa fa-whatsapp"></i>
                      </a>
                       <!-- Facebook button -->
                      <a class="share-btn share-btn-facebook product-share-button btn-circle no-link bg-facebook d-inline-block m-half-all" data-network="facebook" target="_blank"
                         href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
                         title="Share on Facebook">
                          <i class="fa fa-facebook"></i>
                      </a>
                       <!-- Twitter button -->
                      <a class="share-btn share-btn-twitter product-share-button btn-circle no-link bg-twitter d-inline-block m-half-all" data-network="twitter" target="_blank"
                         href="https://twitter.com/share?url={{ product.social_url }}"
                         title="Share on Twitter">
                          <i class="fa fa-twitter"></i>
                      </a>
                      <!--Google+ button -->
                      <a class="share-btn share-btn-googleplus product-share-button btn-circle no-link bg-google d-inline-block m-half-all" data-network="gplus" target="_blank"
                         href="https://plus.google.com/share?url={{ product.social_url }}"
                         title="Share on Google+">
                          <i class="fa fa-google-plus"></i>
                      </a>
                      <a class="share-btn share-btn-branded product-share-button share-btn-pinterest btn-circle no-link bg-pinterest c-pointer d-inline-block m-half-all" target="_blank">
                           <i class="fa fa-pinterest"></i>
                      </a>
                  </div>
          	</div>
            <div class="modal-footer modal-mobile-footer">
                <span class="btn btn-default pull-right" data-dismiss="modal" aria-label="Close">{{ 'Cerrar' | translate }}<span>
            </div>
    	</div>
	</div>
</div>