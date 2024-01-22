# Kubernetes Deployments

##  Introduction
- What is Deployment?
Deployment is a higher-level concept that manages ReplicaSets and provides declarative updates to Pods along with a lot of other useful features. Therefore, it is recommended to use Deployments instead of directly using ReplicaSets and pods.

You describe state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments.

## Use Cases
- Create a Deployment to rollout a ReplicaSet. The ReplicaSet creates Pods in the background. Check the status of the rollout.

- Rollback to an earlier Deployment revision if the current Deployment isn’t stable. Check the status of the rollback.

- Scale up the Deployment to facilitate more load.

- Pause the Deployment to apply multiple fixes to its Pod template.

- Resume the Deployment to start a new rollout.

- Use the status command to view the rollout status of a Deployment.

- Cleanup older ReplicaSets that you don’t need anymore.

## Create a Deployment
- Create a Deployment named nginx-deployment, and instruct the Deployment to create three Pod replicas, I will be using yaml file to create the deployment
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
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
        - name: nginx
            image: nginx:1.14.2
            ports:
            - containerPort: 80
```
- Create the Deployment
```
kubectl create -f nginx-deployment.yaml
```
- View the Deployment
```
kubectl get deployments
```

- View the ReplicaSet
```
kubectl get replicasets
```

- View the Pods
```
kubectl get pods
```

## Update the deployment
- Update the image of the application to version 1.16.1
```
kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1 
```

OR

- Update the image of the application to version 1.16.1 using yaml file
```
containers:
- name: nginx
  image: nginx:1.16.1
  ports:
  - containerPort: 80
```

- View the Deployment status
```
kubectl rollout status deployment/nginx-deployment
```


## Rollback the deployment

- View the rollout history
```
kubectl rollout history deployment/nginx-deployment
```

- Rollback to the previous version
```
kubectl rollout undo deployment/nginx-deployment
```

- Rollback to a specific revision
```
kubectl rollout undo deployment/nginx-deployment --to-revision=n
```
Change n to the revision number you wish to rollback to.


## Pause and Resume a deployment

- Pause the deployment
```
kubectl rollout pause deployment/nginx-deployment
```

- Resume the deployment
```
kubectl rollout resume deployment/nginx-deployment
```

## Scale a deployment

- Scale using the command line
```
kubectl scale deployment nginx-deployment --replicas=5
```
This command will scale the deployment to 5 replicas.

- Scale using yaml file
```
spec:
  replicas: 5
```


## Strategies for Deploying Updates

- Recreate
   In this strategy, the existing ReplicaSet is scaled down to zero and a new one is created with the updated Pod template. This is the default strategy for Deployments.

- Rolling Update
    In this strategy, the Deployment updates Pods in a rolling fashion. It ensures that only a certain number of Pods are down while they are being updated in one go. This is the default strategy for DaemonSet and StatefulSet.

    ### Example
    ```
    spec:
    strategy:
        type: RollingUpdate
        rollingUpdate:
        maxSurge: 1
        maxUnavailable: 1
    ```
    maxSurge: The maximum number of Pods that can be scheduled above the desired number of Pods.

    maxUnavailable: The maximum number of Pods that can be unavailable during the update process.

- Blue/Green
    In this strategy, two Deployments are created. One with the current version of the application and the other with the updated version. Once the new version is ready, traffic is switched to the new version by updating the service to point to the Pods of the new version.(No downtime)

### Example
```
spec:
  strategy:
    type: BlueGreen
    blueGreen:
      activeService: blue-service
      previewService: green-service
      prePromotionCheck: labelSelector:
        matchLabels:
          ready: "true"
```

- Canary
    In this strategy, a new version of the application is deployed alongside the current version. Once the new version is ready, a small amount of traffic is routed to the new version. If the new version is stable, the traffic is gradually increased to the new version. If the new version is not stable, the traffic is rolled back to the previous version.

### Example
```
spec:
  strategy:
    type: Canary
    canary:
      steps:
      - setWeight: 10
      - pause: {}
      - setWeight: 20
      - pause: {}
      - setWeight: 30
      - pause: {}
      - setWeight: 40
      - pause: {}
      - setWeight: 50
      - pause: {}
      - setWeight: 60
      - pause: {}
      - setWeight: 70
      - pause: {}
      - setWeight: 80
      - pause: {}
      - setWeight: 90
      - pause: {}
      - setWeight: 100
```

## A/B Testing
- A/B testing is a strategy where two versions of an application are deployed and traffic is split between the two versions. This is useful when you want to test a new version of an application without affecting the existing version.


## Clean up
- Delete the deployment
```
kubectl delete deployment nginx-deployment
```



Next we will look at Kubernetes Services


### References
https://kubernetes.io/docs/concepts/workloads/controllers/deployment/



Thank You and Happy Coding :)

## The End







