# Response plans<a name="response-plans"></a>

Use response plans to plan for incidents and define how to respond to incidents\. Response plans provide a template for when an incident occurs\. This template includes information about who to engage, the expected severity of the event, automatic runbooks to initiate, and metrics to monitor\. To create a response plan, use the following steps\.

## Best practices<a name="response-plan-best-practices"></a>

Taking the time to plan for incidents ahead of time saves operational time for teams later down the road\. Teams should consider the following best practices when designing a response plan\.
+ **Streamlined engagement** – Identify the most appropriate team for an incident\. Engaging wide distribution lists or the wrong teams causes confusion and wastes responder time during incidents\. 
+ **Reliable escalation** – Using escalation plans rather than contacts ensures that responders are effectively and reliably engaged\. Even with the best intentions, responders are sometimes unreachable\. Having a backup responder configured in an escalation plan covers these scenarios\. 
+ **Runbooks** – Developing runbooks that provide repeatable and understandable steps helps reduce the stress responders experience during incidents\.
+ **Collaboration** – Use chat channels to streamline communication during incidents\. Chat channels help responders stay up to date with information and also share information with other responders\. 

## Response plan creation<a name="response-plans-create"></a>

Using the response plan best practices and the Incident Manager console, create dynamic response plans to automate incident response\.

**Create a response plan\.**

1. Open the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home), and in the left navigation, choose **Response plans**\.

1. Choose **Create response plan**\.

1. Enter a unique and identifiable response plan **Name**\. The response plan name only contains alpha\-numeric, hyphen, and underscore characters\. 

1. \(Optional\) Enter a **Display name**\. Use the display name to provide a more user\-friendly name to the response plan\.

1. Enter an incident title\. The incident title helps to identify an incident on the incidents home page\.

1. To indicate the potential scope of the incident, choose an **Impact**\.

1. \(Optional\) Provide a brief description of the incident\. 

1. \(Optional\) Provide a dedupe string\. Incident Manager uses the dedupe string to prevent the same root cause from creating multiple incidents\.

1. Choose a chat channel for the incident responders to interact in during an incident\. For more information about chat channels, see [Chat channels](chat.md)\. 
**Important**  
Incident Manager must have permissions to publish to the chat channel's SNS topic\. Without permissions to publish to the SNS topic, you can't add it to the response plan\. Incident Manager verifies permissions by publishing a test notification to the SNS topic\.

1. \(Optional\) Choose additional SNS topics to publish to during the incident\. Adding SNS topics in multiple Regions increases redundancy in case a Region is down at the time of the incident\.

1. For **Engagement**, choose any number of contacts and escalations plans\. For information about contact and escalation plan creation, see [Contacts](contacts.md) and [Escalation plans](escalation.md)\.

1. To select a **Runbook**:
   + Choose **Select an existing runbook**\. Select the **Owner**, **Runbook**, and **Version**\. For information about runbook creation, see [Runbooks and automation](runbooks.md)\.
   + Choose **Clone runbook from template**\. Enter a descriptive runbook name\. 

1. Either choose an existing role or use the following steps to create a new role\. If you choose an existing role it must allow Incident Manager to start an automation execution for you\.

   1. Open the IAM console at [https://console\.aws\.amazon\.com/iam/](https://console.aws.amazon.com/iam/)\.

   1. Choose **Roles** from the left navigation and choose **Create role**\.

   1. Select **Incident Manager** and choose the **Incident Manager** use case\.

   1. Choose **Next: Permissions**

   1. Choose **Create policy** and then choose the **JSON** tab\. 

   1. Copy and paste the following JSON blob describing the policy into the JSON editor\.

      ```
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Resource": "arn:aws:ssm:*:111122223333:automation-definition/DocumentName:*",
            "Action": "ssm:StartAutomationExecution"
          },
          {
            "Effect": "Allow",
            "Resource": "arn:aws:iam::*:role/AWS-SystemsManager-AutomationExecutionRole",
            "Action": "sts:AssumeRole"
          }
        ]
      }
      ```

   1. Choose **Next: Tags**

   1. \(Optional\) Add tags to your policy\.

   1. Choose **Next: Review**\.

   1. Provide a **Name** and optionally provide a **Description** for the policy\.

   1. Choose **Create policy**\.

   1. Navigate back to the role you were creating and select for the policy you created\. 

   1. \(Optional\) Add tags to your role\.

   1. Provide a **Role name** and \(optional\) update the **Role description**\.

   1. Choose **Create role**\.

   1. Navigate back to the response plan you are creating and refresh the **Role name** dropdown\.

   1. Select the role you created in the IAM console\.

1. Choose the **Execution target**\.

1. \(Optional\) Add tags to your response plan\.

1. Choose **Create response plan**\.

    