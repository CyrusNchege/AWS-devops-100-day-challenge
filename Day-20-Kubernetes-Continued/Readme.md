# Kubernetes Continued
On Day 19, we learnt about Kubernetes, its architecture and its components.  We will learn to create pods and other resources in Kubernetes. We will also learn about the different types of services in Kubernetes.

## Creating a Pod
A pod is the smallest unit of deployment in Kubernetes. It is a logical collection of one or more containers that share the same IP address and port space. A pod can be created using the following command:

```
kubectl run <pod-name> --image=<image-name>
```

Example:

```
kubectl run nginx --image=nginx
```

## Using YAML to create a Pod

A pod can also be created using a YAML file. The YAML file for creating a pod looks like this:

```
touch pod.yaml
```

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
    type: front-end
spec:
    containers:
    - name: nginx
      image: nginx
```

To create a pod using the YAML file, use the following command:

```
kubectl create -f pod.yaml
```

In pod.yaml we have 4 top level keys:

- apiVersion: This is the version of the Kubernetes API that we want to use. In this case, we are using the v1 version of the API.  apiVersion depends on **kind**. For example, 
    - apiVersion: v1

        kind: Pod
    - apiVersion: v1
    
        kind: Service

    - apiVersion: apps/v1

        kind: Deployment
    - apiVersion: apps/v1

        kind: ReplicaSet

- kind: This is the type of resource that we want to create. In this case, we are creating a pod. Other types of resources include Service, Deployment, ReplicaSet, etc.

- metadata: This is the data that we want to associate with the resource. In this case, we are associating a name and labels with the pod. Labels are key-value pairs that can be used to identify the pod.

- spec: This is the specification of the pod. In this case, we are specifying the containers that we want to run in the pod. We are also specifying the image that we want to use for the container.

## Viewing Pods

To view the pods that are running in the cluster, use the following command:

```
kubectl get pods
```

To view the pod you created for more details, use the following command:

```
kubectl describe pod <pod-name>

kubectl describe pod nginx
```

Deleting a pod:

```
kubectl delete pod <pod-name>
```

Note: There is more that can be added to the above YAML file. This is just the basic YAML file for creating a pod.

