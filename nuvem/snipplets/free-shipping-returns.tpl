<div class="banner__free">
  {% for item in menus["free_shipping_returns"]  %}
    <div class="container">
      <div class="row">
        <div class="col-12">
            <a href="{{ item.url }}">{{ item.name }}</a>
        </div>
      </div>
    </div>
  {% endfor %}
</div>