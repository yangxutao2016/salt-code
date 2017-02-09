zabbix-agent:
  pkg.installed:
    - name: zabbix22-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf 
    - source: salt://init/files/zabbix_agentd.conf
    - backup: minion
    - template: jinja
    - defaults:
      Zabbix_Server: {{ pillar['Zabbix_Server'] }}
    - require:
      - pkg: zabbix-agent
  service.running:
    - enable: True
    - watch:
      - pkg: zabbix-agent
      - file: zabbix-agent
