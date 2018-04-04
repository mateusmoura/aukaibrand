{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
	<h1 class="title">{{ "Desculpe, mas a página que você está procurando não existe." | translate }}</h1>
    <h2>{{ "Talvez você se interesse pelos seguintes produtos:" | translate }}</h2>
	
    <div class="listado">
    {% snipplet "product_grid.tpl" with products = sections.slider.products %}
    </div>
    
	<div class="clear"></div>
</div><!--content-->