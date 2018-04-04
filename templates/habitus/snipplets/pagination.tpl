<div class="crumbPaginationContainer bottom">
    <ul class="pagination">
        {% if pages.numbers %}
            {% if pages.previous %}
                <li><a href="{{ pages.previous }}">&laquo;</a></li>
            {% endif %}
            {% for page in pages.numbers %}
                {% if page.selected %}
                    <li><span class="active">{{ page.number }}</span></li>
                {% else %}
                    <li><a href="{{ page.url }}">{{ page.number }}</a></li>
                {% endif %}
            {% endfor %}
            {% if pages.next %}
                <li><a href="{{ pages.next }}">&raquo;</a></li>
            {% endif %}
        {% endif %}
    </ul>
</div>