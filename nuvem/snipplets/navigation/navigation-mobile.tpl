<div class="js-mobile-nav js-search-container mobile-nav">
    <div class="js-mobile-first-row mobile-nav-first-row">           
        <div class="js-toggle-hamburger-panel btn-hamburger text-center visible-phone pull-left">
            <div class="mobile-nav-first-row-icon">
                {% include "snipplets/svg/hamburger.tpl" %}
            </div>
        </div>
        <div class="mobile-nav-title">
            {% snipplet "mobile-page-title.tpl" %}
        </div>
        <div class="js-toggle-mobile-search js-toggle-mobile-search-open mobile-search-btn visible-phone text-center pull-right">
            <div class="mobile-nav-first-row-icon pull-right">
                {% include "snipplets/svg/search.tpl" %}
            </div>
        </div>
    </div>
    <div class="js-mobile-search-row mobile-nav-search-row">
        <form action="{{ store.search_url }}" method="get" class="js-search-form mobile-search-form">
            <div class="mobile-search-input-container">
                <span class="js-search-back-btn js-toggle-mobile-search mobile-search-input-back m-top-half p-left-half">
                    <i class="fa fa-chevron-left fa-lg mobile-search-input-icon" aria-hidden="true"></i>
                </span>
                <input class="h6 js-mobile-search-input js-search-input mobile-search-input" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                <button type="submit" class="mobile-search-input-submit" value="">
                    <i class="fa fa-lg fa-search mobile-search-input-icon"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="js-mobile-nav-second-row mobile-nav-second-row container-fluid">
        {% snipplet "navigation/navigation-mobile-tabs.tpl" %}
    </div>
    <div class="js-mobile-nav-arrow mobile-nav-arrow-up" style="display:none;">
        <i class="fa fa-caret-up fa-2x" aria-hidden="true"></i>
    </div>
</div>
<div class="js-search-suggest search-suggest">
    {# AJAX container for search suggestions #}
</div>
{# Categories list for mobile #}
<div class="js-categories-mobile-container" style="display:none;">
    <ul class="modal-xs mobile-nav-categories-container">
        <li>
            <a class="modal-xs-list-item modal-xs-list-subtitle inverse"  href="{{ store.products_url }}">
                {{ 'Ver todos los productos' | translate }}
            </a>
        </li>
        {% snipplet "navigation/navigation-mobile-categories.tpl" %}
    </ul>
    {% for category in categories %}
        {% snipplet "navigation/navigation-mobile-categories-panels.tpl" %}
    {% endfor %}
</div>
