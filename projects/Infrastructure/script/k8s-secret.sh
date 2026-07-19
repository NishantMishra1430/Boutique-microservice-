kubectl create secret generic authdburl --from-literal=DBurl="postgresql://postgres:postgres123@postgres:5432/auth_db" -n boutique && \
kubectl create secret generic productdburl --from-literal=DBurl="postgresql://postgres:postgres123@postgres:5432/products_db" -n boutique && \
kubectl create secret generic ordersdburl --from-literal=DBurl="postgresql://postgres:postgres123@postgres:5432/orders_db" -n boutique && \
kubectl create secret generic userdburl --from-literal=DBurl="postgresql://postgres:postgres123@postgres:5432/users_db" -n boutique && \
kubectl create secret generic boutique-postgres-password --from-literal=pg-password="postgres123" -n boutique && \
kubectl create secret generic boutique-postgres-username --from-literal=pg-username="postgres" -n boutique