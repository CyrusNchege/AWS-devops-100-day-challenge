# Project on Wordpress on EC2

## Introduction
In this simple project, we will be creating a Wordpress website on an EC2 instance. 

## Prerequisites
- AWS account

## Steps
1. Create an EC2 instance
Login to your AWS account and go to the EC2 dashboard. Click on the **Launch Instance** button.

Configure the following settings:
- **AMI**: Ubuntu Server 22.04 LTS
- **Instance Type**: t2.micro
- **Security Group**: Create a new security group and allow SSH, HTTP, HTTPS traffic from anywhere.
- **Key Pair**: Create a new key pair and download the private key. Save the private key in a safe place.

Note: You can use AMI of your choice but make appropriate configuration changes like for db management, etc.

2. Create an Elastic IP
Go to the Elastic IP dashboard and click on the **Allocate Elastic IP address** button. Select the **Amazon's pool of IPv4 addresses** option and click on the **Allocate** button.

Associate the Elastic IP address with the EC2 instance that you created in the previous step.

This will ensure that the IP address of your EC2 instance will not change.

3. Connect to the EC2 instance

Open your terminal and run the following command:

```bash
chmod 400 <path-to-your-private-key>
```
The private key is the key that you downloaded in the first step.

Run the following command to connect to the EC2 instance:

```bash
ssh -i <path-to-your-private-key> ubuntu@<public-ip-address>
```

4. Install Apache2
Run the following command to install Apache2:

```bash
sudo apt update && sudo upgrade -y
sudo apt install apache2 -y
```

5. Install PHP Runtime

Run the following command to install PHP runtime:

```bash
sudo apt install php php-mysql -y
```

6. Install MySQL

Run the following command to install MySQL:

```bash
sudo apt install mysql-server -y
```

7. Configure MySQL

Run the following command to configure MySQL:

```bash
sudo mysql_secure_installation
```

Follow prompts to configure MySQL.

8. Create an User and Database for Wordpress

Run the following command to login to MySQL:

```bash
sudo mysql -u root 
```

Change authentication plugin for root user:

```bash
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

Replace `password` with your own strong password.

To test if the authentication plugin was changed successfully, first exit from MySQL by running the following command:
```bash 
exit
```

Then login to MySQL again by running the following command:
```bash
sudo mysql -u root -p
```
Then enter your password.

Create a new database for Wordpress:

```bash
CREATE DATABASE wordpress;
```

Create a new user for Wordpress:

```bash
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
```
Change `password` to your own strong password.

Grant privileges on the database to the user:

```bash
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
```

Flush privileges:

```bash
FLUSH PRIVILEGES;
```

Exit from MySQL:

```bash
exit
```

9. Install Wordpress

Run the following command to install Wordpress:

```bash
cd /tmp
curl -O https://wordpress.org/latest.tar.gz

tar xzvf latest.tar.gz
```

Copy the extracted files to the Apache root directory:

```bash
sudo mv wordpress/ /var/www/html
```

10. Configure Wordpress

In your browser, go to the public_ip_address/wordpress. You will see the Wordpress setup page.

Fill in the wordpress setup form 

- **Database Name**: wordpress
- **Username**: wordpressuser
- **Password**: `password` (the password that you created in step 8)
- **Database Host**: localhost
- **Table Prefix**: wp_

Click on the **Submit** button.

You will get a message saying that the `wp-config.php` is unable to write.

On your terminal, run the following command:

```bash
cd /var/www/html/wordpress

sudo nano wp-config.php
```
Then paste the code given on the Wordpress setup page in the `wp-config.php` file.

Save and exit the file.

Go back to the Wordpress setup page and click on the **Run the installation** button.

Fill in the Wordpress setup form:

- **Site Title**: My Blog
- **Username**: admin
- **Password**: `password` (the password that you created in step 8)
- **Your Email**:

Click on the **Install Wordpress** button.

You will be redirected to the Wordpress login page. Enter the username and password that you created in the previous step.

You will be redirected to the Wordpress dashboard.

11. Confirm that the Wordpress site is working

In your browser, go to the public_ip_address/wordpress. You will see the Wordpress site.

