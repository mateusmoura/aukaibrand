<div class="container page user-content">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ page.name }}</h1></legend></fieldset>
			</div>
		</div>
	</div>	
	<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
		<ul class="breadcrumb-custom" itemprop="breadcrumb">
			<li>
				<a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
			</li>
			<li>
				<span class="separator">></span>
				<span class="crumb"><strong>{{ page.name }}</strong></span>
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			{{ page.content }}
		</div>
	</div>
</div>