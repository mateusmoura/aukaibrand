<div id="content" class="contacto">
	<h1 class="title">{{ "Contacto" | translate }}</h1>
	
	<div class="text">
		<p>{{ store.contact_intro }}</p>
		<ul class="social">
			{% if store.facebook %}
				<li class="facebook"><a target="_blank" href="{{ store.facebook }}">{{ "Síguenos en Facebook" | translate }}</a></li>
			{% endif %}
			{% if store.twitter %}
				<li class="twitter"><a target="_blank" href="{{ store.twitter }}">{{ "Síguenos en Twitter" | translate }}</a></li>
			{% endif %}
			{% if store.google_plus %}
				<li class="google_plus"><a target="_blank" href="{{ store.google_plus }}">{{ "Agrega a tus círculos" | translate }}</a></li>
			{% endif %}			
			{% if store.pinterest %}
				<li class="pinterest"><a target="_blank" href="{{ store.pinterest }}">{{ "Síguenos en Pinterest" | translate }}</a></li>
			{% endif %}			
			{% if store.instagram %}
				<li class="instagram"><a target="_blank" href="{{ store.instagram }}">{{ "Síguenos en Instagram" | translate }}</a></li>
			{% endif %}
			{% if store.phone %}
				<li class="telefono">{{ store.phone }}</li>
			{% endif %}
			{% if store.email %}
				<li class="mail"><a href="mailto:{{ store.email }}">{{ store.email }}</a></li>
			{% endif %}
			{% if store.address %}
				<li class="direccion">{{ store.address }}</li>
			{% endif %}
		</ul>
	</div><!--text-->
	
	<form action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
		<input type="hidden" value="{{ product.id }}" name="product"/>
        <input type="hidden" name="type" value="contact" />

		{% if contact %}
			{% if contact.success %}
				<div class="contact-ok">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
			{% else %}
				<div class="contact-error">{{ "Debes completar los datos de contacto." | translate }}</div>
			{% endif %}
		{% endif %}
		
		<label>{{ "Nombre" | translate }}</label>
		<input type="text" id="name" name="name"/>
		<div class="clear"></div>
		
		<label>{{ "Teléfono" | translate }}</label>
		<input type="text" id="phone" name="phone"/>
		<div class="clear"></div>
		
		<label>{{ "Email" | translate }}</label>
		<input type="text" id="email" name="email"/>
		<div class="clear"></div>

        <div class="winnie-pooh">
            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
        </div>

		<label>{{ "Consulta" | translate }}</label>
		<textarea name="message" rows="4" cols="6"></textarea>
		<div class="clear"></div>
		
		<div class="button">
			<input type="submit" value="{{ 'Enviar' | translate }}" name="contact" />
		</div>
		
		
		<div class="clear"></div>
	</form>
			
	<div class="clear"></div>
	
</div><!--content-->
