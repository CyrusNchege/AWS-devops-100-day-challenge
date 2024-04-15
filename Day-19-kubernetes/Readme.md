# Kubernetes

Kubernetes also known as K8s is an open-source system for automating deployment, scaling, and management of containerized applications.\

It was built by Google to manage their applications running on containers in their data centers. It is now maintained by Cloud Native Computing Foundation (CNCF).

Kubernetes is a Greek word which means helmsman or pilot.

## Why Kubernetes?

We use kubernetes to manage our containers in a clustered environment. It is a container orchestration tool, which means it automates the deployment, scaling and management of containers in an application.

## Advantages of Kubernetes
- Service discovery and load balancing - Kubernetes can expose a container using the DNS name or using their own IP address. If traffic to a container is high, Kubernetes is able to load balance and distribute the network traffic so that the deployment is stable.
- Storage orchestration - Kubernetes allows you to automatically mount a storage system of your choice, such as local storages, public cloud providers, and more.
- Automated rollouts and rollbacks - You can describe the desired state for your deployed containers using Kubernetes, and it can change the actual state to the desired state at a controlled rate. For example, you can automate Kubernetes to create new containers for your deployment, remove existing containers and adopt all their resources to the new container.
- Automatic bin packing - You provide Kubernetes with a cluster of nodes that it can use to run containerized tasks. You tell Kubernetes how much CPU and memory (RAM) each container needs. Kubernetes can fit containers onto your nodes to make the best use of your resources.
- Self-healing - Kubernetes restarts containers that fail, replaces containers, kills containers that don't respond to your user-defined health check.
- Secret and configuration management - Kubernetes lets you store and manage sensitive information, such as passwords, OAuth tokens, and SSH keys. You can deploy and update secrets and application configuration without rebuilding your container images, and without exposing secrets in your stack configuration.
- Horizontal scaling - You can scale your application up and down with a simple command, with a UI, or automatically based on CPU usage.
- Ipv4 and Ipv6 dual-stack - Kubernetes supports IPv4 and IPv6 dual-stack for services and containers.
- Batch execution - Kubernetes supports batch execution.

## Kubernetes Architecture
- Node - is a physical or virtual machine on which Kubernetes is installed. 
    - Master Node - is a node that controls the cluster. It is responsible for managing the cluster.
    - Worker Node - is a node that runs the application. It is responsible for running the actual application.
- Cluster -  Set of nodes grouped together. If one node fails, the application is still accessible through other nodes in the cluster. It also provides high availability. And also load balancing.

- Pod - Single instance of an application. It is the smallest unit that can be managed by Kubernetes. It is a logical collection of one or more containers that are always co-located, co-scheduled, and run in a shared context. Containers in a Pod share an IP address and port space, are always co-located and co-scheduled, and run in a shared context on the same Node.

## Kubernetes Components

- API Server -  This acts as the front-end of the Kubernetes control plane. Management devices, Command line interfaces all talk to the API server to communicate with the Kubernetes cluster. It is the only component that interacts with the etcd database.

- etcd - This is a key-value store that stores all the data used to manage the cluster. It is a distributed database that stores the cluster state and configuration data. It is the single source of truth for the cluster. (If we have multiple masters, then etcd is replicated across all the masters to ensure that all masters have the same data)

- Scheduler - This component is responsible for distributing work or containers across multiple nodes. It looks for newly created containers and assigns them to nodes. It considers the available resources, quality of service requirements, policies, and other factors.

- Controller Manager - This is the brain of the cluster. It is responsible for the running of controllers. It is responsible for the cluster's workload, making sure the cluster is in the desired state. It is also responsible for node management, replication, endpoints, and service accounts.

- Kubelet - This is the agent that runs on each node in the cluster. It makes sure that containers are running in a pod. It takes a set of PodSpecs that are provided through various mechanisms and ensures that the containers described in those PodSpecs are running and healthy. It also takes care of starting, stopping, and maintaining application containers inside the pods.

- Container Runtime - This is the software that is responsible for running containers. Kubernetes supports several container runtimes: **Docker**, containerd, CRI-O, and any implementation of the Kubernetes CRI (Container Runtime Interface).

- kube-proxy - This is a network proxy that runs on each node in the cluster. It maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.


## Kubectl
This is a tool that allows us to run commands to interact with the cluster. It is a command line interface for running commands against Kubernetes clusters. It is used to deploy applications, inspect and manage cluster resources, and view logs.

### Some useful commands
- `kubectl get nodes` - This command lists all the nodes in the cluster.
- `kubectl get pods` - This command lists all the pods in the cluster.
- `kubectl get pods -o wide` - This command lists all the pods in the cluster along with the node on which they are running.
- `kubectl get pods -o wide --sort-by=.spec.nodeName` - This command lists all the pods in the cluster along with the node on which they are running, sorted by node name.

Other helpful commands include:
When you want to get pod defination yaml file of an already running pod, you can use the following command:
```
kubectl get pod <pod-name> -o yaml > my-pod.yaml
```

# Containers in Kubernetes
In the beginning, Kubernetes was designed to run Docker containers. But now it supports other container runtimes like containerd, CRI-O, etc.

The above was enabled by introduction of Container Runtime Interface (CRI),CRI allowed any vendor to run as a container runtime in Kubernetes

They however have to comply with the OCI (Open Container Initiative) standards.
OCI consists of two specifications:
- Image Specification
- Runtime Specification

Image Specification - This is a specification that defines how a container image should be built. It defines the format of the image and the metadata that should be included in the image.

Runtime Specification - This is a specification that defines how a container should be run. It defines the runtime environment for the container, including the filesystem, environment variables, and other runtime settings.





