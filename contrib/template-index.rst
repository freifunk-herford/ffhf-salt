{{ title }}

Inhalt:

.. toctree::
   :maxdepth: {{ maxdepth }}

   {% for index in toc -%}
   {{ index }}
   {% endfor %}
