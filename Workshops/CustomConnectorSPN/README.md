# Lab: Use service principal auth for custom connectors

> [!IMPORTANT]
> For this lab, you have to be able to create an app registration. In most organizations, this is not possible for end users. Make sure to have a dev environment and your own Microsoft 365 Developer Tenant, because it's highly likely you will not be able to finish this lab otherwise. If you don't know how to do this, watch [this video](https://www.youtube.com/watch?v=KYym2M9YocQ) by April Dunnam

In this lab, you will learn how to use service principal auth for custom connectors. The Microsoft Graph API and in particularly the Invitation Manager is used for this lab. During this lab you will learn how to create a connector that contains only one action. This lab is focused on creating service principal support for custom connectors, so it's not about having a big connector with lots of actions.

## Tasks in this lab

- Learn about the API
- Create the connector
- Create the app registration
- Finish the connector
- Test the connector
- Test the connector in one of the products
- Download the connector to your own machine

## Learn about the API

> [!IMPORTANT]
> Learning about the API is one of the most important steps when you are building a connector. Knowing what the API does will benefit you in the rest of the process of building a connector massively.

When building a connector, the first thing that you need to do is read the docs. In this case, we are going to build a connector for the [Microsoft Graph API](https://aka.ms/graph). To be more specific, we are going to build a connector for the Invitation Manager. The Invitation Manager is an operation in the Microsoft Graph API that helps organizations manage their guest users. In the Microsoft ecosystem, it is possible to invite guest users to your organization and share certain assets with them. This could be a SharePoint site, OneDrive for Business documents or folders, but we can also share Power Apps or even give them the ability to make within the Power Platform.

To learn more about the Invitation Manager, go to the [API reference](https://aka.ms/invitationmanager) on the Microsoft Graph learn website. On this page, you can read more about what the operation does, what the methods, properties and relationships are. In most cases, there also is a JSON representation of the resource (like in this case, the invitation resource).

## Create the connector

In this lab, we will start creating a connector from blank. This is something you can do in the maker portal.

1. Go to the Power Automate maker portal via [https:/make.powerautomate.com](https:/make.powerautomate.com)

    ![The Power Automate Maker Portal](./assets/make-powerautomate-home.png)

1. Select **More** in the left navigation
1. Select **Discover all** in the pop out

    ![The Power Automate Maker Portal with the `More` pop out open](./assets/make-powerautomate-discover-all-items.png)

1. Scroll down the page, and in the **Data** section, make sure to click the **pin** next to **Custom connectors**. This will pin the **Custom connectors** section to the left navigation and this will be useful in this lab

    ![Pin the ](./assets/make-powerautomate-pin-custom-connectors.png)

1. Select **Custom connectors** in the left navigation
1. In the custom connectors section, select **New custom connector** in the top-right and select **Create from blank**
1. Enter **Invitation Manager** as the name and select the blue **Continue** button
1. This will open the custom connector UI. Here we will do most of our work. Add the following description:

    ```text
    Use this connector to invite guests to your organization. When the invited guest accepts the invitation, they will get added as a guest/member to the organization.
    ```

1. Next, make sure to add `graph.microsoft.com` as the host
1. Add `/v1.0/` as the Base URL
1. Select **Security** at the bottom to move to the security section

    ![General tab in the custom connectors UI](./assets/custom-connector-move-to-security.png)

1. Change the authentication type from **No authentication** to **OAuth 2.0**
1. Change the identity provider from **Generic Oauth 2** to **Azure Active Directory**

> [!NOTE]
> Now you will see a bunch of fields appear, like *Enable Service Principal Support*, *Client ID*, *Client Secret* etc.
>
> To fill in these fields, we need to have an app registration. This app registration needs to be created in Entra ID. Let's do that first, because we need that before we can continue.

## Create an app registration

> [!IMPORTANT]
> For this section, you have to be able to create an app registration. In most organizations, this is not possible for end users. Make sure to have a dev environment and your own Microsoft 365 Developer Tenant, because it's highly likely you will not be able to finish this lab otherwise. If you don't know how to do this, watch [this video](https://www.youtube.com/watch?v=KYym2M9YocQ) by April Dunnam

Creating an app registration is fairly simple if you know how it works. This part of the lab is going to guide you through the whole process.

1. Go to the Azure Portal by adding a new tab in your browser. Enter [https://portal.azure.com](https://portal.azure.com) to go to the Azure Portal
1. If you're not logged in yet, make sure to log in with your developer account
1. Go to **Microsoft Entra ID** (This was previously named Azure Active Directory) by either searching for it or selecting it through the services part on the portal home page
1. Select **App registrations** in the left navigation
1. You might already see a couple of applications here. Select the **New registration** button at the top

    ![New Entra ID app registration](./assets/entra-id-new-registration.png)

1. Enter `Invitation Manager - Custom Connector` as the name of the application
1. Select the blue **Register** button at the bottom
1. Next, you will see the overview page of your app registration, here you can find a bunch of helpful resources, like the *Application (client) ID*, the *Directory (tenant) ID* and more.
1. Open notepad (or another tool with the same functionality and copy the **Application (client) ID** and the **Directory (tenant) ID** to that and make sure to save it to a local file, so that you can find it back later
1. Go back to the overview page of your app registration and select the **Add a Redirect URI** on that page
1. Select the **Add a platform** link at the top
1. In the side panel, select **Web**
1. Copy and paste the following URI into the Redirect URIs input box:

    ```Text
    https://global.consent.azure-apim.net/redirect
    ```

1. Select the blue **Configure** button at the bottom of the side panel
1. Select **API permissions** in the left navigation
1. We need API permissions for our app registrations, but how do we know which API permissions are needed for the Invitation Manager operation? Open the [Microsoft Graph API Docs](https://aka.ms/invitationmanager) in a new browser tab
1. In the *permissions* part of that page, we can see that in the *Least privileged permissions* column for both the *delegated* and the *application* permission types, `User.Invite.All` is needed. Close the tab after checking the permissions

    ![Graph API Invitation Manager Permissions](./assets/graph-api-permissions.png)

1. Let's add them in the API permissions section in the app registration. Select the **Add a permission** button in the API permissions section

    ![Add a permission](./assets/app-registration-add-permission.png)

1. In the side panel, select Microsoft Graph
1. Select Delegated permissions
1. In the search box, type `User.Invite`, (1) expand the `User` part, (2) select the checkbox in front of `User.Invite.All` and (3) select the blue **Add permissions** button

    ![Add delegated permission User.Invite.All to be able to invite guest users to the organization](./assets/app-registration-add-delegated-permission.png)

1. After adding the permission, you will see that the delegated permission `User.Invite.All` is added to the `Configured permissions` section, but it's not yet granted. This means we will have to grant admin consent, but we will not do this yet, since we also have to add the application permission for the same permission
1. Select the **Add a permission** button again
1. In the side panel, select Microsoft Graph
1. Select Application permissions
1. In the search box, type `User.Invite`, (1) expand the `User` part, (2) select the checkbox in front of `User.Invite.All` and (3) select the blue **Add permissions** button

    ![Add application permission User.Invite.All to be able to invite guest users to the organization](./assets/app-registration-add-application-permission.png)

1. Take a look at the status of the permissions, it should show that the permissions we just added are not granted yet

    ![Grant admin consent for permissions](./assets/app-registration-grant-consent.png)

1. Select the **Grant admin consent** button
1. In the confirmation pop up, select the blue **Yes** button
1. Now, the status should be changed to `Granted`

    ![Permission status changed to granted](./assets/app-registration-granted-consent.png)

1. Select **Certificates & secrets** in the left navigation
1. In the `Clients secrets` tab, create a new client secret by selecting the **New client secret** button

    ![New client secret](./assets/app-registration-create-client-secret.png)

1. Enter `LabSecret` as the **Description**
1. Leave **Expires** on the recommended (default) value
1. Select the blue **Add** button at the bottom
1. Copy the value of the client secret we just created and save it in a safe place

    ![Copy the value of the client secret](./assets/app-registration-copy-client-secret.png)

## Finish the connector

### Security section

Now we have finished setting up the app registration, we can set our focus on the custom connector again! Let's go back to the browser tab where we left of and continue setting up the custom connector!

1. Select the checkbox in front of **Enable Service Principal support**
1. In the **Client ID** text box, paste the client ID we copied to notepad
1. In the **Client Secret** text box, paste the client secret we saved in a safe place at the end of our last task
1. In the **Resource URL** text box, enter the following URL:

    ```https://graph.microsoft.com```

1. In the **Scope** text box, enter the following permission:

    ```User.Invite.All```

> [!NOTE]
> The above details (app ID, app secret, etc) are for OAuth auth, not for the application (SPN) permissions. The SPN details will live in the connection.

Move to the next section (Definition), by selecting **Definition** at the bottom right.

![Move to definition tab](./assets/custom-connector-move-to-definition.png)

### Definition section

In the definition section, you have to add the actions and triggers you want in your connector. In this case, we only want to add the **Create an invitation** action.

1. Select the **New action** button in the `Actions` section on the left
1. In the **Summary** text box, enter `Create an invitation`
1. In the **Description** text box, enter `Use this action to create a new invitation. An invitation adds an external user to the organization.`
1. In the **Operation ID** text box, enter `CreateInvitation`
1. In the `Request` section, select the **Import from sample** button

    > [!NOTE]
    > This will open a side panel where you can import a sample request

1. In the **Verb** part of the side panel, select **Post**
1. For URL, enter the following URL:

      ```/invitations```

1. In the **Headers** text box, enter the following header:

    ```Content-Type application/json```

1. For the **Body**, copy the following request body and paste it in the text box. This is a sample JSON body, I got from the learn page for the create an invitation operation in the Microsoft Graph API

    ```json
    {
      "invitedUserDisplayName": "string",
      "invitedUserEmailAddress": "string",
      "invitedUserMessageInfo": {
        "ccRecipients": [
          {
            "emailAddress": {
              "address": "string",
              "name": "string"
            }
          }
        ],
        "customizedMessageBody": "string",
        "messageLanguage": "string"
      },
      "sendInvitationMessage": true,
      "inviteRedirectUrl": "string",
      "inviteRedeemUrl": "string",
      "resetRedemption": false,
      "invitedUserType": "string"
    }
    ```

1. Select the **Import** button. This will import the sample request and import this into our connector

    > [!IMPORTANT]
    >
    > The request section should look like this now:

    ![Import request](./assets/custom-connector-import-request.png)

1. Next, we are going to make sure that the response that comes back from the API, also gets parsed when using the Power Platform. To ensure this works, we need to define a response. Scroll down to the **Response** section and select the button that says **default** and has a gray background

    ![default response in response section](./assets/custom-connector-response.png)

1. In the next screen, replace `default` in the **Name** text box with `201`. This is because we are expecting to get a 201 HTTP Code back after the request
1. Select the blue **Import from sample** button at the top
1. For the **Headers** text box, enter the following header:

    ```Content-Type application/json```

1. For the **Body**, copy the following request body and paste it in the text box. This is a sample JSON body, I got from the learn page for the create an invitation operation in the Microsoft Graph API

    ```json
    {
      "id": "7b92124c-9fa9-406f-8b8e-225df8376ba9",
      "inviteRedeemUrl": "https://invitations.microsoft.com/redeem/?tenant=04dcc6ab-388a-4559-b527-fbec656300ea&user=7b92124c-9fa9-406f-8b8e-225df8376ba9&ticket=VV9dmiExBsfRIVNFjb9ITj9VXAd07Ypv4gTg%2f8PiuJs%3d&lc=1033&ver=2.0",
      "invitedUserDisplayName": "Fabrikam Admin",
      "invitedUserEmailAddress": "admin@fabrikam.com",
      "resetRedemption": false,
      "sendInvitationMessage": false,
      "invitedUserMessageInfo": {
          "messageLanguage": "",
          "ccRecipients": [
          {
              "emailAddress": {
              "name": "",
              "address": ""
              }
          }
          ],
          "customizedMessageBody": ""
      },
      "inviteRedirectUrl": "https://myapp.contoso.com",
      "status": "Completed",
      "invitedUser": {
          "id": "243b1de4-ad9f-421c-a933-d55305fb165d"
      }
    }
    ```

1. Select the **Import** button. This will import the sample response and import this into our connector

    > [!IMPORTANT]
    >
    > The request section should look like this now:

    ![Import request](./assets/custom-connector-201-response-finished.png)

    Now, we only have to go back by selecting the back button in the screenshot below:

    ![Import request](./assets/custom-connector-201-response-back.png)

1. Select the **Create connector** button at the top

This will take a little while, but it will save the connector to the Power Platform.

> [!NOTE]
> There is also a **Code** section in the custom connector UI, but in this lab, we won't go into detail about that. If you want to, you can learn more about it [here](https://aka.ms/cc/code).

## Test the connector

Now we are at the moment we want to test if everything is alright with our connector. In this lab, we will test in multiple ways:

- We will test inside of the custom connector UI (which is a technical test to see if we don't get any errors)
- We wil test inside of Power Automate, to see if the user experience is good or not. We don't want to build connectors that are not very maker friendly

Let's start with the test inside of the custom connector UI.

1. Select **5. Test** at the top of the connector UI

    ![Move to the test section](./assets/custom-connector-move-to-test.png)

1. In the following page, scroll down to see the operations you can test. In this case, you will see a gray **Test operation** button. This is because we haven't created a connection yet for the connector
1. Scroll up a bit, and select the **New connection** button in the `Connections` part

    ![New connection](./assets/custom-connector-new-connection.png)

    This will redirect you to a new connection experience, where you can configure your connection.

1. We have created a connector that works with both delegated and application permissions, so we have to select the connection type of our choice in the first dropdown. In this case, let's select **Service Principal Connection**

    > [!NOTE]
    > In this case, we chose Service Principal Connection, but we could've also chosen `OAuth Connection`.

1. In the **Client ID** text box, paste the `Client ID` we copied to notepad
1. In the **Client Secret** text box, paste the `Client Secret` we saved in a safe place at the end of our last task
1. In the **Tenant** text box, paste the `Directory (tenant) ID` we copied to notepad
1. Select the blue **Create connection** button
1. In the left navigation, select **Custom connectors**
1. Look for the **Invitation Manager** custom connector and select the **pencil icon** next to it, to open it into edit mode
1. Select **5. Test** at the top

    Now we can see that the **Test operation** button is blue instead of gray.

1. In the **Content-Type** text box, enter `application/json`
1. In the **invitedUserDisplayName** text box, enter your name
1. In the **invitedUserEmailAddress** text box, enter your work email address
1. In the **sendInvitationMessage** text box, enter `true`
1. In the **inviteRedirectUrl** text box, enter `https://office.com`
1. Select the blue **Test operation** button to test out the invitation

    ![Operation test successful](./assets/custom-connector-test-operation-successful.png)

1. Now, you will receive an email in your mailbox where you can accept the invitation:

    ![Invitation Email received](./assets/custom-connector-test-invitation-received.png)

    It also shows that after the acceptance of the invitation, you will be sent to `https://office.com`. This is a very simple scenario, but ideally you would give the guest access to resources inside your organization, like a Power App, or a SharePoint site. But we will skip that for this lab.

### Remove the invited user from Entra ID

1. Go to [https://portal.azure.com](https://portal.azure.com)
1. Go to **Microsoft Entra ID** (This was previously named Azure Active Directory) by either searching for it or selecting it through the services part on the portal home page
1. Select **Users** in the left navigation
1. Select the invited user by **selecting the checkbox in front of the guest user** that you invited in the earlier section
1. Delete the user by selecting the **delete button** at the top

    ![Remove invited user](./assets/entra-id-remove-invited-user.png)

1. Select the blue **OK** button as the confirmation

## Test the connector in one of the products

Of course, we also want to see how our connector works in Power Automate. So let's do that!

1. Go to [https://make.powerautomate.com](https://make.powerautomate.com)
1. Select **Create** in the left navigation
1. Select **Instant cloud flow**
1. Enter **Invitation Manager** as the name of the flow
1. Select the **Manually trigger a flow** trigger
1. Select the blue **Create** button

    ![Create test cloud flow](./assets/test-cloud-flow-create-flow.png)

1. Select the **New step** button
1. Select the **Custom** tab to see all custom connectors
1. Select the **Invitation Manager** connector
1. Select the **Create an invitation** action

Now we can see a couple of issues:

- A field like content-type is very technical for makers, it might be good to hide this field for makers and set the default to `application/json`
- The names of the inputs aren't very useful to the makers (invitedUserDisplayName, invitedUserEmailAddress, etc aren't the most useful names to makers)

Let's fix these issues.

## Improve the connector for makers

1. Select the **save button** at the top of the cloud flow
1. Select the **back button** at the top left

    ![Go back to the cloud flow overview page](./assets/test-cloud-flow-back.png)

1. In the left navigation, select **Custom connectors**
1. Look for the **Invitation Manager** custom connector and select the **pencil icon** next to it, to open it into edit mode
1. Select **3. Definition** at the top
1. In the **Request** section, select **Content-Type** under `Headers` and select **Edit**

    ![Edit content-type field](./assets/improve-connector-edit-content-type.png)

1. Change the **Default value** to `application/json`
1. Set the **Is required** value to `Yes`
1. Set the **Visibility** to `Internal`
1. When done, select the **Back button** at the top of the parameter settings
1. In the **Request** section, select **body** under `body` and select **Edit**

    In the following screen, you can see a lot of the request fields we just saw in the cloud flow. You can change these fields one by one.

    ![Overview of the body payload](./assets/improve-connector-edit-body.png)

1. In the **Body** section, select **inviteRedeemUrl** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Invite Redeem URL details](./assets/edit-property-invite-redeem-url.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **inviteRedirectUrl** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Invite Redirect URL details](./assets/edit-property-invite-redirect-url.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **invitedUserDisplayName** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Invited User Display Name details](./assets/edit-property-invite-display-name.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **invitedUserEmailAddress** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Invited User Email Address details](./assets/edit-property-invite-email-address.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body.
1. In the **Body** section, select **address** and select **Edit**
1. Make sure to change the properties to match the following:

    ![CC Email Address details](./assets/edit-property-cc-address.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **name** and select **Edit**
1. Make sure to change the properties to match the following:

    ![CC Display Name details](./assets/edit-property-cc-name.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **customizedMessageBody** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Customized Message Body details](./assets/edit-property-customized-message-body.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **messageLanguage** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Message Language details](./assets/edit-property-message-language.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **invitedUserType** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Invited User Type details](./assets/edit-property-invited-user-type.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **resetRedemption** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Reset Redemption details](./assets/edit-property-reset-redemption.png)

    Description:

    ```text
    Reset the user's redemption status and reinvite a user while retaining their user identifier, group memberships, and app assignments.
    ```

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. In the **Body** section, select **sendInvitationMessage** and select **Edit**
1. Make sure to change the properties to match the following:

    ![Send Invitation Message details](./assets/edit-property-send-invitation-message.png)

1. Select the **Back button** on the top of the Schema Property box to move back to the body
1. Select the **Back button** on the top of the Parameter box to move back to the definition
1. Select the **Update connector** button on the top of the screen

## Test the connector again in one of the products

Let's try out the connector again now!

1. Go to [https://make.powerautomate.com](https://make.powerautomate.com)
1. Select **My flows** in the left navigation
1. Select the **Invitation Manager** cloud flow by selecting the display name
1. Select the **Edit with new designer** button on the top
1. Select the **Create an invitation** card in the cloud flow
1. At the left side, you will see a panel where you can see the **Invited User Email Address** and the **Invite Redirect URL**, which are the two properties that we marked as important

    ![Edit cloud flow in new designer](./assets/edit-new-designer.png)

You will be able to select **Show all** under the `Advanced parameters` if you want to see all parameters. This way you can check if the connector updated correctly.

## End of the lab

This is the end of the lab. We hope you enjoyed it! Take a look at the rest of [this GitHub Repository](https://aka.ms/pp/advocates) to check out other workshops as well.
