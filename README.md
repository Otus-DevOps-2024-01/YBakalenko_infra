# YBakalenko_infra

## Устройство Gitlab CI. Построение процесса непрерывной поставки (gitlab-ci-1)
1. Установка GitLab CE в контейнере Docker удаленного движка через docker compose
2. Настройка админки GitLab (группы, учетки, проект)
3. Запуск раннеров в контейнерах docker и их регистрация в проекте Gitlab
4. Создание пайплайнов с деплойментом и тестированием приложения
5. Добавление окружений для `dev` / `stage`/ `prod` и условий запуска: вручную (manual) и по тегам git
6. Добавление динамических окружений для запуска jobs в окружениях соответствующих выделенных веток git

## Разработка и тестирование Ansible ролей и плейбуков (ansible-4)
1. Сделан скрипт Vagrant (Vagrantfile) для деплоя виртуальных машин локально через провайдер гипервизора VmWare Fusion
   (`vmware_desktop`)
2. Написан Python-скрипт с модулем `Testinfra` для тестирования роли при деплое тестовой ВМ через Molecule

## Ansible: работа с ролями и окружениями (ansible-3)
1. Созданы пользовательские роли Ansible для базы данных (`ansible/roles/db`) и приложения (`ansible/roles/app`) с вызовами через отдельные плэйбуки (`ansible/playbooks/db.yml` и `ansible/playbooks/app.yml` соответственно)
2. Созданы отдельные окаружения с со своими переменными и инвентарями для сред stage и prod (`environments/stage` и `environment/prod`)
3. Добавлена коммьюнити-роль `jdauphant.nginx` для обратного проксирования с порта `80` на порт приложения `9292`
4. Добавлены кастомные учетные записи в ВМ с шифрованием паролей черех `ansible-vault` в файлах переменных сред `credentials.yml` через приватный ключ `vault.key`

## Деплой и управление конфигурацией с Ansible (ansible-2)
1. Созданы инвентори-файлы в форматах INI, YAML и JSON
2. Создан плэйбук с одним сценарием, применимым для всех хостов и разделением тасков по тэгам (`reddit_app_one_play.yml`)
3. Создан плэйбук с несколькими сценариями (для настройки MongoDB, настройки web-сервиса и деплоя самого приложения соответственно), где каждый сценарий тегирован групповым образом  (`reddit_app_multiple_plays.yml`)
4. Созданы два плэйбука, в каждом из которых определено по одному сценарию для
   запуска в провиженерах Packer при создании виртуальных машин MongoDB и приложения с Ruby (`packer_app.yml` и `packer_db.yml`)
5. Скрипты Packer адаптированы на использование плэйбуков Ansible в качестве
   провиженеров для установки MongoDb и Ruby соответственно (`db.json` и `app.json`)

## Управление конфигурацией. Основные DevOps инструменты. Знакомство с Ansible (ansible-1)
1. Создан инвентори-файл в форматах `INI` и `YAML`
2. Создана конфигурация `ansible` (`ansible.cfg`) для работы с инвентори
3. Создан плейбук `clone.yml`
4. При первичном выполнении прейбука clone.yml вывод следующий:
   `appserver                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0`
   При удалении приложения reddit через команду `ansible app -m command -a 'rm -rf ~/reddit'` и повторном выполнении плейбука `clone.yml` вывод команды получается следующим:
    `appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0`
   Причина заключается в том, что первичное выполенние плейбука не выполнило изменений на сервере приложения, т.к. приложение уже было развернуто. А повторный запуск плейбука как раз выполнил повторную установку

## Деплой тестового приложения (cloud-testapp)
1. Создан инстанс виртуальной машины через утилиту YC CLI. Данные для подключения к приложению  ВМ:
 - `testapp_IP = 51.250.69.190`
 - `testapp_port = 9292`
2. На виртуальную машину установлены через SSH: Ruby и MongoDB;
3. Установлено приложение reddit через git

## Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform. (terraform-2)
1. Разработаны скрипты Packer для создания отдельных образов ВМ приложения Ruby и базы данных Mongo
2. Разработан скрипт Terraform с неявной зависимостью атрибутов развертывания инстансов виртуальных машин от атрибутов создания сетевой инфраструктуры
3. Разработана модульная структура скрипта Terraform для параллельного деплоймента ВМ БД Mongo (модуль db) и приложения Reddit (модуль app)
4. Настроено хранение state-файла в удаленном бекенде Yandex Object Storage

## Практика IaC с использованием Terraform (terraform-1)
1. Подготовлен скрипт `terraform` деплоймента виртуальной машины из образа `reddit-base` (`main.tf`)
2. Вывод переменных (внешнего IP виртуальной машины) через Teraform `outputs.tf`
3. Деплоймент приложения в созданной виртуальной машине с применением provisioners (`main.tf`)
4. Параметризация вводных переменных деплоймента с помощью `variables.tf` и `terraform.tfvars`
5. Форматирование конфигурационных файлов через `terraform fmt`

## Сборка образов VM при помощи Packer (packer-base)
The full reddit VM image was built using Packer framework utiliing the below features:
1. Packer JSON-template (see `packer/ubuntu16.json`) with priovisioners based on Bash scripts
   installing a Ruby environment and Mongo database
2. Yandex cloud service account has been used for VM deployment and image build process
   Packer interaction with YC provider
3. Packer JSON template enhancement was done to introduce user-defined parameters from
   external file (see `packer/variables.json`) or CLI parameters
   - `variables.json` file gist:
   ```
   {
        "variables": {
                "my_folder_id": "myfolder_id",
                "my_service_account_key_file": "myserviceaccount_json_file_path",
                "my_source_image_family": "os_image_family"
        }
   }
   ```
   - shell Packer build command:
   `packer build -var-file=../packer/variables.json ../packer/ubuntu16.json`
4. A full reddit application baked VM image was prepared using a additional provisioning script
   (`packer/files/install_reddit.sh`)

## Знакомство с облачной инфраструктурой. Yandex.Cloud (cloud-bastion)
In order to SSH an internal VPC machine someinternalhost with command like
`ssh someinternalhost` from a local machine please follow the below steps:
1. Modify your local SSH configuration file `~/.ssh/config`:
   `nano ~/.ssh/config`
2. Add the following lines to the configuration file:
    ```
    Host bastionhost
            HostName <bastionhost_public_IP>
            User appuser
            Port 22
    Host someinternalhost
            HostName <someinternalhost_internal_IP>
            User appuser
            Port 22
            ProxyJump bastionhost
    ```
    For my instance:
    `bastionhost_public_IP = 51.250.66.22`
    `someinternalhost_internal_IP = 10.128.0.24s`
