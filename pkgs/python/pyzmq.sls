include:
  - pkgs.system.gcc
  - pkgs.system.pip
  - pkgs.system.swig

pyzmq:
  pip.installed:
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pkg: gcc
      - pkg: swig
