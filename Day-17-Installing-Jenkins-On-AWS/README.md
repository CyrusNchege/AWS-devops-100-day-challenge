# Setting up Jenkins on AWS EC2

## why install Jenkins on AWS EC2?

For real world projects, we will be using Jenkins on AWS EC2 this is because of its flexibility, scalability, and control over the Jenkins environment.


## Setting up Jenkins on AWS EC2

Login to your AWS account and follow the steps below:

### Step 1: Launch an EC2 instance

On the AWS dashboard, click on `Services` and select `EC2`.

Launch an EC2 instance with the following configuration:
- Add Name of the instance

- AMI: Ubuntu Server 22.04 LTS (HVM), SSD Volume Type

- Instance Type: t2.micro

-  Create key pair and download it

    this will be used to ssh into the instance

- On the security group part select all

Note: We will make changes to the security group later.

- Launch the instance

![instance](/Images/jenkins/ec2created.png)

### Step 2: Connect to the instance

- Open your terminal and navigate to the directory where the key pair is located.

- Change the permissions of the key pair using the command below:

    ```bash
    chmod 400 <key-pair-name>.pem
    ```

    Replace `<key-pair-name>` with the name of the key pair.

- Connect to the instance using the command below:

    ```bash
    ssh -i <key-pair-name>.pem ubuntu@<public-ip-address>
    ```

    Replace `<key-pair-name>` with the name of the key pair and `<public-ip-address>` with the public IP address of the instance.

### Step 3: Install Java

- Update the packages list on the instance using the command below:

    ```bash
    sudo apt update  && sudo apt upgrade -y
    ```

- Install Java using the command below:

    ```bash

    sudo apt install openjdk-11-jdk -y
    ```

- Verify the installation by checking the Java version:

    ```bash

    java -version
    ```

### Step 4: Install Jenkins

- Add the repository key to the system

- Add the repository to the system using the command below:

    ```bash
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

    ```
- Update the package list and install Jenkins using the command below:

    ```bash

    sudo apt update -y

    sudo apt install jenkins -y
    ```
- Start Jenkins using the command below:

    ```bash

    sudo systemctl start jenkins
    ```

- Enable Jenkins to start on boot using the command below:

    ```bash

    sudo systemctl enable jenkins
    ```
- Check the status of Jenkins using the command below:

    ```bash

    sudo systemctl status jenkins
    ```

#### Configure Security Group
For Jenkins to work properly, we need to make some changes to the security group.

- On the AWS dashboard, click on `Services` and select `EC2`.

- Click on the instance you created and click on `Security`.

- Click on the security group.

- Click on `Edit inbound rules`.

- Click on `Add rule` and add Custom TCP rule on port 8080 and allow all traffic from anywhere.
 
 This will allow us to access Jenkins on port 8080.

- Click on `Save rules`.
### Step 5: Access Jenkins

- Copy the public IP address of the instance and paste it in your browser.

- Add `:8080` to the end of the IP address and press `Enter`.

Example: `http://<public-ip-address>:8080`

![unlockjenkins](/Images/jenkins/unlockjenkins.png)
You will be welcomed with Unlock Jenkins page, to get the password, run the command below:

```bash

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the password and paste it in the `Administrator password` field and click on `Continue`.

Click on `Install suggested plugins`.
![installplugins](/Images/jenkins/installplugins.png)   

Create an admin user and click on `Save and Finish`.

![adminuser](/Images/jenkins/admin.png)

Click on `Start using Jenkins`.

You should see the Jenkins dashboard.

![jenkinsdashboard](/Images/jenkins/dashboard.png)

Congratulations! You have successfully installed Jenkins on AWS EC2.


Remember to terminate the instance  if it is for learning purposes to avoid unnecessary charges.

Happy Coding!!


