# Release Notes ![](images/favicon.png)

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