# joojang.backend.docker

### Git First Push.

Use the package manager [Docker](https://www.docker.com) to install foobar.


## Git Clone.

```bash
git clone https://joojanghelp@github.com/joojanghelp/joojang.backend.docker.git
```

## Docker Build
```bash
docker-compose build --force-rm
docker-compose up -d
```

## Docker Command
```bash
// 빌드
docker-compose build --force-rm

// 이미지 초기화
docker system prune -a

// 컨테이너 접속
docker-compose exec xxxx /bin/bash

docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)

docker kill $(docker ps -q) && docker rm $(docker ps -a -q)
docker kill $(docker ps -q) && docker rm $(docker ps -a -q) && docker-compose build --force-rm
```
## mysql users

```bash
mysql -h 192.168.2.246 -uroot -p137@Key mysql -e "create user 'dbdev'@'localhost' identified by '1111'"
mysql -h 192.168.2.246 -uroot -p137@Key mysql -e "create user 'dbdev'@'%' identified by '1111'"

mysql -h 192.168.2.246 -uroot -p137@Key mysql -e "grant all privileges on *.* to 'dbdev'@'localhost'"
mysql -h 192.168.2.246 -uroot -p137@Key mysql -e "grant all privileges on *.* to 'dbdev'@'%'"
mysql -h 192.168.2.246 -uroot -p137@Key mysql -e "flush privileges"

create user 'dbdev'@'localhost' identified by '1111'
create user 'dbdev'@'%' identified by '1111'
grant all privileges on mytowndev.* to 'dbdev'@'localhost'
grant all privileges on mytowndev.* to 'dbdev'@'%'
flush privileges

revoke all on *.* FROM 'dbdev'@'localhost';
revoke all on *.* FROM 'dbdev'@'%';
```
## mysql backup && restore
```bash
mysqldump -u root --lock-all-tables --add-drop-database --add-drop-table --create-options --all-databases > /data/xxxxxx_2019121303.sql
mysql -udbdev -p1111 < /root/mysql/xxxxx.sql
mysql < xxxxx_2019121303.sql



mysqldump -u dbdev -p1111 --lock-all-tables --add-drop-database --add-drop-table --create-options --databases -d xxxxx > /data/xxxxxx_2019121303.sql






```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
