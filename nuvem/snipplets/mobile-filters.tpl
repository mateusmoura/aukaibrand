<div class="js-mobile-filters-panel mobile-filters modal-xs modal-xs-right modal-xs-right-out visible-xs">
    <a class="js-toggle-mobile-filters modal-xs-header" href="#">
        <i class="fa fa-2x fa-angle-left modal-xs-header-icon"></i>
        <span class="modal-xs-header-text modal-xs-right-header-text">{{ 'Filtrar por:' | translate }}</span>
    </a>
    <div class="modal-xs-body">
        {% snipplet "filters.tpl" %}
    </div>
</div>
