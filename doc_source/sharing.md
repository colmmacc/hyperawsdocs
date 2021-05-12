# Working with shared contacts and response plans<a name="sharing"></a>

With contact sharing, as a contact owner, you can share contact information, escalation plans, and engagements with other AWS accounts or within an AWS organization\. You can create and manage contacts and escalation plans centrally, and ensure that others can engage the correct contacts during an incident\. 

With response plan sharing, as a response plan owner, you can share a response plan and the related incidents with other AWS accounts or within an AWS organization\. You can create and manage response plans centrally so that responders in consumer accounts can interact with incidents as they happen\.

A contact or response plan owner can share contacts and response plans with:
+ Specific AWS accounts inside or outside of its organization in AWS Organizations
+ An organizational unit inside its organization in AWS Organizations
+ Its entire organization in AWS Organizations

**Topics**
+ [Prerequisites for sharing contacts and response plans](#sharing-prereqs)
+ [Related services](#sharing-related)
+ [Sharing a contact or response plan](#sharing-share)
+ [Stop sharing a shared contact or response plan](#sharing-unshare)
+ [Identifying a shared contact or response plan](#sharing-identify)
+ [Shared contact and response plan permissions](#sharing-perms)
+ [Billing and metering](#sharing-billing)
+ [Instance limits](#sharing-limits)

## Prerequisites for sharing contacts and response plans<a name="sharing-prereqs"></a>

To share a contact or response plan with your organization or organizational unit in AWS Organizations:
+ You must own the resource in your AWS account\. You can't share a contact or response plan that has been shared with you\. 
+ You must enable sharing with AWS Organizations\. For more information, see [ Enable Sharing with AWS Organizations](https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html#getting-started-sharing-orgs) in the *AWS RAM User Guide*\.

## Related services<a name="sharing-related"></a>

Contact and response plan sharing integrates with AWS Resource Access Manager \(AWS RAM\)\. With AWS RAM, you can share your AWS resources with any AWS account or through AWS Organizations\. You share resources that you own by creating a *resource share*\. A resource share specifies the resources to share, and the consumers with whom to share them\. Consumers can be individual AWS accounts, organizational units, or an entire organization in AWS Organizations\.

For more information about AWS RAM, see the *[AWS RAM User Guide](https://docs.aws.amazon.com/ram/latest/userguide/)*\.

## Sharing a contact or response plan<a name="sharing-share"></a>

After you share a response plan, the consumers have access to all past, current, and future incidents created using that response plan\. 

After you share a contact, the consumers have access to the contact information, engagement plan, escalation plans, and engagements that occur during an incident\. Consumers can also engage a contact or escalation plan during an incident\.

If you're part of an organization in AWS Organizations and sharing within your organization is enabled, consumers in your organization are automatically granted access to the shared contact or response plan\. Otherwise, consumers receive an invitation to join the resource share and are granted access to the shared contact or response plan after accepting the invitation\.

You can share a contact or response plan that you own by using the AWS RAM console or the AWS CLI\.

**To share a contact or response plan that you own by using the AWS RAM console**  
See [Creating a Resource Share](https://docs.aws.amazon.com/ram/latest/userguide/working-with-sharing.html#working-with-sharing-create) in the *AWS RAM User Guide*\.

**To share a contact or response plan that you own by using the AWS CLI**  
Use the [create\-resource\-share](https://docs.aws.amazon.com/cli/latest/reference/ram/create-resource-share.html) command\.

## Stop sharing a shared contact or response plan<a name="sharing-unshare"></a>

When a resource owner stops sharing a contact or response plan with a consumer, the contacts, response plans, escalation plans, engagements, and incidents no longer appear in the consumer's console\. 

**Note**  
The consumer continues to see the contacts, response plans, escalation plans, engagements, or incidents without updates, if they're viewing them in the console, until they refresh the page or navigate away from the page\. 

To stop sharing a shared contact or response plan that you own, you must remove it from the resource share\. You can do this by using the AWS RAM console or the AWS CLI\.

**To stop sharing a shared contact or response plan that you own by using the AWS RAM console**  
See [Updating a Resource Share](https://docs.aws.amazon.com/ram/latest/userguide/working-with-sharing.html#working-with-sharing-update) in the *AWS RAM User Guide*\.

**To stop sharing a shared contact or response plan that you own by using the AWS CLI**  
Use the [disassociate\-resource\-share](https://docs.aws.amazon.com/cli/latest/reference/ram/disassociate-resource-share.html) command\.

## Identifying a shared contact or response plan<a name="sharing-identify"></a>

Owners and consumers can identify shared contacts and response plans by using the Incident Manager console and AWS CLI\.

To identify a shared contact or response plan by using the Incident Manager console

**Note**  
Contacts, response plans, escalation plans, engagements, and incidents are generally not identifiable as a shared resource in the Incident Manager console\. In places where the Amazon Resource Name \(ARN\) is visible, the ARN contains the owner's account ID\.

**To identify a shared contact or response plan by using the AWS CLI**  
Use the [ListResponsePlans](TBD) or [ListContacts](TBD) commands\. The command returns the contacts and response plans that you own and contacts and response plans that are shared with you\. The ARN shows the AWS account ID of the contact or response plan owner\.

## Shared contact and response plan permissions<a name="sharing-perms"></a>

### Permissions for owners<a name="perms-owner"></a>

Owners can update, view, share, stop sharing, and use contacts and response plans\. Contacts and response plans include related engagements and incidents\.

### Permissions for consumers<a name="perms-consumer"></a>

Consumers can use and view only response plans and contacts\. Contacts and response plans include related engagements and incidents\.

## Billing and metering<a name="sharing-billing"></a>

The owner of the resource is billed for the resource\. Consumers aren't billed for resources shared with them\. There aren't extra costs associated with sharing a resource\.

## Instance limits<a name="sharing-limits"></a>

Sharing a resource doesn't affect the limits of the resource in the owner's or consumer's account\. Only the owner's account is used to calculate the limits of the resource\.