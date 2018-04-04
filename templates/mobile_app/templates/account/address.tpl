<div class="container">
    <div class="page-header-container container">
        <div class="col-md-8 col-sm-12 col-xs-12 page-header">
            <h1>{{ "Mi cuenta" | translate }}</h1>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4 breadcrumbs-wrapper hidden-phone hidden-tablet">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
    </div>
    <div class="account-form-wrapper float-none div-center col-md-6 col-sm-11 col-xs-11 margin-top-x2 margin-bottom-x2">
        <form action="" method="post" class="form-horizontal">
            {% if result.errors.name %}
                <div class="alert alert-error">{{ 'Debes ingresar tu nombre!' | translate }}</div>
            {% endif %}
            {% if result.errors.address %}
                <div class="alert alert-error">{{ 'Debes ingresar tu dirección!' | translate }}</div>
            {% endif %}
            {% if result.errors.number %}
                <div class="alert alert-error">{{ 'Debes ingresar tu número!' | translate }}</div>
            {% endif %}
            {% if result.errors.floor %}
                <div class="alert alert-error">{{ 'Debes ingresar tu piso!' | translate }}</div>
            {% endif %}
            {% if result.errors.locality %}
                <div class="alert alert-error">{{ 'Debes ingresar tu localidad!' | translate }}</div>
            {% endif %}
            {% if result.errors.zipcode %}
                <div class="alert alert-error">{{ 'Debes ingresar tu código postal!' | translate }}</div>
            {% endif %}
            {% if result.errors.city %}
                <div class="alert alert-error">{{ 'Debes ingresar tu ciudad!' | translate }}</div>
            {% endif %}
            {% if result.errors.province %}
                <div class="alert alert-error">{{ 'Debes ingresar tu provincia!' | translate }}</div>
            {% endif %}
            {% if result.errors.country %}
                <div class="alert alert-error">{{ 'Debes ingresar tu país!' | translate }}</div>
            {% endif %}
            {% if result.errors.phone %}
                <div class="alert alert-error">{{ 'Debes ingresar tu teléfono!' | translate }}</div>
            {% endif %}
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ result.name | default(address.name) }}" />
            </div>
            <div class="form-group">
                <label for="address">{{ 'Dirección' | translate }}</label>
                <input type="text" name="address" id="address" class="form-control" value="{{ result.address | default(address.address) }}" />
            </div>
            {% if current_language.country == 'BR' %}
                <div class="form-group">
                    <label for="number">{{ 'Número' | translate }}</label>
                    <input type="text" name="number" id="number" class="form-control" value="{{ result.number | default(address.number) }}" />
                </div>
                <div class="form-group">
                    <label for="floor">{{ 'Piso' | translate }}</label>
                    <input type="text" name="floor" id="floor" class="form-control" value="{{ result.floor | default(address.floor) }}" />
                </div>
                <div class="form-group">
                    <label for="locality">{{ 'Localidad' | translate }}</label>
                    <input type="text" name="locality" id="locality" class="form-control" value="{{ result.locality | default(address.locality) }}" />
                </div>
            {% endif %}
            <div class="form-group">
                <label for="zipcode">{{ 'Código Postal' | translate }}</label>
                <input type="text" name="zipcode" id="zipcode" class="form-control" value="{{ result.zipcode | default(address.zipcode) }}" />
            </div>
            <div class="form-group">
                <label for="city">{{ 'Ciudad' | translate }}</label>
                <input type="text" name="city" id="city" class="form-control" value="{{ result.city | default(address.city) }}" />
            </div>
            <div class="form-group">
                <label for="province">{{ 'Provincia' | translate }}</label>
                <input type="text" name="province" id="province" class="form-control" value="{{ result.province | default(address.province) }}" />
            </div>
            <div class="form-group">
                <label for="country">{{ 'País' | translate }}</label>
                <select name="country" id="country" class="form-control">{{ country_options }}</select>
            </div>
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }}</label>
                <input type="text" name="phone" id="phone" class="form-control" value="{{ result.phone | default(address.phone) }}" />
            </div>
            <div class="form-group">
                <input class="btn btn-secondary col-md-12 col-sm-12 col-xs-12" type="submit" value="{{ 'Guardar cambios' | translate }}" />
            </div>
        </form>
    </div>
</div>
