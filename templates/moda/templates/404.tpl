{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ "Desculpe, mas a página que você está procurando não existe." | translate }}</h1>
    {% if sections.slider.products %}
        <p>{{ "Talvez você se interesse pelos seguintes produtos:" | translate }}</p>
        <br />
        <br />
        <div class="product-table">{% snipplet "product_grid.tpl" with products = sections.slider.products %}</div>
    {%else %}
        {% if sections.home.products %}
            <p>{{ "Talvez você se interesse pelos seguintes produtos:" | translate }}</p>
            <div class="product-table">{% snipplet "product_grid.tpl" with products = sections.home.products %}</div>
        {% endif%}
    {% endif%}
</div>