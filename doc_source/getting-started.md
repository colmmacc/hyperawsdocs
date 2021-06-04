# Getting prepared with Incident Manager<a name="getting-started"></a>

This section walks through **Get prepared** in the Incident Manager console\. You're required to complete **Get prepared** in the console before you can begin to use it for incident management\. The wizard walks you through setting up your replication set, at least one contact, at least one escalation plan, and your first response plan\. The following is useful background information to help you understand Incident Manager and the incident lifecycle:
+ [What Is AWS Systems Manager Incident Manager?](what-is-incident-manager.md)
+ [Incident lifecycle](incident-lifecycle.md)

## Prerequisites<a name="getting-started-prereq"></a>

If you're using AWS for the first time or you're setting up your AWS Identity and Access Management account, see the [AWS Identity and Access Management prerequisites](iam-prereq.md)\.

We recommend you complete the Systems Manager quick setup before beginning the Incident Manager **Get prepared** wizard\. Use Systems Manager [Quick Setup](https://console.aws.amazon.com/systems-manager/quick-setup) to configure frequently used AWS services and features with recommended best practices\. Incident Manager uses Systems Manager features to manage incidents in your system and benefits from having Systems Manager configured first\. 

Before you begin your account must have the IAM permission `iam:CreateServiceLinkedRole`\. Incident Manager uses this permission to create the `AWSServiceRoleforIncidentManager` in your account\. To learn more about this service linked role, see [Using service\-linked roles for Incident Manager](using-service-linked-roles.md)\. 

We recommend setting up Incident Manager in the account that you use to manage your operations\.

## Get prepared wizard<a name="getting-started-wizard"></a>

The first time you use Incident Manager you can access the **Get prepared** wizard from the Incident Manager service homepage\. To access the **Get prepared** wizard after first setup, choose **Prepare** on the **Incidents** list page\.

1. Open the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home)\. 

1. On the Incident Manager service homepage, choose **Get prepared**\. 

**General settings**

1. Choose **General settings**\. Use the **General settings** to set up your replication set\. The replication set ensures that your response plans, contacts, and escalation plans are usable from any of the Regions that you develop or maintain applications in\. 

1. Read the on\-boarding acknowledgment\. If you agree to the Incident Manager terms and conditions, choose **I have read and agree to the AWS Systems Manager Incident Manager terms and conditions** and choose **Next**\.

1. Set up the replication set using either an AWS owned key or your own AWS KMS key\. All Incident Manager resources are encrypted To learn more about how your data is encrypted, see [Data Protection in Incident Manager](data-protection.md)\.
   + If you want to use the AWS owned key, choose **Use AWS owned key** and choose **Create**\.
   + If you want to use your own AWS KMS key, choose **Choose a different AWS KMS key \(advanced\)**\.

     1. Your current Region appears as the first Region in your replication set\. Search for an AWS key that you already have in our account or choose **Create an AWS KMS key**\.

     1. To add more Regions to your replication set, choose **Add Region**\. 

1. To create your replication set and begin creating contacts, choose **Create**\. 

**Note**  
Creating the replication set creates the `AWSServiceRoleforIncidentManager` service\-linked role in your account\. To learn more about this role, see [Using service\-linked roles for Incident Manager](using-service-linked-roles.md) 

**Contacts \(optional\)**

1. Choose **Create contact**\. Incident Manager engages contacts during an incident\. For more information about contacts, see [Contacts](contacts.md)\.

1. Provide the contact name\.

1. Provide a unique and identifiable alias\.

1. Create **Contact channels**\.

   1. Choose the **Type**\. Incident Manager supports **Email**, **SMS**, or **Voice**\.

   1. Provide a unique and identifiable name\.

   1. Provide the channel details, such as an email address for **Email**\.

   1. To create another contact channel, choose **Add a new contact channel**\. 

1. Create the contacts **Engagement plan**\. We recommend defining two or more devices in the engagement plan with at least one device that's engaged at the beginning of the engagement\. 

   1. Choose a **Contact channel name**\.

   1. Define the number of minutes to wait until engaging the contact channel\. 

   1. To add more contact channels to the engagement plan, choose **Add engagement**\.

1. To create the contact and send activation codes to the defined contact channels, choose **Next**\.

1. \(Optional\) Enter the activation code sent to each device\.

1. Repeat step four until you have added all of your contacts to Incident Manager\.

1. Choose **Finish**\.

**Escalation plans \(optional\)**

1. Choose **Create escalation plan**\. An escalation plan escalates through your contacts during an incident, ensuring that Incident Manager engages the correct responders during an incident\. For more information about escalation plans, see [Escalation plans](escalation.md)\.

1. Provide a unique and identifiable **Escalation plan name**\.

1. Specify the number of minutes the first stage should last before starting the next stage\.

1. Add contacts to the first stage by choosing them from the **Contact** search bar\. 

1. If you want the contact to be able to halt the progression of escalation plan stages, select **Acknowledgment stops plan progression**\.

1. To add more contacts to a stage, choose **Add contact**\.

1. To create a new stage in the escalation plan, choose **Add stage**\.

1. After you've finished adding stages and contacts, choose **Create escalation plan**\.

**Response plan**

1. Choose **Create response plan**\. Use the response plan to put together contacts and escalation plans you created\. During this **Getting started** wizard, skip the **Chat channel** and **Runbooks** sections of the response plan\. To learn more about creating response plans with contacts, escalation plans, chat channels, and runbooks, see [Incident preparation](incident-response.md)\.

1. Provide a unique, identifiable **Name**\.

1. Provide an **Incident title prefix**\. 

1. Choose the expected **Impact** of the incident\.

1. Provide a brief **Summary** of the incident to inform responders of what's happening\. Incident Manager automatically populates relevant information into the summary during an incident\.

1. \(Optional\) Provide a dedupe string\.

1. Choose contacts and escalation plans from the **Engagements** dropdown\.

1. Choose **Create response plan**\. After you choose **Create response plan**, the **Response plans** list console page opens\. 

After you've created a response plan, you can associate Amazon CloudWatch alarms or Amazon EventBridge events with the response plan to automatically create an incident based on an alarm or event\. To learn more about incident creation, see [Incident creation](incident-creation.md)\.