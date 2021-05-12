# Runbooks and automation<a name="runbooks"></a>

A runbook drives incident mitigation and response\. AWS Systems Manager Incident Manager brings your runbooks to a central place, ensuring responders focus on mitigation instead of tracking down the next steps\. Setup and configure runbooks using Systems Manager automation documents and connect them to an incident by defining them in a response plan\. For more information about Automation Documents, see [Working with Automation documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-documents.html) in the Systems Manager user guide\. Using automation steps in Automation Documents incurs costs in Systems Manager\. For more information about Systems Manager billing, [Systems Manager pricing](http://aws.amazon.com/systems-manager/pricing/)\. For more information about adding a runbook to a response plan, see [Response plans](response-plans.md)\.

## Define a runbook<a name="runbook-create"></a>

When creating a runbook, you can follow the steps provided here or you can follow the more detailed steps provided in the [SSM documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html) section in the Systems Manager user guide\. If you're creating a multi\-account, multi\-region runbook, see [Running automations in multiple AWS Regions and accounts](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html) in the Systems Manager user guide\. 

**Define a runbook**

1. Open the Systems Manager console at [https://console\.aws\.amazon\.com/systems\-manager/](https://console.aws.amazon.com/systems-manager/)\. 

1. In the navigation pane, choose **Documents**\.

1. Choose **Create automation**\.

1. Provide a unique and identifiable runbook name\.

1. Provide a description of the runbook\.

1. Provide an IAM role for the automation document to assume\. This allows the runbook to run commands automatically\. For more information, see [Configuring a service role access for Automation workflows](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-setup.html#automation-setup-configure-role)\.

1. \(Optional\) Add the input parameters that the runbook starts with\.

1. \(Optional\) Add a **Target** type\.

1. \(Optional\) Add tags\.

1. Fill in the steps that the runbook takes\. Each step requires:
   + A name\.
   + A description of the purpose of the step
   + The action to run during the step\. Runbooks use the **Pause** action type to describe a manual step\.
   + \(Optional\) Provide command properties\.

1. After adding all required runbook steps, choose **Create Automation**\.

To enable cross\-account functionality, share the runbook in your management account with all application accounts that use the runbook during an incident\. 

**Share a runbook**

1. Open the Systems Manager console at [https://console\.aws\.amazon\.com/systems\-manager/](https://console.aws.amazon.com/systems-manager/)\.

1. In the navigation pane, choose **Documents**\.

1. In the documents list, choose the document you want to share and then choose **View details**\. On the **Permissions** tab, verify that you're the document owner\. Only a document owner can share a document\.

1. Choose **Edit**\.

1. To share the command publicly, choose **Public** and then choose **Save**\. To share the command privately, choose **Private**, enter the AWS account ID, choose **Add permission**, and then choose **Save**\. 

## Incident Manager runbook template<a name="runbooks-template"></a>

Incident Manager provides the following runbook templates to get your team started with authoring runbooks in Systems Manager automation documents\. You can use these templates as is or edit them to include more details specific to your application and resources\. 

**Find Incident Manager runbook templates**

1. Open the Systems Manager console at [https://console\.aws\.amazon\.com/systems\-manager/](https://console.aws.amazon.com/systems-manager/)\.

1. In the navigation pane, choose **Documents**\.

1. In the documents list use the search to find *AWSIncidents\-*\. This displays all Incident Manager runbooks\.

**Using a template**

1. Open the Systems Manager console at [https://console\.aws\.amazon\.com/systems\-manager/](https://console.aws.amazon.com/systems-manager/)\.

1. In the navigation pane, choose **Documents**\.

1. Choose the template you're updating from the documents list\.

1. Choose the **Content** tab and copy the content of the document\.

1. In the navigation pane, choose **Documents**\.

1. Choose **Create automation**\.

1. Provide a unique and identifiable name\.

1. Choose the **Editor** tab\. 

1. Choose **Edit**\.

1. Enter the copied details in the **Document editor** area\. 

1. Choose **Create automation**\.

### AWSIncidents\-CriticalIncidentRunbookTemplate<a name="runbooks-template-critical"></a>

The AWSIncidents\-CriticalIncidentRunbookTemplate is a template that provides the Incident Manager incident lifecycle in manual steps\. These steps are generic enough to use in most applications but detailed enough to get responders started with incident resolution\. 