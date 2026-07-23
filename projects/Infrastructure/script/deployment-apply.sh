kubectl apply -f ../../boutique-microservices/backend/services/auth/k8s/auth.yaml -n boutique && \

kubectl apply -f ../../boutique-microservices/backend/services/gateway/k8s/gateway.yaml -n boutique && \

kubectl apply -f ../../boutique-microservices/backend/services/order-service/k8s/order-srv.yaml -n boutique && \

kubectl apply -f ../../boutique-microservices/backend/services/orders/k8s/orders.yaml -n boutique && \

kubectl apply -f ../../boutique-microservices/backend/services/product-service/k8s/product.yaml -n boutique && \

kubectl apply -f ../../boutique-microservices/backend/services/user-service/k8s/user.yaml -n boutique && \

kubectl apply -f ../../boutique-microservices/frontend/k8s/frontend.yaml -n boutique