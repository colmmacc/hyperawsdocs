# Data Protection in Incident Manager<a name="data-protection"></a>

The AWS [shared responsibility model](http://aws.amazon.com/compliance/shared-responsibility-model/) applies to data protection in AWS Systems Manager Incident Manager\. As described in this model, AWS is responsible for protecting the global infrastructure that runs all of the AWS Cloud\. You are responsible for maintaining control over your content that is hosted on this infrastructure\. This content includes the security configuration and management tasks for the AWS services that you use\. For more information about data privacy, see the [Data Privacy FAQ](http://aws.amazon.com/compliance/data-privacy-faq)\. For information about data protection in Europe, see the [AWS Shared Responsibility Model and GDPR](http://aws.amazon.com/blogs/security/the-aws-shared-responsibility-model-and-gdpr/) blog post on the *AWS Security Blog*\.

For data protection purposes, we recommend that you protect AWS account credentials and set up individual user accounts with AWS Identity and Access Management \(IAM\)\. That way each user is given only the permissions necessary to fulfill their job duties\. We also recommend that you secure your data in the following ways:
+ Use multi\-factor authentication \(MFA\) with each account\.
+ Use SSL/TLS to communicate with AWS resources\. We recommend TLS 1\.2 or later\.
+ Set up API and user activity logging with AWS CloudTrail\.
+ Use AWS encryption solutions, along with all default security controls within AWS services\.
+ Use advanced managed security services such as Amazon Macie, which assists in discovering and securing personal data that is stored in Amazon S3\.
+ If you require FIPS 140\-2 validated cryptographic modules when accessing AWS through a command line interface or an API, use a FIPS endpoint\. For more information about the available FIPS endpoints, see [Federal Information Processing Standard \(FIPS\) 140\-2](http://aws.amazon.com/compliance/fips/)\.

We strongly recommend that you never put sensitive identifying information, such as your customers' account numbers, into free\-form fields such as a **Name** field\. This includes when you work with Incident Manager or other AWS services using the console, API, AWS CLI, or AWS SDKs\. Any data that you enter into Incident Manager or other services might get picked up for inclusion in diagnostic logs\. When you provide a URL to an external server, don't include credentials information in the URL to validate your request to that server\.

By default, Incident Manager encrypts data in transit using SSL/TLS \(Secure Socket Layers/Transport Layer Security\)\.

## Data encryption<a name="data-protection-encrypt"></a>

Incident Manager uses AWS Key Management Service \(AWS KMS\) customer master keys \(CMKs\) to encrypt your Incident Manager resources\. For more information about AWS KMS, see the [AWS KMS Developer Guide](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)\. AWS KMS combines secure, highly available hardware and software to provide a key management system scaled for the cloud\. Incident Manager encrypts your data using your specified key and encrypts metadata using an AWS owned key\. To use Incident Manager, you must set up your replication set, which includes setting up encryption\. Incident Manager requires data encryption for use\.

You can use an AWS owned key to encrypt your replication set or you can use your own customer managed key to encrypt individual Regions in your replication set or all Regions in your replication set\. If you use customer managed keys, you use the [AWS KMS console](https://console.aws.amazon.com/kms/) or AWS KMS APIs to centrally create the customer managed keys and define the key policies that control how Incident Manager can use the customer managed keys\. When you use a customer managed key for encryption with Incident Manager, the AWS KMS customer managed key must be in the same Region as the resources\. To learn more about setting up data encryption in Incident Manager, see [Get prepared wizard](getting-started.md#getting-started-wizard)\.

There are additional charges for using AWS KMS customer managed keys\. For more information, see [AWS KMS concepts \- Customer master keys \(CMKs\)](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys) in the AWS Key Management Service Developer Guide and [AWS KMS pricing](http://aws.amazon.com/kms/pricing/)\.

To allow Incident Manager to use your customer managed key to encrypt your data, you must add the following policy statements to the key policy of your customer managed key\. To learn more about setting up and changing the key policy in your account, see [Using key policies in AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)\. The policy provides the following permissions:
+ Allows Incident Manager to perform read\-only operations to find the CMK for Incident Manager in your account\.
+ Allows Incident Manager to use the CMK to create grants, but only when it is acting on behalf of principals in the account who have permission to use Incident Manager\. If the principals specified in the policy statement don't have permission to use the CMK and to use Incident Manager, the call fails, even when it comes from the Incident Manager service\.

```
       {
       "Sid": "Allow CreateGrant through AWS Systems Manager Incident Manager",
       "Effect": "Allow",
       "Principal": {
         "AWS": "arn:aws:iam::111122223333:user/ssm-lead"
       },
       "Action": [
         "kms:CreateGrant"
       ],
       "Resource": "*",
       "Condition": {
         "StringLike": {
           "kms:ViaService": [
             "ssm-incidents.amazonaws.com",
             "ssm-contacts.amazonaws.com"
           ]
         }
       }
      }
```

Replace the `Principal` value with the IAM principal that created your replication set\.

Incident Manager uses an [encryption context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context) in all requests to KMS for cryptographic operations\. You can use this encryption context to identify CloudTrail log events where Incident Manager uses your CMK\. Incident Manager uses the following encryption context:
+ `contactArn=ARN of the contact or escalation plan`