<div id="content" class="contacto">
	<h1 class="title">{{ "Contato" | translate }}</h1>
	
	<div class="text">
    
            {% if product %}
		<h2>{{ "Produto seleccionado" | translate }} </h2>
		<div class="prod_sel">
			
				<img src="{{ product.featured_image | product_image_url('small') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}" class="img_ps" />
		
			<div class="datos">
				<em>{{ "Procurar por:" | translate }} </em><br />
				{{ product.name | a_tag(product.url) }}
			</div>
		</div>
	{% endif %}
		<p>{{ store.contact_intro }}</p>
		<ul class="social">
			{% if store.facebook %}
				<li class="Facebook"><a target="_blank" href="{{ store.facebook }}">{{ "Curta nossa página no Facebook" | translate }}</a></li>
			{% endif %}
			{% if store.twitter %}
				<li class="Twitter"><a target="_blank" href="{{ store.twitter }}">{{ "Siga-nos no Twitter" | translate }}</a></li>
			{% endif %}			
			{% if store.google_plus %}
				<li class="google_plus"><a target="_blank" href="{{ store.google_plus }}">{{ "Adicione aos seus círculos" | translate }}</a></li>
			{% endif %}			
			{% if store.pinterest %}
				<li class="pinterest"><a target="_blank" href="{{ store.pinterest }}">{{ "Siga-nos no Pinterest" | translate }}</a></li>
			{% endif %}			
			{% if store.instagram %}
				<li class="instagram"><a target="_blank" href="{{ store.instagram }}">{{ "Siga-nos no Instagram" | translate }}</a></li>
			{% endif %}
            {% if store.phone %}
				<li class="telefono">{{ store.phone }}</li>
			{% endif %}
			{% if store.email %}
				<li class="mail"><a href="mailto:{{ store.email }}">{{ store.email }}</a></li>
			{% endif %}
			{% if store.blog %}
                <li class="blog"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
            {% endif %}
			{% if store.address %}
				<li class="direccion">{{ store.address }}</li>
			{% endif %}
		</ul>
	</div><!--text-->
	
	<form action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
		<input type="hidden" value="{{ product.id }}" name="product"/>

		{% if contact and contact.type == 'contact' %}
			{% if contact.success %}
				<div class="contact-ok">{{ "A mensagem foi enviada com sucesso, muito obrigado." | translate }}</div>
			{% else %}
				<div class="contact-error">{{ "Verifique os dados digitados para que possamos entrar em contato." | translate }}</div>
			{% endif %}
		{% endif %}
		
		<label>{{ "Nome" | translate }}</label>
		<input type="text" id="name" name="name"/>
		<div class="clear"></div>
		
		<label>{{ "Telefone" | translate }} <span class="mini-text">(Opcional)</span></label>
		<input type="text" id="phone" name="phone"/>
		<div class="clear"></div>
		
		<label>{{ "E-mail" | translate }}</label>
		<input type="text" id="email" name="email"/>
		<div class="clear"></div>

        <div class="winnie-pooh">
            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
        </div>

		<label>{{ "Consulta" | translate }} <span class="mini-text">(Opcional)</span></label>
		<textarea name="message" rows="4" cols="6"></textarea>
		<div class="clear"></div>
		
		<div class="button">
			<input type="submit" value="{{ 'Enviar' | translate }}" name="contact" />
		</div>
		
		
		<div class="clear"></div>
	</form>
			
	<div class="clear"></div>
	
</div><!--content-->
