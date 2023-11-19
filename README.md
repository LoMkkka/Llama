# Llama

<h1 align="center">Развертывание LLAMA в Grafana с помощью Terrafrom и Ansible</a> 
<img src="https://github.com/blackcater/blackcater/raw/main/images/Hi.gif" height="32"/></h1>


```mermaid
erDiagram
    Node-1 ||--o{ Master : ping
    Node-2 ||--o{ Master : ping
    Node-3 ||--o{ Master : ping
    Master {
        string carRegistrationNumber PK, FK
        string driverLicence PK, FK
    }
