<div id="account-info" class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Mi cuenta" | translate %}
    <div class="account-info-form row m-top">
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" name="name" id="name" autocorrect="off" autocomplete="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name | default(customer.name) }}">
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu nombre!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocapitalize="off" autocorrect="off" autocomplete="email"  class="form-control {% if result.errors.email == 'exists' or result.errors.email %}input-error{% endif %}" name="email" value="{{ result.email | default(customer.email) }}">
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Ya existe una cuenta para este email!' | translate }}</p></div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar un email válido!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input type="tel" name="phone" id="phone" class="form-control" value="{{ result.phone | default(customer.phone) }}" autocorrect="off" autocomplete="tel">
            </div>
            <input class="btn btn-info col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Guardar cambios' | translate }}">
        </form>
    </div>
</div>