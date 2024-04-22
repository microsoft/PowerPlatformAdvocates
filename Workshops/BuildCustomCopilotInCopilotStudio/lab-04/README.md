# Lab 04 - Create a custom topic with a plugin action for Generative Actions

A prompt plugin can also be executed inside of a Topic to create a controlled user experience and add further logic and/or processing of the copilot.  The prompt plugin can be added as a plugin action inside the authoring canvas.

## 4.1	Adding the prompt plugin as an action to a Topic

In this part of the lab you’ll learn how to add the prompt plugin created earlier to a Topic.

1.	Select **Topics** in the left hand side menu. Click on the **X** icon to close **Test copilot** to increase the width of the authoring canvas and select **+ Create**. Select **Topic** and select **From blank**.

    ![Create Topic](assets/4.1_01_CreateTopic.jpg)

2.	Enter a name for the Topic and in the description of the Trigger, enter 5 trigger phrases. 

Example: 

```
Compile a list of learning resources for mastering the subject provided by the user including links to the resources, provide a list of learning resources for the subject entered by the user including links to the resources, compile a list of learning resources including links to the resources for mastering the subject entered by the user, generate a list of learning resources for mastering the subject entered by the user including links to the resources, create a list of learning resources for mastering the subject provided by the user including links to the resources
```

    ![Topic Trigger](assets/4.1_02_TopicTrigger.jpg)

3.	Select **Save** on the top right of the authoring canvas to save the Topic.

    ![Save Topic](assets/4.1_03_SaveTopic.jpg)

4.	Next, we’ll display a message to let the user know that copilot will go ahead and perform an action. Select the **+** icon in the authoring canvas to add a new node. Select **Send a message**.

    ![Send A Message](assets/4.1_04_SendAMessage.jpg)

5.	Enter a message such as, **Let me compile a list of learning resources for you, one moment please.**

    ![Message Description](assets/4.1_05_MessageDescription.jpg)

6.	Select the **+** icon in the authoring canvas to add a new node. This time select **Call an action** and select the **Plugin (preview)** tab. The AI plugin of the custom prompt created earlier will be displayed, select it.

    ![Call An Action](assets/4.1_06_CallAnAction.jpg)

7.	The plugin action will be added to the authoring canvas with the outputs already configured. The input will need to be added. Select **+ Set value** and **select subject**.

    ![Set Input Value To Subject](assets/4.1_07_SetInputValueToSubject.jpg)

8.	Select the **>** icon and select **Activity.Text** as the input value for the plugin action to use the user’s entire response and identify the subject value.

    ![Set Value For Input](assets/4.1_08_SetValueForInput.jpg)

9.	Select the **+** icon in the authoring canvas to add a new node. This time select **Send a message**

    ![Send A Message](assets/4.1_09_SendAMessage.jpg)

10.	To insert the output value which is the prompt response of the plugin action, use a Power Fx expression. Select the Power Fx icon, enter Topic.Output.text and select Insert.
    
    ![4.1_10_InsertPowerFx](assets/4.1_10_InsertPowerFx.jpg)

11.	The Send a message node will now display the output from the plugin action.	Select **Save** on the top right of the authoring canvas to save the updated Topic.

    ![Send A Message](assets/4.1_11_SendAMessage.jpg)

12.	The plugin action created earlier for the prompt plugin needs to be modified to prevent the plugin action executing outside of the Topic. Navigate to **Actions (preview)** in the left hand side menu and select the plugin action created earlier. Scroll down and under **Dynamic chaining**, *untick* the **Enabled checkbox**.

    ![Update plugion action](assets/4.1_12_UpdatePluginAction.jpg)

15.	Next, the response to the user needs to be disabled since the response will be returned from the Topic. In the Outputs tab untick the Respond to the user after running this action checkbox. Select the **Save** icon on the top right. 

    ![Update plugin action](assets/4.1_13_UpdatePluginAction.jpg)

17.	Now let’s test the updated copilot by triggering the recently created Topic. Navigate to **Topics** and select the Topic created earlier.

    ![Select Custom Topic](assets/4.1_14_SelectCustomTopic.jpg)

18.	Select **Test copilot** on the top right.

    ![Test Copilot](assets/4.1_15_TestCopilot.jpg)

19. Enter a prompt such as, **Can you please provide me with learning resources for building with Power Apps**

    ![Prompt](assets/4.1_16_EnterPrompt.jpg)

20.	The Topic will be triggered with a message sent to the user about compiling the list of learning resources, followed by the prompt response as copilot executed the AI Plugin action. In the tracing mode view, you’ll see that the Topic succeeded with the green tick icon displayed.

    ![Prompt Response](assets/4.1_17_PromptResponse.jpg)

## Next lab

Congratulations! 🥳 You created a custom topic and added the prompt plugin created in [lab 02](../lab-02/README.md) as a plugin action.

This is the end of Lab 04 - Create a custom topic with a plugin action for Generative Action, select the link below to move to the next lab.

[⏭️ Move to Lab 05 - Automation in copilot with Power Automate cloud flows](../lab-05/README.md)
