# Resource\-based policy examples for AWS Systems Manager Incident Manager<a name="security_iam_resource-based-policy-examples"></a>

Incident Manager doesn't support resource\-based policies that deny access to resources shared using AWS RAM\.

To learn how to create a response plan or contact, see [Response plans](response-plans.md) and [Contacts](contacts.md)\.

## Restricting Incident Manager response plan access by organization<a name="security_iam_resource-based-policy-examples-restrict-response-plan-by-org"></a>

The following example grants permissions to users in the organization with the organization ID: `o-abc123def45` to respond to incidents created using the response plan `myplan`\.

The `Condition` block uses the `StringEquals` conditions and the `aws:PrincipalOrgID` condition key, which is an AWS Organizations specific condition key\. For more information about these condition keys, see [Specifying conditions in a policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/amazon-s3-policy-keys.html)\. 

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "OrganizationAccess",
      "Effect": "Allow", 
      "Principal": “*”,
      "Condition": {
         "StringEquals": {"aws:PrincipalOrgID" : ["o-abc123def45"] }
      },
      "Action": [
        "ssm-incidents:GetResponsePlan",
        "ssm-incidents:StartIncident",
        "ssm-incidents:UpdateIncidentRecord",
        "ssm-incidents:GetIncidentRecord",
        "ssm-incidents:CreateTimelineEvent",
        "ssm-incidents:UpdateTimelineEvent",
        "ssm-incidents:GetTimelineEvent",
        "ssm-incidents:ListTimelineEvents",
        "ssm-incidents:UpdateRelatedItems",
        "ssm-incidents:ListRelatedItems"
      ],
      "Resource": [
        "arn:aws:ssm-incidents:*:111122223333:response-plan/myplan",
        "arn:aws:ssm-incidents:*:111122223333:incident-record/myplan/*"
      ]
    }
  ]
}
```

## Providing Incident Manager contact access to a principal<a name="security_iam_resource-based-policy-examples-provide-contact-access-to-principal"></a>

The following example grants permission to the principal with the ARN `arn:aws:iam::999988887777:root` to create engagements to the contact `mycontact`\.

```
{
    "Version": "2012-10-17", 
    "Statement": [
        { 
            "Sid": "PrincipalAccess",
            "Effect": "Allow", 
            "Principal": { 
                "AWS": "arn:aws:iam::999988887777:root" 
            }, 
            "Action": [
                "ssm-contacts:GetContact",
                "ssm-contacts:StartEngagement",
                "ssm-contacts:DescribeEngagement",
                "ssm-contacts:ListPagesByContact"
            ],
            "Resource": [
                "arn:aws:ssm-contacts:*:111122223333:contact/mycontact"
                "arn:aws:ssm-contacts:*:111122223333:engagement/mycontact/*"
            ]
        }
    ] 
}
```