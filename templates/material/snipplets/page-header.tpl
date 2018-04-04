<div class="page-title-container row">
	<div class="container-fluid {% if template == 'category' %}col-tight-xs{% endif %}">
		{% if not hide_breadcrumbs %}
			<div class="hidden-xs">
		    	{% snipplet "navigation/breadcrumbs.tpl" %}
		    </div>
	    {% endif %}
	    <h1 class="clear-both{% if template == 'category' and  filter_categories %} with-categories{% endif %}">{{ page_header_title }}</h1> 
	</div>
</div>