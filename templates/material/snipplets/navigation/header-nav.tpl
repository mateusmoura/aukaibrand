<div class="navbar navbar-inverse navbar-fixed-top">
    {% if store.has_accounts or languages | length > 1 %}
        <div id="account-header" class="container-fluid hidden-xs">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                    <div class="search-lang-wrapper pull-left">
                         {% if languages | length > 1 %}
                            <div class="languages">
                                <ul class="language list-style-none p-none m-none-bottom">
                                    {% for language in languages %}
                                        <li class="d-inline-block">
                                            <a href="{{ language.url }}">
                                                {{ language.country | flag_url | img_tag(language.name) }}
                                            </a>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </div>
                        {% endif %}
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                    <ul class="list-style-none p-none m-none account-links">
                        {% if store.has_accounts %}
                            {% if not customer %}
                                {% if store.customer_accounts != 'mandatory' %}
                                    <li class="d-inline-block">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'd-inline-block no-link contrast m-half-left') }}</li>
                                {% endif %}
                                    <li class="d-inline-block">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'd-inline-block no-link contrast m-half-left') }}</li>
                            {% else %}
                                <li class="d-inline-block">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'd-inline-block no-link contrast ') }}</li>
                                <li class="d-inline-block">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'd-inline-block no-link contrast m-half-left') }}</li>
                            {% endif %}
                        {% endif %}
                    </ul>
                </div>
            </div>
        </div>
    {% endif %}
    <div class="navbar-header">
        <div class="pull-right nav-icons">
            {% if not store.is_catalog %}
                <div class="cart-widget-container pull-right hidden-xs">
                     {% if not store.is_catalog and template != 'cart' %}
                        {% if settings.ajax_cart %}
                            {% snipplet "navigation/cart-widget-ajax.tpl" as "cart" %}
                        {% else %}
                            {% snipplet "navigation/cart-widget.tpl" as "cart" %}
                        {% endif %}
                    {% endif %}
                </div>
            {% endif %}
             {% if template == 'category' %}
                {% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
                {% if has_filters %}
                    <a data-target="#filters-mobile" data-toggle="modal" href="#" class="mobile-filters d-inline-block-xs"><i class="material-icons">&#xE152;</i></a>
                {% endif %}
            {% endif %}
            {% if template == 'product' %}
                <a data-target="#sharing-mobile" data-toggle="modal" href="#" class="mobile-sharing d-inline-block-xs"><i class="material-icons">&#xE80D;</i></a>
            {% endif %}
            <a id="show-search" href="#"><i class="material-icons">&#xE8B6;</i></a>
        </div>
        <div id="search-form" style="display: none">
            <form class="search-bar input-group" action="{{ store.search_url }}" method="get">
                <span class="input-group-btn">
                    <a href="#" id="back-arrow" class="btn btn-info btn-xs p-none-top p-none-bottom">
                        <i class="material-icons back-arrow">&#xE5C4;</i>
                    </a>
                </span>
                <input type="search" class="form-control material-input border-radius-none" name="q" placeholder="{{ 'Buscar' | translate }}">
                <span class="input-group-btn">
                    <button type="submit" class="search-submit btn btn-info btn-xs p-none-top p-none-bottom  hidden-xs" value="">
                        <i class="material-icons">&#xE8B6;</i>
                    </button>
                    <a href="#" id="delete-search" style="display:none;" class="btn btn-info btn-xs p-none-top p-none-bottom">
                        <i class="material-icons">&#xE5CD;</i>
                    </a>
                </span>
            </form>
        </div>
        <div class="menu-btn c-pointer pull-left m-half-right hidden-md hidden-lg hidden-sm">
            <i class="material-icons">menu</i>
        </div> 
        {% if template == 'home' %}
            <h1 class="nav-store-name"><a class="no-link" href="{{ store.url }}">{{ store.name }}</a></h1>
        {% else %}
            <div class="nav-store-name"><a class="no-link" href="{{ store.url }}">{{ store.name }}</a></div>
        {% endif %}
    </div>
    <div class="secondary-navbar-desktop hidden-xs">
         <ul class="top-links pull-left m-none-bottom p-none m-right">
             <nav id="navigation" class="p-relative">
                <ul id="menu" class="nav navbar-nav text-center f-none p-relative">
                    {% snipplet "navigation/navigation.tpl" %}
                </ul>
            </nav>
        </ul>
    </div>
    <div class="secondary-navbar-mobile">
        {% snipplet "navigation/navigation-mobile-tabs.tpl" %}
    </div>
</div>
{# Categories list for mobile #}
<ul id="categories-mobile-container" class="visible-xs container-fluid list-style-none p-fixed full-height full-width p-top p-bottom p-left-none p-right-none in-canvas-top-closed">
     <div class="container-fluid">
         <a href="#" id="close-categories-btn" class="btn btn-default btn-close pull-right m-bottom m-half-top"><i class="material-icons">&#xE5CD;</i></a>
     </div>
      <li>
        <a class="col-xs-12 d-block text-decoration-none text-wrap no-link p-top p-bottom border-bottom border-top mobile-see-all-category font-bold text-uppercase"  href="{{ store.products_url }}">
            {{ 'Todos los productos' | translate }}
        </a>
     </li>
     {% snipplet "navigation/navigation-mobile-categories.tpl" %}
</ul>
{% if settings.ajax_cart %}
    {# Cart toast notification #}

    <div id="added-to-cart" style="display:none;" class="js-toggleCart js-toggleCart-ajax {% if store.has_accounts or languages | length > 1 %} with-top-bar{% endif %}">
        <div class="arrow-up"></div>
        <div class="snackbar {% if store.has_accounts or languages | length > 1 %} with-top-bar{% endif %}">
            <span class="snackbar-content"><i class="material-icons d-inline pull-left m-half-right m-none-xs m-half-bottom-xs">&#xE86C;</i>{{ 'El producto fue agregado exitosamente al carrito' | translate }}</span>
        </div>
    </div>
{% endif %}

{# AJAX Cart Panel #}
{% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
    {% snipplet "navigation/cart-panel-ajax.tpl" %}
 {% endif %}

{# Search backdrop #}
<div id="search-backdrop" class="backdrop container-fluid full-width full-height  {% if store.has_accounts or languages | length > 1 %} with-top-bar{% endif %}" style="display: none;"></div>