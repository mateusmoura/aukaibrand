<section class="section-register">
    <div class="container-fluid">
        {% snipplet "breadcrumbs.tpl" %}
    </div>

    <div class="container">
        <div class="row">
            <div class="section-register__form">
                <form id="login-form" action="" method="post" class="form-horizontal">
                    <h1>{{ "Cadastre-se" | translate }}</h1>

                    {% if result.errors.name %}
                        <div class="col-12">
                            <div class="st alert alert-error alert-danger c">{{ 'Debes ingresar tu nombre!' | translate }}</div>
                        </div>
                    {% endif %}
                    {% if result.errors.email == 'exists' %}
                        <div class="col-12">
                            <div class="st alert alert-error alert-danger c">{{ 'Ya existe una cuenta para este email!' | translate }}</div>
                        </div>
                    {% elseif result.errors.email %}
                        <div class="col-12">
                            <div class="st alert alert-error alert-danger c">{{ 'Debes ingresar un email válido!' | translate }}</div>
                        </div>
                    {% endif %}
                    {% if result.errors.password == 'required' %}
                        <div class="col-12">
                            <div class="st alert alert-error alert-danger c">{{ 'Debes ingresar tu contraseña!' | translate }}</div>
                        </div>
                    {% endif %}
                    {% if result.errors.password == 'confirmation' %}
                        <div class="col-12">
                            <div class="st alert alert-error alert-danger c">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                        </div>
                    {% endif %}
                    {% if store_fb_app_id %}
                        <div class="col-12">
                            <i class="fa fa-facebook"></i>
                            <input class="button facebook" type="button" value="Facebook Login" onclick="loginFacebook();" />
                            <span class="badge">{{ 'o' | translate }}</span>
                            <hr class="featurette-or-divider"></hr>
                        </div>
                    {% endif %}
                    <div class="col-12">
                        <div class="form-group">
                            <label class="control-label" for="name">{{ 'Nombre' | translate }}</label>
                            <input class="form-control" type="text" name="name" id="name" value="{{ result.name }}" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label class="control-label" for="email">{{ 'Email' | translate }}</label>
                            <input class="form-control" autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label class="control-label" for="phone">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                            <input class="form-control" type="text" name="phone" id="phone" value="{{ result.phone }}" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label class="control-label" for="password">{{ 'Contraseña' | translate }}</label>
                            <input class="form-control" type="password" name="password" id="password" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label class="control-label" for="password_confirmation">{{ 'Confirmar Contraseña' | translate }}</label>
                            <input class="form-control" type="password" name="password_confirmation" id="password_confirmation" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="control-group">
                            <input class="submit_button btn btn-dark btn-block" type="submit" value="{{ 'Crear cuenta' | translate }}" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
