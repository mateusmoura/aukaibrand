<div class="container">
    <div class="page-header-container container">
        <div class="col-md-8 col-sm-12 col-xs-12 page-header">
            <h1>{{ "Crear cuenta" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-phone hidden-tablet">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
    <div class="account-form-wrapper float-none div-center col-md-6 col-sm-12 col-xs-12 margin-top-x2 margin-bottom-x2">
        <form id="login-form" action="" method="post" >
            {% if result.errors.name %}
            <div class="row">
                <div class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            </div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
            <div class="row">
                <div class="alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            </div>
            {% elseif result.errors.email %}
            <div class="row">
                <div class="alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</div>
            </div>
            {% endif %}
            {% if result.errors.password == 'required' %}
            <div class="row">
                <div class="alert alert-danger">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
            </div>
            {% endif %}
            {% if result.errors.password == 'confirmation' %}
            <div class="row">
                <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            </div>
            {% endif %}
            {% if store_fb_app_id %}
                <div class="col-sm-offset-4 col-sm-5 c">
                    <i class="fa fa-facebook"></i>
                    <input class="button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="featurette-or-divider"></hr>
                </div>
            {% endif %}
                <div class="form-group">
                    <label for="name">{{ 'Nombre' | translate }}</label>
                    <input type="text" name="name" id="name" value="{{ result.name }}" class="form-control"/>
                </div>
                <div class="form-group">
                    <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                    <input autocorrect="off" class="form-control" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                </div>
                <div class="form-group">
                    <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                    <input type="text" class="form-control" name="phone" id="phone" value="{{ result.phone }}" />
                </div>
                <div class="form-group">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                    <input type="password" class="form-control" name="password" id="password" />
                </div>
                <div class="form-group">
                    <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                    <input type="password" name="password_confirmation" id="password_confirmation" class="form-control" />
                </div>
                <div class="form-group">
                    <input class="btn btn-secondary col-md-12 col-sm-12 col-xs-12" type="submit" value="{{ 'Crear cuenta' | translate }}" />
                </div>
            </div>
        </form>
    </div>
</div>
