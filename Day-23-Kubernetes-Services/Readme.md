# Kubernetes Services

## What is a Kubernetes Service?
A service is a method of exposing an application running on a set of Pods as a network service. It is a Kubernetes resource that provides a stable IP address and DNS name for a set of Pods. It also provides a way to access the Pods from outside the cluster.

## Why do we need a Kubernetes Service?
- Pods are ephemeral. They can be created and destroyed at any time. When a Pod is destroyed, it is replaced by a new Pod with a different IP address. This makes it difficult to access the Pods from outside the cluster.
- A service provides a stable IP address and DNS name for a set of Pods. This makes it easy to access the Pods from outside the cluster.

## Types of Kubernetes Services
- ClusterIP
    - This is the default type of service. Exposes the service on a cluster-internal IP. Choosing this value makes the service only reachable within the cluster.
- NodePort
    - Exposes the service on each Node’s IP at a static port (the NodePort). A ClusterIP service, which is automatically created, is assigned to the service. Range for NodePort is 30000-32767.

- LoadBalancer
    -  Creates an external load balancer in the current cloud (if supported) and assigns it to the service. A ClusterIP service, which is automatically created, is assigned to the service.

- ExternalName
    - Maps the service to the contents of the externalName field (e.g. ‘my-service.example.com’). No proxying of any kind is done. This requires version 1.7 or higher of kube-dns.

## Creating a ClusterIP Service
- Create a service yaml file
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
    type: ClusterIP
    selector:
        app: my-app
    ports:
    - targetPort: 80
      port: 80
```
This service exposes port 80 of the Pods selected by the selector app: my-app. The service is exposed on port 80 of the cluster-internal IP address.

- Create the service
```
kubectl create -f my-service.yaml
```

- View the service
```
kubectl get services
```

- View the details of the service
```
kubectl describe service my-service
```

- Creating a service using the kubectl expose command
```
kubectl expose deployment my-app --port 80 --target-port=80 --name=my-service --type=ClusterIP
```

## Creating a NodePort Service
- Create a service yaml file
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
    type: NodePort
    selector:
        app: my-app
    ports:
    - targetPort: 80
      port: 80
      nodePort: 30080
```
This service exposes port 80 of the Pods selected by the selector app: my-app. The service is exposed on port 30080 of the Node IP address.

Note: The nodePort value must be in the range 30000-32767.

- Create the service
```
kubectl create -f my-service.yaml
```

- View the service
```
kubectl get services
```

- Creating a service using the kubectl expose command
```
kubectl expose deployment my-app --port 80 --target-port=80 --name=my-service --type=NodePort
```

## Creating a LoadBalancer Service
- Create a service yaml file
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
    type: LoadBalancer
    selector:
        app: my-app
    ports:
    - targetPort: 80
      port: 80
```

This service exposes port 80 of the Pods selected by the selector app: my-app. The service is exposed on port 80 of the external IP address of the load balancer.

- Create the service
```
kubectl create -f my-service.yaml
```

- View the service
```
kubectl get services
```
- Creating a service using the kubectl expose command
```
kubectl expose deployment my-app --port 80 --target-port=80 --name=my-service --type=LoadBalancer
```

## Creating an ExternalName Service
- Create a service yaml file
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
    type: ExternalName
    externalName: my-service.example.com
```

This service maps the service to the contents of the externalName field (e.g. ‘my-service.example.com’). No proxying of any kind is done.

- Create the service
```
kubectl create -f my-service.yaml
```

- View the service
```
kubectl get services
```

- Creating a service using the kubectl expose command
```
kubectl expose deployment my-app --type=ExternalName --name=my-service --external-name=my-service.example.com
```

## Deleting a Service
- Delete the service
```
kubectl delete service my-service
```

## References
- https://kubernetes.io/docs/concepts/services-networking/service/


Thanks and happy coding:)

