# vim: ft=sls
# How to install infratest
{%- from "infratest/map.jinja" import infratest with context %}

{% if infratest.run_all %}
infratest_run_all_tests:
  module.run:
    - name: infratest.run_all
{% endif %}
