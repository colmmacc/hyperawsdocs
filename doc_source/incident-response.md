# Incident preparation<a name="incident-response"></a>

Planning for an incident begins long before the incident lifecycle\. To prepare for an incident, consider each of the following topics before you create response plans\. Use monitoring, contacts, escalation plans, chat channels, and runbooks to build response plans that automate response\. 

**Topics**
+ [Monitoring](#incident-response-monitoring)
+ [Contacts](contacts.md)
+ [Escalation plans](escalation.md)
+ [Chat channels](chat.md)
+ [Runbooks and automation](runbooks.md)
+ [Response plans](response-plans.md)

## Monitoring<a name="incident-response-monitoring"></a>

Monitoring the health of your AWS hosted applications is key to ensuring application up time and performance\. When determining monitoring solutions, consider the following: 
+ **Criticality of feature** – If the system were to fail, how critical would the impact to downstream users be\.
+ **Commonality of failure** – How commonly does a system fail; systems that require frequent intervention should be closely monitored\.
+ **Increased latency** – How much the time to complete a task has increased or decreased\.
+ **Client\-side versus server\-side metrics** – If there is a discrepancy between related metrics on the client and server\.
+ **Dependency failures** – Failures that your team can and should prepare for\.

After creating response plans, you can use your monitoring solutions to automatically track incidents the moment they happen in your environment\. For more information about incident tracking and creation, see the [Incident tracking](tracking.md)\.

For more information about architecting secure, high\-performing, resilient, and efficient infrastructure applications and workloads, see the [AWS Well\-Architected whitepaper](aws.amazon.com/architecture/well-architected/)\.