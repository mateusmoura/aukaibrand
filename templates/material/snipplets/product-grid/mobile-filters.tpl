{# Mobile Filters #}
<div class="modal fade bottom modal-mobile js-modal-mobile" id="filters-mobile" tabindex="-1" role="dialog" q-hidden="true">
    <div class="modal-dialog modal-lg modal-mobile-dialog m-none">
        <div class="modal-content modal-mobile-content">
    	     <div class="modal-header">
		         <span class="btn btn-default btn-close pull-right" data-dismiss="modal" aria-label="Close"><i class="material-icons">&#xE5CD;</i></span>
		        <h3 class="modal-title">{{ 'Filtrar por:' | translate }}</h3>
	      	</div>
            <div class="modal-body modal-mobile-body">
        	    {% snipplet "product-grid/sidebar-filters.tpl" %}
        	</div>
            <div class="modal-footer modal-mobile-footer">
                <a class="btn btn-default pull-right close-modal" data-dismiss="modal" aria-label="Close">{{ 'Cerrar' | translate }}</a>
            </div>
    	</div>
	</div>
</div>