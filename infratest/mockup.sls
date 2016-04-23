# vim: ft=sls
# How to install infratest
{%- from "infratest/map.jinja" import infratest with context %}

{% if infratest.mockup.enabled %}
infratest_mockup_install_deps:
  pkg.installed:
    - pkgs: {{ infratest.mockup.deps }}
{% endif %}
