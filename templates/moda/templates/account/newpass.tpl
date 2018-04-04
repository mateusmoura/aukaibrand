{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ (customer.password ? 'Mudar Minha Senha' : 'Ativar Conta') | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <form action="" method="post">
            {% if failure %}
                <div class="error">{{ 'As senhas não coincidem. Digite novamente.' | translate }}</div>
            {% endif %}
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
                    <label for="password_confirm">{{ 'Confirmar Senha' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="password" name="password_confirm" id="password_confirm" />
                </div>
            </div>
            <div class="button">
                <input type="submit" name="submit" value="{{ (customer.password ? 'Mudar Minha Senha' : 'Ativar Conta')  | translate }}" />
            </div>
        </form>
    </div>
</div>