cat configmap/reverseproxy.conf

# configmap 생성
kubectl create configmap nginx-config --from-file=configmap/reverseproxy.conf
kubectl get configmap
kubectl get configmap nginx-config -o yaml

# 파드
kubectl create -f configmap/nginx.yml
kubectl get pod

# 서비스
kubectl create -f configmap/nginx-service.yml
kubectl get service

# url
minikube service helloworld-nginx-service --url
http://192.168.49.2:31869

# 상세도 높이기
curl http://192.168.49.2:31869 -vvvv

# 컨테이너 로그인(nodejs가 아닌 nginx로)
kubectl exec -it helloworld-nginx -c nginx -- bash

# 마운트된 볼륨 확인
ps x
cat /etc/nginx/conf.d/reverseproxy.conf