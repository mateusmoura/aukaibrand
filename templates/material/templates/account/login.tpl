<div id="account-login" class="container m-bottom">
    {% snipplet "page-header.tpl" with page_header_title =  "Iniciar sesión" | translate %}
    <div class="row m-top m-bottom">
        <form id="login-form" action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            {% include 'snipplets/facebook-login.tpl' %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input autocapitalize="off" autocorrect="off" autocomplete="email" class="form-control {% if not result.facebook and result.invalid %}input-error{% endif %}" name="email" value="{{ result.email }}">
            </div>
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input type="password" name="password" class="form-control {% if not result.facebook and result.invalid %}input-error{% endif %}">
                <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
            </div>
            {% if not result.facebook and result.invalid %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up arrow-centered"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'El email o la contraseña son incorrectos.' | translate }}</p></div>
            {% endif %}
            <input class="btn btn-info col-xs-12 col-sm-12 col-md-5 col-lg-5 pull-right" type="submit" value="{{ 'Iniciar sesión' | translate }}">
        </form>
    </div>
</div>
