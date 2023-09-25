#  CICD using Github Action to EC2

## Introduction
Github Actions is a CI/CD tool that allows you to automate your software development workflows. You can use Github Actions to build, test, and deploy your code to any server.


In this project I will show you how to deploy a simple Django application to EC2 using Github Action.

For the web server I will use Nginx and for the application server I will use Gunicorn.

## Prerequisites

- AWS Account
- Github Account
- Python


## Step 1: Sign up for AWS account

If you don't have an AWS account, you can create one at [AWS](https://aws.amazon.com/). You will need a credit card to create an account. You will get 12 months of free tier access to AWS services.

## Step 2: Create an EC2 Instance


1. **Navigate to EC2 Dashboard:**

   - In the AWS Management Console, use the search bar at the top to find "EC2," then click on "EC2" when it appears. This will take you to the EC2 Dashboard.

2. **Launch an EC2 Instance:**

   - In the EC2 Dashboard, locate and click the "Launch Instance" button to begin the instance creation process.

3. **Choose an Amazon Machine Image (AMI):**

   - In the "Choose an Amazon Machine Image (AMI)" step, select "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type." This is a reliable choice for hosting a variety of applications.

4. **Select an Instance Type:**

   - Choose an instance type based on your requirements. For testing purposes, you can start with the "t2.micro" instance type, which is eligible for the AWS Free Tier. You can always change the instance type later as needed.

5. **Key Pair:**

   - In this step, you can create a new key pair or select an existing key pair. This key pair will be used to SSH into your instance. If you don't have an existing key pair, you can create a new one. Make sure to download and save the key pair file (.pem) in a secure location. You will need this file to SSH into your instance.

6. **Configure Security Group:**

   - Create or select an existing security group. Configure the security group to allow inbound traffic on the following ports:
     - HTTP (80)
     - HTTPS (443)
     - SSH (22)

   - Properly configuring your security group is essential for allowing web traffic and SSH access to your instance.

6. **Configure Storage:**

   - Set the storage size for your instance. The default size is typically sufficient for basic usage. You can adjust this based on your application's storage needs.

8. **Add Tags (Optional):**

   - You can add tags to your instance to help identify it later. Tags are optional but can be useful for organization and management.


10. **Review and Launch:**

    - Review your instance configuration to ensure it matches your requirements.

11. **Launch the Instance:**

    - After reviewing, click the "Launch" button to create your EC2 instance.

# Step 3: Connect to the EC2 Instance

After launching the EC2 instance, you can connect to it using SSH. You will need the key pair file (.pem) you downloaded earlier to connect to the instance.

1. **Change the permissions of the key pair file:**

   - Open a terminal and navigate to the directory where you saved the key pair file. Run the following command to change the permissions of the key pair file:

     ```bash
     chmod 400 <key-pair-file-name>.pem
     ```
2. **Connect to the instance:**

   - Run the following command to connect to the instance:

     ```bash
     ssh -i <key-pair-file-name>.pem ubuntu@<public-ip-address>
     ```

   - Replace `<key-pair-file-name>` with the name of your key pair file and `<public-ip-address>` with the public IP address of your EC2 instance.

   - You should now be connected to your EC2 instance.

# Step 4: Install Necessary Packages

Install required software packages on the EC2 instance.

```
sudo apt-get update

sudo apt-get upgrade -y
```

```
# Install virtualenv
sudo apt-get install python3-venv

python3 -m venv env

source env/bin/activate

# Install Git
sudo apt install git -y

# Install NGINX
sudo apt-get install nginx -y
```

# Step 5: Clone the Django Project

Clone the Django project from GitHub.

```
https://github.com/CyrusNchege/Django-REST-CRUD.git
```
Replace `username` with your GitHub username and `project` with the name of your project.

```
cd Django-REST-CRUD
```

Install the required packages.

```
pip install -r requirements.txt
```

make migrations and migrate.

```
python manage.py makemigrations

python manage.py migrate
```

Collect static files.

```   
python manage.py collectstatic
```


install gunicorn.

```
pip install gunicorn
```

Also install supervisor.

