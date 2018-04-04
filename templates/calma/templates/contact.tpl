
<h2 class="light">{{ "Contacto" | translate }}</h2>

<div class="contentBox contact">
	<div class="form">
		{% if contact and contact.type == 'contact' %}
			{% if contact.success %}
				<div class="box">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
			{% endif %}
		{% endif %}
		<form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
			<input type="hidden" value="{{ product.id }}" name="product"/>

			<div class="field {% if contact and not contact.name %}err{% endif %}">
				<label for="name">{{ "Nombre" | translate }}</label>
				<input type="text" id="name" name="name" value="{{ contact.success ? '' : contact.name }}" />
			</div>
		
			<div class="field {% if contact and not contact.email | is_valid_email %}err{% endif %}">
				<label for="email">{{ "Email" | translate }}</label>
				<input type="text" id="email" name="email" value="{{ contact.success ? '' : contact.email }}" />
			</div>

            <div class="field winnie-pooh">
                <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                <input id="winnie-pooh" type="text" name="winnie-pooh"/>
            </div>
		
			<div class="field">
				<label for="phone">
					{{ "Teléfono" | translate }}
					<span class="mini-text">({{ "Opcional" | translate }})</span>
				</label>
				<input type="text" id="phone" name="phone" value="{{ contact.success ? '' : contact.phone }}" />
			</div>
		
			<div class="field">
				<label for="message">
					{{ "Mensaje" | translate }} <span class="mini-text">({{ "Opcional" | translate }})</span>
				</label>
				<textarea id="message" name="message" cols="20" rows="5">{{ contact.success ? '' : contact.message }}</textarea>
			</div>	
		
			<input type="hidden" value="contact" name="type"/>
			<div class="submit">
				<input type="submit" class="button" value="{{ 'Enviar' | translate }}" name="contact"/>
			</div>
		</form>
	</div>
</div>
