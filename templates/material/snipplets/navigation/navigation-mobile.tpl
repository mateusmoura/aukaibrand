{% for page in pages %}
    <li>
        <a class="d-block container-fluid clear-both text-decoration-none text-wrap no-link p-top p-bottom border-bottom" href="{{ page.url }}">
            {{ page.name }}</a>
     </li>
{% endfor %}
