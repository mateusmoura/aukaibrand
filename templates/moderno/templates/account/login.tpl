<div id="content" class="single">
    {% snipplet "breadcrumbs.tpl" %}
    <h1 class="title ssb">{{ "Iniciar sesión" | translate }}</h1>
    <div class="account-form-wrapper">
        <form id="login-form" action="" method="post">
            {% if not result.facebook and result.invalid %}
                <div class="st error c">{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
            {% elseif result.facebook and result.invalid %}
                <div class="st error c">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
            {% endif %}
             {% if store_fb_app_id %}
                 <div class="span4">
                    <input class="submit_button facebook" type="button" value="{{ 'Regístrate con Facebook' | translate }}" onclick="loginFacebook();" />
                </div>
                 <div class="span4 c">
                    <span class="badge">{{ 'o' | translate }}</span>
                </div>
                {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="span3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                </div>
            </div>
            <div class="field">
                <div class="span1">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password" />
                </div>
            </div>

            <input class="submit_button" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
            <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
        </form>
    </div>
</div>
