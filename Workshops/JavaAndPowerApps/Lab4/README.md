# Lab 4 - Testing a Custom Connector

Now that you've created a Custom Connector and added all the necessary actions, it is now time to test it to make sure that it's working properly. Testing anything you've created is very important.

1. To ensure that we're testing the latest changes, click the ```✓ Update connector``` button.

2. Every connector needs a connection for it to work so under the *Connections* section, click ```+ New Connection```.

![Screenshot of the Connections section under the Test Tab in the custom connector wizard](/Workshops/JavaAndPowerApps/Lab4/assets/new-custom-connector-connection.png)

3. After creating the connection, you can proceed to test out the actions you have just created.

**GetLists**

Ensure that the **GetLists** action is selected under the *Operations* section on the left-hand side of the screen.

Then click ```Test operation```.

This should be the response. A 200 response code along with the body containing all ToDo lists:

![GetLists action Test response](/Workshops/JavaAndPowerApps/Lab4/assets/get-lists-response.png)

**CreateList**

Ensure that the **CreateList** action is selected under the *Operations* section on the left-hand side of the screen.

Fill in the following details:

* id: ```2e134d62c2a44f1f8ec9a9```
* name: ```Work```
* description: ```My work list```

Then click ```Test operation```.

You should have a 201 response code along with the body containing the new *Work* ToDo list.

**GetListItems**

Let's skip the *DeleteList* action for now and ensure that the **GetListItems** action is selected under the *Operations* section on the left-hand side of the screen.

Fill in the following details:

* id: ```c9c74ec076c245b195447f19cb3d6bbe```

> **Note**: This is the *id* of the *Shopping* list that you created in [Lab 2](https://github.com/gomomohapi/JavaWorkshop/tree/main/Lab2#step-2---add-your-own-list-data).

Click ```Test operation```.

You should have a 200 response code along with the body containing all of the *Shopping* ToDo list items.

**CreateListItem**

Ensure that the **CreateListItem** action is selected under the *Operations* section on the left-hand side of the screen.

Fill in the following details:

* listId: ```2e134d62c2a44f1f8ec9a9```
* id: ```c5c1ed8252e14e3daa0d74```
* listId: ```2e134d62c2a44f1f8ec9a9```
* name: ```Send email to manager```

Leave the other parameters as is.

Click ```Test operation```.

You should have a 201 response code along with the body containing the new *Work* ToDo list item: "Send email to manager".

**UpdateListItem**

Let's skip the *DeleteListItem* action for now and ensure that the **UpdateListItem** action is selected under the *Operations* section on the left-hand side of the screen.

Fill in the following details:

* listId: ```2e134d62c2a44f1f8ec9a9```
* itemId: ```c5c1ed8252e14e3daa0d74```
* id: ```c5c1ed8252e14e3daa0d74```
* listId: ```2e134d62c2a44f1f8ec9a9```
* name: ```Send email to manager and colleague```
* state: ```todo```

Leave the other parameters as is.

Click ```Test operation```.

You should have a 200 response code along with the body containing the updated *Work* ToDo list item: "Send email to manager and colleague". It was previously: "Send email to manager".

![Body response of updated ToDo list item](/Workshops/JavaAndPowerApps/Lab4/assets/updated-list-item-response.png)

Now let's work with the Delete actions.

**DeleteListItem**

Ensure that the **DeleteListItem** action is selected under the *Operations* section on the left-hand side of the screen.

Fill in the following details:

* listId: ```2e134d62c2a44f1f8ec9a9```
* itemId: ```c5c1ed8252e14e3daa0d74```

Click ```Test operation```.

You should have a 204 response code confirming that something has been deleted. This test has deleted the "Send email to manager and colleague" list item from the *Work* ToDo list.

**DeleteList**

Ensure that the **DeleteList** action is selected under the *Operations* section on the left-hand side of the screen.

Fill in the following details:

* listId: ```2e134d62c2a44f1f8ec9a9```

Click ```Test operation```.

You should have a 204 response code confirming that something has been deleted. This test has deleted the *Work* ToDo list.

And there you have it! All actions have been tested and passed.

![All actions with passed test](/Workshops/JavaAndPowerApps/Lab4/assets/passed-action-tests.png)

Click the ```✓ Update connector``` button and once the custom connector has been saved, click the ```X Close ``` button.

Now that you know that your custom connector is complete, we can go ahead and use it in a Power App - which you will be building next.

### Next: [Lab 5 - Creating a Power Apps Canvas App](/Workshops/JavaAndPowerApps/Lab5/)