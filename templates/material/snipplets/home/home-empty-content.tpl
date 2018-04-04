<section id="home-empty" class="sections {% if show_help %}no-products{% endif %} container">
        <h2>{{"¡Bienvenido a tu tienda!" | translate}}</h2>
        <div class="no-products-txt">
            {% if has_products %}
                <p>{{"Todavía no destacaste productos, ¿deseas" | translate}} <a href="/admin/products/feature" target="_top">{{"destacar uno ahora" | translate}}</a>?</p>
            {% else %}
                <p>{{"Todavía no tienes ningún producto, ¿deseas" | translate}} <a href="/admin/products/new" target="_top">{{"crear uno ahora" | translate}}</a>?</p>
            {% endif %}
        </div>
    <a class="no-products-overlay" href="/admin/products/new" target="_top"></a>
</section>