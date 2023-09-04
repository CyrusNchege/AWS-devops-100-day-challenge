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

### 2. Create an AWS Lambda Function
- Search for "Lambda" in the AWS Management Console.
- Click the "Create function" button.
- Choose "Author from scratch."
- Give your Lambda function a name and select the Python 3.8 runtime.
- In the "Function code" section, replace the default code with 
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

- Configure the Lambda function to use an existing or new execution role (which you will create in step 4).

### 3. Create an Amazon Simple Notification Service (SNS) Topic
- Search for "SNS" in the AWS Management Console.
- Click the "Create topic" button.
- Give your topic a name and display name.
- Click "Create topic."

### 4. Create an IAM Role
- Search for "IAM" in the AWS Management Console.
- Click "Roles" in the left navigation pane and then "Create role."
- Select "Lambda" as the trusted entity.
- In the "Permissions" step, attach policies that grant your Lambda function the necessary permissions. You can create a custom policy with the permissions you specified (s3:GetObject, s3:PutObject, sns:Publish).
- Review and name the role (e.g., "DocumentManagementRole").

### 5. Attach IAM Role to Lambda Function
- After creating the IAM role, go back to your Lambda function in the Lambda console.
- In the "Function overview" section, scroll down to the "Execution role" and click "Edit."
- Attach the IAM role you created (DocumentManagementRole) to the Lambda function.

## Conclusion
With these steps completed, your solution is set up to count words in documents uploaded to the S3 bucket and send notifications to the team leader through the SNS topic. Ensure that you've properly configured the S3 bucket's event trigger to invoke the Lambda function when new objects (documents) are created in the bucket.



