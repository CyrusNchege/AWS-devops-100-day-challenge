# Amazon Elastic Compute Cloud (Amazon EC2)



## Table of Contents
1. Introduction
2. What is Amazon EC2?
3. Key Features
4. Instance Types
5. Amazon Machine Images (AMIs)
6. Security Groups and Network Configuration
7. Elastic Block Store (EBS)
8. Auto Scaling
9. Load Balancing
10. Pricing
11. Getting Started
12. Conclusion
13. Additional Resources

## 1. Introduction
This Readme file is an introduction to Amazon Elastic Compute Cloud (Amazon EC2). It provides an overview of the service, including its key features, instance types, and pricing. It also includes links to relevant documentation and resources that you can use to get started with Amazon EC2.
## 2. What is Amazon EC2?
Amazon EC2 is a web service provided by Amazon Web Services (AWS) that enables you to create and manage virtual servers in the cloud. These virtual servers are known as "instances" and they allow you to run applications and workloads on Amazon's highly-scalable infrastructure.

## 3. Key Features
- **Elasticity**: Scale up or down based on demand, ensuring you have the required resources when needed.
- **Variety of Instance Types**: Choose from a wide range of instance types optimized for different use cases, such as compute, memory, storage, and GPU-intensive workloads.
- **Amazon Machine Images (AMIs)**: Pre-configured templates for instances, including operating system, software, and settings.
- **Security Groups**: Virtual firewalls that control inbound and outbound traffic to instances.
- **Elastic IP Addresses**: Static IP addresses that can be associated with instances, allowing you to maintain a consistent IP even if the instance is stopped and started.
- **Elastic Block Store (EBS)**: Persistent block storage volumes that can be attached to instances.
- **Auto Scaling**: Automatically adjusts the number of instances based on defined conditions to handle varying traffic loads.
- **Load Balancing**: Distributes incoming traffic across multiple instances to improve availability and fault tolerance.
- **Integration with Other AWS Services**: Easily connect EC2 instances to other AWS services like Amazon S3, Amazon RDS, and more.

## 4. Instance Types
Amazon EC2 offers a variety of instance types, each optimized for specific use cases. Instance types include General Purpose, Compute Optimized, Memory Optimized, Storage Optimized, and GPU Instances. <br>
You can also choose between On-Demand Instances, Reserved Instances, and Spot Instances based on your requirements.

## 5. Amazon Machine Images (AMIs)
AMIs are templates that contain the information required to launch an instance. They include the operating system, software, settings, and optionally, your application code. AWS provides a range of public AMIs, and you can also create custom AMIs tailored to your needs.

## 6. Security Groups and Network Configuration
Security Groups act as virtual firewalls for instances, controlling inbound and outbound traffic. You can configure security groups to allow specific types of traffic to and from instances. 

## 7. Elastic Block Store (EBS)
EBS provides persistent block storage volumes that can be attached to EC2 instances. You can choose from different types of EBS volumes, such as General Purpose, Provisioned IOPS, and Cold HDD, based on your storage requirements.

## 8. Auto Scaling
Auto Scaling allows you to automatically adjust the number of instances in response to changes in demand. This ensures optimal performance and cost efficiency.

## 9. Load Balancing
Amazon EC2 offers two types of load balancers: Application Load Balancers (ALB) and Network Load Balancers (NLB). Load balancers distribute incoming traffic across multiple instances, enhancing availability and fault tolerance.

## 10. Pricing
EC2 pricing is based on the instance type, usage duration, and any additional resources like storage and data transfer. You can choose between On-Demand Instances, Reserved Instances, and Spot Instances based on your budget and requirements.

## 11. Getting Started
To get started with Amazon EC2:
1. Sign in to the AWS Management Console.
2. Navigate to the EC2 Dashboard.
3. Launch an instance using an AMI and configure instance details.
4. Configure security groups and networking settings.
5. Connect to your instance using SSH (Linux) or RDP (Windows).
6. Install and configure your applications.

## 12. Conclusion
Amazon EC2 provides scalable and flexible compute capacity in the cloud, enabling you to run a wide range of applications. By understanding its features and best practices, you can leverage EC2 to build resilient, cost-effective, and high-performance architectures.

## 13. Additional Resources
- [Amazon EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [EC2 Instance Types](https://aws.amazon.com/ec2/instance-types/)
- [Getting Started with Amazon EC2](https://aws.amazon.com/ec2/getting-started/)

