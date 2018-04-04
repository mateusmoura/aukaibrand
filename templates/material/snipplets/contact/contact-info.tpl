{% if store.contact_intro %}
    <p class="m-bottom">{{ store.contact_intro }}</p>
{% endif %}
<div id="store-contact-information">
    <ul class="contact-information list-style-none p-none row">
       {% if store.phone %}
            <li class="m-half-bottom container-fluid"><i class="material-icons pull-left m-half-right">&#xE0CD;</i><h5 class="pull-left m-quarter-top hidden-xs">{{ store.phone }}</h5><h5 class="pull-left m-quarter-top hidden-sm hidden-md hidden-lg"><a href="tel:{{ store.phone }}" class="no-link text-wrap">{{ store.phone }}</a></h5></li>
        {% endif %}
        {% if store.email %}
            <li class="m-half-bottom text-wrap container-fluid"><i class="material-icons pull-left m-half-right">&#xE0BE;</i><h5 class="pull-left m-quarter-top mail-to">{{ store.email | mailto }}</h5></li>
        {% endif %}
        {% if store.blog %}
            <li class="m-half-bottom container-fluid"><i class="material-icons pull-left m-half-right">&#xE0B7;</i><h5 class="pull-left m-quarter-top"><a target="_blank" href="{{ store.blog }}" class="no-link text-wrap">{{ store.blog }}</a></h5></li>
        {% endif %}
        {% if store.address %}
            <li class="m-half-bottom container-fluid"><i class="material-icons pull-left m-half-right">&#xE0C8;</i><h5 class="pull-left m-quarter-top"><a target="_blank" href=" http://maps.google.com/?q={{ store.address }}" class="no-link text-wrap">{{ store.address }}</a></h5></li>
        {% endif %}
    </ul>
    {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
        <h4 class="m-bottom border-top-contrast p-half-top">{{ "Siguenos" | translate }}</h4>
        <ul class="social-networks list-style-none p-none m-left-none m-half-top">
        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
            {% set sn_url = attribute(store,sn) %}
            {% if sn_url %}
                <li class="{{ sn }} m-half-bottom d-inline-block m-half-right">
                    <a target="_blank" href="{{ sn_url }}" class="no-link btn-circle pull-left">
                        <i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }} d-block"></i>
                    </a>
                </li>
            {% endif %}
        {% endfor %}
        </ul>
    {% endif %}   
</div>