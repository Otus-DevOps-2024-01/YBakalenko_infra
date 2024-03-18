# YBakalenko_infra

1. Созданы пользовательские роли Ansible для базы данных (ansible/roles/db) и
   приложения (ansible/roles/app) с вызовами через отдельные плэйбуки (ansible/playbooks/db.yml и ansible/playbooks/app.yml соответственно)
2. Созданы отдельные окаружения с со своими переменными и инвентарями для сред stage и
   prod (environments/stage и environment/prod)
3. Добавлена коммьюнити-роль jdauphant.nginx для обратного проксирования с порта 80
   на порт приложения 9292
4. Добавлены кастомные учетные записи в ВМ с шифрованием паролей черех ansible-vault в файлах переменных сред credentials.yml через приватный ключ vault.key
