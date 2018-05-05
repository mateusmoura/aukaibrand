<div class="row-fluid">
    <div class="container">
        <div class="headerBox-List">
            <div class="span8">
                <h1>{{ "Crear cuenta" | translate }}</h1>
            </div>
            <div class="span4 breadcrumbs-wrapper">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="account-form-wrapper span6 offset3 sst">
            <form id="login-form" action="" method="post" class="form-horizontal">
                {% if result.errors.name %}
                    <div class="st alert alert-error c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
                {% endif %}
                {% if result.errors.email == 'exists' %}
                    <div class="st alert alert-error c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
                {% elseif result.errors.email %}
                    <div class="st alert alert-error c">{{ 'Debes ingresar un email válido!' | translate }}</div>
                {% endif %}
                {% if result.errors.password == 'required' %}
                    <div class="st alert alert-error c">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
                {% endif %}
                {% if result.errors.password == 'confirmation' %}
                    <div class="st alert alert-error c">{{ 'Las contraseñas no coinciden.' | translate }}</div>
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
                    <label class="control-label" for="name">{{ 'Nombre' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="name" id="name" value="{{ result.name }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                    <div class="controls">
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                    <div class="controls">
                        <input type="text" name="phone" id="phone" value="{{ result.phone }}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">{{ 'Contraseña' | translate }}</label>
                    <div class="controls">
                        <input type="password" name="password" id="password" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                    <div class="controls">
                        <input type="password" name="password_confirmation" id="password_confirmation" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="submit_button" type="submit" value="{{ 'Crear cuenta' | translate }}" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
