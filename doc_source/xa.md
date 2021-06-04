# Setting up cross\-account functionality<a name="xa"></a>

AWS Systems Manager Incident Manager uses AWS Resource Access Manager \(AWS RAM\) to share Incident Manager resources across management and application accounts\. This section describes cross\-account best practices, how to set up cross\-account functionality for Incident Manager, and some limitations of cross\-account functionality in Incident Manager\.

A management account is the account that you perform operations management from\. The management account owns the response plans, contacts, escalation plans, runbooks, and other AWS Systems Manager resources\. 

An application account is the account that owns the resources that make up your applications\. These resources can be Amazon EC2 instances, Amazon DynamoDB tables, or any of the other resources that you use to build applications in the AWS Cloud\. Application accounts also own the Amazon CloudWatch alarms and Amazon EventBridge events that create incidents in Incident Manager\.

AWS RAM uses resource shares to share resources between accounts\. You can share the response plan and contact resources between accounts in AWS RAM\. By sharing these resources, application accounts and management accounts can interact with engagements and incidents\. Sharing a response plan shares all past and future incidents created using the response plan\. Sharing a contact shares all past and future engagements of the contact or response plan\.

## Best practices<a name="xa-best-practices"></a>

Follow these best practices when sharing your Incident Manager resources across accounts\.
+ Regularly update the resource share with response plans and contacts\.
+ Regularly review resource share principals\. 
+ Set up Incident Manager, runbooks, and chat channels in your management account\.

## Set up and configuration<a name="xa-setup"></a>

The following steps describe how to set up and configure Incident Manager resources and use them for cross\-account functionality\. You may have configured some services and resources for cross\-account functionality in the past\. Use these steps as a checklist of requirements before starting your first incident using cross\-account resources\.

1. \(Optional\) Create organizations and organizational units using AWS Organizations\. Follow the steps in the Organizations [Tutorial: Creating and configuring an organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tutorials_basic.html)\.

1. \(Optional\) Use the Systems Manager quick setup to set up the correct AWS Identity and Access Management roles for you to use when configuring your cross\-account runbooks\. For more information, see [Quick Setup](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-quick-setup.html) in the Amazon EC2 Systems Manager user guide\.

1. Create runbooks in Systems Manager automation documents using the recommended [Systems Manager multiple account and Region setup](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html)\. Follow the steps listed in that guide and then see the following steps for further configuration for Incident Manager runbooks\. The following use cases require installing AWS CloudFormation templates for the necessary roles that can create and view runbooks during an incident\. Use these policy templates during the setup described in the Systems Manager documentation\.
   + *Running a runbook in the management account\.* The management account must download and install this CloudFormation template: [https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemsManager-AutomationReadOnlyRole.zip](https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemsManager-AutomationReadOnlyRole.zip)\. When installing `AWS-SystemsManager-AutomationReadOnlyRole`, specify the account IDs of all application accounts\. This role will let your application accounts read the status of the runbook from the incident details page\. The application account must install this CloudFormation template: [https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemManager-AutomationAdministrationReadOnlyRole.zip](https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemManager-AutomationAdministrationReadOnlyRole.zip)\. The incident details page uses this role to get the automation status from the management account\.
   + *Running a runbook in an application account\.* The management account must download and install the following CloudFormation template: [https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemManager-AutomationAdministrationReadOnlyRole.zip](https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemManager-AutomationAdministrationReadOnlyRole.zip)\. This role allows the management account to read the status of the runbook in the application account\. The application account must download and install the following CloudFormation template: [https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemsManager-AutomationReadOnlyRole.zip](https://s3.amazonaws.com/aws-incident-manager-assets.us-east-1/cross-account-setup/AWS-SystemsManager-AutomationReadOnlyRole.zip)\. When installing `AWS-SystemsManager-AutomationReadOnlyRole`, specify the account ID of the management account and other application accounts\. The management and other application accounts assume this role to read the status of the runbook\.

1. To set up and create contacts, escalation plans, chat channels, and response plans, follow the steps detailed in [Incident preparation](incident-response.md)\.

1. Add your contacts and response plan resources to your existing resource share or a new resource share in AWS RAM\. For more information, see [Getting started with AWS RAM](https://docs.aws.amazon.com/ram/latest/userguide/getting-started.html)\. Adding response plans to AWS RAM enables application accounts to access incidents and incident dashboards created using the response plans\. Application accounts also gain the ability to associate CloudWatch alarms and EventBridge events to a response plan\. Adding the contacts and escalation plans to AWS RAM enables application accounts to view engagements and engage contacts from the incident dashboard\. 

1. Add cross\-account cross\-Region functionality to your CloudWatch console\. For steps and information, see [Cross\-Account Cross\-Region CloudWatch Console](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html) in the CloudWatch user guide\. Adding this functionality ensures the application accounts and management account you've created can view and edit metrics from the incident and analysis dashboards\.

1. Create a cross\-account Amazon EventBridge event bus\. For steps and information, see [Running automations in multiple AWS Regions and accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-cross-account.html)\. You can then use this event bus to create event rules that detect incidents in application accounts and create incidents in the management account\.

## Limitations<a name="xa-limitations"></a>

The following are known limitations of the Incident Manager cross\-account functionality:
+ Timeline events aren't populated for automation documents run in application accounts\. Updates of automation documents run in application accounts are visible in the runbook tab of the incident\.
+ SNS topics can't be used cross\-account\. SNS topics must be created in the same Region and account as the response plan it's used it\. We recommend using the management account to create all SNS topics and response plans\. 