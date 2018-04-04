<div class="page-content container m-bottom">
	{% snipplet "page-header.tpl" with page_header_title = page.name , hide_breadcrumbs = true %}
	{# All user generated content has the user-content class (pages and product descriptions) #}
	<div class="user-content">
		{{ page.content }}
	</div>
</div>