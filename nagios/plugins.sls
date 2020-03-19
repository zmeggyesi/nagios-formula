{% from "nagios/map.jinja" import nagios with context %}

nagios-plugins:
  pkg.installed:
    - name: {{ salt['pillar.get']('nagios:plugins', 'nagios-plugins') }}

{% if salt['pillar.get']("nagios:plugins:extra_pkgs", False) %}
nagios-extra-plugin-pkgs:
  pkg.installed:
    - pkgs: {{ salt['pillar.get']("nagios:plugins:extra_pkgs")|json }}
{% endif %}
