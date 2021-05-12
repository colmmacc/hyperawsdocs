# Security best practices in AWS Systems Manager Incident Manager<a name="security-best-practices"></a>

AWS Systems Manager Incident Manager provides many security features to consider as you develop and implement your own security policies\. The following best practices are general guidelines and don't represent a complete security solution\. Because these best practices might not be appropriate or sufficient for your environment, treat them as helpful considerations rather than prescriptions\.

**Topics**
+ [Incident Manager preventative security best practices](#security-best-practices-prevent)
+ [Incident Manager detective security best practices](#security-best-practices-detect)

## Incident Manager preventative security best practices<a name="security-best-practices-prevent"></a>

**Implement least privilege access**  
When granting permissions, you decide who is getting what permissions to which Incident Manager resources\. You enable specific actions that you want to allow on those resources\. Therefore, grant only the permissions that are required to perform a task\. Implementing least privilege access is fundamental in reducing security risk and the impact that could result from errors or malicious intent\. 

The following tools are available to implement least privilege access: 
+  [IAM user policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_controlling.html) and [Permissions Boundaries for IAM Entities ](https://docs.aws.amazon.com/https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
+ [Service Control Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)

**Creating and managing contacts**  
When activating contacts, Incident Manager reaches out to the device to confirm the activation\. Ensure the device information is correct before activating the device\. This reduces the possibility that Incident Manager contacts the wrong device or person during activation\. 

Regularly review your contacts and escalation plans to ensure that only contacts that need to be contacted during an incident are being contacted\. Regularly review the contacts to remove outdated or incorrect information\. If a contact should no longer be informed when an incident occurs, remove them from the related escalation plans or remove them from Incident Manager\.

**Make chat channels private**  
You can make your incident chat channels private to implement least privilege access\. Consider using a different chat channel with a scoped down user list for each response plan template\. This ensures only the correct responders are pulled into a chat channel that may contain sensitive information\. 

AWS Chatbot enabled Slack channels inherit the permissions of the IAM role used to configure AWS Chatbot\. This enables responders in an AWS Chatbot enabled Slack channel to call any allow\-listed action, such as Incident Manager APIs and retrieving metrics graphs\. 

**Keep AWS tools up to date**  
AWS regularly releases updated versions of tools and plugins that you can use in your AWS operations\. Keeping these resources up to date ensures that users and instances in your account have access to the latest functionality and security features in these tools\. 
+ AWS CLI – The AWS Command Line Interface \(AWS CLI\) is an open source tool that enables you to interact with AWS services using commands in your command\-line shell\. To update the AWS CLI, you run the same command used to install the AWS CLI\. We recommend creating a scheduled task on your local machine to run the command appropriate to your operating system at least once every two weeks\. For information about installation commands, see [Installing the AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) in the *AWS Command Line Interface User Guide*\.
+ AWS Tools for Windows PowerShell – The Tools for Windows PowerShell are a set of PowerShell modules that are built on the functionality exposed by the AWS SDK for \.NET\. The Tools for Windows PowerShell enable you to script operations on your AWS resources from the PowerShell command line\. Periodically, as updated versions of the Tools for Windows PowerShell are released, you should update the version that you're running locally\. For information, see [Updating the AWS Tools for Windows PowerShell on Windows](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-windows.html#pstools-updating) or [Updating the AWS Tools for Windows PowerShell on Linux or macOS](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-linux-mac.html#pstools-updating-linux)\.

**Related content**  
[Security best practices for Systems Manager](https://docs.aws.amazon.com/ystems-manager/latest/userguide/security-best-practices.html)

## Incident Manager detective security best practices<a name="security-best-practices-detect"></a>

**Identify and audit all your Incident Manager resources**  
Identification of your IT assets is a crucial aspect of governance and security\. Identify your Systems Manager resources to assess their security posture and take action on potential areas of weakness\. Create resource groups for your Incident Manager resources\. For more information, see [What Is AWS Resource Groups?](https://docs.aws.amazon.com/ARG/latest/userguide/welcome.html)

**Use AWS CloudTrail**  
AWS CloudTrail provides a record of actions taken by a user, role, or an AWS service in Incident Manager\. Using the information collected by AWS CloudTrail, you can determine the request that was made to Incident Manager, the IP address from which the request was made, who made the request, when it was made, and additional details\. For more information, see [Logging AWS Systems Manager Incident Manager API calls using AWS CloudTrail](logging-using-cloudtrail.md)\.

**Monitor AWS security advisories**  
Regularly check security advisories posted in Trusted Advisor for your AWS account\. You can do this programmatically using [describe\-trusted\-advisor\-checks](https://docs.aws.amazon.com/cli/latest/reference/support/describe-trusted-advisor-checks.html)\. 

Further, actively monitor the primary email address registered to each of your AWS accounts\. AWS will contact you, using this email address, about emerging security issues that might affect you\. 

AWS operational issues with broad impact are posted on the [AWS Service Health Dashboard](https://status.aws.amazon.com/)\. Operational issues are also posted to individual accounts through the Personal Health Dashboard\. For more information, see the [AWS Health documentation](https://docs.aws.amazon.com/health/)\. 

**Related content**  
[Amazon Web Services: Overview of Security Processes](http://aws.amazon.com/architecture/security-identity-compliance/?cards-all.sort-by=item.additionalFields.sortDate&cards-all.sort-order=desc) \(whitepaper\)

[Getting Started: Follow Security Best Practices as You Configure Your AWS Resources](http://aws.amazon.com/blogs/security/getting-started-follow-security-best-practices-as-you-configure-your-aws-resources/) \(AWS Security Blog\) 

[IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

[Security Best Practices in AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/best-practices-security.html)