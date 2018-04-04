{% for c in categories %}
	<li class="category-top">
		<a href="{{ c.url }}"{% if c.active %} class="active"{% endif %}>{{ c.name }}</a>
		{% if c.subcategories %}
			<ul class="collection-list">
				{% snipplet "categories.tpl" with categories = c.subcategories %}
			</ul>
		{% endif %}
	</li>
{% endfor %}