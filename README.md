# dbt-workshop
## Installation
### DBT
```
 python3 -m venv dbt-env   
 source dbt-env/bin/activate
 python -m pip install dbt-postgres  
```
### PostgreSQL
```
colima start
docker pull postgres
docker run --name postgresql -e POSTGRES_USER=myusername -e POSTGRES_PASSWORD=mypassword -p 5432:5432 -d postgres
```

## Getting Started
Make sure you already have installed DBT
```
dbt --version
```
Initial DBT
```
dbt init dbt_workshop
cd dbt_workshop
```