Supervisor is a process control system that allows you to monitor and control a number of processes on Linux operating systems.

```
sudo apt-get install supervisor
```



# Step 6: Configure Django settings.py

Update the `ALLOWED_HOSTS` list in the `settings.py` file.

```
ALLOWED_HOSTS = ['<public-ip-address>', '<domain-name>']
```
Replace `<public-ip-address>` with the public IP address of your EC2 instance and `<domain-name>` with your domain name.


# Step 7: Configure Guincorn and Supervisor

create a file ginicorn.conf in /etc/supervisor/conf.d/ directory.

```
sudo nano /etc/supervisor/conf.d/gunicorn.conf
```

Add the following lines to the file.

```

[program:gunicorn]
directory=/home/ubuntu/project
command=/home/ubuntu/Django-REST-CRUD/env/bin/gunicorn --workers 3 --bind unix:/home/ubuntu/Django-REST-CRUD/person.sock person.wsgi:application
autostart=true
autorestart=true
stderr_logfile=/var/log/gunicorn/gunicorn.err.log
stdout_logfile=/var/log/gunicorn/gunicorn.out.log
```
you have to change the directory and command according to your project.
``` directory= ``` should be the path of your project directory.

``` command= ``` should be the path of your project directory.

Create a directory for gunicorn log files.

```
sudo mkdir /var/log/gunicorn
```
restart supervisor.

```
sudo supervisorctl reread

sudo supervisorctl update

sudo supervisorctl restart all
```

# Step 8: Configure NGINX
Alter nginx.conf file.

```
sudo nano /etc/nginx/nginx.conf
```

Change the following lines in the file.

```
user www-data;
```
to
```
user root;
```


create a file project.conf in /etc/nginx/sites-available/ directory.

```
sudo nano /etc/nginx/sites-available/django.conf
```
you can name the file anything you want.

Add the following lines to the file.

```
server {
    listen 80;
    server_name <public-ip-address> <domain-name>;
	
	location / {

		include proxy_params;
		proxy_pass http://unix:/home/ubuntu/project/project.sock;
	}
}
``` 

Replace `<public-ip-address>` with the public IP address of your EC2 instance and `<domain-name>` with your domain name.
Also replace the path of the `project`.sock file with your `project`.sock file path.

Enable the site.

```
sudo ln -s /etc/nginx/sites-available/project.conf /etc/nginx/sites-enabled
```

Test the NGINX configuration.

```
sudo nginx -t
```

Restart NGINX.

```
sudo systemctl restart nginx
```


# Step 9: Configure Github Action

Create a file `.github/workflows/main.yml` in your project directory.

```
name: Django CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Code
      uses: actions/checkout@v2

    - name: Set up Python 3.8
      uses: actions/setup-python@v2
      with:
        python-version: 3.8

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt

    - name: Test with pytest
      run: |
        python manage.py test

    - name: Deploy to EC2
        run: |
          ssh -o StrictHostKeyChecking=no -i ${{ secrets.SSH_PRIVATE_KEY }} ${{ secrets.USERNAME }}@${{ secrets.HOST }} "cd /home/ubuntu/Django-REST-CRUD && git pull && source /home/ubuntu/Django-REST-CRUD/env/bin/activate && pip install -r requirements.txt && python manage.py makemigrations && python manage.py migrate && python manage.py collectstatic --noinput && sudo supervisorctl restart all"
```

To manage secrets, go to your project repository on GitHub and click on Settings > Secrets > New repository secret.

Create the following secrets:
- SSH_PRIVATE_KEY - The private key of your EC2 instance.

- HOST: The public IP address of your EC2 instance.

- USERNAME: The username of your EC2 instance.

- KEY: The private key of your EC2 instance.

# Step 10: Test the Application

To test the application, navigate to the public IP address of your EC2 instance in a web browser. You should see the Django application running.

# Note 

The above steps can be used to deploy any Django application to any Linux server. You just need to change the settings.py file and the gunicorn.conf file according to your project.

# Conclusion

In this project, I showed you how to deploy a Django application to EC2 using Github Action. I hope you found this project useful. Feel free to ask your valuable questions.

Thank you for reading!
