# Lab 0 - Setup your environment

> NOTE:
>
> If you already have a Power Platform environment or an Azure account, you're more than welcome to use any of those for this workshop. However, be careful: when you are using an environment where you are not the admin, it could happen that you don't have enough rights to perform all actions. You could for instance run into a Data Loss Prevention (DLP) policy which could block the usage of the custom connector you are going to be building later in this workshop. If you're not an admin for your Azure account, you might be blocked from creating certain resources needed to complete this workshop as well.

## Background

This lab is all about setting up your environment. This is what you need to get started. Make sure to do this before starting the workshop.

## Instructions

### Create your own developer tenant

You can create your own developer tenant through the Microsoft 365 Developer Program. Go to the Microsoft 365 Developer Program website and make sure to register for a free 25-user tenant. When you are done creating the tenant, make sure to go to the next step.

1. Go to [developer.microsoft.com/microsoft-365/dev-program](https://developer.microsoft.com/microsoft-365/dev-program).

1. Click **Join Now**.

    ![Screenshot of Join Now Call to action on the Microsoft 365 Developer Program page](assets/join-m365-dev-program.jpg)

1. Sign into your Microsoft account or Create a Microsoft account.

    > **Note**: If you’re creating a new account, you’ll need to validate the account with a phone number.

1. Complete the **Join the Microsoft 365 Developer Program!** form.

1. On the **Set up your Microsoft 365 E5 sandbox** page, make sure that *Instant sandbox* is selected and then click **Next**.

    ![Screenshot of the Set up your Microsoft 365 E5 account page](assets/set-up-your-microsoft-365-e5-sandbox.png)

1. Finish setting up your *Instant sandbox* by choosing your country/region, admin username, and admin password.

    > **Note**: Make sure to note down / remember this admin password because this will be the password for your developer tenant.

1. Click **Continue**.

1. Provide a valid cell phone number and choose **Send code**. Enter the code that you receive, and then choose **Set up**.

    > **Note**: You must use a valid cell phone number and not Voice over IP (VoIP). You can only have one Microsoft 365 Developer Program account associated with your phone number.

    After the subscription is created, your subscription domain name and expiration date appear on your profile page.

1. Copy/Save the Administrator email address for signing into the Power Apps portal.

    ![Screenshot of the Microsoft 365 developer subscriptions page](assets/microsoft-365-developer-subscriptions.png)

### Add a Power Platform Developer account to the  Microsoft 365 Developer tenant you've just created

The Power Apps Developer Plan gives you a free development environment to build and test with Power Apps, Power Automate, and Microsoft Dataverse. In this workshop, the Power Apps Developer Plan enables you to also create a custom connector.

![Screenshot showing the Power Apps Developer plan features](assets/power-apps-dev-plan-custom-conn.png)

1. Go to [powerapps.microsoft.com/developerplan](https://powerapps.microsoft.com/developerplan).

1. Click **Get started free**.

1. For **Step 1**, enter your **M365 Dev Program** email address (the **Administrator email** address).

    ![Microsoft Power Apps for Developer Step One](assets/sign-up-for-power-apps.jpg)

1. You should receive the following message:

    ![Microsoft Power Apps for Developer Step One](assets/sign-up-message.jpg)

1. Click **Sign in** and sign-in using your M365 Dev Program credentials (the **Administrator** email address and password).

1. After you sign in and complete the process, click **Get Started**.

    ![Microsoft Power Apps for Developer Step One](assets/power-apps-get-started.jpg)

1. After your licenses have been configured, you should automatically be redirected to [make.powerapps.com](https://make.powerapps.com/) - which is the Power Apps Portal.

    ![Power Apps Maker Portal](assets/power-apps-portal.png)

### Create an Azure account

You can create an Azure account for free and receive 12 months of popular services for free and a $200 credit to explore Azure for 30 days.

1. Go to [azure.microsoft.com/free](https://azure.microsoft.com/free/) and click **Start Free**.

    ![Start free with Azure](assets/azure-start-free.png)

1. Sign into your Microsoft account. The same admin account you used to create your Power Apps Developer Plan.

1. Fill in profile details to complete the sign up process.

1. Once your information has been confirmed, you'll be ready to start with Azure.

    ![Screenshot showing a link to the Azure Portal](assets/ready-with-azure.png)

### Download Visual Studio

You can download Visual Studio Community Edition for free. Visual Studio is the IDE that you will be using in this workshop to create the API.

1. Go to [https://visualstudio.microsoft.com/vs/features/net-development/](https://visualstudio.microsoft.com/vs/features/net-development/) and hover over the **Download** button.

1. Click **Community 2022** and an installer will be downloaded.

    ![Screenshot of the Visual Studio download page](assets/visual-studio-download.png)

    This installer comes pre-packaged with all the components you need for .NET development.

1. Once the installer has been downloaded, run it and follow the instructions to install Visual Studio.

Now with everything set up and ready to go, you can start with the workshop.

### ➡️ [Lab 1 - Laying the Foundation: Azure OpenAI Service and Power Platform](/Workshops/PodcastCopilotPowerApp/Lab1/README.md)
