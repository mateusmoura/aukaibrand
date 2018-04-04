<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span8">
                <h1>{{ "Iniciar sesión" | translate }}</h1>
            </div>
            <div class="span4 breadcrumbs-wrapper">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="account-form-wrapper span6 offset3 sst">
            <form id="login-form" action="" method="post" class="form-horizontal">
            {% if not result.facebook and result.invalid %}
                <div class="col-sm-offset-4 col-sm-5">
                    <div class="st alert alert-error c">{{ 'El email o la contraseña son incorrectos.' | translate }}</div>
                </div>
            {% elseif result.facebook and result.invalid %}
                <div class="col-sm-offset-4 col-sm-5">
                    <div class="st alert alert-error c">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
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
                        <input class="submit_button" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
