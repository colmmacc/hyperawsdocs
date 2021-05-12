# Using the Incident Manager replication set<a name="replication"></a>

The Incident Manager replication set replicates your data to many Regions to increase redundancy in case a Region is down and allow other other Regions to access your data\. The replication set it also used to encrypt your data with either an AWS owned key or your own customer owned key\. All Incident Manager resources are encrypted by default\. To learn more about how your resources are encrypted, see [Data Protection in Incident Manager](data-protection.md)\. To get started with Incident Manager, first create your replication set using the **Get prepared** wizard\. To learn more about getting prepared in Incident Manager, see the [Get prepared wizard](getting-started.md#getting-started-wizard)\.

## Editing your replication set<a name="replication-edit"></a>

Using the Incident Manager **Settings** page you can edit your replication set\. You can add Regions, delete Regions, and enable or disable replication set deletion protection\. You can't edit the key used to encrypt you data\. To change the key, delete the replication set\.

**Add a Region**

1. Navigate to the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home) and choose **Settings** from the left navigation bar\. 

1. Choose **Add Region**\.

1. Select the **Region**\. 

1. Choose **Add**\.

**Delete a Region**

1. Navigate to the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home) and choose **Settings** from the left navigation bar\. 

1. Select the Region you want to delete\.

1. Choose **Delete**\.

1. Enter **delete** into the text box and choose **Delete**\.

## Deleting your replication set<a name="replication-delete"></a>

Deleting the last Region in your replication set deletes the entire replication set\. Before you can delete the last Region, disable the deletion protection by toggling **Deletion protection** on the **Settings** page\. After you've deleted your replication set you can create a new replication set by using the **Get prepared** wizard\. 

To delete Regions from your replication set, wait 24 hours after creating them\. Attempting to delete a Region from your replication set sooner than 24 hours after creation causes the deletion to fail\. 

Deleting your replication set deletes all Incident Manager data\. 

**Delete the replication set**

1. Navigate to the [Incident Manager console](https://console.aws.amazon.com/systems-manager/incidents/home) and choose **Settings** from the left navigation bar\. 

1. Select the last Region in your replication set\.

1. Choose **Delete**\.

1. Enter **delete** into the text box and choose **Delete**\.