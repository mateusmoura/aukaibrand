{% set has_social = store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
{% if has_social %}
    <div class="col-md-6 redes">
        <h2>{{ "SÍGUENOS EN:" | translate }}</h2>
        {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
            {% set sn_url = attribute(store,sn) %}
            {% if sn_url %}
                <a href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}>
                    <div class="red">
                        <span>
                            <i class="fa fa-{{ sn == 'google_plus' ? 'google-plus' : sn }}"></i>
                        </span>
                    </div>
                </a>
            {% endif %}
        {% endfor %}
    </div>
{% endif %}