# AWS acccount Creation and IAM user creation

## About


An AWS Identity and Access Management (IAM) user is an entity that you create in AWS. The IAM user represents the human user or workload who uses the IAM user to interact with AWS. 

The advantages of employing IAM users are as follows:

### Centralized Access Control:
 Through the AWS Management Console or the AWS Command Line Interface (CLI), you can effectively manage IAM users and their associated permissions. This streamlines the process of monitoring who possesses access to your AWS resources and enables swift access revocation when required.

### Precise Access Management: 
The creation of IAM users with granular permissions fosters an environment where users can exclusively access the specific AWS resources that they necessitate. Consequently, this approach mitigates the potential risks of unauthorized entry into your AWS account.

### Robust Authentication Measures: 
IAM users can be mandated to adhere to stringent authentication mechanisms, such as multi-factor authentication (MFA), when logging into your AWS account. This layer of security serves as a enhancement against any potential unauthorized infiltrations.

#### Distinct categories of IAM users:

#### Root User: 
 The root user is the default IAM user for your AWS account. It has full access to all AWS resources in your account. You should only use the root user for administrative tasks.(not recommended for day to day use).

#### IAM Users (recommended for day to day use): 
IAM users are identities that you create to represent people, services, or applications. You can assign permissions to IAM users to control what they can do in your AWS account.
#### Roles: 
Roles are temporary identities that you can assume to access AWS resources. Roles are often used to grant permissions to applications or services that do not need to have permanent access to your AWS account.