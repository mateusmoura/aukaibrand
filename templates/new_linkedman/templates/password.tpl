<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
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
    {{ 'bootstrap.css' | static_url | css_tag }}
    {{ 'bootstrap-responsive.css' | static_url | css_tag }}
    {{ '//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css' | css_tag }}
    {{ 'style.css' | static_url | css_tag }}
    {{ 'custom.css.tpl' | static_url | css_tag }}
    {{ 'main-color.scss.tpl' | static_url | css_tag }}
    {{ '//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' | css_tag }}
    {% set nojquery = true %}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag }}
    {{ 'js/jquery.cookie.js' | common_cdn | script_tag }}
    {{ 'media-style.css' | static_url | css_tag }}
    <!--[if lte IE 7]>
    {{ "ie.css" | static_url | css_tag }}
    <![endif]-->
    <!--[if lt IE 9]>
    {{ "html5shiv-printshiv.js" | static_url | script_tag }}
    <![endif]-->
    <style>
        {{ settings.css_code }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{back_to_admin}}
<div class="password-page">
    <div class="password-page-body">
        <div class="password-container">
            {% if has_logo %}
                <h1 class="img logo">
                    {{ store.logo  | img_tag(store.name) | a_tag(store.url)}}
                </h1>
            {% else %}
                <h1 id="no-logo-wrapper">
                    <div id="logo">
                        <a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
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
        <div class="password-container password-message">
            <h2 class="text-center">{{ message }}</h2>
        </div>
        {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
            <div class="password-container password-social">
                <div class="container text-center">
                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                        {% set sn_url = attribute(store,sn) %}
                        {% if sn_url %}
                            <a class="soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i></a>
                        {% endif %}
                    {% endfor %}
                </div>
            </div>
        {% endif %}
    </div>
    <div class="password-footer {% if not store.phone and not store.address and not store.blog and not store.facebook and not store.twitter and not store.google_plus and not store.pinterest and not store.instagram %} password-footer-tall{% endif %}">
        <div class="password-container">
            <div id="wrapper-foot">
                <form method="post" class="password-password">
                    <div class="input-append">
                        <input type="password" name="password" class="span2"  placeholder="{{ 'Contraseña de acceso' | translate }}">
                        <input type="submit" name="unlock" class="btn" value='{{ "Desbloquear" | translate }}'>
                    </div>
                    {% if invalid_password == true %}
                        <div class="alert alert-danger">{{ 'La contraseña es incorrecta.' | translate }}</div>
                    {% endif %}
                </form>
                {% if store.phone or store.address or store.blog %}
                    <ul class="foot-nav">
                        {% if store.phone %}
                            <li>{{ store.phone }}</li>
                        {% endif %}
                        {% if store.address %}
                            <li>{{ store.address }}</li>
                        {% endif %}
                        {% if store.blog %}
                            <li class="blog"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                        {% endif %}
                        {% if store.email %}
                            <li class="email">{{ store.email | mailto }}</li>
                        {% endif %}
                    </ul>
                {% endif %}
            </div>
        </div>
        <div class="password-container">
            <div id="wrapper-legal">
                <div class="container">
                    <div class="row-fluid">
                        <div class="span6">
                            <div class="powered-by">
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
                        <div class="span6">
                            <div class="copyright">
                                {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
</body>
</html>