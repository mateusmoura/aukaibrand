{% if "banner-contact.jpg" | has_custom_image %}
    {% set banner_contact %}
    <div class="banner-innerpage-content contact-banner" id="banner-innerpage">
        <div class="banner-innerpage-cover"></div>
        {% if settings.banner_contact_description %}
            <div class="container text-banner">
                <div class="row inside">
                    <div class="col-xs-12">
                        <h2 class="banner-copy {% if settings.banner_contact_align == "aligncontact_left" %}text-left
                        {% elseif settings.banner_contact_align == "aligncontact_right" %}text-right
                        {% else %}text-center{% endif %}">
                            {{ settings.banner_contact_description }}
                        </h2>
                    </div>
                </div>
            </div>
        {% endif %}
    </div>
    {% endset %}
    {% if settings.banner_contact_url %}
        <a class="banner-innerpage-link" href="{{ settings.banner_contact_url | raw }}">{{ banner_contact }}</a>
    {% else %}
        {{ banner_contact }}
    {% endif %}
{% endif %}

<div class="page-contact page container">
    <div class="headerBox-Page">
        <h1>{{ "Contacto" | translate }}</h1>
    </div>
    <hr class="featurette-divider">
    <div class="row">

        <div class="col-md-7">
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
            {% if store.contact_intro %}
                <p>{{ store.contact_intro }}</p>
            {% endif %}
            <div class="form">
                {% if contact and contact.type == 'contact' %}
                    {% if contact.success %}
                        <div class="alert alert-success"><i class="fa  fa-check-circle"
                                                            style="margin-right:10px;"></i>{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}
                        </div>
                    {% else %}
                        <div class="alert alert-danger"><i class="fa fa-exclamation-triangle"
                                                           style="margin-right:10px;"></i>{{ "Debes completar los datos de contacto." | translate }}
                        </div>
                    {% endif %}
                {% endif %}

                <form role="form" class="contact_form" action="/winnie-pooh" method="post"
                      onsubmit="$(this).attr('action', '');">
                    <input type="hidden" value="{{ product.id }}" name="product"/>
                    <input type="hidden" name="type" value="contact" />

                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="{{ "Nombre" | translate }}"/>
                    </div>

                    <div class="form-group">
                        <input type="email" class="form-control" id="email" name="email" placeholder="{{ "E-mail" | translate }}"/>
                    </div>

                    <div class="form-group hide">
                        <input id="winnie-pooh" type="text" name="winnie-pooh" placeholder="{{ "No completar este campo" | translate }}"/>
                    </div>

                    <div class="form-group">
                        <input class="form-control" type="text" id="phone" name="phone" placeholder="{{ "Teléfono" | translate }}"/>
                    </div>

                    <div class="form-group">
                        <textarea id="message" class="form-control" name="message" cols="20" rows="5"
                                  placeholder="{{ "Mensaje" | translate }}"></textarea>
                    </div>
                    <input type="hidden" name="type" value="contact" />
                    <input type="submit" class="btn btn-primary btn-lg" value="{{ 'Enviar' | translate }}"
                           name="contact">
                </form>
            </div>
        </div>
        <div class="col-md-5 sidebar">
            <div class="row">
                <div class="col-md-10 col-md-offset-2">
                    {% if store.address and settings.show_map_on_contact %}
                        <div id="google-map"></div>
                    {% endif %}
                    <ul class="list-unstyled">
                        {% if store.phone %}
                            <li class="phone">{{ store.phone }}</li>
                        {% endif %}
                        {% if store.email %}
                            <li class="mail"><strong>{{ store.email | mailto }}</strong></li>
                        {% endif %}
                        {% if store.blog %}
                            <li class="blog">
                                <a target="_blank" href="{{ store.blog }}">{{ "Visita nuestro Blog!" | translate }}</a>
                            </li>
                        {% endif %}
                        {% if store.address %}
                            <li class="address">{{ store.address }}</li>
                        {% endif %}
                    </ul>
                </div>
            </div>
            {% set has_social = store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
            {% if has_social %}
            <div class="row">
                <div class="col-md-10 col-md-offset-2">
                    <h3>{{ "También puedes encontrarnos en:" | translate }}</h3>
                    <hr>
                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                        {% set sn_url = attribute(store,sn) %}
                        <ul class="list-unstyled">
                            {% if sn_url %}
                                <li class="{{ sn }}">
                                    <a target="_blank" href="{{ sn_url }}">{{ "{1}" | translate(sn | replace('_', ' ') | capitalize) }}</a>
                                </li>
                            {% endif %}
                        </ul>
                    {% endfor %}
                </div>
            </div>
            {% endif %}
        </div>
    </div>
</div>