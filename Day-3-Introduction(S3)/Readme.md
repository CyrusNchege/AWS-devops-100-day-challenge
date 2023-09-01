# Amazon S3 (Simple Storage Service) 
![Amazon S3 Logo ](/Images/AWS-s3.webp) 

## Table of Contents

1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
   - [Creating an S3 Bucket](#creating-an-s3-bucket)
   - [Uploading Objects](#uploading-objects)
3. [Configuring S3](#configuring-s3)
   - [Access Control](#access-control)
   - [Versioning](#versioning)
   - [Logging](#logging)
4. [Managing Data](#managing-data)
   - [Object Lifecycle](#object-lifecycle)
   - [Data Transfer Acceleration](#data-transfer-acceleration)
   - [Cross-Region Replication](#cross-region-replication)
5. [Security](#security)
   - [Bucket Policies](#bucket-policies)
   - [Encryption](#encryption)
6. [Performance](#performance)
   - [Transfer Acceleration](#transfer-acceleration)
   - [Optimizing Costs](#optimizing-costs)
7. [Advanced Topics](#advanced-topics)
   - [Event Notifications](#event-notifications)
   

8. [Resources](#resources)

9. Use Cases
    - [Use-Case-1: Uploading files](/Day-3-Introduction(S3)/Use-Cases-1(Uploading-file)/Readme.md)

---

## 1. Introduction

Amazon S3 is an object storage service offered by Amazon Web Services (AWS). It allows you to store and retrieve data from anywhere on the web. 
<br>
S3 is designed for 99.999999999% (11 9's) of durability, and stores data for millions of applications used by market leaders in every industry. <br>
It is a simple storage service that offers an extremely durable, highly available, and infinitely scalable data storage infrastructure at very low costs.

## 2. Getting Started

### Creating an S3 Bucket

To get started with Amazon S3, follow these steps:

1. **Sign in to AWS Console**: Log in to your AWS account.

2. **Open S3 Console**: Navigate to the S3 service in the AWS Management Console.

3. **Create a Bucket**: Click the "Create bucket" button and follow the prompts. (The bucket name must be unique across all of S3.
)
### Uploading Objects

Once you have a bucket, you can upload objects (files) into it. Use the AWS Management Console, AWS CLI, or an SDK to upload your data.

## 3. Configuring S3

### Access Control

Control who can access your S3 buckets and objects using Access Control Lists (ACLs) or Bucket Policies. Ensure you follow the principle of least privilege.

### Versioning

Enable versioning to track changes to objects over time. This helps in recovering previous versions of objects and protecting against accidental deletions.

### Logging

Enable access logging to record all requests made to your bucket. This can help with security and audit purposes.

## 4. Managing Data

### Object Lifecycle

Configure object lifecycle policies to automatically delete or transition objects to different storage classes based on criteria like age.

### Data Transfer Acceleration

Enable Data Transfer Acceleration to speed up uploads and downloads using Amazon CloudFront's content delivery network (CDN).

### Cross-Region Replication

Replicate objects across different AWS regions for disaster recovery and low-latency access.

## 5. Security

### Bucket Policies

Use bucket policies to define fine-grained access control rules for your S3 buckets. 

### Encryption

Encrypt data at rest and in transit using server-side encryption and SSL/TLS for data in transit.

## 6. Performance

### Transfer Acceleration

Enable Transfer Acceleration for faster data transfers to and from your S3 bucket.

### Optimizing Costs

Apply cost optimization strategies like using S3 Select and S3 Intelligent-Tiering to reduce storage costs.

## 7. Advanced Topics

### Event Notifications

Set up event notifications to trigger actions (e.g., Lambda functions) when objects are uploaded or deleted.

## 8. Resources

- [Amazon S3 Documentation](https://docs.aws.amazon.com/s3)

## 9. Use Cases
- [Use-Case-1: Uploading files](/Day-3-Introduction(S3)/Use-Cases-1(Uploading-file)/Readme.md)
 
 - [Use-Case-2: Hosting a static website](/Day-3-Introduction(S3)/Use-Cases-2(Hosting-a-static-website)/Readme.md)

