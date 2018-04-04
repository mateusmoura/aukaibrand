<section id="home-logo" class="p-bottom">
    {% if has_logo %}
        <div class="img logo m-none m-none-top text-center">
           {{ store.logo  | img_tag(store.name,  {class: 'img-responsive'}) | a_tag(store.url, '', 'd-inline-block p-top') }}
        </div>
        <div id="no-logo-wrapper" class="hidden text-center">
            <div id="logo" class="">
                <a id="no-logo" class="d-inline-block text-wrap" href="{{ store.url }}">{{ store.name }}</a>
            </div>
        </div>
    {% else %}
        <div class="img logo hidden text-center">
            {{ store.logo  | img_tag(store.name,  {class: 'img-responsive'}) | a_tag(store.url, '', 'd-inline-block p-top')}}
        </div>
        <div id="no-logo-wrapper" class="m-none-top text-center">
            <div id="logo">
                <a id="no-logo" class="d-inline-block text-wrap" href="{{ store.url }}">{{ store.name }}</a>
            </div>
        </div>
    {% endif %}
</section>