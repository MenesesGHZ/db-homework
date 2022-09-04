# db-homework
## Setup project
```sh
docker compose up -d
docker exec -it pharmacy-container ./manage.py makemigrations db
docker exec -it pharmacy-container ./manage.py migrate db
```

## Explore database with Adminer
Since we are using `Adminer` as our db management tool, go to `localhost:8080` and enter the following params in order to have access to
its dashboard
```sh
System: MySQL
Server: mysql
Username: root
Password: password
Database: pharmacy
```
![image](https://user-images.githubusercontent.com/52936839/188303813-417cb39e-76ef-4711-a3c3-04b084ce5a5f.png)
![image](https://user-images.githubusercontent.com/52936839/188303785-bcf03da9-cae0-4a1f-9ab8-2f4bcc297ba8.png)
