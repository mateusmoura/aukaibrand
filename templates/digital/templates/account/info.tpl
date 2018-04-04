{% snipplet "sidebar.tpl" %}
<div id="content" class="single">
    <h1 class="title">{{ "Minha conta" | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <form action="" method="post">
            {% if result.errors.name %}
                <div class="error">{{ 'Você precisa cadastrar um Nome!' | translate }}</div>
            {% endif %}
            {% if result.errors.email == 'exists' %}
                <div class="error">{{ 'Já existe uma conta para este e-mail!' | translate }}</div>
            {% elseif result.errors.email %}
                <div class="error">{{ 'Você precisa cadastrar um e-mail válido!' | translate }}</div>
            {% endif %}
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="name">{{ 'Nome' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="name" id="name" value="{{ result.name | default(customer.name) }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="email">{{ 'Email' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email | default(customer.email) }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="phone">{{ 'Telefone' | translate }} {{ '(opcional)' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone | default(customer.phone) }}" />
                </div>
            </div>
            <div class="button">
                <input type="submit" name="submit" value="{{ 'Atualizar Cadastro' | translate }}" />
            </div>
        </form>
    </div>
</div>