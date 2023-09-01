# Use Case 1: Uplodaing files to S3

## Steps to upload files to S3:

1. Search for S3 in the search bar and select S3 from the list of services.

![S3](/Images/uploading-files-s3/searchs3.png)
2. Click on the Create bucket button. <br>
3. Enter a unique bucket name and select the region.
![S3](/Images/uploading-files-s3/namingbucket.png)
4. Click on the Create button.
And bucket is created successfuly.

![S3](/Images/uploading-files-s3/bucketcreated.png)

5. Click on the bucket name. <br>

6. Click on the Upload button.
![S3](/Images/uploading-files-s3/uploadbutton.png)
7. Click on the Add files or folder button.
![S3](/Images/uploading-files-s3/addfiles.png)
8. Select the file and click on the Open button.
9. Click on the Upload button.

10. And the file is uploaded successfully.
![S3](/Images/uploading-files-s3/successsfulupload.png)

## Note:
 You can also upload files using AWS CLI and AWS SDKs.

## Public Access:

If you did not make the bucket public, then you will not be able to access the file. To make the file public, follow the below steps:

1. Click on the Permissions tab.

2. Click on the Bucket Policy button and then click on the Edit button.

3. Copy the below code and paste it in the Bucket policy editor.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::<bucket-name>/*"
            ]
        }
    ]
}
```
4. Replace the bucket name with your bucket name.

5. Click on the Save changes button.

6. Now you can access the file using the URL.
