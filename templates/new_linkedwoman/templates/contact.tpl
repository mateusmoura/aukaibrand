<div class="page-content contact-cont">	
	<div class="headerBox-Page">
		<h1>{{ "Contacto" | translate }}</h1>
	</div>
    {% snipplet "breadcrumbs.tpl" %}
    
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
    
	<div class="row-fluid">
		<div class="contact">
            <div class="span6">
                {% if store.contact_intro %}
                    <p>{{ store.contact_intro }}</p>
                {% endif %}
                <div class="row-fluid info">
                    <div class="span7">
                       {% if store.phone %}
                            <li><i class="fa fa-phone"></i>{{ store.phone }}</li>
                        {% endif %}
                        {% if store.email %}
                            <li><i class="fa fa-envelope"></i><strong>{{ store.email | mailto }}</strong></li>
                        {% endif %}
                        {% if store.blog %}
                            <li><i class="fa fa-comment"></i><a target="_blank" href="{{ store.blog }}">{{ "Visita nuestro Blog!" | translate }}</a></li>
                        {% endif %}
                        {% if store.address %}
                            <li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
                        {% endif %}
                    </div>
                    <div class="span5">
                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <li class="{{ sn }}"><i class="fa fa-{{ sn }}"></i><a target="_blank" href="{{ sn_url }}">{{ "Siguenos en {1}" | translate(sn | replace('_', ' ') | capitalize) }}</a></li>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            </div>
            
            <div class="span6">
                <div class="form">
                    {% if product %}
                        <div class="field prod-consult">
                            <div class="span3">
                                <label>
                                    {{ "Consulta por:" | translate }} {{ product.name | a_tag(product.url) }}
                                </label>
                            </div>
                            <div class="span9">
                                <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}" />
                            </div>
                        </div>
                    {% endif %}
                    {% if contact and contact.type == 'contact' %}
                        {% if contact.success %}
                            <div class="alert alert-success">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
                        {% else %}
                            <div class="alert alert-danger">{{ "Debes completar los datos de contacto." | translate }}</div>
                        {% endif %}
                    {% endif %}
                
                    <form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        <input type="hidden" value="{{ product.id }}" name="product"/>
                        <input type="hidden" name="type" value="contact" />
        
                        <div class="field">
                        	<div class="span3">
                            <label for="name">{{ "Nombre" | translate }}</label>
                            </div>
                            <div class="span9">
                            <input type="text" id="name" name="name"/>
                            </div>
                        </div>
                    
                        <div class="field">
                        	<div class="span3">
                            <label for="email">{{ "Email" | translate }}</label>
                            </div>
                            <div class="span9">
                            <input type="text" id="email" name="email"/>
                            </div>
                        </div>
        
                        <div class="field winnie-pooh">
                            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                        </div>
        
                        <div class="field">
                            <div class="span3">
                            <label for="phone">
                                {{ "Teléfono" | translate }}<br/>
                                <span class="mini-text">({{ "Opcional" | translate }})</span>
                            </label>
                            </div>
                            <div class="span9">
                            <input type="text" id="phone" name="phone"/>
                            </div>
                        </div>
                    
                        <div class="field">
                        	<div class="span3">
                            <label for="message">
                                {{ "Mensaje" | translate }}<br/>
                                <span class="mini-text">({{ "Opcional" | translate }})</span>
                            </label>
                            </div>
                            <div class="span9">
                            <textarea id="message" name="message" cols="20" rows="5"></textarea>
                            <input type="hidden" value="contact" name="type"/>
                            <input type="submit" class="submit_button contact" value="{{ 'Enviar' | translate }}" name="contact"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
