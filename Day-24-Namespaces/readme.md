# Namespaces in kubernetes

Namespaces provide a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces. Namespace-based scoping is applicable only for namespaced objects (e.g. Deployments, Services, etc.) and not for cluster-wide objects (e.g. StorageClass, Nodes, PersistentVolumes, etc.).

## Initial namespaces

- 1. default: The default namespace for objects with no other namespace
    Kubernetes includes this namespace so that you can start using your new cluster without first creating a namespace.
- 2. kube-system: The namespace for objects created by the Kubernetes system
- 3. kube-public: This namespace is created automatically and is readable by all users (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster.
- 4. kube-node-lease: This namespace holds the lease objects associated with each node which improves the performance of the node heartbeats as the cluster scales.

## Why use namespaces?

- 1. Multiple teams or users working in the same cluster

- 2. Multiple environments (e.g. dev, test, prod) in the same cluster

- 3. Resource quotas
    Namespaces are a way to divide cluster resources between multiple users (via resource quotas) and to segregate resources between multiple teams or environments.
- 4. Access control
    Namespaces are a way to divide cluster resources between multiple users (via role-based access control) and to segregate resources between multiple teams or environments.

# Namespace commands
To create a namespace, use the following command.

```bash
kubectl create namespace my-namespace
```

To get the list of namespaces, use the following command.

```bash
kubectl get namespaces
```

To get the detailed information about a namespace, use the following command.

```bash
kubectl describe namespace my-namespace
```

To delete a namespace, use the following command.

```bash
kubectl delete namespace my-namespace
```
Displaying pods in a specific namespace

```bash
kubectl get pods --namespace=my-namespace
```
Getting pods from all namespaces

```bash
kubectl get pods --all-namespaces
```

Creating a pod in a specific namespace

```bash
kubectl run my-pod --image=nginx --namespace=my-namespace
```

# Switching between namespaces
To switch between namespaces, use the following command.

```bash
kubectl config set-context --current --namespace=my-namespace
```

# Creating a namespace using yaml file
You can also create a namespace using a yaml file. The following is an example of a namespace yaml file.

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: my-namespace

```

Then you can create the namespace using the following command.

```bash
kubectl create -f namespace-definition.yml
```

# Namespace scope
Namespaces provide a scope for names. 
Namespace scope in Kubernetes refers to the boundary within which names of resources must be unique. This means that resources such as pods, services, replication controllers, and others created within a namespace must have unique names within that namespace. However, the same resource names can be reused across different namespaces without conflicts.

For example, if you create a pod named my-pod within the default namespace, you cannot create another pod with the same name (my-pod) within the same namespace. However, you can create a pod with the name my-pod in a different namespace, such as development or testing, without any issues.

# Resource Quotas
Resource quotas are a way to limit the amount of resources that can be consumed in a namespace. This can help prevent one team or user from consuming all the resources in a cluster, and can also help prevent accidental resource exhaustion.

To create a resource quota, you can define a quota in a yaml file and apply it to a namespace. The following is an example of a resource quota yaml file.

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: my-resource-quota
spec:
    hard:
        pods: "10"
        requests.cpu: "4"
        requests.memory: 4Gi
        limits.cpu: "8"
        limits.memory: 8Gi
```
    
    Then you can create the resource quota using the following command.
    
    ```bash
    kubectl create -f resource-quota-definition.yml
    ```

# Namespaces and DNS
Kubernetes provides DNS for service discovery within a namespace. When you create a service in a namespace, Kubernetes automatically creates a DNS entry for that service. This allows other pods within the same namespace to discover and communicate with the service using the DNS name.

For example, if you create a service named my-service in the default namespace, other pods within the default namespace can access the service using the DNS name `my-service.default.svc.cluster.local`.

Detailed example for DNS in namespaces

You have a db-service in the default namespace. You have a web-service in the default namespace. The web-service needs to connect to the db-service. The web-service can connect to the db-service using the DNS name `db-service.default.svc.cluster.local`.

So the format is `service-name.namespace.svc.cluster.local`.

