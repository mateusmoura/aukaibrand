{% if store_fb_app_id %}
    <div id="facebook-login-button" class="col-xs-12 col-sm-12 col-lg-12 col-md-12 p-relative p-none">
        <input type="button" class="btn btn-info col-xs-12 col-sm-12 col-lg-12 col-md-12" value="{{ 'Facebook login' | translate }}" onclick="loginFacebook();">
        <i class="fa fa-facebook p-absolute"></i>
    </div>
    {% if result.facebook and result.invalid %}
    	<div class="alert alert-danger text-center-xs col-xs-12 m-half-top"><div class="arrow arrow-up"></div><i class="material-icons d-inline pull-left m-half-right m-none-xs m-quarter-bottom-xs">&#xE000;</i><p>{{ 'Hubo un problema con el login de Facebook.' | translate }}</p></div>
	{% endif %}
     <div class="facebook-divider col-xs-12 col-sm-12 col-lg-12 col-md-12 text-center">
        <h4>{{ 'o' | translate }}</h4>
        <hr class="divider">
    </div>
{% endif %}
