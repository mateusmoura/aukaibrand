{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ "Cadastre-se" | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <form id="login-form" action="" method="post">
            {% if result.errors.name %}
                <div class="error">{{ 'Você precisa cadastrar um Nome!' | translate }}</div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
                <div class="error">{{ 'Já existe uma conta para este e-mail!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="error">{{ 'Você precisa cadastrar um e-mail válido!' | translate }}</div>
            {% endif %}
            {% if result.errors.password == 'required' %}
                <div class="error">{{ 'Você precisa cadastrar uma senha!' | translate }}</div>
            {% endif %}
            {% if result.errors.password == 'confirmation' %}
                <div class="error">{{ 'As senhas não coincidem. Digite novamente.' | translate }}</div>
            {% endif %}
            {% if store_fb_app_id %}
                <div class="span4">
                    <input class="submit_button facebook" type="button" value="{{ 'Criar conta com o Facebook' | translate }}" onclick="loginFacebook();" />
                </div>
                <div class="span4 text-center">
                    <span class="badge">{{ 'ou' | translate }}</span>
                </div>
            {% endif %}
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="name">{{ 'Nome' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="name" id="name" value="{{ result.name }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="phone">{{ 'Telefone' | translate }} {{ '(opcional)' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="password">{{ 'Senha' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="password" name="password" id="password" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="password_confirmation">{{ 'Confirmar Senha' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="password" name="password_confirmation" id="password_confirmation" />
                </div>
            </div>
            <div class="button">
                <input type="submit" name="submit" value="{{ 'Cadastre-se' | translate }}" />
            </div>
        </form>
    </div>
</div>
