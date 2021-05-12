# Incident details<a name="tracking-details"></a>

The Incident Manager incident details page is an incident responder's point of reference for all things involved in an incident\. The incident details page automatically populates incidents as they're created\.

The top banner of every incident details page includes the **Incident title**, **Impact**, **Chat channel**, and **Duration**\. You can edit the incident title, impact, and chat channel by choosing **Edit** in the top right of the banner\. 

The incident details page has six tabs, making it easier for responders to locate and view information during an incident\. The tabs display a counter in the tab name, indicating the number of updates to the tab\. For more information about the contents each tab and how it works, continue reading\.

**Topics**
+ [Overview](#tracking-details-overview)
+ [Metrics](#tracking-details-metrics)
+ [Timeline](#tracking-details-timeline)
+ [Runbook](#tracking-details-runbook)
+ [Contacts](#tracking-details-contacts)
+ [Related items](#tracking-details-related)

## Overview<a name="tracking-details-overview"></a>

The **Overview** tab is the landing page for responders\. It contains the summary, a list of recent timeline events, and the current runbook step\.

Responders use the **Summary** to catch up on what actions have been taken, the results of changes, possible next steps, and information about the impact of the incident\. To update the summary, choose **Edit** in the top\-right corner of the **Summary** section\. If multiple responders are editing the summary field simultaneously, the responder who submits their edits last overwrites all other input\. 

**Recent timeline events** is the next section of the Overview tab\. Incident Manager populates the timeline with the five most recent events\. Use this section to understand the status of the incident and what has recently occurred\. To view a complete timeline, continue to the **Timeline** tab\. 

The overview page also displays the **Current runbook step**\. This step may be an automatic step running in your AWS environment or it may be a set of manual instructions for responders\. To view the complete runbook, including prior and upcoming steps, continue to the **Runbook** tab\.

## Metrics<a name="tracking-details-metrics"></a>

The **Metrics** tab contains vital information about your AWS hosted applications and systems\. Incident Manager uses Amazon CloudWatch to populate the metrics and alarm graphs found on this page\. To learn more about incident management best practices for defining alarms and metrics, see [Monitoring](incident-response.md#incident-response-monitoring) in the *Incident planning* section of this user guide\.

**To add metrics**
+ Choose **Add** in the upper right corner of this tab\.
  + Add a metric from an existing CloudWatch dashboard by selecting **From existing CloudWatch dashboard**\.

    1. Choose a **Dashboard**\. This adds all metrics and alarms that are part of the dashboard\.

    1. \(Optional\) You can **Select metrics** from the dashboard\.
  + Add a single metric by selecting **From CloudWatch** and pasting a metric source\. To copy a metric source:

    1. Open the CloudWatch console at [https://console\.aws\.amazon\.com/cloudwatch/](https://console.aws.amazon.com/cloudwatch/)\.

    1. In the navigation pane, choose **Metrics**\. 

    1. On the **All metrics** tab, enter a search term in the search field, such as a metric name or resource name, and press **Enter**\.

       For example, if you search for the `CPUUtilization` metric, you see the namespaces and dimensions with this metric\.

    1. Choose one of the results for your search to view the metrics\.

    1. Choose the **Source** tab and copy the source\.

Metric alarm graphs can only be added to the incident details through the related response plan or by selecting **From existing CloudWatch dashboard** when adding a metric\.

To remove metrics, choose **Remove** and then choose metrics from the provided **Metrics** dropdown\.

## Timeline<a name="tracking-details-timeline"></a>

Use the **Timeline** tab to track events that occur during an incident\. Incident Manager automatically populates timeline events that identify significant occurrences during the incident\. Responders can add custom events based on occurrences detected manually\. During the post incident analysis, the timeline tab provides valuable insights into how to better prepare and respond to incidents in the future\. For more information about post incident analysis, see [Post\-incident analysis](analysis.md)\. 

To add a custom timeline event, choose **Add**\. Select a date using the calendar and enter a time; all times are in your local time\. Provide a brief description of the event that appears in the timeline\. 

To edit an existing custom event, select the event on the timeline and choose **Edit**\. You can change the time, date, and description of *custom* events\. You can only edit custom events\.

## Runbook<a name="tracking-details-runbook"></a>

The runbook tab of the incident details displays the list of steps that the runbook automatically takes or responders manually perform\. The steps expand as they become the current step, displaying information required to complete the step or details about what the step does\. Automatic runbook steps resolve after the automation is complete\. Manual steps require the responders to choose **Next step** at the bottom of the step\. After a step has completed, the step output appears as a dropdown\.

To navigate to the runbook definition in Systems Manager, choose the runbook's title under **Runbook**\. To navigate to the running instance of the runbook in Systems Manager, choose the execution details under **Runbook details**\. These pages display the template used to start the runbook and the specific details of the currently running instance of the automation document\. 

Incident Manager starts runbooks automatically using Systems Manager\. To keep track of runbooks started in Systems Manager, we recommend copying the runbook's ARN \(Amazon Resource Name\) and adding it as a related item in the [Related items](#tracking-details-related) tab of the incident details\.

## Contacts<a name="tracking-details-contacts"></a>

The **Contacts** tab of the incident details drives engagement of responders and teams\. From this tab you can see who has been engaged and responded, who has been engaged but not responded, and responders who are going to be engaged as part of an escalation plan\. Responders can engage other contacts directly from this tab\. To learn more about creating contacts and escalation plans, see the [Contacts](contacts.md) and [Escalation plans](escalation.md) sections of this guide\. 

You can configure response plans with contacts and escalation plans to automatically start engagement at the start of an incident\. To learn more about configuring response plans, see the [Response plans](response-plans.md) section of this guide\.

You can find Information about each contact on the table in the contacts tab\. Choosing the contacts name under the **Name** column takes you to the contact's details page, displaying their contact methods and engagement plan\. If an escalation plan engaged the contact, the **Escalation plan** column contains a link to the escalation plan used to contact the responder\. The **Engaged** column displays when the contact was engaged or when they will be engaged\. Acknowledgment of engagement is the last column and displays whether the responder has responded to their engagement\.

## Related items<a name="tracking-details-related"></a>

The **Related Items** tab is a place for responders to gather useful resources used during the mitigation of the incident\. These resources can be an ARN or a link directly to an external resource\. The table displays a descriptive title and ARN or link details\.

**Adding a resource**

1. Choose **Add** in the upper right corner of the **Related items** tab\.

1. Enter a descriptive **Title**\. This title helps responders understand what the ARN or link is\.

1. In **Detail**, provide an ARN or a link to an external resource\.

1. Choose **Add**\.