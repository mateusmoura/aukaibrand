<div class="page-content register-cont">
    <div class="headerBox-Page">
        <h1>{{ "Crear cuenta" | translate }}</h1>
    </div>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <form id="login-form" action="" method="post" class="contact_form">
            {% if store_fb_app_id %}
                <div class="col-sm-offset-4 col-sm-5">
                    <i class="fa fa-facebook"></i>
                    <input class="submit_button facebook" type="button" value="{{ 'Regístrate con Facebook' | translate }}" onclick="loginFacebook();" />
                </div>
                <div class="col-sm-offset-4 col-sm-5 c">
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="featurette-or-divider"></hr>
                </div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="name">{{ 'Nombre' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="name" id="name" value="{{ result.name }}" />
                </div>
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="span3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                </div>
            </div>
            {% if result.errors.email == 'exists' %}
                <div class="alert alert-danger">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="alert alert-danger">{{ 'Debes ingresar un email válido!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone }}" />
                </div>
            </div>
            <div class="field">
                <div class="span1">
                    <label for="password">{{ 'Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password" id="password" />
                </div>
            </div>
             {% if result.errors.password == 'required' %}
                <div class="alert alert-danger">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
            {% endif %}
            <div class="field">
                <div class="span1">
                    <label for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                </div>
                <div class="span3">
                    <input type="password" name="password_confirmation" id="password_confirmation" />
                </div>
            </div>
            {% if result.errors.password == 'confirmation' %}
                <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            {% endif %}
            <input class="submit_button" type="submit" value="{{ 'Crear cuenta' | translate }}" />
        </form>
    </div>
</div>
