# Resilience in AWS Systems Manager Incident Manager<a name="disaster-recovery-resiliency"></a>

The AWS global infrastructure is built around AWS Regions and Availability Zones\. AWS Regions provide multiple physically separated and isolated Availability Zones, which are connected with low\-latency, high\-throughput, and highly redundant networking\. With Availability Zones, you can design and operate applications and databases that automatically fail over between zones without interruption\. Availability Zones are more highly available, fault tolerant, and scalable than traditional single or multiple data center infrastructures\. 

For more information about AWS Regions and Availability Zones, see [AWS Global Infrastructure](http://aws.amazon.com/about-aws/global-infrastructure/)\.

Incident Manager is a global\-regional service and does not currently support Availability Zones\. 

In addition to the AWS global infrastructure, Incident Manager offers several features to help support your data resiliency and backup needs\. During the Getting started wizard you're asked to set up a replication set\. This regional replication set ensures that your data and resources are accessible from multiple Regions, making incident management across a cloud\-network more manageable\. This replication also ensures that your data is safe and accessible in the event that one of your Regions goes down\. To learn more about the replication set, see [Get prepared wizard](getting-started.md#getting-started-wizard)\.