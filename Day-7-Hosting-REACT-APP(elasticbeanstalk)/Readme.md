# Hosting react app on AWS Elastic Beanstalk.

AWS Elastic Beanstalk is platform as a service (PaaS) that allows you to deploy and scale web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.
***
I will use a simple react app to show how to host a react app on AWS Elastic Beanstalk.

The react repository is [here](https://github.com/CyrusNchege/document-uploader).

## Prerequisites

- AWS account
- React app
- AWS CLI
- Node.js
- NPM

## Steps
step 1: Ensure the react app is working locally.(see the react repository for instructions [here](https://github.com/CyrusNchege/document-uploader))

step 2: Create a new IAM user with the necessary permissions.

step 3: Install the AWS CLI and configure it with the IAM user credentials.
 
 #### Install the AWS CLI
 ```
  sudo apt install awscli
  ```
  For other installation options see [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

#### Configure the AWS CLI
```
aws configure
```
Enter the IAM user credentials.

step 4: Create a new Elastic Beanstalk application.
```
aws elasticbeanstalk create-application --application-name document-uploader 
```
Note: The application name is the name of the application you want to deploy.
And the application name must be unique within your account.

step 5: Create a new Elastic Beanstalk environment.

```


