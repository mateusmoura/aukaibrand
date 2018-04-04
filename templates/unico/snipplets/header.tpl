<div id="header" class="clear">

	{% if has_logo %}
		<div id="logo">
			{{ store.logo | img_tag | a_tag(store.url) }}
		</div>
	{% else %}
		<h2><a href="{{ store.url }}">{{ store.name }}</a></h2>
	{% endif %}
	
	<div id="hello">
		{% if languages | length > 1 %}
			<div class="languages">
				{% for language in languages %}
					<a href="{{ language.url }}">{{ language.country | flag_url | img_tag(language.name) }}</a>
				{% endfor %}
			</div>
		{% endif %}
	
		<div class="contact-info">
			{% if store.phone %}
				<p><strong>{{ "t:" | translate }}</strong> {{ store.phone }}</p>
			{% endif %}
			{% if store.email %}
				<p><strong>{{ "e:" | translate }}</strong> <span class="email">{{ store.email }}</span></p>
			{% endif %}
		</div>
		
		<div id="finder">
			<form action="{{ store.search_url }}" method="get">
				<input class="field" type="text" name="q"/>
				<input class="submit" type="submit" value="{{ 'Buscar' | translate }}"/>
			</form>
		</div>
	</div>
</div>

