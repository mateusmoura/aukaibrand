<div id="sidebar">
	<div id="finder" class="clear">
		<form method="get" action="/search">
			<input type="text" name="q" value="{% if template == 'search' %}{{ query}}{% endif %}" class="field" /> 
			<input type="submit" value="{{"Buscar" | translate }}" class="submit" />
		</form>
	</div>
	{% if categories %}
	<div id="collections" class="section">
		<div class="title">
			<h4>{{ "Categorías" | translate }}</h4>
		</div>
		<ul class="collection-list">
			{% snipplet "categories.tpl" %}
		</ul>
	</div>
	{% endif %}
    {% if "banner-sidebar.jpg" | has_custom_image %}
        <div class="banner-sidebar">
            {% if settings.banner_sidebar_url != '' %}
                {{ "banner-sidebar.jpg" | static_url | img_tag | a_tag(settings.banner_sidebar_url) }}
            {% else %}
                {{ "banner-sidebar.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}
</div>