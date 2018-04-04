<div id="colLeft">
    <div id="sidebar">
        <h1 class="title">{{ "Categorias" | translate }}</h1>
        <ul id="categorias">
            {% snipplet "categories.tpl" %}
        </ul>
    </div>
    <div id="newsletter">
        <h1 class="title">{{ "Cadastre-se" | translate }}</h1>
        <span id="ofertas">{{ "Ofertas exclusivas no seu e-mail" | translate }}</span>
        {% if contact.type == 'newsletter' %}
            {% if contact.success %}
                <div class="contact-ok">{{ "Obrigado por cadastrar seu e-mail para receber nossas novidades" | translate }}</div>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $('#newsletter form').hide();
                        $('#newsletter .title').hide();
                        $('#newsletter #ofertas').hide();
                    });
                </script>
            {% else %}
                <div class="contact-error">{{ "Digite o seu e-mail" | translate }}</div>
            {% endif %}
        {% endif %}
        <form method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');">
            <input type="text" onfocus="if (this.value == '{{ "Seu nome" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Seu nome" | translate }}';}" value='{{ "Seu nome" | translate }}' name="name">
            <input type="text" onfocus="if (this.value == '{{ "Seu e-mail" | translate }}') {this.value = '';}" onblur="if (this.value == '') {this.value = '{{ "Seu e-mail" | translate }}';}" value='{{ "Seu e-mail" | translate }}' name="email">
            <div class="winnie-pooh">
                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
            </div>
            <input type="hidden" name="message" value="{{ "Pedido de inscrição na newsletter" | translate }}" />
            <input type="hidden" name="type" value="newsletter" />
            <div class="buttonGrey">
                <input type="submit" name="contact" class="buttonGrey" value='{{ "Enviar" | translate }}'>
            </div>
        </form>
    </div>
    {% if "banner-sidebar.jpg" | has_custom_image %}
        <div class="banner-sidebar">
            {% if settings.banner_sidebar_url != '' %}
                {{ "banner-sidebar.jpg" | static_url | img_tag | a_tag(settings.banner_sidebar_url) }}
            {% else %}
                {{ "banner-sidebar.jpg" | static_url | img_tag }}
            {% endif %}
        </div>
    {% endif %}
</div>