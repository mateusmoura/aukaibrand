<div id="contact-form" class="m-bottom">
    {# This happens when a buyer clicks on "Contact" on a product page #}
    {% if product %}
        <div class="product-question m-bottom">
            <label>
                {{ "Consulta por:" | translate }} {{ product.name | a_tag(product.url) }}
            </label>
            <div class="product-question-image">
                <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}">
            </div>
        </div>
    {% endif %}
    {% if contact and contact.type == 'contact' %}
        {% if contact.success %}
            <div class="alert alert-success text-center-xs"><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE86C;</i><p>{{ "El mensaje ha sido enviado con éxito, muchas gracias." | translate }}</p></div>
        {% else %}
            <div class="alert alert-danger text-center-xs"><div class="arrow arrow-down arrow-centered"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ "Debes completar los datos de contacto." | translate }}</p></div>
        {% endif %}
    {% endif %}
    {#  This shady winnie-pooh submit URL is a honey-pot strategy to avoid spam :)  #}

    {% set contact_error =  contact and contact.type == 'contact' and not contact.success %}
    <form  action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
        <input type="hidden" value="{{ product.id }}" name="product">
        <input type="hidden" name="type" value="contact">
        <div class="form-group">
            <label for="name">{{ "Nombre" | translate }}</label>
            <input type="text" autocorrect="off" autocomplete="name" id="name" class="form-control {% if contact_error %}input-error{% endif %}" name="name">
        </div>
        <div class="form-group">
            <label for="email">{{ "Email" | translate }}</label>
            <input type="email" id="email" autocapitalize="off" autocorrect="off" autocomplete="email" class="form-control {% if contact_error %}input-error{% endif %}" name="email">
        </div>
        <div class="form-group" style="display:none;">
            <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
            <input id="winnie-pooh" type="text" class="form-control" name="winnie-pooh">
        </div>
        <div class="form-group">
            <label for="phone">
                {{ "Teléfono" | translate }}
                <span class="mini-text">({{ "Opcional" | translate }})</span>
            </label>
            <input id="phone" type="tel" autocorrect="off" autocomplete="tel" class="form-control" name="phone">
        </div> 
        <div class="form-group">
            <label for="message">
                {{ "Mensaje" | translate }}
                <span class="mini-text">({{ "Opcional" | translate }})</span>
            </label>
            <textarea id="message" name="message" class="form-control" cols="20" rows="5"></textarea>
        </div>
         <input type="hidden" value="contact" name="type">
         <div class="row">
            <div class="container-fluid">
                <input type="submit" class="btn btn-info col-xs-12 col-sm-12 col-md-5 col-lg-5 pull-right" value="{{ 'Enviar' | translate }}" name="contact">
            </div>
         </div>
    </form>
</div>