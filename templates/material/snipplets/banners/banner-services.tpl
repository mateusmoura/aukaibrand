<div class="banner-services-container row border-top-contrast p-half-top drop-shadow">
    {% set num_banners_services = 0 %}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03'] %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
        {% endif %}
    {% endfor %}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03'] %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
        <div class="col-xs-12 col-sm-offset-0 col-sm-12 col-sm-offset-0 {% if num_banners_services == 1 %}col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4{% elseif num_banners_services == 2 %}col-md-6 col-lg-6 {% elseif num_banners_services == 3 %}col-md-4 col-lg-4{% endif %}">
            <div class="row p-half-top p-bottom">
                <div class="banner-services-icon col-xs-12 col-sm-12 col-md-3 col-lg-3 text-right text-center-sm text-center-xs">
                    <h2 class="m-none text-center"><i class="fa {%if loop.first %}fa-truck{% endif %}{%if loop.index == 2 %}fa-credit-card{% elseif loop.index == 3 %}fa-lock{% endif %}"></i></h2>
                </div>
                <div class="banner-services-text col-xs-12 col-sm-12 col-md-9 col-lg-9 text-left p-none-lg-md text-center-sm text-center-xs m-half-top">
                    <h4 class="m-none opacity-80">{{ banner_services_title }}</h4>
                    <p class="m-none">{{ banner_services_description }}</p>
                </div> 
            </div>
        </div>         
        {% endif %}
    {% endfor %}
</div>
