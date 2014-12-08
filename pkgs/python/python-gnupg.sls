include:
  - pkgs.system.pip

{%- if grains['os'] == 'Fedora' %}
uninstall-python-gnupg:
  pkg.removed:
    - name: python-gnupg
{%- endif %}

python-gnupg:
  pip.installed:
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      {%- if grains['os'] == 'Fedora' %}
      - pkg: uninstall-python-gnupg
      {%- endif %}
