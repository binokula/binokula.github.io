# FAQ ![Binokula](images/favicon.png)

## What is Binokula?

Binokula is an online service that enables organisations to share their interactive reports with users internal or external to their organisation.  A user only needs an internet connection and a browser to be able to access reports. The user does not need a software licence, or to install any additional software.

Also, the user does not need to be registered in the organisation’s Azure directory. An organisation uses Binokula’s security features to manage a user’s access to Binokula and their reports.

The Binokula service is a web application hosted in the Microsoft Azure cloud so any user on the world-wide internet can be provided access to an organisation’s reports.  

### Why should I use Binokula for report sharing?

Providing users outside your organisation with secure access to interactive reports can be challenging.  Depending on the approach, the following issues can be experienced:

1. Additional licenses to purchase for users; incurring the cost of the licenses and the on-going administration of those licenses.

2. Additional software for users to install.  This can be complex to support as external users can often have different desktop configurations and security requirements.

3. IT department overhead should users need to be invited as guest users into the organisations Azure directory.  

4. Developing your own solution means that you have all the issues, costs, and on-going maintenance associated with a software application’s development and deployment.  

Binokula addresses these issues head on by wrapping an easy-to-use service around Microsoft’s Power BI, making secure report sharing as easy as possible.

### Can’t I just use Power BI to share reports?

It depends, Power BI is a terrific product but may not be an ideal fit if you want to share reports externally. Most Binokula customers use Power BI for their internal business analytics, but when it came to sharing reports externally, they typically encountered the following issues:  

+ **Licensing** - If sharing reports directly from powerbi.com, each external user must be licensed with a Power BI Pro license and their account needs to be either an Azure Active Directory (AD) account or a Microsoft Account. Power BI Premium avoids the need to purchase Pro licenses, but users are still required to have an Azure Active Directory account or Microsoft account.

+ **Portal Integration** - If you already provide a web portal for your users and you wish to integrate powerbi.com reports, you are left with 2 choices:
    1. Provide a link to a report URL and expect users to authenticate with their Azure AD or Microsoft account.
    2. Commission your web portal developers to use Power BI Embedded and present reports from your portal.

+ **Risk** - If you are inviting external users into your powerbi.com, you will need to manage access to reports, workspaces, apps, and settings.  This is to ensure users can’t accidentally break something, can’t see each other’s email addresses, and can’t access data that they are not authorised to access.  

### How do I get my reports into Binokula?

Binokula customers build their interactive reports in Microsoft Power BI Desktop and publish them into a dedicated ‘Binokula’ workspace in their Power BI Service (powerbi.com) tenant.   Once a report is published into this ‘Binokula’ workspace, it is automatically detected by Binokula and the Binokula administrator can then grant users permission to access the report. Report publishing is explained in Building and Publishing Reports section in the Admin Guide.

### Do I need to know how to use Power BI?

Report Viewers – If you are viewing Power BI reports in Binokula, you do not need to know Power BI at all. All you need to do is login to your account and view the reports assigned to you.
Report Builders - If you are a Binokula administrator then you will need to learn the basics of Power BI. There are many free resources on the internet to get started.  
Binokula will support any Power BI report supported by Power BI Embedded.  If you are using some specialist features like row-level-security (RLS) then you will need to implement these in a specific manner. This is explained in Building and Publishing Reports section in the Admin Guide.

### How do I login to Binokula?

Your organisation’s Binokula account is managed by your organisation’s Binokula administrator. The administrator will send you an email to invite you to access Binokula. If you have been advised that you already have access to view reports in Binokula, then please see the [Getting Started section in the User Guide.](\user-guide\#getting-started)
