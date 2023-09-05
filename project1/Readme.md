# Challenge


Design and implement a solution that can help an organization improve its document management system.

 The goal is to enable writers to upload documents directly to an S3 bucket, which will make it easier for the team leader to keep track of all documents and their word count. 
 
 Your team should create a simple solution to allow writers to upload documents in an S3 bucket, and send a notification to the team leader with the word count every time a document is uploaded to the bucket. 

 ***
# Solution steps


### 1. Create an Amazon S3 Bucket
- Search for "S3" in the AWS Management Console.
- Click the "Create bucket" button.
- Enter a unique and meaningful name for your bucket.
- Choose a region for your bucket (select one geographically close to your users for better performance).
- Configure other settings as needed (e.g., versioning, logging, and access control). Ensure that you set up appropriate permissions to allow writers to upload documents.

### 2. Create an Amazon Simple Notification Service (SNS) Topic
- Search for "SNS" in the AWS Management Console.
- Click the "Create topic" button.
- Give your topic a name and display name.
- Click "Create topic."
- Click the name of your topic.
- Click "Create subscription."
- Select "Email" as the protocol.
- Enter your email address.
- Click "Create subscription."
- Check your email and click the link to confirm your subscription.


### 3. Create an IAM Role
- Search for "IAM" in the AWS Management Console.
- Click "Roles" in the left navigation bar.
- Click the "Create role" button.
- Select "Lambda" as the trusted entity.
- Click "Next: Permissions."
- Search for "S3" in the search bar.
- Select the "AmazonS3FullAccess" policy.
- Search for "SNS" in the search bar.
- Select the "AmazonSNSFullAccess" policy.
- Enter a name for your role.
- Click "Create role."

### 4. Create an AWS Lambda Function
- Search for "Lambda" in the AWS Management Console.
- Click the "Create function" button.
- Select "Author from scratch."
- Enter a name for your function.
- Select a runtime (e.g., Python 3.8).
- Select the IAM role you created in the previous step.
- Click "Create function."
- In the "Function code" section, paste the code and deploy the function.
```python
import boto3

def count_words(event, context):
    s3 = boto3.resource("s3")
    bucket = s3.Bucket(event["bucket"])
    key = event["key"]

    file = bucket.Object(key).get()
    text = file["Body"].read().decode("utf-8")

    word_count = len(text.split(" "))

    return {"word_count": word_count}
```
- In the "Designer" section, click "Add trigger."
- Select "S3" as the trigger type.
- Select the S3 bucket you created in the previous step.
- Select "All object create events" as the event type.
- Click "Add."
- Click "Save."

### 5. Create an Amazon S3 Event Notification
- Search for "S3" in the AWS Management Console.
- Click the name of your bucket.
- Click the "Properties" tab.
- Click the "Events notifications" tab.
- Click "Create event notification."
- Enter a name for your event notification.
- Select "All object create events" as the event type.
- Select "Lambda function" as the destination type.
- Select the Lambda function you created in the previous step.
- Click "Save."




