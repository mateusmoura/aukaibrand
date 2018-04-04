	<div id="footer" class="clear">
        {% if settings.show_footer_fb_like_box and store.facebook %}
            <div style="margin:10px 0;">
                {{ store.facebook | fb_page_plugin(894,190) }}
            </div>
        {% endif %}
		<div class="col-1">
			<div>
				{% if store.email %}
					<div><strong>{{ "Email" | translate }}:</strong> <a href="mailto:{{ store.email }}">{{ store.email }}</a></div>
				{% endif %}
				{% if store.phone %}
					<div><strong>{{ "Teléfono" | translate }}:</strong> {{ store.phone }}</div>
				{% endif %}
				{% if store.address %}
					<div><strong>{{ "Dirección" | translate }}:</strong> {{ store.address }}</div>
				{% endif %}
			</div>
			<div>
				{#
					La leyenda que aparece debajo de esta linea de código debe mantenerse 
					con las mismas palabras y con su apropiado link a Tienda Nube; 
					como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso . 
					Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a 
					tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.

					Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas 
					palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso: 
					http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo 
					e a posição dos créditos para que ele se adque ao seu site. Porém você precisa 
					manter visivél e com um link funcionando.
				#}
				<p>&copy; {{ "now" | date("Y") }} {{ store.business_name ? store.business_name : store.name }} {{ store.business_id }}. {{ powered_by_link }}</p>
			</div>
		</div>
		<div class="col-2">
            <div class="social">
                {% if store.facebook %}
                <a href="{{ store.facebook }}" target="_blank" >
                    <img src="{{ "logo-face.png" | static_url }}" alt="facebook" name="facebook" width="29" height="29" id="facebook" />
                </a>
                {% endif %}
                {% if store.twitter %}
                <a href="{{ store.twitter }}" target="_blank" >
                    <img src="{{ "logo-twitter.png" | static_url }}" alt="twitter" name="twitter" width="29" height="29" id="twitter" />
                </a>
                {% endif %}
				{% if store.google_plus %}
				<a href="{{ store.google_plus }}" target="_blank" rel="publisher">
					<img src="{{ "logo-gplus.png" | static_url }}" alt="Google Plus"  title="Google Plus" name="Google Plus" width="29" height="29" id="gplus-bottom" />
				</a>
				{% endif %}					
				{% if store.pinterest %}
				<a href="{{ store.pinterest }}" target="_blank">
					<img src="{{ "logo-pinterest.png" | static_url }}" alt="Pinterest"  title="Pinterest" name="Pinterest" width="29" height="29" id="pinterest-bottom" />
				</a>
				{% endif %}					
				{% if store.instagram %}
				<a href="{{ store.instagram }}" target="_blank">
					<img src="{{ "logo-instagram.png" | static_url }}" alt="Instagram"  title="Instagram" name="Instagram" width="29" height="29" id="instagram-bottom" />
				</a>
				{% endif %}
            </div>
            <div class="payments">
                {% for payment in settings.payments %}
                    {{ payment | payment_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
            <div class="shipping">
                {% for shipping in settings.shipping %}
                    {{ shipping | shipping_logo | img_tag('', {'height' : 29}) }}
                {% endfor %}
            </div>
            <div class="seals">
                {% if ebit %}
                    {{ ebit }}
                {% endif %}
                {% if store.afip %}
		            <div class="afip">
		            {{ store.afip | raw }}
		            </div>
	            {% endif %}
            </div>
		</div>
	</div>
