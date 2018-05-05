{% if "foto-contacto.jpg" | has_custom_image %}
        <div class="row-fluid">
            <div class="banner">
                {% if settings.foto_contacto_url != '' %}
                    {{ "foto-contacto.jpg" | static_url | img_tag | a_tag(settings.foto_contacto_url) }}
                {% else %}
                    {{ "foto-contacto.jpg" | static_url | img_tag }}
                {% endif %}
            </div>
        </div>
{% endif %}

<div class="wrapper" id="contact-page">
    <div class="row-fluid">
    	<div class="container">
        	<div class="span6">
                <h1>{{ "Contacto" | translate }}</h1>
               
                {% if settings.descr_contacto %}
                    <p>{{ settings.descr_contacto }}</p>
                {% endif %}
                {% if store.contact_intro %}
                    <p>{{ store.contact_intro }}</p>
                {% endif %}
    		</div>
            <div class="span6">
                  {% if product %}
                        <div class="prod-consult">
                            <div class="span12">
                                <label>
                                    {{ "Consulta por:" | translate }} {{ product.name | a_tag(product.url) }}
                                </label>
                            </div>
                            <div class="span12">
                                <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}" />
                            </div>
                        </div>
                    {% endif %}
            	<div class="form">
                    <form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        <input type="hidden" value="{{ product.id }}" name="product"/>
                        <input type="hidden" name="type" value="contact" />
        
                        <div class="field">
                            <div class="span11">                           
                            	<input type="text" id="name" name="name" placeholder="{{ "Nombre" | translate }}"/>
                            </div>
                        </div>
                    
                        <div class="field">
                            <div class="span11">
                            	<input type="email" id="email" name="email" placeholder="{{ "Email" | translate }}"/>
                            </div>
                        </div>
        
                        <div class="field winnie-pooh">
                            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                        </div>
        
                        <div class="field">
                            <div class="span11">
                            	<input type="text" id="phone" name="phone" placeholder="{{ "Teléfono" | translate }} ({{ "Opcional" | translate }})"/>
                            </div>
                        </div>
                    
                        <div class="field">
                            <div class="span11">
                            	<textarea id="message" name="message" cols="20" rows="5" placeholder="{{ "Mensaje" | translate }} ({{ "Opcional" | translate }})"></textarea>
                                {% if contact and contact.type == 'contact' %}
                                    {% if contact.success %}
                                        <div class="alert alert-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
                                    {% else %}
                                        <div class="alert alert-error">{{ "Debes completar los datos de contacto." | translate }}</div>
                                    {% endif %}
                                {% endif %}
                                <input type="hidden" name="type" value="contact" />
                            	<input type="submit" class="submit_button" value="{{ 'Enviar' | translate }}" name="contact"/>
                            </div>
                        </div>
                    </form>
                </div>	
            </div>
        </div>
    </div>
</div>
{% if store.address or store.phone or store.email or store.blog %}
    {% set show_map = settings.map_contacto and store.address %}
    <div class="row-fluid">
        <div class="container">
            <div class="span{% if show_map %}6{% else %}12{% endif %}">
                <div class="contact-dates">
                    <h2>{{ "Datos de contacto" | translate }}</h2>
                    {% if store.address %}
                        <li class="address"><i class="fa fa-map-marker"></i> {{ store.address }}</li>
                    {% endif %}
                    {% if store.phone %}
                        <li class="phone"><i class="fa fa-phone-square"></i> {{ store.phone }}</li>
                    {% endif %}
                    {% if store.email %}
                        <li class="mail"><i class="fa fa-envelope"></i> {{ store.email | mailto }}</li>
                    {% endif %}
                    {% if store.blog %}
                        <li class="blog"><i class="fa fa-quote-right"></i> <a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                    {% endif %}
                 </div>
            </div>
            {% if show_map %}
                <div class="span6">
                    <div class="contact-dates">
                        <h2>{{ "Mapa de ubicación" | translate }}</h2>
                        <div id="gmap3" class="gmap3"></div>
                    </div>
                </div>
            {% endif %}
        </div>
    </div>
{% endif %}


    
	