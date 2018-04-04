{% for item in navigation %}
	<li class="nav-item">
		{% if item.subitems %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
				{{ item.name }}
				<span class="arrow">&#9658;</span>
			</a>
			<ul>
				{% snipplet "navigation.tpl" with navigation = item.subitems %}
			</ul>
		{% else %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		{% endif %}
	</li>
{% endfor %}