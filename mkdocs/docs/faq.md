# FAQ ![](images/favicon.png)

###Why should I use Binokula for report sharing?
Securely providing access to interactive reports to people outside your organization is a surprisingly difficult problem to solve. You can either try to develop your own reporting portal and worry about how long it will take to develop and how much it will cost. Or you can purchase a solution and encounter some of the following issues:

1. User licenses need to be paid, even if they don't access the reports.
+ It is not possible to implement the solution without turning it into a large IT project.
+ It is not possible to stop users from "finding" each other within the application.
+ Software developers are required every time you need any changes to reports or add new reports.
+ It is not possible to secure access to reports or data within reports.
+ It is not possible provide interactive reporting.

Binokula sets out to address these issues head on by wrapping an easy-to-use service around Microsoft's Power BI. We try to make secure report sharing as easy as possible.

###Can't I just use Power BI to share reports?
It depends, Power BI is a terrific product but isn't an ideal fit if you want to share reports externally. Most of our customers already used Power BI for their internal business analytics. They typically **encountered the following issues when they considered Power BI for external report sharing**:

* **Licensing** - If you decide to share reports from powerbi.com, each external user needs to be licensed with a Power BI Pro license and their account needs to be either an Azure Active Directory (AD) account or a Microsoft Account. Power BI Premium avoids the need to purchase Pro licenses but users are still required to have an Azure Active Directory account or Microsoft account.
* **Portal Integration** - If you already provide a portal for your users and you wish to integrate powerbi.com reports, you are left with 2 choices:
    1. Provide a link to a report URL and expect users to authenticate with their Azure AD or Microsoft account.
    + Commission your portal developers to use Power BI embedded and present reports from your portal.
* **Risk** - If you are getting multiple external users onto powerbi.com, you have to take in configuring access to reports, workspaces, apps and tenant settings to ensure users can't accidentally break something, users can't see each other's email address, users can't access data accidentally see data they shouldn't.

Binokula will like be a good fit for you if:

* **you don't want** your users to have Azure Active Directory or Microsoft accounts
* **you don't want** to purchase Power BI Pro licenses or Power BI Premium
* **you don't want** to start a software development project to integrate Power BI into your existing portal
* **you do** want to leverage existing Power BI skills within your organization
* **you do** want a managed cloud solution for report sharing
* **you do** want to simplify portal integration to a single API call
* **you do** want to minimize the risk of users seeing each other's email address or access data they couldn't

###How do I get reports into Binokula?
Binokula reports are build in Microsoft Power BI Desktop and published to a dedicated tenant for your organization. Publishing is explained in [Building and Publishing Reports section in the Admin Guide.](../admin-guide/#building-and-publishing-reports)

###How do I access my Binokula account?
Your Binokula account is managed by a Binokula provider. If you know that you should have a login to Binokula, then see the [Getting Started section in the User Guide.](../user-guide/#getting-started)

### What happens if I don't know how to use Power BI?
* **Report Viewers** - Report viewers in Binokula don't need to know Power BI at all. All you need to do is login to your account and view the reports assigned to you.

* **Report Builders** - If you are a Binokula provider then you will need to learn the basics of Power BI. There are numerous free resources on the internet to get started. Binokula requires Power BI reports to be built in a specific manner. This is explained in [Building and Publishing Reports section in the Admin Guide.](../admin-guide/#building-and-publishing-reports)
