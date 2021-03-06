<div class="page-account container page">
    <div class="headerBox-Page row">
        <div class="col-md-12">
            <div class="section-title">
                <fieldset><legend><h1>{{ "Crear cuenta" | translate }}</h1></legend></fieldset>
            </div>
        </div>
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="account-form-wrapper span6 offset3 sst">
        <form id="login-form" action="" method="post" class="form-horizontal">
            {% if result.errors.name %}
            <div class="col-sm-offset-4 col-sm-5">
                <div class="bg-danger c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            </div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
            <div class="col-sm-offset-4 col-sm-5">
                <div class="bg-danger c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
            </div>
            {% elseif result.errors.email %}
            <div class="col-sm-offset-4 col-sm-5">
                <div class="bg-danger c">{{ 'Debes ingresar un email válido!' | translate }}</div>
            </div>
            {% endif %}
            {% if result.errors.password == 'required' %}
            <div class="col-sm-offset-4 col-sm-5">
                <div class="bg-danger c">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
            </div>
            {% endif %}
            {% if result.errors.password == 'confirmation' %}
            <div class="col-sm-offset-4 col-sm-5">
                <div class="bg-danger c">{{ 'Las contraseñas no coinciden.' | translate }}</div>
            </div>
            {% endif %}
            {% if store_fb_app_id %}
                <div class="col-sm-offset-4 col-sm-5 c">
                    <input class="general-button facebook" type="button" value="{{ 'Regístrate con Facebook' | translate }}" onclick="loginFacebook();" />
                </div>
                <div class="col-sm-offset-4 col-sm-5 text-center">
                    <span class="badge">{{ 'o' | translate }}</span>
                    <hr class="featurette-or-divider"></hr>
                </div>
            {% endif %}
            <div class="form-group">
                <label class="control-label col-sm-4" for="name">{{ 'Nombre' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="name" id="name" value="{{ result.name }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">{{ 'Email' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="password">{{ 'Contraseña' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="password" name="password" id="password" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                <div class="col-sm-5">
                    <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-5">
                    <input class="product-related-button" type="submit" value="{{ 'Crear cuenta' | translate }}" />
                </div>
            </div>
        </form>
    </div>
</div>