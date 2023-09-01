# Use Case 2: Hosting a static website on S3

To host a static website on S3, you need to follow the following steps:

**Step 1: Sign in to AWS Console**


**Step 2: Create an S3 Bucket for Hosting**
- In the AWS Management Console, go to the Amazon S3 service.
- Click the "Create bucket" button.
- Provide a globally unique name for your bucket.
- Select the AWS region where you want your bucket to be located.
- Click "Create."
![S3](/Images/Static-hosting-web-s3/webbucket.png)

**Step 3: Enable Static Website Hosting**
- After creating the bucket, select it from the list.
- Click the "Properties" tab.
- Scroll down to the "Static website hosting" card and click "Edit."
- Choose the "Use this bucket to host a website" option.
- Enter the index document (e.g., `index.html`) and error document (optional) for your website.
![S3](/Images/Static-hosting-web-s3/webstaticenable.png)
- Click "Save changes."

**Step 4: Upload Your Website Files**
- In the bucket dashboard, navigate to the "Overview" tab.
- Click the "Upload" button to upload your website files. This should include your HTML, CSS, JavaScript, and any other assets. <br>
-- Exampe I will upload index.html file that contains the following code:
<br>
#### index.html
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>My Website</title>
</head>
<body>
    <h1>Hello World!</h1>
</body>
</html>
```
#### style.css
```css
h1 {
    color: red;
}
```

- Ensure that the main HTML file (e.g., `index.html`) is at the root level of your bucket.

![S3](/Images/Static-hosting-web-s3/uploadhtml.png)
**Step 5: Configure Bucket Permissions**
- By default, your bucket and objects are private. To make your website files publicly accessible, you need to configure bucket and object permissions.
- In the bucket properties, go to the "Permissions" tab, and then click "Edit." to bucket policy.
- Use the following settings:
  - Bucket Policy: Create a bucket policy that allows public read access to your objects. Example policy:
```json
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

- Replace `<bucket-name>` with the name of your bucket.

![S3](/Images/Static-hosting-web-s3/permissions.png)
- Click "Save changes."

Alow public access 

**Step 6: Test Your Website**
- After configuring the permissions, your website should be accessible via the S3 endpoint. You can find the endpoint URL in the "Properties" tab of your bucket under "Static website hosting."
![S3](/Images/Static-hosting-web-s3/properties.png)
- Test your website by opening the endpoint URL in a web browser.
![S3](/Images/Static-hosting-web-s3/testdone.png)

---
#### Done! You have successfully hosted a static website on S3.
<br>

**Step 7: Configure a Custom Domain (Optional)**
- You can configure a custom domain for your website by using Amazon Route 53.
(https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html)

