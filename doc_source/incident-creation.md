# Incident creation<a name="incident-creation"></a>

AWS Systems Manager Incident Manager tracks incidents\. Using Amazon CloudWatch or Amazon EventBridge, Incident Manager can automatically start incidents\. You can also create Incidents manually on the incident list page\. When you create an incident, Incident Manager creates a parent OpsItem in OpsCenter to track related work and future incident analyses\. Calls to OpsCenter incur costs in Systems Manager\. For more information about OpsCenter pricing, see [Systems Manager pricing](http://aws.amazon.com/systems-manager/pricing/)\. This section describes automatic and manual incident creation\. 

## Automatic creation of incidents<a name="incident-tracking-auto"></a>

Incident Manager integrates with CloudWatch and EventBridge to automatically track an incident when the alarm reaches a defined threshold or meets event rule conditions\. Once you've set up a CloudWatch alarm or EventBridge event to monitor your environment for incidents, you can set these alarms or events to use the start incident action\. The start incident action uses the provided runbook and creates an incident in Incident Manager\. Using CloudWatch and EventBridge with Incident Manager incurs costs for incident creation\. For more information about pricing see, [CloudWatch pricing](http://aws.amazon.com/cloudwatch/pricing/)\.

### Amazon CloudWatch alarms<a name="incident-tracking-auto-alarms"></a>

Amazon CloudWatch uses your CloudWatch metrics to alert you about changes in your environment and to automatically perform the start incident action\. CloudWatch works with Systems Manager and Incident Manager to create an incident from a response plan template when an alarm goes into alarm state\. This requires the following prerequisites:
+ Incident Manager configured and replication set created\. This step creates the Incident Manager service linked role in your account, providing the necessary permissions\.
+ `iam:ListResponsePlans` added to your IAM policy\. This provides permissions for the alarm to list the response plans when setting up the alarm action\.
+ ` iam:CreateServiceLinkedRole` added to your IAM policy\. This provides permissions to create the Incident Manager service linked role in your account\.
+ A configured Incident Manager response plan\. To learn how to configure Incident Manager response plans, see [Response plans](response-plans.md) in the *Incident preparation* section of this guide\. 
+ Configured CloudWatch metrics monitoring your application\. For monitoring best practices, see [Monitoring](incident-response.md#incident-response-monitoring) in the *Incident preparation* section of this guide\.
+ To set up the alarm you need the following permission in your IAM policy `cloudWatch:PutMetricAlarm` or `cloudWatch:PutCompositeAlarm`\.

**To create an alarm with a **Start incident** action**

1. Decide what type of alarm you're creating and follow the steps found in the following sections of the CloudWatch user guide\.
   + [Create an Alarm Based on a Static Threshold]()
   + [Creating an Alarm Based on Anomaly Detection]()
   + [Creating an Alarm Based on a Metric Math Expression]()
   + [Creating a Composite Alarm](AmazonCloudWatch/latest/monitoring/Create_Composite_Alarm.html)
   + [Creating a CPU Usage Alarm]()
   + [Creating a Load Balancer Latency Alarm]()
   + [Creating a Storage Throughput Alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_AlarmAtThresholdEBS.html)

1. When choosing the action for the alarm to perform, select **Add Systems Manager action**\.

1. Choose **Start incident** and select the **Response plan** for this incident\.

1. Complete the remaining steps in your selected alarm type guide\.

You can also add the start incident action to any existing alarm\.

### EventBridge events<a name="incident-tracking-auto-eventbridge"></a>

EventBridge rules watch for event patterns\. If the event matches the defined pattern, Incident Manager creates an incident using the chosen response plan\. You can configure EventBridge to receive events from software as a service \(SaaS\) partner applications and services, allowing for third\-party integration\. After configuring EventBridge to receive events from third\-party partners, you can create rules that match on partner events to create incidents\. To see a list of third\-party integrations, see [Receiving events from a SaaS partner](https://docs.aws.amazon.com/eventbridge/latest/userguide/create-partner-event-bus.html)\.

**To configure rules using SaaS partner applications and services:**

1. Configure EventBridge to receive events from a SaaS integration\.

   1. Open the Amazon EventBridge console at [https://console\.aws\.amazon\.com/events/](https://console.aws.amazon.com/events/)\.

   1. In the navigation pane, choose **Partner event sources**\.

   1. Find the partner that you want and choose **Set up** for that partner\. 

   1. Choose **Copy** to copy your account ID to the clipboard\.

   1.  In the navigation pane, choose **Partner event sources**\.

   1. Go to the partner's website and follow the instructions to create a partner event source\. Use your account ID for this\. The event source that you create is available only on your account\. 

   1. Go back to the EventBridge console and choose **Partner event sources** in the navigation pane\.

   1. Select the button next to the partner event source, and choose **Associate with event bus**\.

1. <a name="step2"></a>Create a rule that triggers on an event from a SaaS partner\.

   1. Open the Amazon EventBridge console at [https://console\.aws\.amazon\.com/events/](https://console.aws.amazon.com/events/)\.

   1. In the navigation pane, choose Rules\.

   1. Choose **Create rule**\.

   1. Enter a name and description for the rule\.

   1. For **Define pattern**, choose **Event pattern**\.

   1. Choose **Pre\-defined pattern by service**\.

   1. For **Service provider**, choose **Service partners**\.

   1. For **Service name**, choose the name of the partner\.

   1. For **Event type**, choose **All Events** or choose the type of event to use for this rule\. If you choose **All Events**, all events emitted by this partner event source will match the rule\. 

      If you want to customize the event pattern, choose **Edit**, make your changes, and then choose **Save**\.

   1. For **Service event bus**, select the event bus that corresponds to this partner\.

   1. For **Select targets**, choose **SSM Incident**\.

   1. For **Response plan**, choose a response plan\. 

   1. EventBridge can create the IAM role needed for your rule to run:
      + To create an IAM role automatically, choose** Create a new role for this specific resource**\.
      + To use an IAM role that you created before, choose **Use existing role**\.

   1. \(Optional\) Enter one or more tags for the rule\. 

   1. Choose **Create**\.

EventBridge also receives events from the AWS services listed in [Events from Supported AWS Services](https://docs.aws.amazon.com/eventbridge/latest/userguide/event-types.html)\. Similar to how you configure rules for SaaS partners they, you can configure them for AWS services\. To define a rule for an AWS service, perform [step two](#step2) in this procedure but choose an AWS service when selecting the **Service name**\.

#### Creating incidents across accounts in EventBridge<a name="incident-tracking-auto-eventbridge-xa"></a>

EventBridge supports sending and receiving events between AWS accounts and Regions but requires specific configuration for this use case\. To learn more about sharing events across account, see the [EventBridge user guide](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-cross-account.html)\. Rules created in your application accounts can be used to start incidents using response plans created in your management account\.

1. Set up a cross\-account event bus using the steps listed in the [EventBridge user guide](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-cross-account.html)\.

1. Create a rule in your application account using the cross\-account event bus\. 

1. Use the response plan you configured in your management account as the target\.

## Manual creation of incidents<a name="incident-tracking-manual"></a>

Responders can manually track an incident using the Incident Manager console by using a predefined response plan\. Use the following steps to create an incident\.

1. Open the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home)\.

1. Choose **Start incident**\.

1. For **Response plan**, choose a response plan from the list\.

1. \(Optional\) To override the title provided by the defined response plan, enter an **Incident title**\.

1. \(Optional\) To override the impact provided by the defined response plan, enter the **Impact** of the incident\.