<div class="container">
    <div class="page-header-container container">
        <div class="col-md-8 col-sm-12 col-xs-12 page-header">
            <h1>{{ "Iniciar sesión" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-phone hidden-tablet">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
    <div class="account-form-wrapper float-none div-center col-md-6 col-sm-12 col-xs-12 margin-top-x2 margin-bottom-x2">
        <form id="login-form" action="" method="post">
        {% if not result.facebook and result.invalid %}
        <div class="row">
            <div class='alert alert-danger alert-dismissible fade in' role='alert'>{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
        </div>
        {% elseif result.facebook and result.invalid %}
            <div class="alert alert-error col-md-12 col-sm-12 col-xs12">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
        {% endif %}
        {% if store_fb_app_id %}
             <div class="col-md-12">
                <i class="fa fa-facebook"></i>
                <input class="button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                <span class="badge">{{ 'o' | translate }}</span>
                <hr class="featurette-or-divider"></hr>
            </div>
            {% endif %}
            <div class="form-group">
                <label for="email">{{ 'Email' | translate }}</label>
                <div class="controls">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" class="col-md-12 col-sm-12 col-xs-12 form-control" />
                </div>
            </div>
            <div class="form-group">
                <label for="password">{{ 'Contraseña' | translate }}</label>
                <div class="controls">
                    <input type="password" class="form-control" name="password" />
                    <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
                </div>
            </div>
            <div class="form-group">
                <input class="btn btn-secondary col-md-12 col-sm-12 col-xs-12" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
            </div>
        </form>
    </div>
</div>
