<div class="container">
    <div class="title-container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1 class="title">{{ "Crear cuenta" | translate }}</h1>
    </div>
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon svg-primary-fill opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
    <div class="row visible-when-content-ready">
        <form id="login-form" action="" method="post" class="col-sm-6 col-sm-offset-3 m-bottom">
            {% if store_fb_app_id %}
                <input class="btn btn-block facebook m-bottom" type="button" value="Facebook Login" onclick="loginFacebook();" />
                <div class="text-center">
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="divider-with-circle"></hr>
                </div>
            {% endif %}
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input class="form-control" type="text" name="name" id="name" value="{{ result.name }}" />
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone }}" />
            </div>
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <input class="form-control" type="password" name="password" id="password" autocomplete="off"/>
            </div>
            {% if result.errors.password == 'required' %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" autocomplete="off"/>
            </div>
            {% if result.errors.password == 'confirmation' %}
                <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            {% endif %}
            <input class="btn btn-primary full-width-xs pull-right" type="submit" value="{{ 'Crear cuenta' | translate }}" />
            </div>
        </form>
    </div>
</div>
