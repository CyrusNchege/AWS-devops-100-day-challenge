# Hosting Django Application on AWS EC2 Instance.

I will use AWS EC2 instance to host my Django application. I will use Ubuntu 20.04 as operating system. I will use NGINX as the web server and Gunicorn as the  application server. 

## Step 1: Sign up for AWS account

If you don't have an AWS account, you can create one at [AWS](https://aws.amazon.com/). You will need a credit card to create an account. You will get 12 months of free tier access to AWS services.

## Step 2: Create an EC2 Instance


1. **Navigate to EC2 Dashboard:**

   - In the AWS Management Console, use the search bar at the top to find "EC2," then click on "EC2" when it appears. This will take you to the EC2 Dashboard.

2. **Launch an EC2 Instance:**

   - In the EC2 Dashboard, locate and click the "Launch Instance" button to begin the instance creation process.

3. **Choose an Amazon Machine Image (AMI):**

   - In the "Choose an Amazon Machine Image (AMI)" step, select "Ubuntu Server 20.04 LTS (HVM), SSD Volume Type." This is a reliable choice for hosting a variety of applications.

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
sudo apt update

sudo apt upgrade

# Install Python 3 and pip
sudo apt install python3 python3-pip -y

# Install Git
sudo apt install git -y

# Install NGINX
sudo apt install nginx -y
```

# Step 5: Clone the Django Project

Clone the Django project from GitHub.

```
git clone https://github.com/username/project.git
```
Replace `username` with your GitHub username and `project` with the name of your project.

```
cd project
```
create a virtual environment and activate it.

```
python3 -m venv venv

source venv/bin/activate
```

Install the required packages.

```
pip install -r requirements.txt
```
install gunicorn.

```
pip install gunicorn
```

Also install supervisor.

Supervisor is a process control system that allows you to monitor and control a number of processes on Linux operating systems.

```
pip install supervisor
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

program:gunicorn]
directory=/home/ubuntu/project
command=/home/ubuntu/project/venv/bin/gunicorn --workers 3 --bind unix:/home/ubuntu/project/project.sock project.wsgi:application
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

sudo supervisorctl restart 
```

# Step 8: Configure NGINX

create a file project.conf in /etc/nginx/sites-available/ directory.

```
sudo nano /etc/nginx/sites-available/project.conf
```
you can name the file anything you want.

Add the following lines to the file.

```
server {
    listen 80;
    server_name <public-ip-address> <domain-name>;
	
	location / {

		include proxy_params;
		proxy_pass http://unix:/home/ubuntu/elevate/app.sock;
	}
}
``` 

Replace `<public-ip-address>` with the public IP address of your EC2 instance and `<domain-name>` with your domain name.

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















