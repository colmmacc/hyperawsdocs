# Using service\-linked roles for Incident Manager<a name="using-service-linked-roles"></a>

AWS Systems Manager Incident Manager uses AWS Identity and Access Management \(IAM\)[ service\-linked roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role)\. A service\-linked role is a unique type of IAM role that is linked directly to Incident Manager\. Service\-linked roles are predefined by Incident Manager and include all the permissions that the service requires to call other AWS services on your behalf\. 

A service\-linked role makes setting up Incident Manager easier because you don't have to manually add the necessary permissions\. Incident Manager defines the permissions of its service\-linked roles, and unless defined otherwise, only Incident Manager can assume its roles\. The defined permissions include the trust policy and the permissions policy, and that permissions policy cannot be attached to any other IAM entity\.

You can delete a service\-linked role only after first deleting their related resources\. This protects your Incident Manager resources because you can't inadvertently remove permission to access the resources\.

For information about other services that support service\-linked roles, see [AWS Services That Work with IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html) and look for the services that have **Yes **in the **Service\-Linked Role** column\. Choose a **Yes** with a link to view the service\-linked role documentation for that service\.

## Service\-linked role permissions for Incident Manager<a name="slr-permissions"></a>

Incident Manager uses the service\-linked role named **AWSServiceRoleforIncidentManager** – allows Incident Manager to manage Incident Manager incident records and related resources on your behalf\.

The AWSServiceRoleforIncidentManager service\-linked role trusts the following services to assume the role:
+ `ssm-incidents.amazonaws.com`

The role permissions policy allows Incident Manager to complete the following actions on the specified resources:
+ Action: `ssm-incidents:ListIncidentRecords` on all resources related to the action\.
+ Action: `ssm-incidents:CreateTimelineEvent` on all resources related to the action\.
+ Action: `ssm:CreateOpsItem` on all resources related to the action\.
+ Action: `ssm:AssociateOpsItemRelatedItem` on `all resources related to the action.`
+ Action: `ssm-contacts:CreateEngagement` on all resources related to the action\.

You must configure permissions to allow an IAM entity \(such as a user, group, or role\) to create, edit, or delete a service\-linked role\. For more information, see [Service\-Linked Role Permissions](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html#service-linked-role-permissions) in the *IAM User Guide*\.

## Creating a service\-linked role for Incident Manager<a name="create-slr"></a>

You don't need to manually create a service\-linked role\. When you create a replication set in the AWS Management Console, the AWS CLI, or the AWS API, Incident Manager creates the service\-linked role for you\. 

If you delete this service\-linked role, and then need to create it again, you can use the same process to recreate the role in your account\. When you create a replication set, Incident Manager creates the service\-linked role for you again\. 

## Editing a service\-linked role for Incident Manager<a name="edit-slr"></a>

Incident Manager does not allow you to edit the AWSServiceRoleforIncidentManager service\-linked role\. After you create a service\-linked role, you can't change the name of the role because various entities might reference the role\. However, you can edit the description of the role using IAM\. For more information, see [Editing a Service\-Linked Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html#edit-service-linked-role) in the *IAM User Guide*\.

## Deleting a service\-linked role for Incident Manager<a name="delete-slr"></a>

If you no longer need to use a feature or service that requires a service\-linked role, we recommend that you delete that role\. That way you don’t have an unused entity that isn't actively monitored or maintained\. However, you must clean up the resources for your service\-linked role before you can manually delete it\.

To delete the service\-linked role you must first delete the replication set\. Deleting the replication set deletes all data created and stored in Incident Manager, including response plans, contacts, and escalation plans\. You will also lose all previously created incidents\. Any alarms and EventBridge rules pointing to deleted response plans will no longer create an incident on alarm or rule match\. To delete the replication set you must delete every region in the set\.

**Note**  
If the Incident Manager service is using the role when you try to delete the resources, then the deletion might fail\. If that happens, wait for a few minutes and try the operation again\.

**To delete the regions in the replication set used by the AWSServiceRoleforIncidentManager**

1. Open the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home) and choose **Settings** from the left navigation\.

1. Select a region in the **Replication set**\. 

1. Choose **Delete**\.

1. To confirm deletion of the region, enter the Region name and choose **Delete**\.

1. Repeat these steps until you have deleted all Regions in your replication set\. When deleting the final Region, the console informs you that it deletes the replication set with it\.

**To manually delete the service\-linked role using IAM**

Use the IAM console, the AWS CLI, or the AWS API to delete the AWSServiceRoleforIncidentManager service\-linked role\. For more information, see [Deleting a Service\-Linked Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html#delete-service-linked-role) in the *IAM User Guide*\.

## Supported Regions for Incident Manager service\-linked roles<a name="slr-regions"></a>

Incident Manager supports using service\-linked roles in all of the Regions where the service is available\. For more information, see [AWS Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html)\.