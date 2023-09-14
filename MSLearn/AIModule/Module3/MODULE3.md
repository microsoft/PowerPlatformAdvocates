# MODULE 3: BUILDING POWER AUTOMATE FLOWS FOR A REAL ESTATE SOLUTION WITH POWER AUTOMATE COPILOT

This module will cover creating flows using the Power Automate Copilot.

Copilot in Power Automate is the perfect tool to help you automate tedious tasks and save time. It's easy to use and you can now create workflows faster and more efficiently.

**Learning Objectives**

- Evaluate the features and capabilities of Copilot in Power Automate.
- Describe how to create and manage flows with Copilot in Power Automate.


**Prerequisites**

- A Power Automate license
- A Power Platform environment in a US preview region


## INTRODUCTION TO POWER AUTOMATE COPILOT (4 MINS)

Power Automate makes it possible for you to not just describe a flow to create, but also improve and iterate on your flows with AI-driven conversations. This next-generation AI-based Copilot in Power Automate sits inside the flow studio and helps with every flow that’s being built or changed.

Copilot in Power Automate allows open-ended and conversational experiences while authoring your flows. As you build, you’ll be able to ask questions and get assistance making improvements and changes. You won’t need any special knowledge of how Power Automate works. Just by using natural language, you’ll be able to build and enhance everything from a simple flow to a complex, robust enterprise-wide process.

## EXERCISE – CREATE AN APPROVAL WORKFLOW WITH POWER AUTOMATE COPILOT (15 MINS)

In this unit, you’ll create an automation with Power Automate Copilot to automate the approval process for a real estate showing. You’ll use the Copilot to create a flow that will send an email to the real estate agent when a new showing is requested. The agent will then be able to approve or reject the showing request from within the email.

Follow these steps to create a flow using Copilot.

