<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {{ store.name | og('site_name') }}
    {{ '//fonts.googleapis.com/css?family=Lato:100,300,400,700,900|Playfair+Display:900' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css' | css_tag }}
    {{ 'css/style.scss.tpl' | static_url | css_tag }}
    {% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}
    <!--[if lt IE 9]>
    {{ '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js' | script_tag }}
    <![endif]-->
    <style>
        {{ settings.css_code }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{back_to_admin}}
<div class="password-page">
    <div class="password-page-body">
        <div class="password-container nav-bar navbar-inverse9 container">
            <div class="navbar-brand">
                <h1 class="img logo">
                    <div class="logo-wrapper {% if not has_logo %}hidden{% endif %}">
                        {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                    </div>
                    <a id="logo" class="no-logo {% if has_logo %}hidden{% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                </h1>
            </div>
        </div>
        <div class="password-container password-icon text-center">
            <svg version="1.1" id="Capa_1" class="password-svg wiggle" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 viewBox="-62 153.1 486.9 486.9" style="enable-background:new -62 153.1 486.9 486.9;" xml:space="preserve">
						<g>
                            <path class="st0" d="M-48.6,562.1c-17.8,17.8-17.8,46.7,0,64.5c8.9,8.9,20.6,13.3,32.3,13.3s23.3-4.4,32.3-13.3l149.7-149.7
								l-64.5-64.4L-48.6,562.1z"/>
                            <polygon class="st0" points="325.5,284.7 390.8,250.9 424.9,184.9 393.1,153.1 327.1,187.3 293.3,252.4 214,331.8 246.2,364.1
								"/>
                            <path class="st0" d="M339.8,457.7l-6.1-0.6c-11.1,0-21.7,2.3-31.5,5.9L115,275.8c3.6-9.8,5.9-20.4,5.9-31.5l-0.6-6.1
								c-3.2-47.5-42.3-85.1-90.6-85.1c-14,0-27.2,3.4-39.1,9.1l60.6,60.6c3.2,3.2,5.4,7,6.8,10.9c4,10.8,1.8,23.3-6.8,32
								c-5.9,5.9-13.7,8.9-21.5,8.9c-3.6,0-7.1-0.8-10.5-2.1c-4-1.5-7.8-3.6-10.9-6.9l-60.6-60.6c-5.7,11.9-9.1,25-9.1,39.1
								c0,48.3,37.6,87.4,85.1,90.6l6.1,0.6c11.1,0,21.7-2.3,31.5-5.9l187.1,187.2c-3.6,9.8-5.9,20.4-5.9,31.5l0.6,6.1
								c3.2,47.5,42.3,85.1,90.6,85.1c14,0,27.2-3.4,39.1-9.1l-60.6-60.6c-3.2-3.2-5.4-7-6.9-10.9c-4-10.8-1.8-23.4,6.9-32.1
								c5.9-5.9,13.7-8.9,21.5-8.9c3.6,0,7.1,0.8,10.6,2.1c4,1.5,7.8,3.6,10.9,6.8l60.6,60.6c5.7-11.9,9.1-25,9.1-39.1
								C424.9,500,387.3,460.9,339.8,457.7z"/>
                        </g>
					</svg>
        </div>
        <div class="password-container password-message headerBox">
            <h2 class="text-center title">{{ message }}</h2>
        </div>
        <div class="password-container">
            {% snipplet "social_networks.tpl" %}
        </div>
        <div class="password-footer password-container">
            <footer>
                <div class="container footer">
                    {% if store.phone or store.email or store.blog or store.address%}
                        <div class=" {% if has_seals %}col-md-4 {% else %}col-md-6 {% endif %}col-xs-12 centrado_disp">
                            <h2>{{ settings.footer_contact_text }}</h2>
                            <ul>
                                {% if store.phone %}
                                    <li class="phone text-center"><i class="fa fa-phone"></i> {{ store.phone }}</li>
                                {% endif %}
                                {% if store.email %}
                                    <li class="mail text-center"><strong><i class="fa fa-envelope"></i> {{ store.email | mailto }}</strong></li>
                                {% endif %}
                                {% if store.blog %}
                                    <li class="blog text-center">
                                        <i class="fa fa-comment"></i> <a target="_blank" href="{{ store.blog }}"> {{ "Visita nuestro Blog!" | translate }}</a>
                                    </li>
                                {% endif %}
                                {% if store.address %}
                                    <li class="address text-center"><i class="fa fa-map-marker"></i> {{ store.address }}</li>
                                {% endif %}
                            </ul>
                        </div>
                    {% endif %}
                    <div class="{% if has_seals %}col-md-4 {% else %}col-md-6 {% endif %}col-xs-12">
                        <h2>{{ 'Acceso' | translate }}</h2>
                        <form method="post">
                            <input type="password" name="password" placeholder="{{ 'Contraseña de acceso' | translate }}" class="form-control" >
                            <input type="submit" name="unlock" class="boton" value='{{ "Desbloquear" | translate }}' />
                            {% if invalid_password == true %}
                                <div class="row text-center">
                                    <div class="alert alert-danger">{{ "La contraseña es incorrecta." | translate }}</div>
                                </div>
                            {% endif %}
                        </form>
                    </div>
                    {% if has_seals %}
                        <div class="col-md-4 col-xs-12 centrado logo_afip">
                            <h2>{{ "INFORMACIÓN LEGAL" | translate }}</h2>
                            <ul class="list-inline pull-right seals" {% if not (store.afip or ebit) %}style="display: none;"{% endif %}>
                                {% if ebit %}
                                    <li class="ebit">
                                        {{ ebit }}
                                    </li>
                                {% endif %}
                                {% if store.afip %}
                                    <li class="afip">
                                        {{ store.afip | raw }}
                                    </li>
                                {% endif %}
                            </ul>
                        </div>
                    {% endif %}
                </div>
            </footer>
            <div class="footer_bajo">
                <div class="container">
                    <div class="col-md-6">
                        <p>{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
                    </div>
                    <div class="col-md-6 derecha izquierda_disp">
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
                        {{ powered_by_link }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{{ '//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
{{ '//maps.google.com/maps/api/js?sensor=true' | script_tag }}
{{ 'js/gourmet.js' | static_url | script_tag }}
</body>
</html>