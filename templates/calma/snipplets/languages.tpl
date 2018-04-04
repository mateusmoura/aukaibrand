{% if languages | length > 1 %}
	<div class="span-7 last">
		<div id="idioma">
			{% for language in languages %}
				<a href="{{ language.url }}" class="{{ language.active ? 'selected' : '' }} ">{{ language.country | flag_url | img_tag(language.name) }}</a>
			{% endfor %}
		</div>
	</div>
{% endif %}
