# AWS managed policies for AWS Systems Manager Incident Manager<a name="security-iam-awsmanpol"></a>



To add permissions to users, groups, and roles, it is easier to use AWS managed policies than to write policies yourself\. It takes time and expertise to [create IAM customer managed policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_create-console.html) that provide your team with only the permissions they need\. To get started quickly, you can use our AWS managed policies\. These policies cover common use cases and are available in your AWS account\. For more information about AWS managed policies, see [AWS managed policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html#aws-managed-policies) in the *IAM User Guide*\.

AWS services maintain and update AWS managed policies\. You can't change the permissions in AWS managed policies\. Services occasionally add additional permissions to an AWS managed policy to support new features\. This type of update affects all identities \(users, groups, and roles\) where the policy is attached\. Services are most likely to update an AWS managed policy when a new feature is launched or when new operations become available\. Services do not remove permissions from an AWS managed policy, so policy updates won't break your existing permissions\.

Additionally, AWS supports managed policies for job functions that span multiple services\. For example, the **ReadOnlyAccess** AWS managed policy provides read\-only access to all AWS services and resources\. When a service launches a new feature, AWS adds read\-only permissions for new operations and resources\. For a list and descriptions of job function policies, see [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html) in the *IAM User Guide*\.









## AWS managed policy: AWSIncidentManagerServiceRolePolicy<a name="security-iam-awsmanpol-AWSServiceRoleforIncidentManagerPolicy"></a>



You can't attach AWSIncidentManagerServiceRolePolicy to your IAM entities\. This policy is attached to a service\-linked role that allows Incident Manager to perform actions on your behalf\. For more information, see [Using service\-linked roles for Incident Manager](using-service-linked-roles.md)\.



This policy grants Incident Manager permissions to list incidents, create timeline events, create OpsItems, associate related items to OpsItems, and start engagements related to an incident\.



**Permissions details**

This policy includes the following permissions\.




+ `ssm-incidents` – Allows principals to list incidents and create timeline events\. This is required so responders can collaborate during an incident on the incident dashboard\.
+ `ssm` – Allows the principals to create OpsItems and associate related items\. This is required to create a parent OpsItem when an incident starts\.
+ `ssm-contacts` – Allows principals to start engagements\. This is required for Incident Manager to engage contacts during an incident\.



```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "UpdateIncidentRecordPermissions",
            "Effect": "Allow",
            "Action": [
                "ssm-incidents:ListIncidentRecords",
                "ssm-incidents:CreateTimelineEvent"
            ],
            "Resource": "*"
        },
        {
            "Sid": "RelatedOpsItemPermissions",
            "Effect": "Allow",
            "Action": [
                "ssm:CreateOpsItem",
                "ssm:AssociateOpsItemRelatedItem"
            ],
            "Resource": "*"
        },
        {
            "Sid": "IncidentEngagementPermissions",
            "Effect": "Allow",
            "Action": "ssm-contacts:StartEngagement",
            "Resource": "*"
        }
    ]
}
```

## AWS managed policy: AWSIncidentManagerResolverAccess<a name="security-iam-awsmanpol-AWSIncidentManagerResolverAccess"></a>



You can attach AWSIncidentManagerResolverAccess to your IAM entities to allow them to start, view, and update incidents\. This also allows them to create customer timeline events and related items in the incident dashboard\. You can also attach this policy to the AWS Chatbot service role or directly to your customer managed role associated with any chat channel used for incident collaboration\. To learn more about IAM policies in AWS Chatbot, see [Managing permissions for running commands using AWS Chatbot](https://docs.aws.amazon.com/chatbot/latest/adminguide/chatbot-cli-commands.html#iam-policies-for-slack-channels-cli-support)\.

**Permissions details**

This policy includes the following permissions\.




+ `ssm-incidents` – Allows you to start incidents, list response plans, list incidents, update incidents, list timeline events, create custom timeline events, update custom timeline events, delete custom timeline events, list related items, create related items, and update related items\.



```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "StartIncidentPermissions",
            "Effect": "Allow",
            "Action": [
                "ssm-incidents:StartIncident"
            ],
            "Resource": "*"
        },
        {
            "Sid": "ResponsePlanReadOnlyPermissions",
            "Effect": "Allow",
            "Action": [
                "ssm-incidents:ListResponsePlans",
                "ssm-incidents:GetResponsePlan"
            ],
            "Resource": "*"
        },
        {
            "Sid": "IncidentRecordResolverPermissions",
            "Effect": "Allow",
            "Action": [
                "ssm-incidents:ListIncidentRecords",
                "ssm-incidents:GetIncidentRecord",
                "ssm-incidents:UpdateIncidentRecord",
                "ssm-incidents:ListTimelineEvents",
                "ssm-incidents:CreateTimelineEvent",
                "ssm-incidents:GetTimelineEvent",
                "ssm-incidents:UpdateTimelineEvent",
                "ssm-incidents:DeleteTimelineEvent",
                "ssm-incidents:ListRelatedItems",
                "ssm-incidents:UpdateRelatedItems"
            ],
            "Resource": "*"
        }
    ]
}
```





## Incident Manager updates to AWS managed policies<a name="security-iam-awsmanpol-updates"></a>



View details about updates to AWS managed policies for Incident Manager since this service began tracking these changes\. For automatic alerts about changes to this page, subscribe to the RSS feed on the Incident Manager Document history page\.




| Change | Description | Date | 
| --- | --- | --- | 
|  [AWSIncidentManagerResolverAccess](#security-iam-awsmanpol-AWSIncidentManagerResolverAccess) – New policy  |  Incident Manager added a new policy to allow you to start incidents, list response plans, list incidents, update incidents, list timeline events, create custom timeline events, update custom timeline events, delete custom timeline events, list related items, create related items, and update related items\.  | April 26, 2021 | 
|  [AWSIncidentManagerServiceRolePolicy](#security-iam-awsmanpol-AWSServiceRoleforIncidentManagerPolicy) – New policy  |  Incident Manager added a new policy to grant Incident Manager permissions to list incidents, create timeline events, create OpsItems, associate related items to OpsItems, and start engagements related to an incident\.  | April 26, 2021 | 
|  Incident Manager started tracking changes  |  Incident Manager started tracking changes for its AWS managed policies\.  | April 26, 2021 | 