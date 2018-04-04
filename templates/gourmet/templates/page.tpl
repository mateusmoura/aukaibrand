{% snipplet "banner_products.tpl" %}
<div class="container">
    <div class="contenido user-content">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
        <h1>{{ page.name }}</h1>
	    <div class="row vista_producto">
	    	<div class="col-md-12 datos_con">
	        	{{ page.content }}
	        </div>
	    </div>
    </div>
</div>