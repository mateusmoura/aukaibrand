<div class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Iniciar sesión" | translate }}</h1>
    </div>
    {# Page preloader #}
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon svg-primary-fill opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
    <div class="row visible-when-content-ready">
        <form id="login-form" action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom">
            {% if not result.facebook and result.invalid %}
                <div class="alert alert-danger">{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
            {% elseif result.facebook and result.invalid %}
                <div class="alert alert-danger">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
                <div class="text-center">
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="divider-with-circle"></hr>
                </div>
            {% endif %}
             {% if store_fb_app_id %}
                <input class="btn btn-block facebook m-bottom" type="button" value="Facebook Login" onclick="loginFacebook();" />
                <div class="text-center">
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="divider-with-circle"></hr>
                </div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
            </div>
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input class="form-control" type="password" name="password" autocomplete="off"/>
                <div class="help-block"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></div>
            </div>
            <input class="btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
        </form>
    </div>
</div>
