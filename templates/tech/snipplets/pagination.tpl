<div style="text-align:center;">
    {% if pages.numbers %}
        <ul class="pagination">
            {% if pages.previous %}
                <li><a href="#">&laquo;</a></li>
            {% endif %}
            {% for page in pages.numbers %}
                {% if page.selected %}
                    <li class="active"><a href="{{ page.url }}">{{ page.number }}</a></li>
                {% else %}
                    <li><a href="{{ page.url }}">{{ page.number }}</a></li>
                {% endif %}
            {% endfor %}
            {% if pages.next %}
                <li><a href="#">&raquo;</a></li>
            {% endif %}
        </ul>
    {% endif %}
</div>
