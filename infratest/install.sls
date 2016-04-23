# vim: ft=sls
# How to install infratest
{%- from "infratest/map.jinja" import infratest with context %}

{% if infratest.install.git %}
infratest_install_from_git:
  git.latest:
    - name: {{ infratest.install.url }}
    - target: {{ infratest.install.target }}
    - branch: {{ infratest.install.branch }}
    - user: {{ infratest.install.user }}
{% endif %}

{% if infratest.install.deps.from_pip %}
{% for deppkg in infratest.install.deps.pkgs %}
infratest_install_deps_from_pip_{{ deppkg }}:
  pip.installed:
    - name: {{ deppkg }}
{% endfor %}
{% endif %}

infratest_sync_modules:
  module.run:
    - name: saltutil.sync_modules
    - refresh: True
