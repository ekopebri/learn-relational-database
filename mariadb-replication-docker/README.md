# change permission to 0444
`chmod 0444 config-files/primary/primary-1.cnf`

# Config for secondary init
`docker exec mariadb-primary cat /etc/hosts`

```
docker exec mariadb-primary cat /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.19.0.2      2139ef03a447
```

change value init secondary init
```sql
CHANGE MASTER TO
  MASTER_HOST='172.19.0.2',
  MASTER_USER='repluser',
  MASTER_PASSWORD='replsecret',
  MASTER_PORT=3306,
  MASTER_CONNECT_RETRY=10;
```

## TEST
### check status slave
`docker exec -it mariadb-secondary-1 mariadb -uroot -psecret -e 'show slave status\G'`

### create table and insert data to primary
```cmd
docker exec -it mariadb-primary mariadb -uroot -psecret -e 'USE primary_db; CREATE TABLE primary_db.primary_tbl(name VARCHAR(100)); INSERT INTO primary_db.primary_tbl values  ("Anna"), ("Andreia"), ("Kaj"), ("Monty"), ("Ian"), ("Vicentiu"),
 ("Daniel"), ("Faustin"),("Vlad"),("Anel");'
```

### check data in secondary database
```cmd
docker exec -it mariadb-secondary-1 mariadb -uroot -psecret -e 'select * from primary_db.primary_tbl;'
```