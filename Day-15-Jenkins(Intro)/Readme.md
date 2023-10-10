# Challenge 15 - Jenkins (Intro)

## Introduction

### What is Jenkins?
Jenkins is an open-source automation server coded in Java, designed to streamline various aspects of software development, including building, testing, and deploying applications. It facilitates continuous integration and continuous delivery (CI/CD) processes. Jenkins operates as a server-based system within servlet containers like Apache Tomcat. It's compatible with several version control tools such as Git, Subversion, and Mercurial. Jenkins is also highly customizable, with more than 1,000 plugins that enable users to integrate various third-party tools and services.

### Features of Jenkins
- **Automation:** Jenkins automates repetitive tasks such as building, testing, and deploying code, reducing manual intervention.

- **Extensibility:** It has a vast library of plugins that extend its functionality and can be easily integrated into your pipelines.

- **Distributed:** Jenkins can distribute tasks across multiple machines, allowing parallel execution of jobs for faster builds.

- **Community Support:** It has a large and active user community, which means you can find solutions to common problems quickly.

- **Customizable:** You can customize Jenkins to fit your specific development and deployment needs.

- **Free and Open Source:** Jenkins is free to use.

### Jenkins Architecture
Jenkins architecture is a master-slave architecture. The master node is responsible for the management of jobs, builds, and reports. The slave nodes are responsible for the execution of the build jobs. The master distributes the build to the slaves to execute the build and send the result back to the master.

### Jenkins Installation

For this challenge, we will be using Jenkins on Docker. To install Jenkins on Docker, follow the steps below:

1. Install Docker on your system. You can follow the instructions [here](https://docs.docker.com/get-docker/).

2. Pull the Jenkins image from Docker Hub using the command below:

    ```bash
    docker pull jenkins/jenkins
    ```
3. Run the Jenkins image using the command below:

    ```bash
    docker run --name jenkins  -p 8080:8080 -p 50000:50000  --network jenkins  -v jenkins-data:/var/jenkins_home  jenkins/jenkins:latest

    ```
    The command above will create a container named `jenkins` and run it on port `8080` and `50000`. It will also create a volume named `jenkins-data` and mount it to the `/var/jenkins_home` directory in the container. The container will also be connected to the `jenkins` network.
    
4. Open your browser and navigate to `localhost:8080`. You should see the Jenkins dashboard.

5. To get the initial password, run the command below:

    ```bash
    docker exec -it <container-id> cat /var/jenkins_home/secrets/initialAdminPassword
    ```
    Replace `<container-id>` with the container ID of the Jenkins container.

6. Copy the password and paste it in the Jenkins dashboard.

7. Install the suggested plugins.

8. Create an admin user.

9. Click on `Save and Finish`.

10. Click on `Start using Jenkins`.

11. You should see the Jenkins dashboard.

### Creating a Jenkins Pipeline

project (Hello World)

1. Click hello job
- click new item
- name the project
- select freestyle project and click ok

2. Configure the project
- click on configure
- click on build
- click on add build step
- select execute shell
- type in the command `echo "Hello World"`
- click on save

3. Build the project
- click on build now
- click on the build number
- click on console output
- you should see the output `Hello World`

The above is a simple example of a Jenkins project. In the next challenge, we will be creating a Jenkins pipeline.