1. Sign in to [Power Automate](https://make.powerautomate.com/).

2. In the center of the **Home** page within Power Automate, there’s a text field in which you can enter a prompt to **Start building your flow with Copilot**

    Type the following prompt:

    `request approval when a dataverse record is created`

    Select the **Submit** button

    ![The Copilot prompt is entered into the text field.](assets/images/power-automate-copilot-prompt.png)

3. From the prompt, Copilot will provide the outline for a suggested flow which you can review. To accept the flow, select **Next**.

    ![Suggested flow is displayed.](assets/images/power-automate-copilot-suggested-flow.png)

4. Review the connected apps and services. If a connection has not been made yet, configure or fix it. Then select **Create flow**. 

    ![The connected apps and services are displayed.](assets/images/power-automate-copilot-connected-apps.png)

    The Edit with Copilot designer opens with your flow along with a Copilot chat window on the right:

    ![The Copilot designer is displayed.](assets/images/power-automate-copilot-designer.png)

5. We need to configure some parameters. Select the **When a row is added, modified or deleted** trigger.

    A panel on the left-hand side of the screen shows the trigger details, including an empty Table name parameter which is required. 

    ![The trigger details are displayed.](assets/images/power-automate-copilot-trigger-details.png)

6. From the **Table Name** dropdown, search for and select **Real Estate Showings**.

    ![The Real Estate Showings table is selected.](assets/images/power-automate-copilot-table-name.png)

7. Select the **Start and wait for an approval** action.

    Notice that the **Approval Type** parameter is missing:

    ![The approval type parameter is missing.](assets/images/power-automate-copilot-approval-type.png)

8. From the **Approval Type** dropdown, select **Approve/Reject - First to respond**.

    Notice how as soon as you select the **Approval Type**, additional parameters now become available:

    ![The approval type parameter is selected.](assets/images/power-automate-copilot-approval-type-selected.png)

9. In the Copilot chat window, type the following prompt:

    `Add "New Request for Real Estate Showing" as the Title parameter for the Start and wait for an approval action`

10. It will take a few seconds for Copilot to process the prompt. When it does, the **Title** parameter will be populated with the prompt text:

    ![The title parameter is populated with the prompt text.](assets/images/power-automate-copilot-title-parameter.png)

11. For the **Assigned To** parameter, type in the email address that you're using for this lab. This will be the email address that receives the approval request.

12. Now for the **Details** parameter, type in the following:

    ```
    A new request for a real estate showing has been created. Please review the details below and approve or reject the request:

    Property: 
    Client: 
    Client Email:
    Date:
    Time: 
    ```
    ![The details parameter is populated with text.](assets/images/power-automate-copilot-details-parameter.png)

13. Next, place your curser next to "Property: " in the **Details** parameter and click on the lightning icon to open the **Dynamic Content** pane.

    ![The dynamic content icon.](assets/images/power-automate-copilot-dynamic-content-icon.png)

14. In the **Dynamic Content** pane, select **See More** to expand the list of available dynamic content.

    ![The see more link is selected.](assets/images/power-automate-copilot-see-more.png)

15. Scroll down until you see the **Address** field and select it.

    ![The property field is selected.](assets/images/power-automate-copilot-property-field.png)

    The **Address** dynamic content field is now added to the **Details** parameter:

    ![The property field is added to the details parameter.](assets/images/power-automate-copilot-property-field-added.png)

16. Now do the same for the **Client**, **Client Email** , **Date**, and **Time** fields.

    Once you're done with the rest of the fields, it should look like this:

    ![The client, client email, date, and time fields are added to the details parameter.](assets/images/power-automate-copilot-details-parameter-added.png)

17. With the **Details** parameter completed, you can now collapse the **Start and wait for an approval** action by selecting the double arrow icon.

    ![The start and wait for an approval action is collapsed.](assets/images/copilot-start-and-wait-for-an-approval-collapsed.png)
    
18. Now select the **Condition** action.

    ![The condition action is selected.](assets/images/power-automate-copilot-condition.png)

19. Select the **Choose a value** box and select **Outcome** from the **Dynamic content** pane.

    ![The outcome dynamic content is selected.](assets/images/power-automate-copilot-outcome.png)

20. Select **is equal to** for the condition and then type `Approve` for Value.

    ![The condition is set to approve.](assets/images/power-automate-copilot-approve-condition.png)

21. Collapse the **Condition** action and then select the **Update a row** action under the **True** branch of the Condition.

22. From the **Table Name** dropdown, search for and select **Real Estate Showings**.

23. Select the **Row ID** field and then select the **Real Estate Showings** unique identifier field from the **Dynamic content** pane.

    ![The row id field is selected.](assets/images/power-automate-copilot-row-id.png)

    Every time you create a table in Dataverse, a column is automatically created with the same name of the table. This column serves as the unique lookup ID for the record (or row) that was created.

24. Select **Show all** under **Advanced Parameters**.

    ![The show all link is selected.](assets/images/power-automate-copilot-show-all.png)

25. Select **Confirmed** from the **Status** dropdown menu. 

    ![The confirmed status is selected.](assets/images/power-automate-copilot-confirmed-status.png)

    When a showing is approved, the **Status** field in the **Real Estate Showings** table will be updated to **Confirmed**.

26. Collapse the **Update a row** action and then select the **Update a row** action under the **False** branch of the Condition.

27. From the **Table Name** dropdown, search for and select **Real Estate Showings**.

28. Select the **Row ID** field and then select the **Real Estate Showings** unique identifier field from the **Dynamic content** pane.

29. Select **Show all** under **Advanced Parameters**.

30. Select **Cancelled** from the **Status** dropdown menu.

    When a showing is rejected, the **Status** field in the **Real Estate Showings** table will be updated to **Cancelled**.

31. Collapse the **Update a row** action.

32. In the Copilot chat window, type the following prompt and submit:

    `Under the "Update a row" action for both branches in the condiiton, add a new "Send an email (V2)" action`

    After a few seconds, Copilot should then explain what it did:

    ![Copilot explains what it did.](assets/images/power-automate-copilot-explains.png)

    You should then see the updated flow:

    ![The updated flow is displayed.](assets/images/power-automate-copilot-updated-flow.png)

33. Select the **Send an email** action under the **True** branch of the Condition.

34. Select the **To** field, remove the "example@example.com" email address, and then select the **Client Email** field from the **Dynamic content** pane.

35. For the **Subject** field, type in the following into the Copilot chat window and hit enter:

    `Add "Your request for a real estate showing has been approved" as the Subject parameter for the Send an email action`

    The **Subject** field should now be populated with the prompt text:

    ![The subject field is populated with the prompt text.](assets/images/power-automate-copilot-subject-parameter.png)

36. For the **Body** field, type in the following into the Copilot chat window and hit enter:

    `Add "Good day - Your request for a real estate showing has been approved. Please see below for details." as the Body parameter for the Send an email action`

    The **Body** field should now be populated with the prompt text:

    ![The body field is populated with the prompt text.](assets/images/power-automate-copilot-body-parameter.png)

37. Now type in the following after the **Body** text:

    ```
    Property:

    Agent Name:

    Showing Date:

    Showing Time:
    ```

    Then add the **Address**, **Agent Name**, **Date**, and **Time** fields from the **Dynamic content** pane to the appropriate lines in the **Body** text:

    ![The address, agent name, date, and time fields are added to the body text.](assets/images/power-automate-copilot-body-parameter-added.png)

38. To close it off, add the **Response summary** field from the **Dynamic content** pane to the end of the **Body** text:

    ![The response comments field is added to the body text.](assets/images/power-automate-copilot-response-comment.png)

39. Collapse the **Send an email** action.

40. Select the **Send an email** action under the **False** branch of the Condition.

41. Select the **To** field, remove the "example@example.com" email address, and then select the **Client Email** field from the **Dynamic content** pane.

42. For the **Subject** field, type in the following into the Copilot chat window and hit enter:

    `Add "Your request for a real estate showing has been rejected" as the Subject parameter for the Send an email action`

43. For the **Body** field, type in the following into the Copilot chat window and hit enter:

    `Add "Good day - Your request for a real estate showing has been rejected. Please see below for details." as the Body parameter for the Send an email action`

44. Now type in the following after the **Body** text:

    ```
    Property:

    Agent Name:

    Showing Date:

    Showing Time:
    ```

    Then add the **Address**, **Agent Name**, **Date**, and **Time** fields from the **Dynamic content** pane to the appropriate lines in the **Body** text.

45. Add the **Response summary** field from the **Dynamic content** pane to the end of the **Body** text.

    ![The response comments field is added to the body text.](assets/images/power-automate-copilot-response-comment-rejected.png)

46. Collapse the **Send an email** action.

47. Rename the flow to **Request Approval for Real Estate Showing** by selecting the **request approval when a dataverse record is created** text on the upper-left corner of the screen.

    ![The flow is renamed.](assets/images/power-automate-copilot-rename-flow.png)

48. **Save** the flow by selecting the **Save** button in the upper right-hand corner of the screen.

    ![The save button is selected.](assets/images/power-automate-copilot-save.png)

49. **Test** the flow by selecting the **Test** button in the upper right-hand corner of the screen. Select **Manually** and then select **Test**.

    ![The test button is selected.](assets/images/power-automate-copilot-test.png)

50. To submit a real estate showing request, go to the Real Estate Showings app in [Power Apps](https://make.preview.powerapps.com/)

51. Run the app and then select **+New** to create a new showing request.

52. Fill in the following fields with the information below:

    - Agent Name: < random name >
    - Client Full Name: < Your name >
    - Client Email: < Your email > (The email you're using for this lab)
    - Date: < Any future date >
    - Time: < Any future time >
    - Status: `Pending`
    - Address: `210 Pine Road, Portland, OR 97204`

    > **Note**
    >
    > This address is one of the addresses from the Excel file in Module 1. The same file which we uploaded and turned into the **Real Estate Properties** table.
    >
    > Usually, you would have a lookup field to the **Real Estate Properties** table, but we're going to keep it simple for this lab.

53. Then select the checkmark in the top right corner of the screen.

54. Now, select the **X** in the top right corner to close out of the app.

    The flow will run and send an approval email to email that you provided in the flow you're just built.
    
55. Log into the email account that you're using for this lab and wait for the email to arrive.

    > **Note**
    >
    > If the flow doesn't run immediately, make sure that you wait for it. It might take up to 10 minutes for the flow to be triggered especially on the first try.

    The approval should look like this once it arrives:

    ![The approval email is displayed.](assets/images/power-automate-copilot-approval-email.png)

56. Select **Approve**.

57. Add a comment and then select **Submit**.

    ![The approval is submitted.](assets/images/power-automate-copilot-approval-submitted.png)

    The flow continues to run; it updates the row and sends an email to the requestor. The email that's sent to the requester will resemble the following image:

    ![The approval email is displayed.](assets/images/power-automate-copilot-approval-email-2.png)

58. Check the flow and notice that the flow is now marked as **Succeeded** in the run history.

    ![The flow is marked as succeeded.](assets/images/power-automate-copilot-flow-succeeded.png)