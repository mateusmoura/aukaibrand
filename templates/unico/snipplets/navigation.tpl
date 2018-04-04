<ul id="links">
	{% for item in navigation %}
		<li class="link-{{ loop.index }}">
			<a href="{{ item.url }}" class="{{ item.current ? 'active' : '' }}" {% if item.url | is_external %}target="_blank"{% endif %}>
				{{ item.name }}
			</a>
		</li>
	{% endfor %}
</ul>