# Configs and Secrets in Kubernetes
Secrets and ConfigMaps are kubernetes resources designed to store sensitive information and configuration data. They are used to decouple configuration from the container image, so that the same image can be used in different environments without modification.

## ConfigMaps
A ConfigMap are used to pass configuration data to a container through environment variables in form of key-value pairs. 

A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.

Note: ConfigMaps are not designed to store sensitive information. For that, you should use Secrets.

## When to use ConfigMaps?
- When you want to set configuration data separately from application code.

For example, you are developing an application that runs in different environments, such as development, testing, and production. You can use ConfigMaps to store environment-specific configuration such as database URLs, 

## Secrets
Secrets are used to store sensitive information, such as passwords, tokens, and ssh keys, Api keys, etc.
They store sensitive data in a more secure way than ConfigMaps, as data is stored in base64 encoded format.

## When to use Secrets?
- When you want to store sensitive information such as passwords, tokens, Api keys and ssh keys.


## Creating ConfigMaps
There are two ways to create ConfigMaps in Kubernetes:
1. Imperative way
Example:
```bash
kubectl create configmap my-config --from-literal=KEY1=VALUE1 --from-literal=KEY2=VALUE2
```
The above command creates a ConfigMap named `my-config` with two key-value pairs: KEY1=VALUE1 and KEY2=VALUE2.

But this will not the best way when you have a large number of key-value pairs.

2. Declarative way

Create a file named `configmap.yaml` with the following content:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
    KEY1: VALUE1
    KEY2: VALUE2
```

`VALUES1` and `VALUE2` are the values you want to store in the ConfigMap.

Then, run the following command to create the ConfigMap:
```bash
kubectl apply -f configmap.yaml
```

## Using ConfigMaps
You can use ConfigMaps in a Pod by defining environment variables in the Pod's spec section.

In your pod definition, you can refer to the ConfigMap using the `env` field in the container spec.

Example:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
    containers:
    - name: my-container
        image: nginx
        env:
        - name: KEY1
        valueFrom:
            configMapKeyRef:
                name: my-config
                key: KEY1
        - name: KEY2
        valueFrom:
            configMapKeyRef:
                name: my-config
                key: KEY2
```
In the above example, the Pod `my-pod` uses the ConfigMap `my-config` to set the environment variables KEY1 and KEY2.

## Other commands for ConfigMaps
- To view all ConfigMaps in the current namespace:
```bash
kubectl get configmaps
```
- To view a specific ConfigMap:
```bash
kubectl get configmap my-config
```
- To view the details of a ConfigMap:
```bash
kubectl describe configmap my-config
```
- To delete a ConfigMap:
```bash
kubectl delete configmap my-config
```

## Creating Secrets

There are two ways to create Secrets in Kubernetes:
1. Imperative way

Use the following command to create a Secret:
```bash
kubectl create secret generic my-secret
--from-literal=PASSWORD=pass123
--from-literal=API_KEY=12345
```
The above command creates a Secret named
`my-secret` with two key-value pairs: PASSWORD=pass123 and API_KEY=12345.

You can also create a Secret from a file

Example:
create a file named `my-secret.txt` with the following content:
```
PASSWORD=pass123
API_KEY=123
```
Then, run the following command to create a Secret from the file:
```bash
kubectl create secret generic my-secret
--from-file=my-secret.txt
```



2. Declarative way

Create a file named `secret.yaml` with the following content:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
    PASSWORD: cGFzc3dvcmQ=
    API_KEY: MTIzNDU=
```

The values PASSWORD and API_KEY are base64 encoded. You can use the following command to encode a string to base64:
```bash
echo -n "pass123" | base64
echo -n "12345" | base64
```



`PASSWORD` and `API_KEY` are the values you want to store in the Secret.

Then, run the following command to create the Secret:
```bash
kubectl apply -f secret.yaml
```

## Using Secrets
You can use Secrets in a Pod by defining environment variables in the Pod's spec section.

In your pod definition, you can refer to the Secret using the `env` field in the container spec.

Example:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
    containers:
    - name: my-container
        image: nginx
        env:
        - name: PASSWORD
        valueFrom:
            secretKeyRef:
                name: my-secret
                key: PASSWORD
        - name: API_KEY
        valueFrom:
            secretKeyRef:
                name: my-secret
                key: API_KEY
```
In the above example, the Pod `my-pod` uses
the Secret `my-secret` to set the environment variables PASSWORD and API_KEY.

## Other commands for Secrets

- To view all Secrets in the current namespace:
```bash
kubectl get secrets
```

- To view a specific Secret:
```bash
kubectl get secret my-secret
```

- To view the details of a Secret:
```bash
kubectl describe secret my-secret
```

- To delete a Secret:
```bash
kubectl delete secret my-secret
```
 
 Note: Secrets are encoded not encrypted. So, do not expose sensitive information to the public.

But you configure the secrets to be encrypted at rest by enabling the encryption provider in the Kubernetes cluster.

Or you can use a third-party tool like HashiCorp Vault, AWS Secrets Manager, or Azure Key Vault to manage your secrets.





