<section id="home-slider" class="slider-wrapper container drop-shadow m-top m-none-top-xs m-half-bottom-xs p-none p-relative text-center {% if not settings.slider or settings.slider is empty %}hidden{% endif %}">
    <ul class="homeslider bxslider list-style-none p-none m-none">
        {% if settings.slider and settings.slider is not empty %}
            {% for slide in settings.slider %}
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <li><img src="{{ slide_img }}" style="visibility: hidden;"/></li>
                {% else %}
                    <li><a href="{{ slide.link }}"><img src="{{ slide_img }}" style="visibility: hidden;"/></a></li>
                {% endif %}
            {% endfor %}
        {% endif %}
    </ul>
    <div class="spinner spinner-xl contrast p-absolute">
        <div class="spinnerContainer active common full-height full-width p-absolute">
            <div class="spinner-layer layer-1 common full-height full-width p-absolute">
                <div class="circle-clipper left common">
                    <div class="circle common"></div>
                </div><div class="gap-patch common full-height"><div class="circle common"></div></div><div class="circle-clipper right common full-height"><div class="circle common full-height"></div>
                </div>
            </div>
        </div>
    </div>
    {% if settings.slider > 1 %}
        <div class="bx-pager home-slider-pager text-center m-quarter-bottom visible-xs p-absolute">
             {% for slide in settings.slider %}
                <a class="hidden" href="">
                </a>
                 <div class="slider-circles">
                    <span class="circle-pager"></span>
                </div>
             {% endfor %}
        </div>
        {% endif %}
</section>