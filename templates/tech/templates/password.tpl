<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}
    <!-- CSS -->
    {{ '//fonts.googleapis.com/css?family=Lato:100,300,400,700,900|Oswald:400,700,300' | css_tag}}
    {{ '//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css' | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css' | css_tag }}
    {{ 'css/colors.scss.tpl' | static_url | css_tag }}
    {{ 'css/style.css' | static_url | css_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js' | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}
    {% set nojquery = true %}

    <style>
        {{ settings.css_code }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{back_to_admin}}
<div class="password-page">
    <div class="password-page-body">
        <div class="password-container navbar-wrapper">
            {% if has_logo %}
                <h1 class="img logo logo-wrapper">
                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                </h1>
            {% else %}
                <h1 class="no-logo">
                    <div class="logo text-only">
                        <a href="{{ store.url }}" >{{ store.name }}</a>
                    </div>
                </h1>
            {% endif %}
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
        <div class="password-container password-message titles">
            <h2 class="text-center">{{ message }}</h2>
        </div>
    </div>
    <div class="password-footer">
        <div class="footer clear">
            <div class="footer1">
                <div class="container">
                    <form method="post" class="password-password">
                        <div class="input-append">
                            <input type="password" name="password" placeholder="{{ 'Contraseña de acceso' | translate }}">
                            <input type="submit" name="unlock" class="send" value='{{ "Desbloquear" | translate }}'>
                        </div>
                        {% if invalid_password == true %}
                            <div class="control-group">
                                <div class="alert alert-danger">{{ 'La contraseña es incorrecta.' | translate }}</div>
                            </div>
                        {% endif %}
                    </form>
                </div>
                <div class="container">
                    {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
                        <div class="col-md-4 col-lg-4 col-xs-12 footer-col-container">
                            <h3>{{ 'Redes sociales' | translate }}</h3>
                            <div id="wrapper-social">
                                <div class="row-fluid">
                                    <div class="followus">
                                        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                                            {% set sn_url = attribute(store,sn) %}
                                            {% if sn_url %}
                                                <a class="soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                                            {% endif %}
                                        {% endfor %}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {% endif  %}
                    <div class="col-md-4 col-lg-4 col-xs-12 seals footer-col-container" {% if not (store.afip or ebit) %}style="display: none;"{% endif %}>
                        <div class="col-foot">
                            <h3>{{ "Seguridad y Certificaciones" | translate }}</h3>
                            <div class="seals" {% if not (store.afip or ebit) %}style="display: none;"{% endif %}>
                                {% if store.afip %}
                                    <div class="afip">
                                        {{ store.afip | raw }}
                                    </div>
                                {% endif %}
                                {% if ebit %}
                                    <div class="ebit">
                                        {{ ebit }}
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                    {% if store.phone or store.address or store.blog %}
                        <div class="footer2">
                            <div class="col-md-4 col-lg-4 col-xs-12 contactanos footer-col-container contactanos">
                                <h3>{{ 'Contactanos' | translate }}</h3>
                                {% if store.phone %}<p>{{ store.phone }}</p>{% endif %}
                                {% if store.address %}<p>{{ store.address }}</p>{% endif %}
                                {% if store.email %}<p><a href="mailto:{% if store.email %}{{ store.email }}{% endif %}">{{ store.email }}</a></p>{% endif %}
                                {% if store.blog %}<p><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></p>{% endif %}
                            </div>
                        </div>
                    {% endif %}
                </div>
                <div class="clear"></div>
            </div>
            <div class="copy">
                <div class="container">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 copyleft">{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 copyright">{{powered_by_link}}</div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</div>
{{ '//netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js' | script_tag }}
{{ 'js/tech.js' | static_url | script_tag }}
</body>
</html>