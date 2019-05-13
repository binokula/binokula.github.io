# Release Notes ![](images/favicon.png)

###May 13, 2019
####New
* Binokula now supports multiple Power BI workspaces. Reports in located within different workspaces will now appear on Binokula. Workspaces will have to have your respective tenants [admin account as a member](../admin-guide/#power-bi-workspaces) of the workspace.

###April 30, 2019
####New
* Admins can sort by columns in the User Management, Report Group, and User Group pages.
* Search functions are now available in the Report Group and User Group pages.
####Enhancements
* All Admin checkbox forms have been replaced by tables with clickable actions beside them. This increases app performance and speed. 

###April 10, 2019
####New
* Color theme to match our all new brochure site at [Binokula.com](https://binokula.com)
* Admins can now set their organization name through portal settings. Organization names will be used in automated emails sent out to users and other front facing features that labels your tenant.
####Enhancements
* Failed login attempts by a user is now limited to 5. After 5 failed attempts the user will be timed out for 30 minutes.

###April 3, 2019
####Enhancements
* Reports that exist in your tenant but do not exist in your Power BI Workspace will be indicated on Admin Report Management.
* [User Activity Binokula API Endpoint](../developer-guide/#user-activity-list) now returns Report GUIDS on report_view.

###March 8, 2019
####New
* [Embedding Binokula generated reports into your own website](../developer-guide/#embedding-binokula-generated-reports). Developers can now embed Binokula generated reports into their own websites using the Power BI JavaScript API. The new Binokula API endpoints can provide developers with Report ID, Embedded URL and Embed Token in order to use the Power BI JavaScript API.
* [User Activity Binokula API Endpoint](../developer-guide/#user-activity-list). Developers can retrieve Event Activity in our new Binokula API endpoint. This API can be filtered by user event and start/end time.
* [User Group Binokula API Endpoint](../developer-guide/#user-activity-list). Developers can retrieve User Group information in our new Binokula API endpoint. This API can be filtered by user and/or user group.

###February 19, 2019
####New
* [Users can now be assigned an alias](../admin-guide/#rls-aliasing). An alias is used for RLS filtering instead of the users default email.
* RLS Aliases for each [user can be enabled through User Management](../admin-guide/#enablingdisabling-one-users-rls-alias).
* RLS Alias can be assigned and enabled through our [SSO API](../developer-guide/#issuerenew-user-access-token).

###December 20, 2018
####New
* [User Groups](../admin-guide/#user-groups). This feature allows admins to create groups of users then assign them to multiple report groups. This makes managing multiple users on what reports they can access easier. Refer to the Admin Guide for more details.
* Timezone selection is now available for Admin Reporting purposes.
####Enhancements
* Reports that have their RLS configured incorrectly will display an error message on the report page when a user tries to access them.

###October 29, 2018
####New
* Admins are now able to view their tenants admin secret in Portal Settings.
* Admins can reset their Publisher account password under Portal Settings.
####Enhancements
* Improved security.

###October 2, 2018
####New
* Admins now have the option of setting a maximum number of days a user can be inactive before their account is disabled. Admins are able to re-enable disabled accounts if desired. Default number of days before a user is disabled is 30 days.
* We have now provided a demo page which contains demo users. This page allows anyone to try Binokula as sample users and see how each user views Binokula differently.
* Admins can now test user accounts through SSO links. This allows admins to check what a users account can see or do when they login to Binokula.
####Enhancements
* Admin icons now display correctly on certain iPads.

###September 11, 2018
####New
* Users can now be Enabled or Disabled in the User Management section. The next release will incorporate an auto-disable feature for inactive users for administrators that wish to use this feature.
* The API also allows for the enabling or disabling of users.
* Binokula Documentation is live and hosted on <https://binokula.github.io>. The release notes have also been moved to the documentation section.
####Enhancements
* SSO API has optional existingusersonly parameter added. This can be used to stop users from being auto-created.
* The noreply password reset email domain has been changed to binokula.com.

###August 13, 2018
####New
* Azure AD SSO Integration. If your company uses Azure AD, you should be able to authenticate automatically. We will continue to streamline this process as part of our next release
* Mobile Paging Support. This release enables controls on the mobile view to jump across report pages.
####Enhancements
* Azure REDIS Failover Upgrade. As part of the 30 minutes outage (our first in over 3 months) we experienced on Azure REDIS last week, we have added redundancy and failover for Azure REDIS.

###July 31, 2018
####New
* Binokula.app URL is live. Branding will begin to change to Binokula.app
* First version of Mobile support is live! Feel free to create a mobile view for the first page of your report. Navigation controls are coming soon.
* Home page supports tenant lookups. Enter your email address and you will be directed to your tenant automatically. Check it out by going to https://Binokula.app
####Enhancements
* Email with hyphens now supported as a valid email address.
* Improved back-end monitoring and error notifications for our sysadmins. If an error occurs we'll know about it.

###July 12, 2018
####New
* Release Notes published
####Bug Fixes
* Portal Auto Close Option fix for Edge V41

###July 4, 2018
####New
* Portal Settings added to allow redirect or tab close on logout.

###June 28, 2018
####New
* Admins can now request a password reset on behalf of a user.
####Enhancements
* Password reset workflow streamlined to complete the user's email and provide auto-logon.
* Auto-show report and set to default if user can only access one report
* Report Refresh button clears report cache and ensure all users see the latest list of reports available

###June 19, 2018
####New
* Admin report is now accessible on open4bi.com/admin
####Enhancements
* Report refresh button is now green and more obvious

###June 11, 2018
####New
* Breadcrumb added on top of the admin page
* List Report Groups a report belongs to on Report page
* Enable search for users in both Report Groups and User Management section
####Enhancements
* Add/Remove link now replaces checkbox for user on Report Groups

###June 5, 2018
####New
* Report Groups added, allowing admins to specify which users can see which reports

###May 23, 2018
####New
* Refresh report in app from Power BI
* Terms and Conditions and Privacy Statement added to logon page
####Enhancements
* Reset email now avoids most spam filters

###May 1, 2018
####New
* Open4BI Officially Live