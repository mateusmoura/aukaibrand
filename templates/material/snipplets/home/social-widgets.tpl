{% set has_facebook_widget = settings.show_footer_fb_like_box and store.facebook %}
<div id="facebook-twitter-widget" class="container m-bottom">
    <div class="row">
        {#  **** Facebook ****  #}
        {% if has_facebook_widget %}
        <div class="col-xs-12 col-sm-12 {% if settings.twitter_widget %}col-md-6 col-lg-6{% else %}col-md-12 col-lg-12{% endif %}">
            <div class="social-title text-center">
                <h3>{{"Síguenos en Facebook" | translate}}</h3>
            </div>
            <div class="facebook-widget text-center">
                {{ store.facebook | fb_page_plugin(980,200) }}
            </div>
        </div>
        {% endif %}
        {% if settings.twitter_widget %}
            <div class="col-xs-12 col-sm-12 {% if has_facebook_widget %}col-md-6 col-lg-6{% else %}col-md-12 col-lg-12{% endif %}">
                 <div class="social-title text-center">
                    <h3>{{"Síguenos en Twitter" | translate}}</h3>
                </div>
                <div class="twitter-widget text-center">
                    {{ settings.twitter_widget | raw }}
                </div>
            </div>
        {% endif %}
    </div>
</div>