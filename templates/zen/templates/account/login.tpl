<div class="page-content">
    <div class="headerBox-Page">
        <h1>{{ "Iniciar sesión" | translate }}</h1>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="container-fluid">
        <div class="account-form-wrapper">
            <form id="login-form" action="" method="post" class="contact_form">         
                {% if not result.facebook and result.invalid %}
                    <div class="alert alert-danger clear">{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
                {% elseif result.facebook and result.invalid %}
                    <div class="alert alert-danger clear">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
                {% endif %}
                {% if store_fb_app_id %}
                    <div class="span6">
                        <i class="fa fa-facebook"></i>
                        <input class="submit_button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                    </div>
                    <div class="span6 text-center">
                        <span class="badge">{{ 'o' | translate }}</span>
                        <hr class="featurette-or-divider"></hr>
                    </div>
                {% endif %}
                <div class="field">
                    <div class="span1">
                        <label for="email">{{ 'Email' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                    </div>
                </div>
                <div class="field">
                    <div class="span1">
                        <label for="password">{{ 'Contraseña' | translate }}</label>
                    </div>
                    <div class="span5">
                        <input type="password" name="password" />
                        <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
                    </div>
                </div>
                <input class="submit_button" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
            </form>
        </div>
    </div>
</div>
