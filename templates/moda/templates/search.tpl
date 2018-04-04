{% snipplet "sidebar.tpl" %}
{% paginate by 18 %}
<div id="content" class="single">
    <h1 class="title">{{ "Resultados da pesquisa" | translate }}</h1>
    <div class="listado">
        {% if products %}
            {% snipplet "product_grid.tpl" %}
            <div id="pages"> {% snipplet "pagination.tpl" %}</div>
        {% else %}
            <p class="single"><strong>{{ "Não há resultados para a sua pesquisa." | translate }}</strong></p>
            {% if sections.home.products %}
                <br />
                <br />
                <p>{{ "Talvez você se interesse pelos seguintes produtos:" | translate }}</p>
                <br />
                <div class="product-table"> {% snipplet "product_grid.tpl" with products = sections.home.products %} </div>
            {% endif%}
        {% endif %}
    </div>
</div>
<!--content-->
