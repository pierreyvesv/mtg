---
title: "Debug Categories"
layout: single
permalink: /debug/
---
<h2>site.categories dump</h2>
<ul>
{% for cat in site.categories %}
  <li>
    <strong>{{ cat[0] }}</strong> ({{ cat[1].size }} posts)
    <ul>
      {% for post in cat[1] %}
        <li>
          <a href="{{ post.url }}">{{ post.title }}</a> 
          (categories front matter: {{ post.categories }})
        </li>
      {% endfor %}
    </ul>
  </li>
{% endfor %}
</ul>
