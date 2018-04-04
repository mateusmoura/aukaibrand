<div id="account-register" class="container m-bottom">
    {#  **** Page header ****  #}
    {% snipplet "page-header.tpl" with page_header_title =  "Crear cuenta" | translate  %}
    {#  **** Register account form ****  #}
    <div class="register-form row m-bottom">
        <form id="login-form" action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            {#  **** Facebook Login Button ****  #}
            {% include 'snipplets/facebook-login.tpl' %}
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" autocorrect="off" autocomplete="name" name="name" id="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name }}">
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div>
                <i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu nombre!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocapitalize="off" autocorrect="off" autocomplete="email" name="email" id="email" class="form-control {% if result.errors.email == 'exists' or result.errors.email %}input-error{% endif %}" value="{{ result.email }}">
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Ya existe una cuenta para este email!' | translate }}</p></div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar un email válido!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input type="tel" autocorrect="off" autocomplete="tel" name="phone" id="phone" class="form-control" value="{{ result.phone }}">
            </div>
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input type="password" name="password" id="password" class="form-control {% if result.errors.password == 'required' %}input-error{% endif %}">
            </div>
             {% if result.errors.password == 'required' %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs">&#xE000;</i><p>{{ 'Debes ingresar tu contraseña!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                <input type="password" name="password_confirmation" id="password_confirmation" class="form-control {% if result.errors.password == 'confirmation' %}input-error{% endif %}">
            </div>
            {% if result.errors.password == 'confirmation' %}
                <div class="alert alert-danger alert-failed text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs">&#xE000;</i><p>{{ 'Las contraseñas no coinciden.' | translate }}</p></div>
            {% endif %}
            <input class="btn btn-info col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Crear cuenta' | translate }}">
        </form>
    </div>
</div>
