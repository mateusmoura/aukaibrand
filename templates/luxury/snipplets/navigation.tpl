{% for item in navigation %}
    <li class="{{ item.current ? 'selected' : '' }}">
		{% if item.subitems %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>
				{{ item.name }}
				<span class="arrow"></span>
			</a>
			<ul>
				{% snipplet "navigation.tpl" with navigation = item.subitems %}
			</ul>
		{% else %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		{% endif %}
	</li>
{% endfor %}