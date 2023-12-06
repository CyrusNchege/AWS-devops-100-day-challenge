# Hosting Django on AWS Elastic Beanstalk.

## What is Elastic Beanstalk?
AWS Elastic Beanstalk is an orchestration service offered from Amazon Web Services for deploying infrastructure which orchestrates various AWS services, including EC2, S3, Simple Notification Service, CloudWatch, autoscaling, and Elastic Load Balancers. Elastic Beanstalk provides an additional layer of abstraction over the bare server and OS; users instead see a pre-built combination of OS and platform. (Developer focuses on writing code and Elastic Beanstalk handles the rest.)

### Advantages of Elastic Beanstalk
- Easy to use
- You pay only for AWS resources you create to store and run your application.
- You can select the AWS resources that you want to launch for your application, and Elastic Beanstalk provisions and maintains those resources.

### Disadvantages of Elastic Beanstalk
- You can't access the underlying resources.
- You can't customize the Elastic Beanstalk management environment.
- You can't use Elastic Beanstalk with existing AWS resources.

### Prerequisites
- AWS Account
- Python
- Django
- pip
- virtualenv
- awsebcli

### Setting AWS ebcli
- Install awsebcli using pip
```sh
  pip install awsebcli
```
- Check if ebcli is installed
```sh
  eb --version
```
## Note:
- The above setup is for Linux and Mac users. For Windows users, please refer to the official documentation of [AWS Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-windows.html)

## Steps to Django 
### Git clone the repository
```sh
  git clone https://github.com/CyrusNchege/Django_CRUD_CBVs.git
```
### Create a virtual environment
```sh
  virtualenv venv
```
### Activate the virtual environment
```sh
  source venv/bin/activate
```
### Install the requirements
```sh
  pip install -r requirements.txt
```
### Deactivate the virtual environment
```sh
  deactivate
```

## This is just a simple django Application, You can use your own django application.

## Steps to deploy the application on AWS Elastic Beanstalk

### Initialize the ebcli
```sh
  eb init
```
- You will be prompted to select a region. Select the region you want to deploy your application to.
- and other prompts, just press enter to select the default values or change accordingly.

### Create an environment
```sh
  eb create
```
- You will be prompted to enter an environment name. Enter a name of your choice.
- and other prompts, just press enter to select the default values or change accordingly.

### Deploy the application
```sh
  eb deploy
```
- This will deploy the application to AWS Elastic Beanstalk.

### Open the application
```sh
  eb open
```
- This will open the application in your default browser.

### Terminate the environment
```sh
  eb terminate
```
- This will terminate the environment and delete all the resources created by Elastic Beanstalk.

## Note:
- You can also create an environment and deploy the application using the AWS Elastic Beanstalk console.



