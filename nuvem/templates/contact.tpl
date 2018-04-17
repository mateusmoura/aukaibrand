<div class="container">
    <div class="title-container">
	    {% snipplet "breadcrumbs.tpl" %}
   		<h1 class="title">{{ "Contacto" | translate }}</h1>
    </div>
	<div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon svg-primary-fill opacity-80 rotate">
           	{% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
	<div class="row visible-when-content-ready">
		{% set contactColCount = 2 %}
		{% if store.contact_intro or store.email or store.phone or store.blog or store.address or settings.show_map_on_contact %}
			{% set contactColCount = 2 %}
		{% else %}
			{% set contactColCount = 1 %}
		{% endif %}
		{% if contactColCount == 2 %}
			<div class="col-md-6">
				{% if store.contact_intro or store.email or store.phone or store.blog or store.address %}
					<h4>{{ "Contactanos" | translate }}</h4>
				{% endif %}

				{% if store.contact_intro %}
					<p class="m-bottom">{{ store.contact_intro }}</p>
				{% endif %}

				<ul class="contact-info list-unstyled">
					{% if store.phone %}
						<li class="m-bottom"><i class="fa fa-phone fa-lg m-right-quarter"></i>{{ store.phone }}</li>
					{% endif %}
					{% if store.email %}
						<li class="m-bottom"><i class="fa fa-envelope fa-lg m-right-quarter"></i>{{ store.email | mailto }}</li>
					{% endif %}
					{% if store.blog %}
						<li class="m-bottom"><a target="_blank" href="{{ store.blog }}"><i class="fa fa-comments fa-lg m-right-quarter"></i>{{ "Visita nuestro Blog!" | translate }}</a></li>
					{% endif %}
					{% if store.address %}
						<li class="m-bottom"><i class="fa fa-map-marker fa-lg m-right-quarter"></i>{{ store.address }}</li>
					{% endif %}								
				</ul>
				{% set show_map = settings.show_map_on_contact and store.address %}
				{% if show_map %}
				<div id="google-map" class="map m-bottom"></div>
				{% endif %}
			</div>
		{% endif %}
		{% if contactColCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-12">
		{% endif %}
			{% if product %}  
				<div class="m-bottom"> 
					<p>{{ "Usted está consultando por el siguiente producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}</p>
					<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
				</div>
			{% endif %}		
			{% if contact %}
				{% if contact.success %}
				<div class="alert alert-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
				{% else %}
				<div class="alert alert-danger">{{ "Debes completar los datos de contacto." | translate }}</div>
				{% endif %}
			{% endif %}	
			<form class="contact-form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
				<input type="hidden" value="{{ product.id }}" name="product"/>
                <input type="hidden" name="type" value="contact" />
				<div class="form-group">
					<label for="name">{{ "Nombre" | translate }}:</label>
					<input type="text" class="form-control" id="name" name="name">
				</div>
				<div class="form-group">
					<label for="email">{{ "Email" | translate }}:</label>
					<input type="email" class="form-control" id="email"  name="email">
				</div>
				<div class="form-group winnie-pooh hidden">
					<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
					<input type="text" class="form-control" id="winnie-pooh" name="winnie-pooh">
				</div>
				<div class="form-group">
					<label for="phone">{{ "Teléfono" | translate }} ({{ "Opcional" | translate }}):</label>
					<input type="text" class="form-control" id="phone" name="phone">
				</div>
				<div class="form-group">
					<label for="message">{{ "Mensaje" | translate }} ({{ "Opcional" | translate }}):</label>
					<textarea id="message" name="message" class="form-control" rows="7"></textarea>
				</div>
				<input type="hidden" value="contact" name="type"/>
				<input type="submit" class="btn btn-secondary full-width-xs pull-right" value="{{ 'Enviar' | translate }}" name="contact"/>
			</form>
		</div>
	</div>
</div>
