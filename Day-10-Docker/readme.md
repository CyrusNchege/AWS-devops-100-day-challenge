# Docker

Docker is a containerization platform that allows you to package and distribute applications and their dependencies in a consistent and portable way. Containers are lightweight, isolated environments that can run applications and services, making it easier to deploy and manage software across different environments, such as development, testing, and production.

Why containerization?

- **Consistency:** Containers provide a consistent environment for your application to run in. This means that your application will run the same way on any machine, regardless of any custom settings or configurations that may exist on the machine.

- **Portability:** Containers are portable, meaning that you can run them on any machine that has Docker installed. This makes it easy to deploy your application to different environments, such as development, testing, and production.

- **Isolation:** Containers are isolated from each other and from the host machine. This means that if one container crashes or becomes compromised, it won't affect any other containers or the host machine.

- **Efficiency:** Containers are lightweight and use fewer resources than virtual machines. This makes it easier to run multiple containers on a single host machine without sacrificing performance.

## Prerequisites

- Docker installed on your machine

[Install Docker](https://docs.docker.com/get-docker/)

## Example

In this example, we will create a simple Django application and deploy it to a Docker container.

### Step 1: Create a Django application

1. **Create a project directory:**

   - Create a project directory called "django-docker" and navigate to it.

   ```python
   mkdir django-docker && cd django-docker
   ```

2. **Create a virtual environment:**

   - Create a virtual environment called "venv" and activate it.

   ```python
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install Django:**

   - Install Django in the virtual environment.

   ```python
   pip install django
   ```

   ```
   pip freeze > requirements.txt
   ```

4. **Create a Django project:**

   - Create a Django project called "myproject".

   ```python
   django-admin startproject myproject .
   ```

5. **Create a Django app:**

    - Create a Django app called "myapp".
    
    ```python
    python manage.py startapp myapp
    ```

    After creating the app, you should see a new directory called "myapp" in your project directory.

    Add the app to the INSTALLED_APPS list in the "myproject/settings.py" file.

    ```python
    INSTALLED_APPS = [
        ...
        'myapp',
    ]
    ```

6. **Create a Django view:**

    - Open the "myapp/views.py" file and add the following code:
    
    ```python
    from django.http import HttpResponse
    
    def index(request):
        return HttpResponse("Hello, world!")
    ```

7. **Create a Django URL:**

    - Open the "myproject/urls.py" file and add the following code:
    
    ```python
    from django.contrib import admin
    from django.urls import path, include
    
    urlpatterns = [
        path('admin/', admin.site.urls),
        path('', include('myapp.urls')),
    ]
    ```
    
    - Create a new file called "myapp/urls.py" and add the following code:
    
    ```python
    from django.urls import path
    
    from . import views
    
    urlpatterns = [
        path('', views.index, name='index'),
    ]
    ```

    8. **Test the Django app:**

    - Run the Django app and test it in your browser.

    ```python
    python manage.py runserver
    ```

    Check that the app is running by visiting http://localhost:8000 in your browser.


### Step 2: Create a Dockerfile
Docker File is a text file used to define the instructions for building a Docker image. It specifies the base image to use, the commands to run, and the files to copy into the image.



Example Dockerfile:

```python
FROM python:3.8

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python", "manage.py", "runserver", "

```

### Step 3: Build the Docker image

 ### What is a Docker image? 

A Docker image is a read-only template that contains a set of instructions for creating a container that can run on the Docker platform. It is built from a Dockerfile and can be used to create multiple containers that all run the same application.


Build the Docker image using the following command:

```python
docker build -t myproject .
```

The `-t` flag is used to tag the image with a name. In this case, we are tagging the image with the name "myproject".

### Step 4: Run the Docker container

Run the Docker container using the following command:

```python
docker run --name myproject -d -p 8000:8000 myproject
```

The `-d` flag is used to run the container in detached mode. The `-p` flag is used to map the host port to the container port. In this case, we are mapping port 8000 on the host to port 8000 on the container.

### Step 5: Test the Django app

Test the Django app by visiting http://localhost:8000 in your browser.

### Step 6: Pushing the Docker image to Docker Hub or any other registry

Push the Docker image to Docker Hub or any other registry using the following command:

```python

docker push myproject

```


### Step 7: Pulling the Docker image from Docker Hub or any other registry

Pull the Docker image from Docker Hub or any other registry using the following command:

```python

docker pull myproject

```

### Other useful Docker commands

- List all Docker images:

```python
docker images
```

- List all Docker containers:

```python

docker ps -a

```

- Stop a Docker container:

```python

docker stop <container_id>

```

- Remove a Docker container:

```python

docker rm <container_id>

```
This removes stopped containers only. To remove a running container.


- Remove a Docker image:

```python
docker rmi <image_id>
```

- Execute a command in a running Docker container:

```python
docker exec -it <container_id> <command>
```

example :

```python
docker exec -it 8b3f5a5a8b3f /bin/bash
```

- View logs of a Docker container:

```python
docker logs <container_id>
```




