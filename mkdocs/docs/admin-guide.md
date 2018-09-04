# Admin Guide

###Getting a Binokula Tenant
A Binokula Tenant is your dedicated area for publishing, hosting and managing access to your report content. Only organizations who wish to share and control access to report need a tenant. If you are expecting to just access reports in Binokula, you will need to be added as a user on a tenant.

If you are an orgnization who wishes to get a trial tenant, please contact <sales@binokula.com>.

If you are expecting to already have access to reports in Binokula, you can enter your email address at <https://binokula.app> or contact the orgnization whose report content you wish to access.

###Building and Publishing Reports
####Building a Report without RLS
Binokula uses Microsoft Power BI as its report building tool. For a report to be correctly published in Binokula, the report has to adhere to the following pre-prequisites:

* Must have a security role called "User_Security" needs to be added.
* Should have a DAX filter on the Entity to User Mapping List which uses the USERNAME() function. (Only required for Row-Level-Security)

####Building a Report with RLS
Building a report with RLS requires the report to adhere to the following pre-requisites:

* Must have a security role called "User_Security" needs to be added.
* Must have a DAX filter on the Entity to User Mapping List which uses the USERNAME() function. (Only required for Row-Level-Security)
* Cross filter direction should be set to Both for the relationship with Entity to User Mapping List
* Apply security filter in both directions should be ticked for the relationship with Entity to User Mapping List

####Publishing Power BI Reports
Once you have have built and tested your Power BI report, the next step is to publish the report to your dedicated tenant. This is done with the unique publisher account, whose details you would have received as part of requesting your Binokula tenant. You can sign-in with the publisher account by clicking on "Sign in" in Power BI Desktop. If you are already signed in with a different account, click on the account name and select "Switch account". Once you are signed in, you can publish the report by:

1. Saving any changes;
+ Clicking on the "Publish" button on the Home menu; and 
+ Choosing "binokula" as the destination before clicking "Select"

####Report for Mobile Viewing
Power BI Mobile support are supported by Binokula. All you need to do is create the mobile view of a report in the Power BI Desktop file and publish it to your tenant. Please see [Microsoft's Power BI Phone Report documentation](https://docs.microsoft.com/en-us/power-bi/desktop-create-phone-report) for more information on configuring phone layout on Power BI Desktop.

###Viewing report in Binokula
Any new report published are by default not accessible to any users. Access to reports are controlled through report groups. To give yourself access to view a report, you will need to be an administrator and complete the following in Binokula:

1. Import the report definition into Binokula by clicking on the refresh button in the reports administration page;
+ Creating a new Report Group in the report group administration page;
+ Adding the new report to the Report Group;
+ Adding yourself as a user in the report group; and
+ Selecting the report ing the Reports user page.

####Assigning more users and reports
The process is exactly the same as the previous step, all you have to do is add more users. If will be too time-consuming to add users by one-by-one, you can create a script to call Binokula REST API to add users in bulk. Please see the developer guide for details on the REST API. If you need to expose more than one report to a specific audience, multiple reports can also be added to a report group through the Report Group administration page.


###Automating and scheduling the refresh of report data
Refreshing data for Binokula reports is the same as any other Power BI report*. Any on-premise data used in the report needs to be supported by the Power BI On-Premise Data Gateway. The on-premise data gateway needs to be installed and configured with credentials of your unique publisher account. Cloud data sources also needs to be supported by the Power BI service. Additional information on Power BI's data refresh capabilities can be found here:

* [Data refresh in Power BI](https://docs.microsoft.com/en-us/power-bi/refresh-data)
* [Refresh Data Sources from Power BI Desktop](https://docs.microsoft.com/en-us/power-bi/refresh-data#power-bi-desktop-file)

*The Power BI Data Model still needs to have the "User_Security" role created in Power BI Desktop.

Once you have a on-premise data gateway configured, you can access [powerbi.com](https://powerbi.com) with your assigned publisher account and [configure the schedule refresh as per the Power BI Documentation](https://docs.microsoft.com/en-us/power-bi/refresh-scheduled-refresh).