
<div id="categories-column" class="pull-left hidden-phone sidebar-home">
	 <h4 class="cat-title">{{ "Categorías principales" | translate }}</h4>
	<div class="sidebar">
    	<ul id="categories-list" class="home-categories-list pull-left clear">
    		{% for category in categories %}
					<li data-item="{{ loop.index }}" class="pull-left clear no-subcategory">
						<a href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a>
					</li>
			{% endfor %}
		</ul>
		 <a href="#" id="show-more-cats" style="display: none;" title="{{ 'Mostrar más categorías' | translate }}"><i class="fa fa-angle-down"></i></a>
    </div>
</div>

