# Olist Analytics Platform

Projeto de estruturação de uma ambiente de Analytics baseado no dataset Brazilian E-Commerce Public Dataset by Olist

## 📜 Sumário
1. [📌 Sobre o Projeto](#-sobre-o-projeto)
2. [⚙️ Tecnologias Utilizadas](#️-tecnologias-utilizadas)
3. [🚀 Como Executar](#-como-executar)
4. [📊 Estrutura do Projeto](#-estrutura-do-projeto)
5. [🗒️ Licença](#️-licença)
6. [📞 Contato](#-contato)


## 📌 Sobre o Projeto
Este repositório contém uma estrutura completa de analytics com um pipeline ELT (Extract, Load, Transform) utilizando ferramentas Open Source da Modern Data Stack, além de visualização de dados com o Microsoft Power BI.

### Arquitetura utilizada
![Imgur](https://i.imgur.com/i6Bhy1s.png)

## ⚙️ Tecnologias Utilizadas
- Python 
- dlt (data load tool)
- dbt (data build tool)
- Docker
- PostgreSQL
- Power BI

## 🚀 Como Executar
Acesse o dashboard no [Power BI Service](!). 

![dash](!)

#### Pré-requisitos
- Python 3.12+
- Docker
- uv

#### Execução 
1. **Clone o repositório**
```bash
git clone https://github.com/datalopes1/olist_platform
cd olist_platform
```

2. **WIP**
```plaintext
WIP
```
3. **`.env`**
```plaintext
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_pwd
POSTGRES_HOST=host.docker.internal
```


4. **`.dlt`**
```plaintext
[destination.postgres.credentials]
driver = "postgres"
host = "host.docker.internal"
port = 5433
database = "your_db"
username = "your_user"
password = "your_pwd"
```

## 📊 Estrutura do Projeto
```plaintext
WIP
```

## 🗒️ Licença
Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.

## 📞 Contato
- LinkedIn: https://www.linkedin.com/in/datalopes1
- Portfolio: https://datalopes1.github.io/
- E-mail: datalopes1@proton.me




