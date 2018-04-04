<div id="password-reset" class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Cambiar Contraseña" | translate  %}
    <div class="password-reset-form row m-top">
        <p class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">{{ 'Te enviaremos un email para que puedas cambiar tu contraseña.' | translate }}</p>
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            {% if success %}
                <div class="alert alert-success text-center-xs"><i class="material-icons d-inline pull-left m-half-right m-none-xs m-half-bottom-xs">&#xE86C;</i><p>{{ 'Te enviamos un email a {1}' | translate(email) }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocorrect="off" autocapitalize="off" name="email" id="email" class="form-control {% if failure %}input-error{% endif %}" value="{{ email }}">
            </div>
            {% if failure %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs">&#xE000;</i><p>{{ 'No existe ningún cliente con el email ingresado.' | translate }}</p></div>
            {% endif %}
            <input class="btn btn-info col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Enviar email' | translate }}">
        </form>
    </div>
</div>
