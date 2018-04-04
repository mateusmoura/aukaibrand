{% if product %}
<div id="cart">
	<div id="content">
	<table cellpadding="0" cellspacing="0">
		<tr class="odd">
			<td class="pic">
				<div><a href="{{ product.url }}">{{ product.featured_image | product_image_url("tiny") | img_tag(product.name) }}</a></div>
			</td>
			<td>
				<h3><a href="{{ product.url }}">{{ product.name }}</a></h3>
			</td>
		</tr>
	</table>
	</div>
</div>
{% endif %}
<div id="overview" class="clear">	
	<div class="headerBox">
		<h1 id="title">{{ "Contacto" | translate }}</h1>
	</div>
	<div class="contentBox contact">
		<div class="info">
			{% if store.contact_intro %}
				<p>{{ store.contact_intro }}</p>
			{% endif %}
		</div>
		<div class="form">
			{% if contact and contact.type == 'contact' %}
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
					<input type="text" class="field" id="name" name="name"/>
				</div>
			
				<div class="field">
					<label for="email">{{ "Email" | translate }}</label>
					<input type="text" class="field" id="email" name="email"/>
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
					<input type="text" class="field" id="phone" name="phone"/>
				</div>
			
				<div class="field">
					<label for="message">
						{{ "Mensaje" | translate }}
						<span class="mini-text">({{ "Opcional" | translate }})</span>	
					</label>
					<textarea id="message" name="message" cols="20" rows="5"></textarea>
				</div>		
			
				<input type="hidden" value="contact" name="type"/>
				<input type="submit" class="submit" value="{{ 'Enviar' | translate }}" name="contact"/>
			</form>
		</div>
	</div>
</div>
