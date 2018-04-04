{% snipplet "sidebar.tpl" %}
<div id="content" class="single address">
    <h1 class="title">{{ "Minha conta" | translate }}</h1>
    {% snipplet "breadcrumbs.tpl" %}
    <div class="account-form-wrapper">
        <form action="" method="post">
            {% if result.errors.name %}
                <div class="error">{{ 'Você precisa cadastrar um Nome!' | translate }}</div>
            {% endif %}
            {% if result.errors.address %}
                <div class="error">{{ 'É necessário preencher o seu endereço!' | translate }}</div>
            {% endif %}
            {% if result.errors.number %}
                <div class="error">{{ 'É necessário preencher o número do endereço!' | translate }}</div>
            {% endif %}
            {% if result.errors.floor %}
                <div class="error">{{ 'É necessário preencher o seu andar!' | translate }}</div>
            {% endif %}
            {% if result.errors.locality %}
                <div class="error">{{ 'É necessário preencher o seu bairro!' | translate }}</div>
            {% endif %}
            {% if result.errors.zipcode %}
                <div class="error">{{ 'É necessário preencher o seu CEP!' | translate }}</div>
            {% endif %}
            {% if result.errors.city %}
                <div class="error">{{ 'É necessário preencher a sua Cidade!' | translate }}</div>
            {% endif %}
            {% if result.errors.province %}
                <div class="error">{{ 'É necessário preencher o seu Estado!' | translate }}</div>
            {% endif %}
            {% if result.errors.country %}
                <div class="error">{{ 'É necessário preencher o seu País!' | translate }}</div>
            {% endif %}
            {% if result.errors.phone %}
                <div class="error">{{ 'É necessário preencher o seu Telefone!' | translate }}</div>
            {% endif %}
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="name">{{ 'Nome' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="name" id="name" value="{{ result.name | default(address.name) }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="address">{{ 'Endereço' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="address" id="address" value="{{ result.address | default(address.address) }}" />
                </div>
            </div>
            {% if current_language.country == 'BR' %}
                <div class="row-bs">
                    <div class="col-md-3">
                        <label for="number">{{ 'Número' | translate }}</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="number" id="number" value="{{ result.number | default(address.number) }}" />
                    </div>
                </div>
                <div class="row-bs">
                    <div class="col-md-3">
                        <label for="floor">{{ 'Complemento' | translate }}</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="floor" id="floor" value="{{ result.floor | default(address.floor) }}" />
                    </div>
                </div>
                <div class="row-bs">
                    <div class="col-md-3">
                        <label for="locality">{{ 'Bairro' | translate }}</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="locality" id="locality" value="{{ result.locality | default(address.locality) }}" />
                    </div>
                </div>
            {% endif %}
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="zipcode">{{ 'CEP' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="zipcode" id="zipcode" value="{{ result.zipcode | default(address.zipcode) }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="city">{{ 'Cidade' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="city" id="city" value="{{ result.city | default(address.city) }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="province">{{ 'Estado' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="province" id="province" value="{{ result.province | default(address.province) }}" />
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="country">{{ 'País' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <select name="country" id="country">{{ country_options }}</select>
                </div>
            </div>
            <div class="row-bs">
                <div class="col-md-3">
                    <label for="phone">{{ 'Telefone' | translate }}</label>
                </div>
                <div class="col-md-3">
                    <input type="text" name="phone" id="phone" value="{{ result.phone | default(address.phone) }}" />
                </div>
            </div>
            <div class="button">
                <input type="submit" name="submit" value="{{ 'Atualizar Cadastro' | translate }}" />
            </div>
        </form>
    </div>
</div>
