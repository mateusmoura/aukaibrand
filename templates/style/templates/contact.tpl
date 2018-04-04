<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ "Contacto" | translate }}</h1></legend></fieldset>
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
				<span class="crumb"><strong>{{ "Contacto" | translate }}</strong></span>
			</li>
		</ul>
	</div>
	<div class="row">
		{% set contactColCount = 2 %}
		{% if store.contact_intro or store.email or store.phone or store.blog or store.address or settings.show_map_on_contact %}
			{% set contactColCount = 2 %}
		{% else %}
			{% set contactColCount = 1 %}
		{% endif %}
		{% if contactColCount == 2 %}
			<div class="col-md-6">
				{% if store.contact_intro or store.email or store.phone or store.blog or store.address %}
					<h2>{{ "Contactanos" | translate }}</h2>
				{% endif %}

				{% if store.contact_intro %}
					<p>{{ store.contact_intro }}</p>
				{% endif %}

				<ul class="contact-info">
					{% if store.phone %}
						<li><i class="fa fa-phone"></i>{{ store.phone }}</li>
					{% endif %}
					{% if store.email %}
						<li><i class="fa fa-envelope"></i>{{ store.email | mailto }}</li>
					{% endif %}
					{% if store.blog %}
						<li><a target="_blank" href="{{ store.blog }}"><i class="fa fa-comments"></i>{{ "Visita nuestro Blog!" | translate }}</a></li>
					{% endif %}
					{% if store.address %}
						<li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
					{% endif %}								
				</ul>
				{% set show_map = settings.show_map_on_contact and store.address %}
				{% if show_map %}
				<div id="google-map"></div>
				{% endif %}
			</div>
		{% endif %}
		{% if contactColCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-12">
		{% endif %}
			{% if product %}  
				<div class="bg-info bg-contact-product clearfix">
					<p>
						{{ "Usted está consultando por el siguiente producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}
					</p>
					<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
				</div>
			{% endif %}		
			{% if contact %}
				{% if contact.success %}
				<p class="bg-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</P>
				{% else %}
				<p class="bg-danger">{{ "Debes completar los datos de contacto." | translate }}</P>
				{% endif %}
			{% endif %}	
			<form class="contact-form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
				<input type="hidden" value="{{ product.id }}" name="product"/>
                <input type="hidden" name="type" value="contact" />
				<div class="form-group">
					<label for="name"><h3>{{ "Nombre" | translate }}:</h3></label>
					<input type="text" class="form-control" id="name" name="name">
				</div>
				<div class="form-group">
					<label for="email"><h3>{{ "Email" | translate }}:</h3></label>
					<input type="email" class="form-control" id="email"  name="email">
				</div>
				<div class="form-group winnie-pooh">
					<label for="winnie-pooh"><h3>{{ "No completar este campo" | translate }}:</h3></label>
					<input type="text" class="form-control" id="winnie-pooh" name="winnie-pooh">
				</div>
				<div class="form-group">
					<label for="phone"><h3>{{ "Teléfono" | translate }} ({{ "Opcional" | translate }}):</h3></label>
					<input type="text" class="form-control" id="phone" name="phone">
				</div>
				<div class="form-group">
					<label for="message"><h3>{{ "Mensaje" | translate }} ({{ "Opcional" | translate }}):</h3></label>
					<textarea id="message" name="message" class="form-control" rows="7"></textarea>
				</div>
				<input type="hidden" value="contact" name="type"/>
				<input type="submit" class="general-button" value="{{ 'Enviar' | translate }}" name="contact"/>
			</form>
		</div>
	</div>
</div>