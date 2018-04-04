<div id="account-address" class="container">
    {% snipplet "page-header.tpl" with page_header_title =  "Dirección" | translate %}
    <div class="account-address-form row m-top m-bottom">
        <form action="" method="post" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            <div class="form-group">
                <label for="name">{{ 'Nombre' | translate }}</label>
                <input type="text" name="name" id="name" class="form-control {% if result.errors.name %}input-error{% endif %}" value="{{ result.name | default(address.name) }}">
            </div>
            {% if result.errors.name %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu nombre!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="address">{{ 'Dirección' | translate }}</label>
                <input type="text" name="address" id="address" class="form-control {% if result.errors.address %}input-error{% endif %}" value="{{ result.address | default(address.address) }}">
            </div>
             {% if result.errors.address %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu dirección!' | translate }}</p></div>
            {% endif %}
            {% if current_language.country == 'BR' %}
                <div class="form-group">
                    <label for="number">{{ 'Número' | translate }}</label>
                    <input type="text" name="number" id="number" class="form-control {% if result.errors.number %}input-error{% endif %}" value="{{ result.number | default(address.number) }}">
                </div>
                {% if result.errors.number %}
                    <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu número!' | translate }}</p></div>
                {% endif %}
                <div class="form-group">
                    <label for="floor">{{ 'Piso' | translate }}</label>
                    <input type="text" name="floor" id="floor" class="form-control {% if result.errors.floor %}input-error{% endif %}" value="{{ result.floor | default(address.floor) }}">
                </div>
                {% if result.errors.floor %}
                    <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu piso!' | translate }}</p></div>
                {% endif %}
                <div class="form-group">
                    <label for="locality">{{ 'Localidad' | translate }}</label>
                    <input type="text" name="locality" id="locality" class="form-control {% if result.errors.locality %}input-error{% endif %}" value="{{ result.locality | default(address.locality) }}">
                </div>
                {% if result.errors.locality %}
                    <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu localidad!' | translate }}</p></div>
                {% endif %}
            {% endif %}
            <div class="form-group">
                <label for="zipcode">{{ 'Código Postal' | translate }}</label>
                <input type="text" name="zipcode" id="zipcode" class="form-control {% if result.errors.zipcode %}input-error{% endif %}" value="{{ result.zipcode | default(address.zipcode) }}">
            </div>
            {% if result.errors.zipcode %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu código postal!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="city">{{ 'Ciudad' | translate }}</label>
                <input type="text" name="city" id="city" class="form-control {% if result.errors.city %}input-error{% endif %}" value="{{ result.city | default(address.city) }}">
            </div>
            {% if result.errors.city %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu ciudad!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="province">{{ 'Provincia' | translate }}</label>
                <input type="text" name="province" id="province" class="form-control {% if result.errors.province %}input-error{% endif %}" value="{{ result.province | default(address.province) }}">
            </div>
            {% if result.errors.province %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu provincia!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="country">{{ 'País' | translate }}</label>
                <select name="country" id="country" class="form-control {% if result.errors.country %}input-error{% endif %}">{{ country_options }}</select>
            </div>
            {% if result.errors.country %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu país!' | translate }}</p></div>
            {% endif %}
            <div class="form-group">
                <label for="phone">{{ 'Teléfono' | translate }}</label>
                <input type="text" name="phone" id="phone" class="form-control {% if result.errors.phone %}input-error{% endif %}" value="{{ result.phone | default(address.phone) }}">
            </div>
            {% if result.errors.phone %}
                <div class="alert alert-danger text-center-xs"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Debes ingresar tu teléfono!' | translate }}</p></div>
            {% endif %}
            <input class="btn btn-info col-xs-12 col-sm-12 col-md-7 col-lg-7 pull-right" type="submit" value="{{ 'Guardar cambios' | translate }}">
        </form>
    </div>
</div>
