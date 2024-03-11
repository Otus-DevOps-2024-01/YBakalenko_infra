# YBakalenko_infra

1. Создан инвентори-файл в форматах INI и YAML
2. Создана конфигурация ansible (ansible.cfg) для работы с инвентори
3. Создан плейбук clone.yml
4. При первичном выполнении прейбука clone.yml вывод следующий:
   appserver                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

   При удалении приложения reddit через команду ansible app -m command -a 'rm -rf ~/reddit' и повторном выполнении плейбука clone.yml вывод команды получается следующим:
      appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

   Причина заключается в том, что первичное выполенние плейбука не выполнило изменений на сервере приложения, т.к. приложение уже было развернуто. А повторный запуск плейбука как раз выполнил повторную установку
