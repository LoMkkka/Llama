FROM grafana/grafana:latest

# Опционально: добавляем кастомные настройки, например, конфигурацию источников данных
COPY provisioning/datasource.yaml /etc/grafana/provisioning/datasources

# Опционально: добавляем кастомные дашборды
COPY provisioning/dashboards /etc/grafana/dashboards


# Опционально: добавляем настройки для определенного источника данных, например, InfluxDB
#COPY provisioning/datasource.yaml /etc/grafana/provisioning/datasources/

# Опционально: добавляем настройки для определенного дашборда
COPY provisioning/dashboard.yaml /etc/grafana/provisioning/dashboards/

# Если у вас ессть готовый шаблон аларом, то откомментите строку ниже 
COPY provisioning/alert.yaml     /etc/grafana/provisioning/alerting

USER root
RUN chown -R 472:472 /etc/grafana/
USER grafana
# Экспонируем порт, на котором будет работать Grafana
EXPOSE 3000

# Запускаем Grafana
CMD ["grafana-server", "--config=/etc/grafana/grafana.ini"]
