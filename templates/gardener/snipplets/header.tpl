<div class="header-bar">
    <!-- MENÚ FIXED -->
    {% if settings.fixed_menu %}
        <div class="header-bar-fixed" data-spy="affix" data-offset-top="250" data-offset-bottom="200">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-12 logo-container">
                        {% if "fixed_menu_logo.jpg" | has_custom_image %}
                            <div id="logo" class="img">
                                {{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name) | a_tag(store.url) }}
                            </div>
                        {% else %}
                            <div id="logo">
                                <div class="logo-wrapper img {% if not has_logo %}hidden{% endif %}">
                                    {{ store.logo | img_tag(store.name) | a_tag(store.url) }}
                                </div>
                                <a id="no-logo" href="{{ store.url }}" class="no-logo {% if has_logo %}hidden{% endif %}">{{ store.name }}</a>
                            </div>
                        {% endif %}
                    </div>
                    <div class="mobile mobile-nav">
                        <div class="menu-btn"><i class="fa fa-bars"></i></div>
                    </div>  
                      <div class="col-md-3 cart-mobile">
                        {% if not store.is_catalog %}
                            {% snipplet "cart_mobile.tpl" %}
                        {% endif %}
                    </div>                
                     <div class="searchbox col-md-7">
                        <form action="{{ store.search_url }}" method="get" role="form">
                            <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                            <i class="fa fa-search"></i>
                            <input class="submit-button" type="submit" value=""/>
                        </form>
                    </div>
                    <nav class="col-sm-9">
                        <ul id="menu-fixed" class="sf-menu">
                            {% snipplet "navigation.tpl" %}
                            <!-- Carrito -->
                            {% snipplet "cart_fixed.tpl" %}
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    {% endif %}
    <div class="header-bar-top">
        <div class="container">
            <div class="row">
            <div class="mobile mobile-nav {% if store.has_accounts %} mobile-nav-margin {% endif %}">
                <div class="menu-btn"><i class="fa fa-bars"></i></div>
            </div>
                <div class="col-sm-5 text-left col-izq-top">
                    {% if languages | length > 1 %}
                        <div class="languages dropdown">
                            {% for language in languages %}
                                {% if language.active %}
                                    <a  class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                                        {{ language.country | flag_url | img_tag(language.name) }}
                                        <span class="caret"></span>
                                    </a>
                                {% endif %}
                            {% endfor %}
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                {% for language in languages %}
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
                                            {{ language.country | flag_url | img_tag(language.name) }}<span>&nbsp{{ language.name }}</span>
                                        </a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </div>
                    {% endif %}
                    {% if store.phone %}
                        <p class="phone">
                            {{ store.phone }}
                            {% if store.email %}
                                &nbsp;|&nbsp;
                            {% endif %}
                        </p>
                    {% endif %}
                    {% if store.email %}
                        <p class="mail">{{ store.email | mailto }}</p>
                    {% endif %}
                </div>
                <div class="col-sm-7 text-right col-der-top">
                    {% if store.has_accounts %}
                        <div id="auth">
                            {% if not customer %}
                                {% if 'mandatory' not in store.customer_accounts %}
                                    {{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
                                    <span>&nbsp;|&nbsp;</span>
                                {% endif %}
                                {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
                            {% else %}
                                {{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
                                <span>&nbsp;|&nbsp;</span>
                                {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
                            {% endif %}
                        </div>
                    {% endif %}
                    <div class="searchbox">
                        <form action="{{ store.search_url }}" method="get" role="form">
                            <input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                            <i class="fa fa-search"></i>
                            <input class="submit-button" type="submit" value=""/>
                        </form>
                    </div>
                </div>
                <div class="col-sm-12 col-xs-12 contact-language-info-mobile">
                    {% if languages | length > 1 %}
                        <div class="languages dropdown">
                            {% for language in languages %}
                                {% if language.active %}
                                    <a  class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                                        {{ language.country | flag_url | img_tag(language.name) }}
                                        <span class="caret"></span>
                                    </a>
                                {% endif %}
                            {% endfor %}
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                {% for language in languages %}
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
                                            {{ language.country | flag_url | img_tag(language.name) }}<span>&nbsp{{ language.name }}</span>
                                        </a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </div>
                    {% endif %}
                    {% if store.phone %}
                        <p class="phone">
                            {{ store.phone }}
                            {% if store.email %}
                                &nbsp;|&nbsp;
                            {% endif %}
                        </p>
                    {% endif %}
                    {% if store.email %}
                        <p class="mail">{{ store.email | mailto }}</p>
                    {% endif %}
            </div>
            </div>
        </div>
    </div>
    <div class="header-bar-main container">
        <div class="row text-center">
            <div class="col-md-12 logo-container">
                {% if template == 'home' %}
                    <h1 class="img logo">
                {% endif %}
                    <div id="logo" class="img">
                        <div class="logo-wrapper {% if not has_logo %}hidden{% endif %}">
                            {{ store.logo | img_tag(store.name) | a_tag(store.url) }}
                        </div>
                        <a id="no-logo" href="{{ store.url }}" class="no-logo {% if has_logo %}hidden{% endif %}">{{ store.name }}</a>
                    </div>
                {% if template == 'home' %}
                    </h1>
                {% endif %}
            </div>
            <div class="col-md-12 cart-mobile">
                {% snipplet "cart_mobile.tpl" %}
            </div>
        </div>
        <div class="row text-center">
            <nav>
                <ul id="menu" class="sf-menu">
                    {% snipplet "navigation.tpl" %}
                    <!-- Carrito -->
                    {% snipplet "cart.tpl" %}
                </ul>
            </nav>
        </div>
    </div>
</div>