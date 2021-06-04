# Post\-incident analysis<a name="analysis"></a>

Post\-incident analysis guides you through identifying improvements to your incident response, including time to detection and mitigation\. An analysis can also help you understand the root cause of the incidents\. Incident Manager creates recommended *action items* to improve your incident response\. 

**Benefits of a post\-incident analysis**
+ Improve incident response
+ Understand the root cause of the problem
+ Address root causes with deliverable action items
+ Analyze the impact of incidents
+ Capture and share learnings within an organization

**What not to use an analysis for**  
An analysis is blameless and doesn't call out people by name\. 

"Regardless of what we discover, we understand and truly believe that everyone did the best job they could, given what they knew at the time, their skills and abilities, the resources available, and the situation at hand\." \- Norm Kerth, Project Retrospectives: A Handbook for Team Review

## Analysis details<a name="analysis-details"></a>

The analysis details page guides you through gathering information, assessing improvements, and creating action items\. The analysis details page is similar to the incident details with some key differences such as historical metrics, editable timeline, and questions to improve future incidents\. 

### Overview<a name="analysis-details-overview"></a>

The overview is a summary of the incident\. This summary includes background, what occurred, why it happened, how it was mitigated, duration, and key action items to prevent the incident from happening again\. The overview is high level\. You'll explore more details in the **Questions** tab of the analysis\.

### Metrics<a name="analysis-details-metrics"></a>

Use the metrics tab to visualize key metrics in your application over the duration of the incident\. You can add metric graphs here that have one or more metrics depicted in the same graph\. Metrics used during an incident are automatically populated on this tab\. We recommend you adding a description, title, and annotations of key timepoints during the incident\.

Some key time points you can consider when analyzing a metric graph:
+ Deployment change
+ Configuration change
+ Incident start time
+ Alarm time
+ Time of engagement
+ Mitigation start time
+ Incident resolved time

**Limitations**
+ CloudWatch alarms and metric expressions aren't imported from an incident\.
+ Metrics that are in a region that Incident Manager doesn't support aren't imported from the incident\.
+ Metrics in application accounts require configuration of the `CloudWatch-CrossAccountSharingRole` prior to creating the analsysis\. For more information about the role, see [Cross\-Account Cross\-Region CloudWatch console](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html) in the CloudWatch user guide\.

### Timeline<a name="analysis-details-timeline"></a>

Describe key time points on the timeline as you dive deeper into understanding the incident\. The incidents timeline is automatically populated on this tab\. You can delete timepoints that aren't relevant to the analysis\. You can also add and edit time points to more accurately describe the incident and its impact\.

Use the timeline tab to answer questions you find on the **Questions** tab about the incident response\. 

### Questions<a name="analysis-details-questions"></a>

Use Incident Manager questions to improve the time to resolution of incidents in your application and reduce the occurrence of incidents\. As you answer questions, update the **Metrics** and **Timeline** tabs for accuracy\. The questions focus on these key aspects of incident response:
+ Detection – Could you improve time to detection? Are there updates to metrics and alarms that would detect the incident sooner?
+ Diagnosis – Can you improve the time to diagnosis? Are there updates to your response plans or escalation plans that would engage the correct responders sooner?
+ Mitigation – Can you improve the time to mitigation? Are there runbook steps that you could add or improve?
+ Prevention – Can you prevent future incidents from occurring? To discover the root causes of an incident, Amazon uses the 5\-Whys approach in problem investigation\. 

### Actions<a name="analysis-details-actions"></a>

Incident Manager creates recommended action items for you to review as you complete the questions\. You can choose to accept and complete these actions from this tab or you can dismiss these actions\. You can review dismissed action items by choosing **Dismissed action items**\. Action items are a type of OpsItem that are linked to the analysis and incident in OpsCenter\.

### Checklist<a name="analysis-details-checklist"></a>

Before closing an analysis, use the checklist to review actions that a responder should take\. As responders complete actions in the checklist, the icon next to the action changes from an ellipse to a checkmark, indicating that the action is complete\. If you haven't completed checklist items, Incident Manager displays a message to confirm the responder wants to close the analysis without completing it\.

## Analysis templates<a name="analysis-templates"></a>

An analysis template provides a set of questions that dive deep into the root cause of incidents\. You can use your answers to these questions to improve application performance and incident response\. 

### AWS standard template<a name="analysis-templates-standard"></a>

Incident Manager provides a standard template of questions based on AWS incident response and problem analysis best practices\. The standard AWS template provided by Incident Manager is `AWSIncidents-PostIncidentAnalysisTemplate`\. 

### Create an analysis template<a name="analysis-templates-create"></a>

We encourage you to use the default template and add additional questions or sections that are appropriate for your use cases\. Create analysis templates based on the default template in your management account and duplicate them to each Region where you have enabled Incident Manager\.

**Create an analysis template**

1. Download `AWSIncidents-PostIncidentAnalysisTemplate` by calling the `GetDocument` action using the parameter "Name" ` AWSIncidents-PostIncidentAnalysisTemplate`\. For more information about the `GetDocument` syntax, see [Systems Manager API Reference](https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_GetDocument.html)\.

1. The content in the response contains the JSON building blocks for the analysis\. Use the question building blocks to insert additional questions in the analysis\. We recommend that you add questions or sections in the `Incident questions` section\.

1. To create the new template, use the `CreateDocument` operation with the updated JSON from the previous step\. You must include `DocumentFormat: "JSON"`, `DocumentType: "ProblemAnalysisTemplate"`, and `Name: "Analysis_Template_Name`\.

## Create an analysis<a name="analysis-create"></a>



1. To create an analysis, choose **Create analysis** from the incident details page of a closed incident\.

1. Choose the analysis template and provide a descriptive name of the analysis\.

1. Choose **Create**\.