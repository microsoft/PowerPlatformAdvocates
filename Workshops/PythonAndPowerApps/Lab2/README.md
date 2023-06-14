# Lab 2 - Adding data with the ToDo API.

Now that we've got our API up and running in Azure, let's add some data so it's there, ready and waiting, for us to play with in Power Apps.

## Step 1 - Run the GET /lists action to get an array of ToDo lists

1. Look for the ```GET /lists``` action under the Lists API.

![The GET Lists action](/Workshops/PythonAndPowerApps/Lab2/assets/get-lists-action.png)

2. Expand the action and click **Try it out**.

![Screenshot of the "Try it out" button.](/Workshops/PythonAndPowerApps/Lab2/assets/get-lists-try-it-out.png)

3. Then click **Execute**. This will execute that API action in order to get an array of ToDo lists in the application. 

Scroll down to where you see the Server Response. You should see the 200 response code which means the execution was a success. You should also see the response body - which is the data that is returned to us after the action was executed. 

Since this is your first time running the API, your response body will empty:

![Screenshot of the response code and the response body](/Workshops/PythonAndPowerApps/Lab2/assets/response-code-and-body.png)

No worries - you'll be adding data in the next step.
## Step 2 - Add your own list data

Now you're going to be adding your own list.

1. Now look for the ```POST /lists``` action under the Lists API.

2. Expand the action and click **Try it out**.

3. Replace the ```Request body``` with this:

```json
{
  "id": "c9c74ec076c245b195447f19cb3d6bbe",
  "name": "Shopping",
  "description": null
}
```

4. Then click **Execute**. 

Scroll down to where you see the Server Response. You should see the 201 response code which means the execution was a success (similar to 200) but in addition to that - 201 also means that a resource has been created. In this case, you have just created the *Shopping* ToDo list and the new list ID.

5. Go back to the ```GET /lists``` action and execute that one more time.

In the server response, you'll now see that the *Shopping* ToDo list with the new attributes is returned. Copy the new ```id```

![Screenshot of the response code and the response body now showing 2 ToDo lists](/Workshops/PythonAndPowerApps/Lab2/assets/response-with-new-list.png)

## Step 3 - Add your own list item data

Now you'll be adding ToDo items to the Shopping list.

1. Look for the ```POST /lists/{listId}/items``` action under the Items API.

2. Expand the action and click **Try it out**.

This action is a little different because now you have a required parameter: ```listId```. Since you're going to be creating list items, the API needs to know which list to add the items to. Every list has a unique *listId* so that is how you're going to associate the list items with the correct ToDo list.

3. In the *listId* textbox, enter the previous new id. (which is the id for the *Shopping* list, in our case, the id is: 647e409a1a9a70cd243635cf)

4. Replace the ```Request body``` with this and add your id:

```json
{
    "id": "dd181616c5a44b88815f5a98ec4699d1",
    "listId": "new_id_here",
    "name": "Milk",
    "description": null,
    "state": "todo",
    "dueDate": null,
    "completedDate": null
}
```

5. Then click **Execute**. 

Scroll down to where you see the Server Response. You should see the 201 response code. Then scroll back up to the Request Body.

6. Replace the ```Request body``` with this and add your id:

```json
{
    "id": "946b48331dce4904b413a96af034d83c",
    "listId": "new_id_here",
    "name": "Bread",
    "description": null,
    "state": "todo",
    "dueDate": null,
    "completedDate": null
}
```

7. Then click **Execute**. 

Scroll down to where you see the Server Response. You should see the 201 response code. Then scroll back up to the Request Body.

8. Replace the ```Request body``` with this and add your id:

```json
{
    "id": "e0394bfcfa4b4dc4b397d8c7e5aeaa85",
    "listId": "new_id_here",
    "name": "Eggs",
    "description": null,
    "state": "todo",
    "dueDate": null,
    "completedDate": null
}
```
9. Then click **Execute**. 

Scroll down to where you see the Server Response. You should see the 201 response code. 

You've now added 3 list items (milk, bread, and eggs) to the *Shopping* list - and you can prove it: 

10. Look for the ```GET /lists/{listId}/items``` action under the Items API.

11. Expand the action and click **Try it out**.

12. In the *listId* textbox, enter the id for the Shopping list. Then click **Execute**. 

Scroll down to where you see the Server Response. You should see the 200 response code along with the 3 items that you've just added to the *Shopping* ToDo list. 

![Screenshot of the response code and the response body with the 3 Shopping list items](/Workshops/PythonAndPowerApps/Lab2/assets/shopping-list-items.png)

### Next: [Lab 3 - Creating a Custom Connector](/Workshops/PythonAndPowerApps/Lab3/)
