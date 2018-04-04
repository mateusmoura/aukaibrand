<div class="row-fluid">
    <div class="container account-container">
        <div class="headerBox-List">
            <div class="path">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
            <div class="titles">
                <h1>{{ "Iniciar sesión" | translate }}</h1>
            </div>        </div>
        <div class="account-form-wrapper span6">
            <form id="login-form" action="" method="post" class="form-horizontal">
            {% if not result.facebook and result.invalid %}
                <div class="control-group">
                    <div class="alert alert-danger">{{ 'El email o la contraseña son incorrectos' | translate }}</div>
                </div>
            {% elseif result.facebook and result.invalid %}
                <div class="control-group">
                    <div class="alert alert-danger">{{ 'Hubo un problema con el login de Facebook' | translate }}</div>
                </div>
            {% endif %}
           {% if store_fb_app_id %}
                    <div class="control-group c">
                        <i class="fa fa-facebook"></i>
                        <input class="button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                    </div>
                {% endif %}
                <div class="control-group">
                    <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                    <div class="controls">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">{{ 'Contraseña' | translate }}</label>
                    <div class="controls">
                        <input type="password" name="password" />
                        <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button send" type="submit" value="{{ 'Iniciar sesión' | translate }}"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
