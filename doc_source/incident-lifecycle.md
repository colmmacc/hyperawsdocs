# Incident lifecycle<a name="incident-lifecycle"></a>

AWS Systems Manager Incident Manager is an incident lifecycle management tool\. The primary goal of Incident Manager is to facilitate the return of your AWS\-hosted applications to normal as quickly as possible\. Incident Manager provides tools and best practices for every phase of the incident lifecycle:
+ [Alerting and engagement](#alerting-engagement)
+ [Triage](#triage)
+ [Investigation and mitigation](#investigation-mitigation)
+ [Post\-incident analysis](#lifecycle-post-incident-analysis)

![\[Image of the incident lifecycle as described in this page. The cycle flows cyclically from Alerting and engagement to triage to investigation to post incident analysis and back to alerting and engagement.\]](http://docs.aws.amazon.com/incident-manager/latest/userguide/images/incident-lifecycle.png)

## Alerting and engagement<a name="alerting-engagement"></a>

The alerting and engagement phase of the incident lifecycle focuses on bringing awareness to incidents within your applications\. This phase begins before an incident is ever detected and requires a deep understanding of your applications\. You can use Amazon CloudWatch metrics to monitor data about the performance of your applications\. For more information, see [Using Metrics]() in the CloudWatch user guide\. After you've set up monitoring for your applications, you can begin alerting on metrics that stray outside the historical norm by using CloudWatch alarms\. To learn more about monitoring best practices, see [Monitoring](incident-response.md#incident-response-monitoring) in the incident preparedness section of this user guide\.

Now that you are monitoring for incidents in your applications, you can define an incident *response plan* to use during an incident\. To learn more about creating response plans, see [Response plans](response-plans.md)\. Amazon EventBridge events or CloudWatch Alarms can automatically create an incident using with response plans as the template\. To learn more about incident creation, see [Incident creation](incident-creation.md)\.

Response plans launch related *escalation plans* and *engagement plans* to bring first responders into the incident\. For more information about setting up escalation plans, see [Create an escalation plan](escalation.md#escalation-create)\. Simultaneously, AWS Chatbot notifies responders using a *chat channel* directing them to the incident detail page\. Using the chat channel and *incident details*, the team can communicate and triage an incident\. For more information about setting up chat channels in Incident Manager, see [Set up an AWS Chatbot client](chat.md#chat-create)\.

## Triage<a name="triage"></a>

Triage is when first responders attempt to determine the impact to customers\. Responders prioritize incidents by using the following impact rating:
+ 1 – Critical impact, this typically relates to full application failure that impacts many to all customers
+ 2 – High impact, partial application failure with impact to many customers
+ 3 – Medium impact, the application is providing reduced service to customers
+ 4 – Low impact, customer might aren't impacted by the problem yet
+ 5 – No impact, customers aren't currently impacted but urgent action is needed to avoid impact

## Investigation and mitigation<a name="investigation-mitigation"></a>

The *incident* details view provides your team with runbooks, timelines, and metrics\. To see how you can work with an incident, see the [Incident details](tracking-details.md)\.

*Runbooks* commonly provide investigation steps and can automatically pull data or attempt commonly used solutions\. Runbooks also provide clear, repeatable steps that your team has found to be useful in mitigating incidents\. The runbook tab focuses on the current runbook step and shows past and future steps\.

Incident Manager integrates with Systems Manager Automation documents to build runbooks\. Use runbooks to do any of the following:
+ Manage instances and AWS resources
+ Automatically run scripts
+ Manage AWS CloudFormation resources

For more information about the supported action types, see [Systems Manager Automation actions reference](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-actions.html)\.

The *timeline tab* shows what actions have been taken\. The timeline records each with a timestamp and automatically created details\. To add custom events to the timeline, see the [Timeline](tracking-details.md#tracking-details-timeline) section in the *Incident details* page of this user guide\.

The *metrics tab* shows automatically populated metrics and manually added metrics\. This view provides valuable information into the activities of your application during an incident\.

Using *chat channels*, through AWS Chatbot, you can directly interact with your incident\. Using AWS Chatbot you can use any Incident Manager API action in the configured chat channel\. Update the title and description while you resolve the incident directly from the chat channel\. For more information about the commands available, see the [AWS Systems Manager Incident Manager API Reference](https://docs.aws.amazon.com/incident-manager/latest/APIReference/Welcome.html)\.

## Post\-incident analysis<a name="lifecycle-post-incident-analysis"></a>

Use *post incident analysis* to reflect on the incident\. Post incident analysis provides the structure in which your team can formulate ways to improve response and customer experience\. Improvements can include:
+ Changes to the applications involved in an incident\. Your team can use this time to improve the system and make it more fault tolerant\.
+ Changes to an incident response plan\. Take the time to incorporate learned lessons\.
+ Changes to runbooks\. Your team can dive deep into steps needed for resolution and the steps that you can automate\. 
+ Changes to alerting\. After an incident, your team might have noticed critical points in the metrics you can use to alert the team sooner about an incident\. 

Incident Manager facilitates these potential improvements by using a set of post incident analysis questions and action items alongside the incident timeline\. To learn more about improvement through analysis, see [Post\-incident analysis](analysis.md)\.