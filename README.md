# Llama

<h1 align="center">Развертывание LLAMA в Grafana с помощью Terrafrom и Ansible</a> 
<img src="https://github.com/blackcater/blackcater/raw/main/images/Hi.gif" height="32"/></h1>

LLAMA (Loss and Latency MAtrix) - это библиотека для тестирования и измерения сетевых потерь и задержек между распределенными конечными точками. Ссылка на [проект](https://github.com/dropbox/llama).

Collector отправляет UDP-пакет (зонд) на прослушиваемый порт reflector и измеряет, сколько времени требуется для их возврата.

Архитектура
- Reflector - Упрощенный демон для приема зондов и отправки их обратно к источнику.
- Collector - Отправляет зонды reflector на нескольких портах, записывает результаты и представляет данные через REST API.
- Scraper - Извлекает результаты из REST API из collector и записывает в базу данных InfluxDB.

```mermaid
erDiagram
    Node-1 ||--o{ Master-node : ping
    Node-2 ||--o{ Master-node : ping
    Node-3 ||--o{ Master-node : ping
    Node-1 {
       Have reflector
    }
    Node-2 {
       Have reflector
    }
    Node-3 {
       Have reflector
    }
    Master-node {
       Have collector
       and scraper
    }
```


## С чего начать?

Terraform и Openstack.

Первым делом необходима авторизация с Openstack API. Это можно сделать по нашей документации: [Создание сервисного пользователя](https://docs.selectel.ru/cloud/servers/tools/openstack/#создать-сервисного-пользователя) и [Настройка авторизации](https://docs.selectel.ru/cloud/servers/tools/openstack/#настроить-авторизацию).

Если вы работаете с нового сервера, то можно запустить скрипт `setup1.sh`, который развернет необходимую среду для начала работ.

Убедиться, что вы авторизовались в Openstack API через скачанный файл `source rc.sh`.

Далее создаем серверы:
- Инициализация рабочего каталога `terraform init` (Необходимые terraform-providers уже имеются в данном репозитории)
- Посмотреть какие серверы и параметры будут созданы `terraform plan` 
- Начать создание серверов `terraform apply`

## Связанность серверов
После того как серверы созданы, необходимо убедиться, что они имеют связанность между собой.
- Запускаем скрипт `setup2.sh`, который заполняет нужные файлы данными для развертывания проекта.
- Дважды запускаем `ansible-playbook test.yml` в папке `ansible`, который проверит связность между мастером и нодами.

## Запуск MegaLLama

После получения положительного результата связанности, запускаем плейбук `ansible-playbook /root/Llama/ansible/MEGALLAMA.yml` и ждем...
После успешного развертывания заходим по ip мастера с портом `3000`. Данные для входа выставлены по дефолту `admin/admin`. 

# P.S.
Файл `alert.yaml` запаролен, т.к. содержит токены в приватный канал телеграмма. Пример шаблона для алертов будет указан по пути `Llama/ansible/grafana/files/alert1.yaml` 
