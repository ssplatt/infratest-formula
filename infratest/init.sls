# vim: ft=sls
# Init infratest
{%- from "infratest/map.jinja" import infratest with context %}
{# Below is an example of having a toggle for the state #}

{% if infratest.enabled %}
include:
  - infratest.mockup
  - infratest.install
  - infratest.run
{% else %}
'infratest-formula disabled':
  test.succeed_without_changes
{% endif %}

