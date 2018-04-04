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
    <div class="headerBox-List">
        <div class="container c">
            <h1>{{ "Contacto" | translate }}</h1>
        </div>
        <div class="container c">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
</div>
<div class="container-fluid" id="contact-page">
    <div class="row-fluid">
        <div class="{% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}span7 {% else %}span4 {% endif %}">
            {% if store.contact_intro %}
                <h2>{{ store.contact_intro }}</h2>
            {% endif %}
            <div class="row-fluid">
                <div class="{% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}span6 {% else %}span12 {% endif %}contact-dates">
                    <h3>{{ "Datos de Contacto" | translate }}</h3>
                    {% if store.phone %}
                        <li class="phone">{{ "Teléfono:" | translate }} <span>{{ store.phone }}</span></li>
                    {% endif %}
                    {% if store.email %}
                        <li class="mail">{{ "Email:" | translate }} <span>{{ store.email | mailto }}</span></li>
                    {% endif %}
                    {% if store.address %}
                        <li class="address">{{ "Dirección:" | translate }} <span>{{ store.address }}</span></li>
                    {% endif %}
                    {% if store.blog %}
                        <li class="blog">{{ "Blog:" | translate }} <span><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></span></li>
                    {% endif %}
                </div>
                 {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
                    <div class="span6 contact-social">
                        <h3>{{ "Redes Sociales" | translate }}</h3>
                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <li class="{{ sn }}">
                                    <a target="_blank" href="{{ sn_url }}">
                                        <i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i>
                                        {{ "{1}" | translate(sn | replace('_', ' ') | capitalize) }}
                                    </a>
                                </li>
                            {% endif %}
                        {% endfor %}
                    </div>
                {% endif %}
            </div>
        </div>
        <div class="{% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}span5 {% else %}span6{% endif %}">
            <div class="form">
                {% if product %}
                    <div class="prod-sel">
                        <p>
                            {{ "Consultar por:" | translate }} {{ product.name | a_tag(product.url) }}
                        </p>
                        <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}" />
                    </div>
                {% endif %}
                {% if contact and contact.type == 'contact' %}
                    {% if contact.success %}
                        <div class="alert alert-success clear">{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</div>
                    {% else %}
                        <div class="alert alert-danger clear">{{ "Debes completar los datos de contacto." | translate }}</div>
                    {% endif %}
                {% endif %}
                <form class="contact_form" action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                    <input type="hidden" value="{{ product.id }}" name="product"/>
                    <input type="hidden" name="type" value="contact" />
                    <div class="field">
                        <div class="span11">
                            <label for="name">{{ "Nombre" | translate }}</label>
                            <input type="text" id="name" name="name"/>
                        </div>
                    </div>
                    <div class="field">
                        <div class="span11">
                            <label for="email">{{ "Email" | translate }}</label>
                            <input type="text" id="email" name="email"/>
                        </div>
                    </div>
                    <div class="field winnie-pooh">
                        <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                        <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                    </div>
                    <div class="field">
                        <div class="span11">
                            <label for="phone">
                                {{ "Teléfono" | translate }}
                                <span class="mini-text">({{ "Opcional" | translate }})</span>
                            </label>
                            <input type="text" id="phone" name="phone"/>
                        </div>
                    </div>
                    <div class="field">
                        <div class="span11">
                            <label for="message">
                                {{ "Mensaje" | translate }}
                                <span class="mini-text">({{ "Opcional" | translate }})</span>
                            </label>
                            <textarea id="message" name="message" cols="20" rows="5"></textarea>
                            <input type="hidden" name="type" value="contact" />
                            <input id="contact_submit" type="submit" class="submit_button" value="{{ 'Enviar' | translate }}" name="contact"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>