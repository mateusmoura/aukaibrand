{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div id="404">
    <div class="container">
        <div class="error-box">
            <h1>- {{ "Error" | translate }} -</h1>
            <h2>{{ "404" | translate }}</h2>
            <p>{{ "La página que estás buscando no existe." | translate }}</p>
        </div>
    </div>
</div>
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
<div class="row" id="product-example">
    {% snipplet 'defaults/show_help_product.tpl' %}
</div>
{% endif %}