# Escalation plans<a name="escalation"></a>

AWS Systems Manager Incident Manager provides escalation paths through your defined contacts\. You can pull multiple contacts into an incident at the same time\. If these contacts don't respond, Incident Manager escalates to next set of contacts\. You can also define your escalation plan to automatically escalate even if a contact has responded\. You can add escalation plans to a response plan so escalation automatically starts at the beginning of an incident\. You can also add escalation plans to an active incident\.

**Topics**
+ [Stages](#escalation-stages)
+ [Create an escalation plan](#escalation-create)

## Stages<a name="escalation-stages"></a>

Escalation plans use stages where each stage lasts a defined number of minutes\. Each stage has the following information:
+ **Duration** \- The amount of time the plan waits until beginning the next stage\. As soon as the engagement starts the first stage begins\.
+ **Contacts** \- The escalation plan engages each contact using its defined engagement plan\. You can set up each contact to stop the progression of the escalation plan before it goes to the next stage\. Each stage can have multiple contacts\.

## Create an escalation plan<a name="escalation-create"></a>

1. Open the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home) and choose **Escalation plans** from the left navigation\.

1. Choose **Create escalation plan**\.

1. Provide a unique name for the escalation plan\.

1. Define the number of minutes until the next stage begins\.

1. Use the search bar to find and add a contact\.

1. \(Optional\) To have a contact stop the escalation plan when they acknowledge the engagement, select **Contact acknowledgment stops plan progression**\.

1. To add another contact to this stage, choose **Add contact**\.

1. To add a new stage, choose **Add stage**\.

1. Repeat steps 4 through 8 until you have added all contacts and stages you want\.

1. Choose **Create escalation plan**\.