# Lab 01 - Tenant setup

In this lab, you will go through the following tasks:

* [1.1 Create a new browser profile (Microsoft Edge)](#11-create-a-new-browser-profile-microsoft-edge)
* [1.2 Log on to your account and set up authentication in Microsoft Authenticator app](#12-log-on-to-your-account-and-set-up-authentication-in-microsoft-authenticator-app)
* [1.3 Create developer environment](#13-create-developer-environment)
* [1.4 Sign into Microsoft Copilot Studio and select developer environment](#14-sign-into-microsoft-copilot-studio-and-select-developer-environment)
* [1.5 Create new SharePoint site and upload file](#15-create-new-sharepoint-site-and-upload-file)

## 1.1: Create a new browser profile (Microsoft Edge)

It's always good to have a separate browser profile for your work and for workshops like this. This way you can keep all of your credentials separate and not have to worry about logging out of your personal / work accounts.

1. Open Microsoft Edge.

1. Select the **profile icon** on the top left corner and select **+ Set up new personal profile**

    ![Set up new peronsal profile](assets/1.0_01_NewEdgeProfile.jpg)

1. This will launch a new browser window on your taskbar with a new tab that displays "Welcome to Microsoft Edge." Select the **profile icon** on the top left corner again, and this time select the cog wheel icon to update the Edge profile settings.

    ![Update Edge profile](assets/1.0_02_UpdateEdgeProfile.jpg)

1. A new browser tab will load. In the **Profiles** settings, select **Edit**.

    ![Edit Edge profile](assets/1.0_03_EditEdgeProfile.jpg)  

1. Enter a name for your new Edge profile - _Example: Nestor Wilke - CS workshop_, and select **Update**.

    ![Name Edge profile](assets/1.0_04_NameEdgeProfile.jpg)

1. In the **Profiles** settings, select **Profile preferences**.

    ![Profile preferences](assets/1.0_04.1_Profile%20Preferences.jpg)

1. Disable the setting **Account based profile switching**.

    ![Disable account based profile switching setting](assets/1.0_04.1_DisableProfileSwitching.jpg)

1. The setting will now be disabled. Any apps you open from Microsoft 365 waffle menu will now load in the current Edge browser profile.

    ![Account based profile switching setting now disabled](assets/1.0_04.1_ProfileSwitchingDisabled.jpg)


1. Close the tab and in the Edge Welcome tab, select **Start without your data**.

    ![Start without your data](assets/1.0_05_EdgeProfileSetup.jpg)

1. Next, select **Confirm and start browsing**.

    ![Confirm and start browsing](assets/1.0_06_EdgeProfileSetup.jpg)

1.   Next, you can configure your new browser theme. Keep it as the system default and select **Finish**.

![Browser theme](assets/1.0_07_EdgeProfileSetup.jpg)

## 1.2 Log on to your account and set up authentication in Microsoft Authenticator app

With the credentials that were provided to you, log into the account you are going to use during the workshop.

1. Browse to [https://www.office.com](https://www.office.com) and select **Sign in**.

    ![Microsoft 365 Sign In](assets/1.0_08_SignIn.jpg)

1. On the sign-in screen, enter the email address that was provided to you and then click **Next**.

    ![Enter email address](assets/1.0_09_EnterCredentials.jpg)

1. Enter the password and click **Sign in**.

    ![Enter password](assets/1.0_10_EnterCredentials.jpg)

1. A dialog will appear and this is where you'll need to set up your account as an authenticated account in the Microsoft Authenticator app on your mobile device. This is required to authenticate yourself in order to sign-in. Select **Next**.

    ![Authentication dialog](assets/1.0_11_Authentication.jpg)

1. Install the Microsoft Authenticator app on your mobile if you don't already have through the **Apple App store** for iOS devices or **Google Play** store for Android you're prompted to stay signed in, click **Yes**.

    ![Authentication dialog](assets/1.0_12_Authentication.jpg)

1. Open the Microsoft Authenticator app on your **mobile phone**, select the **+ icon** and select **Work or school account**.

1. On your Edge browser, select Next.

    ![Authentication dialog](assets/1.0_13_Authentication.jpg)

1. Scan the **QR code** on your Edge browser using the **Microsoft Authenticator app** on your mobile phone. 

    ![Scan QR code](assets/1.0_14_Authentication.jpg)

1. A notification from the Microsoft Authenticator app will appear on you mobile phone, this is to approve the sign in request. Enter the number seen on your Edge browser.

    ![Approve sign in](assets/1.0_15_Authentication.jpg)

1. Once approved, a dialog will appear asking you to remain signed in. **Tick** the checkbox and select **Yes**.

    ![Stay signed in](assets/1.0_16_Authentication.jpg)

1. You'll now be logged onto Microsoft 365 with your user account.

    ![Signed in](assets/1.0_17_SignedIn.jpg)

## 1.3: Create developer environment

Developer environments are very helpful when you want to try out features, they are meant to be short living environments.

For this workshop, we are going to create one developer environment:

* ```[Username]'s  Developer Environment```: The environment where you'll build your custom copilot.

To create developer environments, you can create them in three ways:

* Via the [Power Apps Developer Plan Sign Up](https://www.microsoft.com/en-us/power-platform/products/power-apps/free) process
* Via the Power Platform Admin Center
* Via the Power Platform CLI

In this workshop, we will create the environments through the Power Platform Admin Center.

1. Browse to the [Power Platform Admin Center](https://aka.ms/ppac). If you see the _Welcome / Tour pop up_, exit by by clicking on the **X** in the top right corner of the pop up screen.

    ![Exit the Welcome / Tour pop up](assets/1.0_18_ExitWelcome.jpg)

1. Select **Environments** in the left hand side menu and select **+ New**.

    ![Create new Enivronment](assets/1.0_19_SelectNewEnvironment.jpg)

1. When the right-hand side dialog pops up - enter the following information:

    | Field | Value |
    | --- | --- |
    | Name | [Username]'s  DEV Environment - _Example: Nestor Wilke's DEV Environment_|
    | Region | United States - Default |
    | Type | Developer |
    | Purpose | Developer environment for Copilot Studio workshop |

    ![Create new Developer Environment](assets/1.0_20_NewEnvironment.jpg)

1. Scroll down and you'll see other options, leave them as-is, **do not upate**. Select **Next**.

    ![Next](assets/1.0_21_NewEnvironmentNext.jpg)
    
1. The environment is now provisioning in the background with a State of _Preparing_. Wait for 5-10 minutes.

    ![Provisioning new environment](assets/1.0_22_PreparingEnvironment.jpg)

1. Select **Refresh** to refresh the environment list.

    ![Refresh environment list](assets/1.0_23_RefreshEnvironment.jpg)

1. The new developer enivronment will be listed with a State of _Ready_.

    ![New developer enivornment ready](assets/1.0_24_NewEnvironmentReady.jpg)

## 1.4 Sign into Microsoft Copilot Studio and select developer environment

1.	Navigate to [https://copilotstudio.microsoft.com/](https://copilotstudio.microsoft.com/) using the username and credential provided.

1.	Switch to the developer environment you created earlier for your account by selecting the cog wheel on the top right.

    ![Select Developer environment](assets/1.0_25_SelectDEVEnvironment.jpg)

1. The developer environment will now be selected and this will be the environment you'll build your custom copilot in.

    ![Next](assets/1.0_26_DEVEnvironmentSelected.jpg)

## 1.5 Create new SharePoint site and upload file

1. Select the waffle icon on the top left hand side of Microsoft Copilot Studio to view the menu.

    ![Select Menu](assets/1.5_01_SelectMenu.jpg)

1. Select SharePoint from the menu.

    ![Select SharePoint](assets/1.5_02_SelectSharePoint.jpg)

1. 

Select SharePoint.

## Next lab

This is the end of lab 01, select the link below to move to the next lab.

[⏭️ Move to lab 02](../lab-02/README.md)