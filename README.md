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
Create database
```
docker exec -it postgresql psql -U myusername
create database dbt
```

## Installing Package
1. Create packages.yml file inside dbt project
2. Inside packages.yml file
```
packages:
  - package: calogica/dbt_expectations
    version: [">=0.8.0", "<0.9.0"]
  - package: EqualExperts/dbt_unit_testing
    version: 0.3.4
```
3. run ```dbt deps``` to install package
