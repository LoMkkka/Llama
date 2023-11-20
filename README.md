# Llama

<h1 align="center">Развертывание LLAMA в Grafana с помощью Terrafrom и Ansible</a> 
<img src="https://github.com/blackcater/blackcater/raw/main/images/Hi.gif" height="32"/></h1>

LLAMA (Loss and Latency MAtrix) - это библиотека для тестирования и измерения сетевых потерь и задержек между распределенными конечными точками.

Collector отправляет UDP-пакет (зонд) на прослушиваемый порт reflector и измеряет, сколько времени требуется для их возврата.

Architecture
- Reflector - Lightweight daemon for receiving probes and sending them back to their source.
- Collector - Sends probes to reflectors on potentially multiple ports, records results, and presents summarized data via REST API.
- Scraper - Pulls results from REST API on collectors and writes to database (currently InfluxDB).

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

Первым делом необходима авторизация с Openstack API. Это можно сделать по нашей докуменатции: [Создание сервесного пользователя](https://docs.selectel.ru/cloud/servers/tools/openstack/#создать-сервисного-пользователя) и [Настройка авторизации](https://docs.selectel.ru/cloud/servers/tools/openstack/#настроить-авторизацию).

Если вы работаете с нового сервера, то можно запустить скрипт `setup.sh`, который развернет необходимую среду для начала работы.
Файл `.terraformrc` поместить в домашнюю дерикторию `~/`.

`terraform init`
`terraform plan` просмотреть, что создатся
`terraform apply`

Убедитесь, что у вас скачен свой личный openrc.sh
Необходимые terraform-providers уже имеются в данном репозитории

Делаем jump-сервер
touch ~/.ssh/config
ansible-playbook test.yml 