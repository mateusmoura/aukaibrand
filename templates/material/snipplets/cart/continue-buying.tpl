{% set last_item_added = (cart.items | first) %}
<a href="{{ last_item_added.product.category.url }}" class="btn btn-info continue-buying col-xs-12 col-sm-9 col-md-9 col-lg-9 m-half-top hidden-xs">{{ 'Seguir comprando' | translate }}</a>    