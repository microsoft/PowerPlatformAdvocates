# Lab 3 - Creating a Custom Connector

In order for your Power App to interact with the API in the previous lab, we need to create a Custom Connector. To create one, you you must describe the API that you want to connect to so that the connector understands the API's operations and data structures. 

You'll be creating the custom connector from scratch by describing the connector completely in the custom connector wizard.

## Step 1 - Create a Power Platform Solution

You're going to start off by creating a [solution](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/solutions-overview). This will contain the custom connector as well as the power app.

> **Note**: It's very important to create a solution and not start directly from Create or Apps. Solutions give you a lot more possibilities. Solutions are the mechanism for implementing application lifecycle management (ALM) in Power Apps and other Power Platform products.

1. Go to [make.powerapps.com](https://make.powerapps.com/) and sign in with the administrator email and password that you created in Lab 0. 

Make sure that you're in the correct environment at the top right-hand side of the portal - it should be ```(Your name)'s Environment```. If not then click on the environment picker and change it to the correct one.

![Environment picker in Power Apps](/Workshops/JavaAndPowerApps/Lab3/assets/environment-picker.png)

2. Click on **Solutions**  in the left hand menu.

3.  In the solution view, click the **+ New Solution** button at the top.

4. In the *New Solution* sidebar, add a solution display name, name (internal name), a publisher and a version. Only fill in the required fields.

> **Note**: Be aware that the new publisher will have a prefix value. That prefix value will be added to the internal name of every component you create in this solution. When you use 'msft' as a prefix, you will get 'msft_' as a prefix before every component that gets created in the solution.

Use these fields:

* Display Name: ```Java + Power Workshop```
* Name: ```JavaPowerWorkshop```
* Publisher:  ```create a new one to your own liking and select that one when you are done creating it```
* Version: ```1.0.0.0```

5. Click **Create** to create your solution.

The solution should automatically open up - If it doesn't, it should appear in the solution list. Click on the display name of your solution to open the solution. 

![Screenshot of opened solution](/Workshops/JavaAndPowerApps/Lab3/assets/open-solution.png)

## Step 2 - Creating the Custom Connector and updating general details

1. Click the **+ New** button at the top of the solution. Hover over the *Automation* menu item and then select **Custom Connector**.

This will open the custom connector creation wizard. In this wizard, we will create the custom connector for the ToDo Java API.

2. Open a *new tab* and navigate to the deployed service API URL to launch the ToDo OpenAPI definition.

There are 12 API actions in total but we're going to make use of 7 for now. Change back into the Custom Connector creation wizard.

3. At the top of the page, name the connector ```JavaToDo```.

![The custom connector name](/Workshops/JavaAndPowerApps/Lab3/assets/connector-name.png)

Right now, you're on the ```1. General``` screen. Here, you can add a connector icon, color, and a description. We will skip that for now. However, we need to fill in a *Host*. Which is the URL of the Java API without the ```https://``` protocol.

4. Copy the URL of the Java API and paste it into the *host* field and then remove the ```https://``` protocol. 

 ![Screenshot of Java API Host in Custom Connector wizard](/Workshops/JavaAndPowerApps/Lab3/assets/host-url-for-connector.png)

5. Navigate to the security part of the wizard by clicking on the tab ```2. Security``` or by clicking on the ```Security →``` button on the bottom right.

 ## Step 3 - Specifying authentication type

Security deals with the API Authentication type. There are several options available. If you were working with a Cognitive Services API, then you would use ```API Key``` authentication or if you were connecting to the Microsoft Graph API, you will have to use ```OAuth2.0``` authentication.

For this workshop, you will leave it on the ```No authentication``` type and then let's navigate to the ```3. Definition``` tab.

## Step 4 - Creating the connector definition

The custom connector wizard gives you many options for defining how your connector functions, and how it's exposed in Power Apps. 

The definition tab is where you can add:

* Actions
* Triggers
* Policy templates

For this workshop, we'll only be adding actions.

Let's start with the ```GET /lists``` action under the Lists API.

1.  On the left pane, select ```+ New Action```.

![New Action button in the custom connector wizard](/Workshops/JavaAndPowerApps/Lab3/assets/new-action-custom-connector.png)

2. Fill in the following details:

    * Summary: ```Get lists```
    * Description: ```Gets an array of ToDo lists```
    * Operation ID: ```GetLists```
    * Visibility: ```important```

> **Note**: Most of the fields have blue 'Learn more' links next to the title of the field. The links lead you to the documentation, which explain where these fields are shown in the products and what the best practices are. 

3. Scroll down to the *Request* section and select the ```+ Import from sample``` button and fill in the following fields:

    * Verb: ```GET```
    * URL: ```(YOUR API URL HERE)/lists?top=20&skip=0```

![Import request from sample screenshot](/Workshops/JavaAndPowerApps/Lab3/assets/import-from-sample-custom-connector.png)

4. Click ```Import```.

The following request should get generated:

![Generated request](/Workshops/JavaAndPowerApps/Lab3/assets/generated-request.png)

Next, we are going to improve the query parameters, so that they are more useful for the users of the custom connector.

5. Select the ˅ next to ```top``` in the query section and select the ```Edit``` button.

6. Fill in following fields:
    
    * Name: ```top```
    * Description: ```The max number of items to return in a result```
    * Summary: ```Max number of items```
    * Default value: ```20```
    * Is required: ```No```
    * Visibility: ```none```

The other fields can be left on the default value. 

![All top query properties](/Workshops/JavaAndPowerApps/Lab3/assets/top-query-properties.png)

7. When done, scroll up and select the ```← Back``` button.

8. Now do the same for the skip property. Select the ˅ next to ```skip``` in the query section and select the ```Edit``` button.

9. Fill in following fields:
    
    * Name: ```skip```
    * Description: ```The number of items to skip within the results```
    * Summary: ```Number of items to skip```
    * Default value: ```0```
    * Is required: ```No```
    * Visibility: ```none```

10. When done, scroll up and select the ```← Back``` button.

Now it's time to define the Responses. Responses are very important in the context of the Power Platform. Without responses, you will not be able to do anything with the data you are getting from the APIs you are sending requests to. The users of your connectors will be very thankful when you define all the responses, because that will make the connector easier to use.

11. Scroll down to the *Response* section and click the highlighted ```default``` button.

12. Change the *Name* property from ```default``` to ```200```.

Remember, in Lab 2, while you were adding data via the ToDo API - when you ran the ```GET /lists``` action, it returned a 200 response code? Which means success? That it what we're referencing here. We're defining what the response looks like when a 200 (success) response code is returned. 

If you go back to the ```GET /lists``` action under the Lists API, you'll see that there is a sample response given. 

![Sample 200 response from API](/Workshops/JavaAndPowerApps/Lab3/assets/sample-responses.png)

We will use this sample in the Custom Connector.

13. Back in the custom connector wizard: select the ```+ Import from sample``` button and paste the following JSON in the *body* field.

```json
[
    {
        "id": "string",
        "name": "string",
        "description": "string"
    }
]
```

14. Click **Import**.

The following should be generated:

![Generated response from sample](/Workshops/JavaAndPowerApps/Lab3/assets/generated-response.png)

In the screenshot above, you can see all the properties that are available in the body payload. These properties are available because they were in our sample JSON which we used to generate the response.

15. Select the ˅ next to ```description``` in the body section and select the ```Edit``` button.

16. Fill in following fields:
    
    * Name: ```Description```
    * Description: ```Description of the ToDo list```
    * Visibility: ```advanced```
  
The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

17. Select the ˅ next to ```id``` in the body section and select the ```Edit``` button.

18. Fill in following fields:

    * Name: ```Id```
    * Description: ```Id of the ToDo list```
    * Visibility: ```advanced```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

19. Select the ˅ next to ```name``` in the body section and select the ```Edit``` button.

20. Fill in following fields:

    * Name: ```Name```
    * Description: ```Name of the ToDo list```
    * Visibility: ```advanced```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button. In the response overview screen, select the ```← Back``` button again. That will lead you back to the main screen with the definition. 

Now we have done a bunch of work, let's create the connector. Select the **✓ Create connector** button at the top right side of the screen. This will take a couple of seconds and it should give you a message at the top that Power Automate is saving your connector, and when it's done, it will show a message that it succeeded.

## Step 5 - Adding additional Actions

Now that you've gone through the process of creating a single action - we need to create 6 more. These are the actions you'll be using in the Power App.

**Create the ```POST /lists``` action**

1. Select ```+ New Action```

2. Fill in the following details:

    * Summary: ```Creates list```
    * Description: ```Creates a new ToDo list```
    * Operation ID: ```CreateList```
    * Visibility: ```important```

3. Under the *Request* section, select ```+ Import from sample``` and fill in the following fields:

    * Verb: ```POST```
    * URL: ```(YOUR API URL HERE)/lists```
    * Body: 
    ```json
    {
        "id": "string",
        "name": "string",
        "description": "string"
    }
    ```
4. Click ```Import```.

5. In the generated *Request* section, select the ˅ next to ```body``` in the body section and select the ```Edit``` button.

6. Then select the ˅ next to ```description``` in the body section and select the ```Edit``` button and fill in the following fields:

    * Title: ```description```
    * Description: ```description of new list```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

7. Then select the ˅ next to ```id``` in the body section and select the ```Edit``` button and fill in the following fields:

    * Title: ```id```
    * Description: ```id of new list```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

8. Then select the ˅ next to ```name``` in the body section and select the ```Edit``` button and fill in the following fields:

    * Title: ```name```
    * Description: ```name of new list```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

Select the ```← Back``` button again to lead you back to the main screen with the definition.

9. Scroll down to the *Response* section and click the highlighted ```default``` button.

10. Change the *Name* property from ```default``` to ```201```.

11. Select the ```+ Import from sample``` button and paste the following JSON in the *body* field:

```json
{
  "id": "string",
  "name": "string",
  "description": "string"
}
```

12. Click **Import**.

13. Select the ˅ next to ```description``` in the body section and select the ```Edit``` button.

14. Fill in following fields:
    
    * Name: ```description```
    * Description: ```Description of the ToDo list```
    * Visibility: ```none```
  
The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

15. Select the ˅ next to ```id``` in the body section and select the ```Edit``` button.

16. Fill in following fields:

    * Name: ```id```
    * Description: ```Id of the ToDo list```
    * Visibility: ```none```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

17. Select the ˅ next to ```name``` in the body section and select the ```Edit``` button.

18. Fill in following fields:

    * Name: ```name```
    * Description: ```Name of the ToDo list```
    * Visibility: ```none```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button. In the response overview screen, select the ```← Back``` button again. That will lead you back to the main screen with the definition.

19. Select the **✓ Update connector** button at the top right side of the screen to save your work.

**Create the ```DELETE /lists/{listId}``` action**

1. Select ```+ New Action```.

2. Fill in the following details:

    * Summary: ```Deletes list```
    * Description: ```Deletes a ToDo list```
    * Operation ID: ```DeleteList```
    * Visibility: ```important```

3. Under the *Request* section, select ```+ Import from sample``` and fill in the following fields:

    * Verb: ```DELETE```
    * URL: ```(YOUR API URL HERE)/lists/{listId}```
   
4. Click ```Import```.

5. In the generated *Request* section, select the ˅ next to ```listId``` in the path section and select the ```Edit``` button.

6. Fill in the following fields:

    * Name: ```listId```
    * Description: ```The Todo list unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

7. Scroll down to the *Response* section and click the highlighted ```default``` button.

8. Change the *Name* property from ```default``` to ```204```.

9. The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button. That will lead you back to the main screen with the definition.

10. Select the **✓ Update connector** button at the top right side of the screen to save your work.

You should have 3 List actions defined by now: 

![Lists of 3 actions defined so far for ToDo lists](/Workshops/JavaAndPowerApps/Lab3/assets/list-custom-connectors-actions.png)

Let's go ahead and define the ListItem actions.

**Create the ```GET /lists/{listId}/items``` action**

1. Select ```+ New Action```

2. Fill in the following details:

    * Summary: ```Gets list items```
    * Description: ```Gets list of ToDo items```
    * Operation ID: ```GetListItems```
    * Visibility: ```important```

3. Under the *Request* section, select ```+ Import from sample``` and fill in the following fields:

    * Verb: ```GET```
    * URL: ```(YOUR API URL HERE)/lists/{listId}/items?top=20&skip=0```

4. Click ```Import```.

5. In the generated *Request* section, select the ˅ next to ```listId``` in the path section and select the ```Edit``` button.

    * Name: ```listId```
    * Description: ```The Todo list unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

6. Then select the ˅ next to ```top``` in the query section and select the ```Edit``` button and fill in the following fields:

    * Name: ```top```
    * Description: ```The max number of items to return in a result```
    * Summary: ```Max number of items```
    * Default value: ```20```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

7. Then select the ˅ next to ```skip``` in the query section and select the ```Edit``` button.

8. Fill in following fields:
    
    * Name: ```skip```
    * Description: ```The number of items to skip within the results```
    * Summary: ```Number of items to skip```
    * Default value: ```0```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

9. Scroll down to the *Response* section and click the highlighted ```default``` button.

10. Change the *Name* property from ```default``` to ```200```.

11. Select the ```+ Import from sample``` button and paste the following JSON in the *body* field:

```json
{
  "id": "string",
  "listId": "string",
  "name": "string",
  "description": "string",
  "state": "todo",
  "dueDate": "2023-04-18T22:21:48.191Z",
  "completedDate": "2023-04-18T22:21:48.191Z"
}
```
12. Click **Import**.

The following should be generated:

![Generated response for GetListItems](/Workshops/JavaAndPowerApps/Lab3/assets/generated-response-listitems.png)

13. For **each** of those properties in the *body* section, select the ˅ next to the property and then fill in the following:

**completedDate**
* Title: ```completedDate```
* Description: ```Completed Date of the ToDo list item```
* Visibility: ```advanced```

**description**
* Title: ```description```
* Description: ```Description of the ToDo list item```
* Visibility: ```advanced```

**dueDate**
* Title: ```dueDate```
* Description: ```Due Date of the ToDo list item```
* Visibility: ```advanced```

**id**
* Title: ```id```
* Description: ```Id of the ToDo list item```
* Visibility: ```advanced```

**listId**
* Title: ```listId```
* Description: ```List Id of the ToDo list item```
* Visibility: ```advanced```

**name**
* Title: ```name```
* Description: ```Name of the ToDo list item```
* Visibility: ```advanced```

**state**
* Title: ```state```
* Description: ```State of the ToDo list item```
* Visibility: ```advanced```

When done, scroll up and select the ```← Back``` button. That will lead you back to the main screen with the definition.

14. Select the **✓ Update connector** button at the top right side of the screen to save your work.

**Create the ```POST /lists/{listId}/items``` action**

1. Select ```+ New Action```

2. Fill in the following details:

    * Summary: ```Creates list item```
    * Description: ```Creates a new ToDo item within a list```
    * Operation ID: ```CreateListItem```
    * Visibility: ```important```

3. Under the Request section, select ```+ Import from sample``` and fill in the following fields:

    * Verb: ```POST```
    * URL: ```(YOUR API URL HERE)/lists/{listId}/items```
    * Body:

    ```json
    {
        "id": "string",
        "listId": "string",
        "name": "string",
        "description": "string",
        "state": "todo",
        "dueDate": "2023-04-18T23:01:44.873Z",
        "completedDate": "2023-04-18T23:01:44.873Z"
    }
    ```

4. Click **Import**.

5. In the generated *Request* section, select the ˅ next to ```listId``` in the path section and select the ```Edit``` button.

    * Name: ```listId```
    * Description: ```The Todo list unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

6. Then select the ˅ next to ```body``` in the body section and select the ```Edit``` button.

7. For **each** of those properties in the *body* section, select the ˅ next to the property and then fill in the following:

**completedDate**
* Title: ```completedDate```
* Description: ```Completed Date of the ToDo list item```

The other fields can be left on the default value.

**description**
* Title: ```description```
* Description: ```Description of the ToDo list item```

The other fields can be left on the default value.

**dueDate**
* Title: ```dueDate```
* Description: ```Due Date of the ToDo list item```

The other fields can be left on the default value.

**id**
* Title: ```id```
* Description: ```Id of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

**listId**
* Title: ```listId```
* Description: ```List Id of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

**name**
* Title: ```name```
* Description: ```Name of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

**state**
* Title: ```state```
* Description: ```State of the ToDo list item```
* Default value: ```todo```
* Is required?: ```Yes```
* Visibility: ```internal```

The other fields can be left on the default value.

> **Note**: *id*, *listId*, *name*, and *state* are required fields because when you create a new list item, these are the parameters that you NEED. *completedDate*, *description*, and *dueDate* are parameters that are not required upon creation and can be edited after the fact. 
>
> *state* is the only parameter with a default value of "todo". In the ToDo app, a list item only has two states; "todo" and "done". When a list item is created, it's state should be set to "todo" automatically.

8. When done, scroll up and select the ```← Back``` button.

9. Scroll down to the *Response* section and click the highlighted ```default``` button.

10. Change the *Name* property from ```default``` to ```201```.

11. Select the ```+ Import from sample``` button and paste the following JSON in the *body* field:

```json
{
  "id": "string",
  "listId": "string",
  "name": "string",
  "description": "string",
  "state": "todo",
  "dueDate": "2023-04-18T23:01:44.874Z",
  "completedDate": "2023-04-18T23:01:44.874Z"
}
```

12. Click **Import**.

13. For **each** of those properties in the *body* section, select the ˅ next to the property and then fill in the following:

**completedDate**
* Title: ```completedDate```
* Description: ```Completed Date of the ToDo list item```

**description**
* Title: ```description```
* Description: ```Description of the ToDo list item```

**dueDate**
* Title: ```dueDate```
* Description: ```Due Date of the ToDo list item```

**id**
* Title: ```id```
* Description: ```Id of the ToDo list item```

**listId**
* Title: ```listId```
* Description: ```List Id of the ToDo list item```

**name**
* Title: ```name```
* Description: ```Name of the ToDo list item```

**state**
* Title: ```state```
* Description: ```State of the ToDo list item```

The other fields can be left on the default value. 

When done, scroll up and select the ```← Back``` button. That will lead you back to the main screen with the definition.

14. Select the **✓ Update connector** button at the top right side of the screen to save your work.

**Create the ```DELETE /lists/{listId}/items/{itemId}``` action**

1. Select ```+ New Action```.

2. Fill in the following details:

    * Summary: ``Deletes list item``
    * Description: ```Deletes a ToDo list item```
    * Operation ID: ```DeleteListItem```
    * Visibility: ```important```

3. Under the *Request* section, select ```+ Import from sample``` and fill in the following fields:

    * Verb: ```DELETE```
    * URL: ```(YOUR API URL HERE)/lists/{listId}/items/{itemId}```

4. Click **Import**

5. In the generated *Request* section, select the ˅ next to ```listId``` in the path section and select the ```Edit``` button.

6. Fill in the following fields:

    * Name: ```listId```
    * Description: ```The Todo list unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

7. In the generated *Request* section, select the ˅ next to ```itemId``` in the path section and select the ```Edit``` button.

8. Fill in the following fields:

    * Name: ```itemId```
    * Description: ```The Todo list item  unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

9. Scroll down to the *Response* section and click the highlighted ```default``` button.

10. Change the *Name* property from ```default``` to ```204```.

11. The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button. That will lead you back to the main screen with the definition.

12. Select the **✓ Update connector** button at the top right side of the screen to save your work.

**Create the ```PUT /lists/{listId}/items/{itemId}``` action**

1. Select ```+ New Action```

2. Fill in the following details:

    * Summary: ```Updates list item```
    * Description: ```Updates a ToDo item within a list```
    * Operation ID: ```UpdateListItem```
    * Visibility: ```important```

3. Under the Request section, select ```+ Import from sample``` and fill in the following fields:

    * Verb: ```PUT```
    * URL: ```(YOUR API URL HERE)/lists/{listId}/items/{itemId}```
    * Body:
    ```json
    {
        "id": "string",
        "listId": "string",
        "name": "string",
        "description": "string",
        "state": "todo",
        "dueDate": "2023-04-19T00:25:20.903Z",
        "completedDate": "2023-04-19T00:25:20.903Z"
    }
    ```

4. Click **Import**.

5. In the generated *Request* section, select the ˅ next to ```listId``` in the path section and select the ```Edit``` button.

6. Fill in the following fields:

    * Name: ```listId```
    * Description: ```The Todo list unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

7. In the generated *Request* section, select the ˅ next to ```itemId``` in the path section and select the ```Edit``` button.

8. Fill in the following fields:

    * Name: ```itemId```
    * Description: ```The Todo list item  unique identifier```

The other fields can be left on the default value. When done, scroll up and select the ```← Back``` button.

9. Then select the ˅ next to ```body``` in the body section and select the ```Edit``` button.

10. For **each** of those properties in the *body* section, select the ˅ next to the property and then fill in the following:

**completedDate**
* Title: ```completedDate```
* Description: ```Completed Date of the ToDo list item```

The other fields can be left on the default value.

**description**
* Title: ```description```
* Description: ```Description of the ToDo list item```

The other fields can be left on the default value.

**dueDate**
* Title: ```dueDate```
* Description: ```Due Date of the ToDo list item```

The other fields can be left on the default value.

**id**
* Title: ```id```
* Description: ```Id of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

**listId**
* Title: ```listId```
* Description: ```List Id of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

**name**
* Title: ```name```
* Description: ```Name of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

**state**
* Title: ```state```
* Description: ```State of the ToDo list item```
* Is required?: ```Yes```
* Visibility: ```important```

The other fields can be left on the default value.

11. When done, scroll up and select the ```← Back``` button.

12. Scroll down to the *Response* section and click the highlighted ```default``` button.

13. Change the *Name* property from ```default``` to ```200```.

14. Select the ```+ Import from sample``` button and paste the following JSON in the *body* field:

```json
{
  "id": "string",
  "listId": "string",
  "name": "string",
  "description": "string",
  "state": "todo",
  "dueDate": "2023-04-18T23:01:44.874Z",
  "completedDate": "2023-04-18T23:01:44.874Z"
}
```

15. Click **Import**.

16. For **each** of those properties in the *body* section, select the ˅ next to the property and then fill in the following:

**completedDate**
* Title: ```completedDate```
* Description: ```Completed Date of the ToDo list item```

**description**
* Title: ```description```
* Description: ```Description of the ToDo list item```

**dueDate**
* Title: ```dueDate```
* Description: ```Due Date of the ToDo list item```

**id**
* Title: ```id```
* Description: ```Id of the ToDo list item```

**listId**
* Title: ```listId```
* Description: ```List Id of the ToDo list item```

**name**
* Title: ```name```
* Description: ```Name of the ToDo list item```

**state**
* Title: ```state```
* Description: ```State of the ToDo list item```

The other fields can be left on the default value. 

When done, scroll up and select the ```← Back``` button. That will lead you back to the main screen with the definition.

17. Select the **✓ Update connector** button at the top right side of the screen to save your work.

You've done a TON of work so far and it has paid off because you have now defined the 7 actions that you'll be using in your Power App.

![All seven ToDo actions in the customer connector wizard](/Workshops/JavaAndPowerApps/Lab3/assets/all-seven-actions.png)

## Step 5 - Using Custom Code Support? 

If you navigate to the ```4. Code (Preview)``` tab - you'll see that you have the ability to add custom code support. In this lab, we will not use this feature, but if you want to know more about the code feature: check out the [docs page](https://learn.microsoft.com/en-us/connectors/custom-connectors/define-blank#step-4-optional-use-custom-code-support). 

Select the tab ```5. Test``` to move on to the last part of the connector - Testing. Which you will be doing in the next Lab.

### Next: [Lab 4 - Testing a Custom Connector](/Workshops/JavaAndPowerApps/Lab4/)