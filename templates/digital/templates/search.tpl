{% snipplet "sidebar.tpl" %}
{% paginate by 9 %}
<div id="content" class="single">
  <h1 class="title">{{ "Resultados da pesquisa" | translate }}</h1>
  <div class="listado"> {% if products %}
    {% snipplet "product_grid.tpl" %}
    {% else %}
    <p class="single">{{ "Não há resultados para a sua pesquisa." | translate }}</p>
    {% endif %} </div>
  <div class="clear"></div>
  <div id="pages"> {% snipplet "pagination.tpl" %}
    <div class="clear"></div>
  </div>
</div>
<!--content-->
