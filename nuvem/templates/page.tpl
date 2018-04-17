<div class="container page user-content">
	<div class="title-container">
	    {% snipplet "breadcrumbs.tpl" %}
   		<h1 class="title">{{ page.name }}</h1>
    </div>
	<div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon svg-primary-fill opacity-80 rotate">
           	{% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
	<div class="row visible-when-content-ready">
		<div class="col-md-12">
			{{ page.content }}
		</div>
	</div>
</div>
