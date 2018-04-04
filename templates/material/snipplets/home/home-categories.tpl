<section id="home-categories" class="container-fluid p-none hidden-xs m-top drop-shadow">
	 <h3 class="cat-title text-center">{{ "Categorías principales" | translate }}</h3>
	<ul id="categories-list" class="list-style-none text-center p-none m-top m-bottom container">
		{% for category in categories %}
			<li data-item="{{ loop.index }}" class="clear no-subcategory d-inline-block label label-default pill-container">
				<a href="{{ category.url }}" title="{{ category.name }}" class="font-weight-normal text-uppercase no-link pill">{{ category.name }}</a>
			</li>
		{% endfor %}
	</ul>
</section>

<div class="horizontal-container mobile-categories p-none m-half-bottom visible-xs">
    <ul class="list-style-none p-left-none p-half-top m-none-bottom p-half-bottom">
        {% for category in categories %}
            <li data-item="{{ loop.index }}" class="pill-container d-inline-block"><a class="no-link pill big label label-primary contrast" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
        {% endfor %}
    </ul>
</div>
