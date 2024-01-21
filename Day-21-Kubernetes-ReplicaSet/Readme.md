# Kubernetes ReplicaSet
This section is a continuation of the K8s learning. In this section we will learn about ReplicaSet.

## What is ReplicaSet?

ReplicaSet is a controller that is used to create multiple replicas of a pod. It is a replacement of Replication Controller. It is a part of the deployment object. It is used to make sure that a specified number of replicas of a pod are running at any given point of time. It is a declarative way of maintaining the desired number of pods.

## Why ReplicaSet?

- ReplicaSet is used to make sure that a specified number of replicas of a pod are running at any given point of time.
 - It maintains desired number of pods.

## How ReplicaSet works?

ReplicaSet works on the label selector. It uses the label selector to identify the pods that it needs to manage. It then compares the actual number of pods with the desired number of pods. If the actual number of pods is less than the desired number of pods, it creates new pods. If the actual number of pods is more than the desired number of pods, it deletes the extra pods.

## ReplicaSet vs Replication Controller

Replication Controller is the older version of ReplicaSet lacked features such as selectors. ReplicaSet is the newer version of Replication Controller. It is recommended to use ReplicaSet instead of Replication Controller.

## ReplicaSet vs Deployment

Deployment is a higher level object that manages ReplicaSet and provides additional features such as rolling updates, rollbacks, etc. It is recommended to use Deployment instead of ReplicaSet.

## ReplicaSet Use Cases

ReplicaSet is used to make sure that a specified number of replicas of a pod are running at any given point of time. It is used to maintain the desired number of pods. It is used to scale the pods horizontally.

## ReplicaSet Example

You define a ReplicaSet in a YAML file. The following is an example of a ReplicaSet YAML file.

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-replicaset
  labels:
    app: my-app
    type: front-end
spec:
    replicas: 3
    selector:
        matchLabels:
        type: front-end
    template:
        metadata:
        labels:
            type: front-end
        spec:
        containers:
        - name: nginx-container
          image: nginx
```

This will create a ReplicaSet with 3 replicas of a pod. The pod will have a label type: front-end. The ReplicaSet will use this label to identify the pods that it needs to manage. It will then compare the actual number of pods with the desired number of pods. If the actual number of pods is less than the desired number of pods, it will create new pods. If the actual number of pods is more than the desired number of pods, it will delete the extra pods.

## ReplicaSet Commands

To create a ReplicaSet, use the following command.

```bash
kubectl create -f replicaset-definition.yml
```

To get the list of ReplicaSets, use the following command.

```bash
kubectl get replicaset
```

To get the detailed information about a ReplicaSet, use the following command.

```bash
kubectl describe replicaset my-replicaset
```

To delete a ReplicaSet, use the following command.

```bash
kubectl delete replicaset my-replicaset
```

## Conclusion

In this section, we learned about ReplicaSet. We also learned about the difference between ReplicaSet and Replication Controller. In the next section, we will learn about Deployment.

## References

https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/


*Thanks and happy Coding! :)*

## The End


