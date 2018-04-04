<div class="wrapper" id="contact-page">
	<div class="container">
    	<div class="page-header-container container">
             <div class="page-header col-md-12- col-sm-12 col-xs-12 ">          
                <h1>{{ "Contacto" | translate }}</h1>
            </div>
		</div>
        {% if store.address or store.phone or store.email or store.blog %}
        <div class="col-md-6 col-sm-12 col-xs-12">
            <div class="contact-dates">
                {% if store.address %}
                    <li class="address main-fg-color"><i class="fa fa-map-marker"></i> {{ store.address }}</li>
                {% endif %}
                {% if store.phone %}
                    <li class="phone main-fg-color"><i class="fa fa-phone"></i> {{ store.phone }}</li>
                {% endif %}
                {% if store.email %}
                    <li class="mail main-fg-color"><i class="fa fa-envelope"></i> {{ store.email | mailto }}</li>
                {% endif %}
                {% if store.blog %}
                    <li class="blog main-fg-color"><i class="fa fa-quote-right"></i> <a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                {% endif %}
             </div>
        </div>
        {% endif %}
        <div class="col-md-6 col-sm-12 col-xs-12 margin-bottom-x2">
                <form class="contact_form margin-top-x2" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                    <input type="hidden" value="{{ product.id }}" name="product"/>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="{{ "Nombre" | translate }}"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="email" id="email" name="email" placeholder="{{ "Email" | translate }}"/>
                    </div>
                    <div class="field winnie-pooh">
                        <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                        <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" id="phone" name="phone" placeholder="{{ "Teléfono" | translate }} ({{ "Opcional" | translate }})"/>
                    </div>
                    <div class="form-group">
                            <textarea id="message" class="form-control" name="message" cols="20" rows="5" placeholder="{{ "Mensaje" | translate }} ({{ "Opcional" | translate }})"></textarea>
                            {% if contact and contact.type == 'contact' %}
                                {% if contact.success %}
                                    <div class="contact-ok alert alert-success">{{ "El mensaje fue enviado con éxito, muchas gracias." | translate }}</div>
                                {% else %}
                                    <div class="contact-error alert alert-warning">{{ "Tenés que completar los datos de contacto." | translate }}</div>
                                {% endif %}
                            {% endif %}
                    </div>
                    <div class="form-group text-right">
                        <input type="hidden" name="type" value="contact" />
                        <input type="submit" class="btn btn-secondary col-md-5 col-sm-12 col-xs-12 pull-right" value="{{ 'Enviar' | translate }}" name="contact"/>
                    </div>
                </form>
        </div>
    </div>
</div>



    
	