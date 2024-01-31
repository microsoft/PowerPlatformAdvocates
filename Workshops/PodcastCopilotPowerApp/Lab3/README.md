# Lab 3 - The Final Touch: Power Apps and Microsoft Copilot Studio Integration

## Background

The final lab brings it all together. We will build the Power App UI, connect to the Custom Connector, and publish the social media post to LinkedIn. As a bonus, we will also see how to implement this workflow with a Power Virtual Agents chatbot.

## Definitions

### What is Power Apps?

Power Apps is a suite of apps, services, and connectors, as well as a data platform, that provides a rapid development environment to build custom apps for your business needs. Using Power Apps, you can quickly build custom business apps that connect to your data stored either in the underlying data platform (Microsoft Dataverse) or in various online and on-premises data sources (such as SharePoint, Microsoft 365, Dynamics 365, SQL Server, and so on).

Learn More: [What is Power Apps? [Microsoft Learn]](https://learn.microsoft.com/en-us/power-apps/powerapps-overview)

### What is Power Fx?

Power Fx is the low-code language that will be used across Microsoft Power Platform. It's a general-purpose, strong-typed, declarative, and functional programming language.

Learn More: [Microsoft Power Fx overview [Microsoft Learn]](https://learn.microsoft.com/en-us/power-platform/power-fx/overview)

## Prerequisites

For this lab, just make sure you've completed the previous three labs.

### Video Overview of Lab:

![Laying the Foundation: Azure OpenAI Service and Power Platform Video Thumbnail](assets/lets-learn-power-3.png)

Date of Livestream: {TBD}

## Instructions

### Creating the Power App

1. Log into [Power Apps](https://make.powerapps.com/) and sign in with your Power Apps Developer account.

1. Click **+ Create** on the left-hand navigation pane and select **Blank app**.

1. Under **Blank canvas app**, select **Create**.

    ![Create a new Power App](assets/create-power-app.png)

1. Name the app ``Podcast Copilot``, select the **Tablet** format, and click **Create**.

    ![Naming the Power App](assets/name-power-app.png)

1. Once the app has been created, on the left navigation pane, select **Data** and click **+ Add data**.

    ![Adding data to the Power App](assets/add-data.png)

1. Search for ``PodcastCopilot_Connector`` and select the connector.

1. Then click **Connect**.

    ![Connecting the Custom Connector to the Power App](assets/connect-custom-connector.png)

1. Once the connector has been added to the app, add the following controls to the screen:

    - 1 x **Text Input** control
    - 1 x **Button** control
    - 2 x **Label** control
    - 1 x **Image** control

    Arrange the controls as shown below:

    ![Adding controls to the Power App](assets/add-controls.png)

    The first **Label** control will be used for the app title. The **Text Input** control will be used to enter the link to the Podcast URL. The **Button** control with the text ``Generate Post`` will fire up the Custom Connector to generate the social media post and image. The second **Label** control will display the generated post. The **Image** control will display the generated image.

1. Name the controls as follows:

    - **Label**: ``lblTitle``
    - **Text Input**: ``txtPodcastURL``
    - **Button**: ``btnGeneratePost``
    - **Image**: ``imgSocialImage``
    - **Label**: ``lblSocialPost``

1. Now select the **Button** control and add the following formula to the **OnSelect** property:

    ```
    //Get Transcription
    Set(
        transcription,
        PodcastCopilot_Connector.GetTranscription(txtPodcastURL.Text).text
    );
    //Get Guest Name
    Set(
        guestName,
        First(PodcastCopilot_Connector.GetGuestName(transcription).choices).message.content
    );
    //Get Guest Bio
    Set(
        guestBio,
        PodcastCopilot_Connector.GetGuestBio(guestName).bio
    );
    //Get Social Media Blurb
    Set(
        socialMediaBlurb,
        First(
            PodcastCopilot_Connector.GetSocialMediaBlurb(
                transcription,
                guestBio
            ).choices
        ).message.content
    );
    //Get DallE Prompt
    Set(
        dallePrompt,
        First(PodcastCopilot_Connector.GetDallEPrompt(socialMediaBlurb).choices).message.content
    );
    //Get Image
    Set(
        socialImage,
        PodcastCopilot_Connector.GetImage(dallePrompt).url
    )
    ```

    This formula will call every action in the Custom Connector that represents the steps for the Podcast Copilot. The resulting social media blurb will be stored in a variable called ``socialMediaBlurb``. The resulting image will be stored in a variable called ``socialImage``.

1. Now select the **lblSocialPost** control and add the following formula to the **Text** property:

    ```
    socialMediaBlurb
    ```

    This will display the social media blurb in the label.

1. Finally select the **imgSocialImage** control and add the following formula to the **Image** property:

    ```
    socialImage
    ```

    This will display the image in the image control.

1. Use the **Preview** button to test the app. Enter the link to the podcast episode in the **Text Input** control and click the **Generate Post** button. The social media blurb and image should be displayed.

Because the main functionality of the app is encapsulated in the Custom Connector, you can easily reuse this connector in other Power Apps or other parts of the Power Platform including Microsoft Copilot Studio.

### Using the connector in Microsoft Copilot Studio

1. Log into [Microsoft Copilot Studio](https://copilotstudio.microsoft.com/) and sign in with your Microsoft account. The same account you've been using for this workshop.

1. On the home page, click **+ Create a copilot**.

    ![Creating a copilot in Microsoft Copilot Studio](assets/create-copilot.png)

1. Name the copilot ``Podcast Copilot`` and click **Create**.

1. Once the copilot has been created, click **Topics & Plugins** on the left-hand navigation pane.

1. On the top navigation pane, click **+ Add** > **Topic** > **From Blank**.

    ![Adding a topic to the copilot](assets/add-topic.png)

1. In the upper-left side of the authoring canvas, rename the topic to **Generate Social Media Post**.

    ![Renaming the topic](assets/rename-topic.png)

1. On the **Trigger** node, click **Edit** and add the following phrases:

    - ``generate a social media post``
    - ``generate post``
    - ``generate a post``
    - ``create a social media post``
    - ``create post``
    - ``create a post``

1. Add a new node by clicking on the **+** icon below the **Trigger** node.

    ![Adding a new node](assets/add-node.png)

1. Select **Send a message** and enter the following message:

    ```
    Sure thing! I can do that for you.
    ```

1. Then add another node and select **Ask a question** and enter the following question:

    ```
    What is the link to the podcast episode?
    ```

1. Beneath **Identify**, select the **User's entire response** option and then **Save response as** ``podcastURL``.

    ![Adding a question to the topic](assets/add-question.png)

1. Now add another node and select **Call an action** and then click on **Create a flow**. This will open Power Automate in a new tab.

1. Click on **When Power Virtual Agents calls a flow** and then under **Parameters** - select **+ Add an input**.

1. Select **Text** and enter ``podcastURL`` in both fields. Then close the pane.

    ![Adding an input parameter to the Power Automate flow](assets/add-input-parameter.png)

1. Then insert a new step between the 2 nodes and select **Add an action**.

1. On the left-hand pane, select **Custom** under runtime and select the **PodcastCopilot_Connector** connector.

    ![Adding the Custom Connector to the Power Automate flow](assets/add-custom-connector.png)

1. First select the **Get Transcription** action and place your curser in the **BlobUrl** field and select the **thunder bolt** icon to open the **Dynamic content** pane.

    ![Adding the Get Transcription action to the Power Automate flow](assets/add-get-transcription.png)

1. Then select **podcastURL** from the **Dynamic content** pane.

    ![Adding the podcastURL parameter to the Get Transcription action](assets/add-podcast-url.png)

1. Add another action but this time, select the **GetGuestName** action. For the **Transcription** field, select the **body/text** field from the **Dynamic content** pane.

    ![Adding the Get Guest Name action to the Power Automate flow](assets/add-get-guest-name.png)

1. In that same pattern;

    - Add the **GetGuestBio** action and in the **GuestName** field, select **message/content** from the **Dynamic content** pane.
    - Add the **GetSocialMediaBlurb** action and in the **Transcription** field, select **body/text** from the **GetTranscription** section from the **Dynamic content** pane. In the **Bio** field, select **bio** from the **Dynamic content** pane.
    - Add the **GetDallEPrompt** action and in the **SocialBlurb** field, select **message/content** from the **GetSocialMediaBlurb** section from the **Dynamic content** pane.
    - Add the **GetImage** action and in the **Prompt** field, select **message/content** from the **GetDallEPrompt** section from the **Dynamic content** pane.

1. Finally, select the **Return value(s) to Power Virtual Agents** action and select **+ Add an output**. Select **Text** and enter ``socialPost`` in the first fields and **message/content** from the **GetSocialMediaBlurb** section from the **Dynamic content** pane in the second field.

    ![Adding the Return value(s) to Power Virtual Agents action to the Power Automate flow](assets/add-return-value.png)

1. Select **+ Add an output** once more, select **Text** and enter ``SocialImage`` in the first fields and **body/url** from the **GetImage** section from the **Dynamic content** pane in the second field.

1. Change the name of the flow to ``Generate Social Media Post Flow`` and click **Save**.

    ![Saving the Power Automate flow](assets/save-flow.png)

1. Once it has been saved, close the tab and return to Microsoft Copilot Studio.

1. Re-add the **Call an action** node, and select the **Generate Social Media Post Flow** flow.

    ![Adding the Generate Social Media Post Flow to the topic](assets/add-flow.png)

1. In the resulting **Action** node, add the **podcastURL** variable to the **Power Automate Inputs** section.

1. Then add another node and select **Send a message** and enter the following message:

    ```
    Here is the social media post I generated for you:
    ```

1. Click on the **Insert variable** icon and select the **socialPost** variable.

    ![Adding the socialPost variable to the topic](assets/add-social-post.png)

1. Do the same with the **SocialImage** variable. Add a message below the last which says ``Here is the image I generated for you:`` and then add the **SocialImage** variable.

    ![Adding the SocialImage variable to the topic](assets/add-social-image.png)

1. Finally, add another node to end conversation and click **Save**.

...and that's it! You've successfully built a Power App and Copilot that uses the Custom Connector to generate a social media post and image from a Podcast URL using AI!