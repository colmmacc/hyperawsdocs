# Chat channels<a name="chat"></a>

A key feature of AWS Systems Manager Incident Manager is the ability to directly communicate through chat channels during an incident\. During an incident, Incident Manager pushes incident updates and notifications directly to the chat channel to keep all responders informed\. Responders can update and interact with the incident directly from the chat channel by using chat commands\. For more information about AWS Chatbot, see [AWS Chatbot Administrator Guide](https://docs.aws.amazon.com/chatbot/latest/adminguide/chatbot-slack-lambda-integration.html)\.

**Topics**
+ [Set up an AWS Chatbot client](#chat-create)
+ [Configuring SNS permissions](#chat-sns)
+ [Interacting through chat](#chat-interact)
+ [Best practices](#chat-best-practices)

## Set up an AWS Chatbot client<a name="chat-create"></a>

Incident Manager uses AWS Chatbot clients to connect responders in Amazon Chime or Slack\. Add AWS Chatbot client to a response plan to notify the chat room that an incident started\.

**Configure an AWS Chatbot client\.**

1. Open the [AWS Chatbot console](https://console.aws.amazon.com/chatbot/), and in the left navigation bar, choose **Configured clients**\.

1. Choose **Configure new client**\.

1. Choose **Amazon Chime** or **Slack**\.

------
#### [ Slack ]

1. Choose your workspace from the dropdown on the top right\.

   1. If you're not already signed in to a workspace, choose **Sign in to a workspace**

1. To grant AWS Chatbot permission to access your Slack workspace, choose **Allow**\.

1. Choose **Configure new channel**\.

1. Switch to Slack and add the AWS Chatbot app\.

   1. In the Slack navigation bar, choose **More** and then choose **Apps**\.

   1. Search for and choose **AWS Chatbot**\. **aws** now appears in your **Apps** list in the navigation bar\.

   1. Invite AWS Chatbot to your channel: `/invite @AWS`

1. Enter an identifiable configuration name\.

1. *Optional*– If you would like logging on this channel, Select **Logging**\.

1. For the channel type, choose **public** or **private**\. Channels might take some time to populate because AWS Chatbot fetches all channels available in the workspace\.
   + For public channels, use the search bar to choose your public channel\. 
   + For private channels, navigate to your channel within Slack and right\-click the channel name\. Choose **Copy link** then enter the link in the **Private Channel ID** field on the AWS Chatbot configuration page\.

1. 

   1. If the 

1. Choose **Create an IAM role using a template**, and enter a role name\.

1. For **policy templates**, choose **AWS Systems Manager Incident Manager permissions**\.

1. In the **Notifications** section, choose the Region for your first SNS topic\. 

1. Choose the SNS topics you would like to notify during an incident\. To learn more about SNS topics, see [Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)\. 
**Note**  
Incident Manager requires SNS topics to send notifications to your chat channels\.

------
#### [ Amazon Chime ]

**Note**  
Chat commands aren't supported on Amazon Chime\.

1. Enter an identifiable **Configuration name**\.

1. Open the Amazon Chime desktop client, then open the chat room you want\.

1. Choose the gear icon in the upper\-right corner, and then choose **Manage webhooks and bots**\.

1. In the **Manage incoming webhooks and bots** dialog box, choose **Add webhook**, type a name for the webhook, and then choose **Create**\.

1. Verify the webhook you created is listed, and choose **Copy URL** to copy the webhook URL to your clipboard\.

1. On the **Configure Amazon Chime webhook** page, paste this copied webhook into the **Webhook URL** field\. 

1. Provide a brief description to identify the chat room and purpose\.

1. You can optionally turn on logging for this chat room\.

1. Choose **Create an IAM role using a template\.**

1. Enter a **Role name**\.

1. For **Policy templates**, choose **AWS Systems Manager Incident Manager permissions**\.

1. In the **Notifications **section, choose the Region for your first SNS topic\. 

1. Choose any number of SNS topics you would like to notify during an incident\. To learn more about SNS topics, see [Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)\.
**Note**  
Incident Manager requires SNS topics to to send notifications to your chat channels\.

------

You can now add this AWS Chatbot client to an Incident Manager response plan\. To learn more about setting up response plans, see [Response plans](response-plans.md)\. 

Using SNS topics with Incident Manager incurs the costs of SNS\. For more information, see [Amazon SNS pricing](http://aws.amazon.com/sns/pricing/)\.

## Configuring SNS permissions<a name="chat-sns"></a>

Before you can use the AWS Chatbot client during an incident, update the access policy of the related Amazon SNS topics\. 

1. Navigate to the Amazon SNS [console](https://console.aws.amazon.com/sns/) and choose **Topics** from the navigation panel\. 

1. Select the Amazon SNS topic related to the AWS Chatbot client you set up in the previous section\.

1. Choose **Edit**\.

1. Expand the **Access policy** section and add the following statement to the policy's **Statement** array\.

   ```
        {
         "Sid": "IncidentManagerSNSPublishingPermissions",
         "Effect": "Allow",
         "Principal": {
           "Service": "ssm-incidents.amazonaws.com"
         },
         "Action": "SNS:Publish",
         "Resource": "arn:aws:sns:us-east-1:111122223333:example_SNS_topic",
         "Condition": {
           "StringEqualsIfExists": {
             "AWS:SourceAccount": "111122223333"
            }
          }
        }
   ```
**Important**  
The AWS service ssm\-incidents\.amazonaws\.com must have permissions to publish to the chat channel's SNS topic\. Without permissions to publish to the SNS topic, Incident Manager will not be able to publish notifications to your chat channel\.

1. Replace the `Resource` value *"arn:aws:sns:us\-east\-1:111122223333:example\_SNS\_topic"* with your Amazon SNS topic ARN\.

1. Replace the `AWS:SourceAccount` value *"111122223333"* with your AWS account ID\.

1. Choose **Save changes**\.

Use the previous steps to update each SNS topic related to the configure AWS Chatbot client\.

## Interacting through chat<a name="chat-interact"></a>

Incident Manager enables responders to interact with incidents directly from the chat channel\. Chat commands are only available in Slack chat channel\. These are some common commands:
+ [CreateTimelineEvent](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_CreateTimelineEvent.html)
+ [DeleteTimelineEvent](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_DeleteTimelineEvent.html)
+ [GetIncidentRecord](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_GetIncidentRecord.html)
+ [GetTimelineEvent](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_DeleteTimelineEvent.html)
+ [ListIncidentRecords](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_ListIncidentRecords.html)
+ [ListTimelineEvents](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_ListTimelineEvents.html)
+ [UpdateIncidentRecord](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_UpdateIncidentRecord.html)
+ [UpdateTimelineEvent](https://docs.aws.amazon.com/incident-manager/latest/APIReference/API_UpdateTimelineEvent.html)

To use any of the preceding commands from an active incident's chat channel, use the following format\. Replace *<CLI Command>* with any of the preceding commands and its appropriate fields\. 

```
@aws ssm-incidents <CLI Command>
```

```
@aws ssm-contacts <CLI Command>
```

## Best practices<a name="chat-best-practices"></a>

Best practices to keep in mind when configuring your chat channels using AWS Chatbot\. 
+ AWS Chatbot enabled Slack channels inherit the permissions of the IAM role used to configure AWS Chatbot\. This enables responders in an AWS Chatbot enabled Slack channel to call any allow\-listed action; such as Incident Manager APIs and retrieving metrics graphs\.
+ Maintain principal of least permission, practice security standards, and regularly review membership of your AWS Chatbot enabled chat channels\.