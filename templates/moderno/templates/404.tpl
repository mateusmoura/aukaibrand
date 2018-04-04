<div id="content" class="listado">
	<h1 class="title">{{ "La página que estás buscando no existe." | translate }} <small>{{ "Tal vez te interesen estos productos." | translate }}</small></h1>
	{% snipplet "product_grid.tpl" with products = sections.slider.products %}
	<div class="clear"></div>
</div><!--content-->