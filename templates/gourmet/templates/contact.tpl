{% snipplet "banner_contact.tpl" %}
<div class="container">
    <div class="contenido">
        <ol class="breadcrumb">{% snipplet "breadcrumbs.tpl" %}</ol>
        <h1>{{ "Contacto" | translate }}</h1>
        <div class="row vista_producto">
            <div class="col-md-6 datos_con">
                <ul>
                    {% if store.phone %}
                        <li class="phone"><i class="fa fa-phone"></i> {{ store.phone }}</li>
                    {% endif %}
                    {% if store.email %}
                        <li class="mail"><strong><i class="fa fa-envelope"></i> {{ store.email | mailto }}</strong></li>
                    {% endif %}
                    {% if store.blog %}
                        <li class="blog">
                            <i class="fa fa-comment"></i> <a target="_blank" href="{{ store.blog }}"> {{ "Visita nuestro Blog!" | translate }}</a>
                        </li>
                    {% endif %}
                    {% if store.address %}
                        <li class="address"><i class="fa fa-map-marker"></i> {{ store.address }}</li>
                    {% endif %}
                </ul>
            </div>
            <div class="col-md-6 form_con">
                {% if store.contact_intro %}
                    <p>{{ store.contact_intro }}</p>
                {% endif %}
                <div class="form">
                    {% if contact and contact.type == 'contact' %}
                        {% if contact.success %}
                            <div class="alert alert-success"><i class="fa  fa-check-circle" style="margin-right:10px;"></i>{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}
                            </div>
                        {% else %}
                            <div class="alert alert-danger"><i class="fa fa-exclamation-triangle"
                                                               style="margin-right:10px;"></i>{{ "Debes completar los datos de contacto." | translate }}
                            </div>
                        {% endif %}
                    {% endif %}
                    {% if product %}
                        <ul class='celdas_tabla'>
                            <li class="table_prod_contact">
                                <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
                            </li>
                            <li class=".table_prod_text_contact">
                                {{ "Consulta por:" | translate }} {{ product.name | a_tag(product.url) }}
                            </li>
                        </ul>
                    {% endif %}
                    <form role="form" class="form-horizontal formulario_contacto" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                        <input type="hidden" value="{{ product.id }}" name="product"/>
                        <input type="hidden" name="type" value="contact" />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="name" name="name" placeholder="{{ "Nombre" | translate }}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="email" class="form-control" id="email" name="email" placeholder="{{ "E-mail" | translate }}"/>
                            </div>
                        </div>
                        <div class="form-group hide">
                            <input id="winnie-pooh" type="text" name="winnie-pooh" placeholder="{{ "No completar este campo" | translate }}"/>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input class="form-control" type="text" id="phone" name="phone" placeholder="{{ "Teléfono" | translate }}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <textarea id="message" class="form-control" name="message" cols="20" rows="5"
                                          placeholder="{{ "Mensaje" | translate }}"></textarea>
                            </div>
                        </div>
                        <input type="hidden" name="type" value="contact" />
                        <button type="submit" class="btn-lg boton" name="contact" value="{{ 'Enviar' | translate }}">{{ 'Enviar' | translate }}</button>
                    </form>
                </div>
            </div>
            {% snipplet "social_networks.tpl" %}
        </div>
    </div>
</div>
{% if store.address and settings.show_map_on_contact %}
    <div id="google-map"></div>
{% endif %}