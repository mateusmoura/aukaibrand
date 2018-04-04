<div class="page-content">	

	<div class="headerBox">
		<h2>{{ "Contacto" | translate }}</h2>
	</div>
	<div class="contentBox contact">
		<div class="info">
			{% if store.contact_intro %}
				<p>{{ store.contact_intro }}</p>
			{% endif %}
			<ul>
				{% if store.address %}
					<li><strong>{{ "Dirección" | translate }}:</strong> {{ store.address }}</li>
				{% endif %}
				{% if store.email %}
					<li><strong>{{ "Email" | translate }}:</strong> <a href="mailto:{{ store.email }}">{{ store.email }}</a></li>
				{% endif %}
				{% if store.phone %}
					<li><strong>{{ "Teléfono" | translate }}:</strong> {{ store.phone }}</li>
				{% endif %}
				{% if store.blog %}
					<li><strong>{{ "Blog" | translate }}:</strong> {{ store.blog | a_tag_blank(store.blog) }}</li>
				{% endif %}
				
				{% if store.twitter or store.facebook or store.google_plus or store.pinterest or store.instagram %}
				<li class="social">
					<strong style="float:left">{{ "Siguenos en" | translate }}</strong>
					{% if store.facebook %}
					<a href="{{ store.facebook }}" title="Facebook" class="social-icon" id="fb-icon">Facebook</a>
					{% endif %}
					{% if store.twitter %}
					<a href="{{ store.twitter }}" title="Twitter" class="social-icon" id="twitter-icon">Twitter</a>
					{% endif %}
					{% if store.google_plus %}
					<a href="{{ store.google_plus }}" title="Google Plus" class="social-icon" id="gplus-icon">Google Plus</a>
					{% endif %}
					{% if store.pinterest %}
					<a href="{{ store.pinterest }}" title="Pinterest" class="social-icon" id="pinterest-icon">Pinterest</a>
					{% endif %}
					{% if store.instagram %}
					<a href="{{ store.instagram }}" title="Instagram" class="social-icon" id="instagram-icon">Instagram</a>
					{% endif %}
				</li>
				{% endif %}
			</ul>
		</div>
		<div class="form">
			{% if contact %}
				{% if contact.success %}
					<div class="contact-ok">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
				{% else %}
					<div class="contact-error">{{ "Debes completar los datos de contacto." | translate }}</div>
				{% endif %}
			{% endif %}
		
			<form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
				<input type="hidden" value="{{ product.id }}" name="product"/>

				<div class="field">
					<label for="name">{{ "Nombre" | translate }}</label>
					<input type="text" id="name" name="name"/>
				</div>
			
				<div class="field">
					<label for="email">{{ "Email" | translate }}</label>
					<input type="text" id="email" name="email"/>
				</div>

                <div class="field winnie-pooh">
                    <label for="winnie-pooh" for="email">{{ "No completar este campo" | translate }}</label>
                    <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                </div>

                <div class="field">
					<label for="phone">
						{{ "Teléfono" | translate }}<br/>
						<span class="mini-text">({{ "Opcional" | translate }})</span>
					</label>
					<input type="text" id="phone" name="phone"/>
				</div>
			
				<div class="field">
					<label for="message">
						{{ "Mensaje" | translate }}<br/>
						<span class="mini-text">({{ "Opcional" | translate }})</span>
					</label>
					<textarea id="message" name="message" cols="20" rows="5"></textarea>
				</div>		
			
				<input type="submit" class="submit_button" value="{{ 'Enviar' | translate }}" name="contact"/>
			</form>
		</div>
	</div>
</div>
