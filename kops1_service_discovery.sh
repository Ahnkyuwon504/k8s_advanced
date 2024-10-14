cat service-discovery/secrets.yml
minikube start

# db
kubectl create -f service-discovery/database.yml
kubectl create -f service-discovery/database-service.yml

# app
kubectl create -f service-discovery/helloworld-db.yml
kubectl create -f service-discovery/helloworld-db-service.yml

# URL
minikube service helloworld-db-service --url
http://192.168.49.2:31012

# 파드 로그 확인
kubectl logs {helloworld-deployment pod name}
Example app listening at http://:::3000
Connection to db established

# app에서 node index-db.js 통해 cnt++
curl http://192.168.49.2:31012
Hello World! You are visitor number 1

# db login(host)
kubectl exec database -it -- mysql -u root -p

# in mySQL
show databases;
use helloworld;
show tables;
select * from visits;

+----+---------------+
| id | ts            |
+----+---------------+
|  1 | 1728915643477 |
|  2 | 1728915654811 |
|  3 | 1728915658565 |
+----+---------------+
\q

# busybox
kubectl run -i --tty busybox --image=busybox --restart=Never -- sh
nslookup helloworld-db-service
nslookup database-service

telnet helloworld-db-service 3000
GET /
Hello World! You are visitor number 4