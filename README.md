# YBakalenko_infra

1. Установка Docker
2. Создание VM в Yandex Clound для Docker engine через Yandex Client CLI
3. Настройка удаленного Docker engine daemon на базе виртуальной машины в Yandex Cloud
   Т.к. в современной сборке Docker отсутствует docker-machine, установка Docker engine  виртуальной машине выполнена вручную, а для работы с удаленным  Docker engine применялась команда export DOCKER_HOST=Remote_IP:2375
4. Создание образа ВМ с предустановленным MongoDB, Ruby и приложением Reddit на удаленном Docker engine через
   Dockerfile
5. Загрузка образа Docker на Docker hub и локальное создание контейнера из образа, полученного из Docker hub
