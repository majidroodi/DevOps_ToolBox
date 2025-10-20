# Kubernetes Practice: Nginx Reverse Proxy + EchoServer

This project deploys two applications on Kubernetes:

1. **EchoServer** – a simple backend that returns request info.  
2. **Nginx Reverse Proxy** – acts as a frontend to handle HTTPS and forward traffic to EchoServer.

---

#### Requirements

- A running Kubernetes cluster (minikube, kind, kubeadm, or cloud).  
- Installed tools:
  - `kubectl`
  - `openssl`
  - `curl` (optional, for testing)

---

## Deployment Steps

### Create Namespace

```bash
kubectl apply -f namespace.yaml
```

All resources will be created in the namespace `reverse-proxy`.

---

### Deploy EchoServer

Apply the deployment and service:

```bash
kubectl apply -f echoserver-deployment.yaml
kubectl apply -f echoserver-service.yaml
```

Check resources:

```bash
kubectl get pods,svc -n reverse-proxy -o wide
```

EchoServer runs on port `8080`, with NodePort `30080`.

---

### Generate TLS Certificate and Create Secret

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout tls.key -out tls.crt   -subj "/CN=*.local.net"   -addext "subjectAltName=DNS:*.local.net,DNS:local.net"

kubectl create secret tls nginx-tls   --cert=tls.crt --key=tls.key   -n reverse-proxy
```

This secret will be mounted in Nginx at `/etc/nginx/ssl`.

---

### Apply ConfigMaps

```bash
kubectl apply -f nginx-config.yaml
kubectl apply -f default-config.yaml
```

- `nginx-config.yaml` contains the main nginx.conf.  
- `default-config.yaml` defines the upstream and server blocks.

---

### 5️⃣ Deploy Nginx Reverse Proxy

```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

Check resources:

```bash
kubectl get all -n reverse-proxy -o wide
```

Nginx listens on ports:

- **80** → HTTP (redirects to HTTPS)  
- **443** → HTTPS (TLS termination)

---

### Test the Setup

Find your node IP:

```bash
kubectl get nodes -o wide
```

Then test:

```bash
curl -k https://<NODE_IP>:30443/
```

or open in browser:

```
https://<NODE_IP>:30443/
```

✅ You should see output from the EchoServer, like:

```
Hostname: echoserver-7c8b74cb9b-xyz
Request served by echoserver
```

---

## How NodePort Works

- A NodePort service exposes a fixed port (30000–32767) on **every node** in the cluster.  
- You can access the service from **any node IP** using `<NodeIP>:<NodePort>`.  
- Kubernetes (via kube-proxy) automatically forwards the traffic to one of the backend pods.

---

## Cleanup

To delete all resources:

```bash
kubectl delete namespace reverse-proxy
```

---

## Deliverables

1. All YAML files (namespace, deployments, services, configs, secret).  
2. Output of:
   
   ```bash
   kubectl get deployment,svc,pod,secret,configmap -n reverse-proxy -o wide
   ```
3. Screenshot or curl output showing successful connection via Nginx.  
4. A short explanation of NodePort and any issues you faced.
