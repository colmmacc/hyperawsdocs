# What Is AWS Systems Manager Incident Manager?<a name="what-is-incident-manager"></a>

AWS Systems Manager Incident Manager is an incident management console designed to help users mitigate and recover from incidents affecting their AWS\-hosted applications\. An incident is any unplanned interruption or reduction in quality of services\. 

Incident Manager increases incident resolution by notifying responders of impact, highlighting relevant troubleshooting data, and providing collaboration tools to get services back up and running\. To achieve the primary goal of reducing the time\-to\-resolution of critical incidents, Incident Manager automates response plans and enables responder team escalation\.

Using AWS tools such as Amazon CloudWatch Alarms and CloudWatch Metrics, AWS CloudTrail, AWS Systems Manager, AWS Chatbot, and more, Incident Manager facilitates rapid incident response to get applications working again\. 

Features include:
+ **Response plans** – Create and automate response plans initiated by CloudWatch alarms or Amazon EventBridge events\.
+ **Runbook automation** – Define runbooks through Systems Manager Automation to automate critical response and provide detailed steps to first responders\.
+ **Engagement and escalation** – Automatically connect the correct people for each unique incident\. Engage through different contact methods and escalate through responders ensuring visibility and active participation during incidents\.
+ **Active collaboration** – Incident responders actively respond to incidents through integration with the AWS Chatbot client\.
+ **Incident tracking** – Review incident details for up\-to\-date information during an incident\. Create and remediate follow\-up items while following runbooks\.

## Benefits of using Incident Manager<a name="benefits"></a>

**Align quickly**  
Incident Manager provides the ability to automatically collect and track the metrics related to an incident, through the use of Amazon CloudWatch metrics\.

You can add metrics manually to an incident, in real time, by using a *chat channel * or the Incident Manager *incident details*\. Investigate metrics further by using the built\-in CloudWatch graphs\. 

Use the Incident Manager incident timeline to display points of interest in chronological order\. Responders can also use the timeline to add custom events, describing what they did or what happened\. Automated points of interest include:
+ Metrics going into alarm
+ Added Metrics
+ Engaged Responders
+ Runbook steps completed

**Collaborate effectively**  
Incident Manager brings incident responders together through the use of contacts, escalation plans, and chat channels\. Define *contacts* directly in Incident Manager with their preferred contact channels\. Using your defined contacts, create *escalation plans* to engage the necessary responders at the right time during an incident\. 

Bring together responders in connected chat channels where they can directly interact with the incident using AWS Chatbot clients\. Incident Manager displays the real\-time actions of incident responders in the chat channel, providing context to others\. Communication during an incident is the key to faster resolution\.

**Automate and improve**  
Incident Manager enables your responders to focus on the key tasks required to resolve an incident through the use of *runbooks*\. Runbooks, a series of actions taken to resolve an incident, combine the power of automated tasks and the detail of manual steps leaving responders more available to analyze and respond to impact\.

Using Incident Manager *post incident analysis*, your team can develop more robust response plans and affect change across your applications to prevent future incidents and down time\. Post incident analysis also provides for iterative learning and improvement of runbooks, response plans, and metrics\.

## Related services<a name="related-services"></a>

Incident Manager integrates with your current AWS environment to provide rapid resolution of incidents\. 
+ **AWS Chatbot** – DevOps teams can use Amazon Chime and Slack chat rooms to monitor and respond to incidents\. To learn how Incident Manager works with AWS Chatbot, see [Chat channels](chat.md) in the *Communications* section of this guide\.
+ **AWS CloudFormation** – Automate the creation of response plans using AWS CloudFormation\. For more information, see the [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)\.
+ **Amazon CloudWatch** – Configure CloudWatch to monitor your application resources\. Use CloudWatch alarms to initiate incidents in the Incident Manager console\. To learn about monitoring best practices, see [Response plans](response-plans.md)\. Review detailed metrics during an incident using the incident details page\. For more information about metrics in the incident details page, see [Metrics](tracking-details.md#tracking-details-metrics) in the incident details section of this guide\. 
+ **AWS Systems Manager** – Use Systems Manager capabilities to view and control your application infrastructure\. For more information, see the [Systems Manager User Guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)\.
  + OpsCenter – Create *OpsItems* directly from a post incident analysis to follow up on related work\. To learn more about continuous improvement using Incident Manager post incident analysis, see the [Post\-incident analysis](analysis.md) section of this guide\.
  + Automation – To learn about creating runbooks using Systems Manager automation, see the [Runbooks and automation](runbooks.md) section of this guide\.

## Accessing Incident Manager<a name="access"></a>

You can access Incident Manager in any of the following ways: 
+ **AWS Systems Manager Incident Manager console** – [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home)
+ **AWS CLI** – For more information, see [Getting set up with the AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) in the *AWS Command Line Interface User Guide*\.
+ **Incident Manager API** – For more information, see the [AWS Systems Manager Incident Manager API Reference](https://docs.aws.amazon.com/incident-manager/latest/APIReference/Welcome.html)
+ **AWS SDKs** – For more information, see [Tools for Amazon Web Services](http://aws.amazon.com/tools)

## Incident Manager regions and quotas<a name="regions-quotas"></a>

Incident Manager isn't supported in all Systems Manager regions\. 

To view information about Incident Manager regions and quotas, see [Incident Manager endpoints](https://docs.aws.amazon.com/general/latest/gr/incident-manager.html) and quotas in the Amazon Web Services General Reference guide\.

## Pricing for Incident Manager<a name="pricing"></a>

There is a charge to use Incident Manager\. For more information, see [AWS Systems Manager pricing](http://aws.amazon.com/systems-manager/pricing/)\.

Other AWS services, AWS content and third\-party content made available in connection with this Service may be subject to separate charges and governed by additional terms\.