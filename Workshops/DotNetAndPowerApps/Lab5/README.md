# Lab 5 - Creating a Power Apps Canvas App

In this lab, you'll be creating a ToDo List Canvas App which will be backed by the Custom Connector you created in the previous labs.

1. Go to [make.powerapps.com](https://make.powerapps.com) and sign in with the administrator email and password that you created in Lab 0.

Make sure that you're in the correct environment at the top right-hand side of the portal - it should be ```(Your name)'s Environment```. If not then click on the environment picker and change it to the correct one.

2. Click on **Solutions** in the left hand menu.

3. In the solution view, look for the ```DotNet + Power Workshop``` solution and then click on it's Display name.

You should see the ```DotNetToDo``` custom connector that you've just finished creating but now we're going to add a new object - a Canvas App.

4. Click the **+ New** button at the top of the solution. Hover over the *App* menu item and then select **Canvas app**.

The *Canvas App from blank* dialog should pop up.

5. Fill in the following details:

    * App name: ```DotNet ToDo App```
    * Format: ```Tablet```

6. Click **Create**.

![Screenshot of the Canvas App from blank dialog](/Workshops/DotNetAndPowerApps/Lab5/assets/canvas-app-dialog.png)

The Power Apps Studio will open up. When you're here for the first time, a welcome dialog will show. Select the **Skip** button.

## Adding the Custom Connector as a Data Source

1. In Power Apps, on the left panel, click the **Data** icon  and click **Add Data**.

![Data icon in the Power Apps Studio](/Workshops/DotNetAndPowerApps/Lab5/assets/data-icon-power-apps.png)

2. In the ```Select a data source``` window, search for ```DotNetToDo``` and select the result.

3. Select **DotNetToDo** once more.

4. Select the **More Actions** icon and select **Rename**.

![Renaming the Custom Connector](/Workshops/DotNetAndPowerApps/Lab5/assets/rename-custom-connector-in-power-apps.png)

5. Rename to ```DotNetToDo```.

## Adding a header

With a connection to the DotNet ToDo Custom Connector made, you're now ready to configure the UI.

1. First, go back to the ```Tree view```. 

![Tree View option in Power Apps panel](/Workshops/DotNetAndPowerApps/Lab5/assets/tree-view-canvas-apps.png)

2. Rename the ```Screen1``` screen to ```ToDo Screen``` by clicking on the ... next to **Screen1** and then selecting **Rename**.

3. With the *ToDo Screen* selected, make sure that the **Fill** property is selected on the *Properties List* dropdown.

![The Properties list in the Power Apps Studio](/Workshops/DotNetAndPowerApps/Lab5/assets/properties-list.png)

4. Fill in this value in the *Formula Bar*: ```RGBA(41, 41, 41, 1)```

![Fill property value of Screen](/Workshops/DotNetAndPowerApps/Lab5/assets/screen-fill-property-value.png)

5. Click the **+ Insert** button on the top command bar and select **Text Label**. Rename the component to ```lblLogo```.

6. Make sure that the **lblLogo** component is selected and then in the right *Properties Pane*, change the following properties:
    * Text: ```ToDo```
    * Font: ```Segoe UI```
    * Font size: ```20```
    * Font weight: ```Bold```
    * Position: ```0 x 0```
    * Size: ```300 x 70```
    * Padding: ```5 (Top) x 5 (Bottom) x 65 (Left) x 5 (Right)```

![Properties configured with the Properties Pane](/Workshops/DotNetAndPowerApps/Lab5/assets/configure-with-properties-pane.png)

7. With the *lblLogo* selected, make sure that the following properties are configured with the *Properties List* dropdown:

    * Color: ```RGBA(277, 277, 277, 1)```
    * Fill: ```RGBA(0, 120, 212, 1)```

> **Note**: When it comes to properties, you can configure them in multiple ways as shown above. Either in the *Properties Pane* on the right or with the *Properties List* dropdown and the *Formula Bar* at the top.

8. Click the **+ Insert** button, search for "Check (badge)" and then select it when it pops up. Rename it to ```icoLogo```.

9. Configure the ```icoLogo``` properties:

    * Display mode: ```View```
    * Position: ```14 x 16```
    * Size: ```40 x 40```
    * Color: ```RGBA(227, 227, 227, 1)```

10. Click the **+ Insert** button and select **Text Label**. Rename it to ```lblHeader```.

11. Configure the ```lblHeader``` properties:

    * Text: ```User().FullName``` (Use the *Properties list* dropdown and *Formula Bar* for this one)
    * Font: ``Segoe UI``
    * Font Size: ```16```
    * Text Alignment: ```Align right```
    * Position: ```300 x 0```
    * Size: ```1066 x 70```
    * Padding: ```5 (Top) x 5 (Bottom) x 5 (Left) x 15 (Right)```
    * Color: ```RGBA(227, 227, 227, 1)```
    * Fill: ```RGBA(2, 69, 120, 1)```

Your header should now look like this: 

![Screenshot of completed App Header](/Workshops/DotNetAndPowerApps/Lab5/assets/completed-app-header.png)

12. Let's go ahead and **Save** our work by clicking on the Save icon at the top right-hand side of the screen.

## Adding the Lists Gallery

1. Click the **+ Insert** button and select **Rectangle**. Rename it to ```recListBackground```.

2. Configure the ```recListBackground``` properties:

    * Position: ```0 x 70```
    * Size: ```300 x 698```
    * Fill: ```RGBA(50, 49, 48, 1)```

3. Click the **+ Insert** button and search for **Blank vertical gallery** and then select it when it pops up. Rename it to ```galLists```.

4. Configure the ```galLists``` properties:

    * Position: ```0 x 68```
    * Size: ```300 x 625```
    * Fill: ```RGBA(50, 49, 48, 1)```
    * Template size: ```57```
    * Template padding: ```0```
    * Template Fill: ```If(ThisItem.IsSelected, RGBA(72,72,72,1))```

5. On the **galLists** component, click **Add an item from the Insert pane**.

6. In the **Insert** pane on the left, select **Text Label**.

7. Then search for "Vertical Line" and select it when it pops up.

8. Go back to the **Tree View** and rename ```Icon2``` to ```icoSelector```. Also rename ```Label3``` to ```lblListName```.

![List gallery components](/Workshops/DotNetAndPowerApps/Lab5/assets/list-gallery.png)

8. Select the **icoSelector** component and configure the following properties:

    * Position: ```0 x 0```
    * Size: ```4 x 57```
    * Color: ```RGBA(0, 120, 212, 1)```
    * Visible: ```If(ThisItem.IsSelected, true, false)``` (Use the *Properties list* dropdown and *Formula Bar* for this one)

9. Select the **lblListName** component and configure the following properties:

    * Position: ```24 x 12```
    * Size: ```270 x 37```
    * Padding: ```5 (top) x 5 (bottom) x 20 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```

10. Let's go ahead and **Save** our work.

## Adding the "New List" text field

1. Click the **+ Insert** button and select **Text Input**. Rename it to ```txtAddList```.

2. Click the **+ Insert** button and search for **List scroll watchlist** and then select it when it pops up. Rename it to ```icoAddList```.

3. Configure the ```txtAddList``` properties:
    * Default: remove "Text Input" and keep Default empty
    * Hint text: ```New List```
    * Position: ```11 x 712```
    * Size: ```278 x 41```
    * Padding: ```5 (top) x 5 (bottom) x 12 (left) x 35 (right)```
    * Border thickness: ```0```
    * Border radius: ```0```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```RGBA(41, 41, 41, 1)```
    * Focused border thickness: ```0```

4. Configure the ```icoAddList``` properties:
    * Display mode: ```If(txtAddList.Text = "", DisplayMode.View, DisplayMode.Edit)``` (Use the *Properties list* dropdown and *Formula Bar* for this one)
    * Position: ```254 x 715```
    * Size: ```35 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 5 (left) x 5 (right)```
    * Focused border thickness: ```0```
    * Color: ```RGBA(255, 255, 255, 1)```

Your app should look like this now. You're making good progress:

![Power App with List gallery and text input](/Workshops/DotNetAndPowerApps/Lab5/assets/completed-lists-gallery.png)

5. Let's go ahead and **Save** our work.

## Adding the List Items Gallery

1. Click the **+ Insert** button and search for **Blank vertical gallery** and then select it when it pops up. Rename it to ```galListItems```.

2. Configure the ```galListItems``` properties:

    * Position: ```300 x 182```
    * Size: ```766 x 586```
    * Template size: ```59```
    * Template padding: ```0```
    * Template Fill: ```If(ThisItem.IsSelected, RGBA(72,72,72,1))```

3. On the **galListItems** component, click **Add an item from the Insert pane**.

4. In the **Insert** pane on the left, select **Text Label**, 

5. Then search for "Check" and select it when it pops up.

6. Then search for "Circle" and select it when it pops up.

7. Go back to the **Tree View** and rename:
    * ```Circle1``` to ```cirCheckMark```
    * ```Icon4``` to ```icoCheckMark```
    * ```Label4``` to ```lblListItemName```.

![List Items Gallery components](/Workshops/DotNetAndPowerApps/Lab5/assets/list-items-gallery.png)

8. Select the **cirCheckMark** component and configure the following properties:
    * Position: ```32 x 15```
    * Size: ```30 x 30```
    * Border thickness: ```2```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover fill: ```RGBA(0, 0, 0, 0)```

9. Select the **icoCheckMark** component and configure the following properties:
    * Position: ```32 x 15```
    * Size: ```30 x 30```
    * Padding: ```5 (top) x 5 (bottom) x 5 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```

10. Select the **lblListItemName** component and configure the following properties:
    * Position: ```73 x 10```
    * Size: ```680 x 40```
    * Color: ```RGBA(255, 255, 255, 1)```

11. Let's go ahead and **Save** our work.

## Adding the "New List item" text field

1. Click the **+ Insert** button and select **Text Input**. Rename it to ```txtAddItem```.

2. Click the **+ Insert** button and search for **Check** and then select it when it pops up. Rename it to ```icoAddItem```.

3. Configure the ```txtAddItem``` properties:
    * Default: remove "Text Input" and keep Default empty
    * Hint text: ```Add an item```
    * Position: ```316 x 137```
    * Size: ```733 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 12 (left) x 40 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(0, 0, 0, 0)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```RGBA(41, 41, 41, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Hover border color: ```RGBA(255, 255, 255, 1)```
    * Focused border thickness: ```3```
    * Focused border color: ```RGBA(2, 69, 120, 1)```

4. Configure the ```icoAddItem``` properties:    
    * Position: ```1014 x 137```
    * Size: ```35 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 5 (left) x 5 (right)```
    * Focused border thickness: ```0```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Visible: ```If(txtAddItem.Text = "", false, true)```

5. Let's go ahead and **Save** our work.

## Adding the List label and List delete button

1. Click the **+ Insert** button and select **Text label**. Rename it to ```lblCurrentList```.

2. Configure the ```lblCurrentList``` properties:
    * Text: ```List Name```
    * Font: ```Segoe UI```
    * Font size: ```18```
    * Font weight: ```Bold```
    * Position: ```300 x 70```
    * Size: ```766 x 57```
    * Padding: ```5 (top) x 5 (bottom) x 20 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(59, 58, 57, 1)```

3. Click the **+ Insert** button and search for **Trash** and then select it when it pops up. Rename it to ```icoDeleteList```.

4. Configure the ```icoDeleteList``` properties:
    * Position: ```1005 x 70```
    * Size: ```61 x 57```
    * Padding: ```15 (top) x 15 (bottom) x 15 (left) x 15 (right)```
    * Focused border thickness: ```0```
    * Color: ```RGBA(0, 120, 212, 1)```

5. Let's go ahead and **Save** our work.

You're almost there:

![Screenshot of app showing list item gallery and additional components](/Workshops/DotNetAndPowerApps/Lab5/assets/completed-list-item-gallery.png)

## Adding the "Select Item" components

1. Click the **+ Insert** button and select **Rectangle**. Rename it to ```recSelectItemBackground```.

2. Configure the ```recSelectItemBackground``` properties:

    * Position: ```1066 x 70```
    * Size: ```300 x 698```
    * Fill: ```RGBA(50, 49, 48, 1)```

3. Click the **+ Insert** button and select **Text label**. Rename it to ```lblSelectItem```.

4. Configure the ```lblSelectItem``` properties:
    * Text: ```Select an item to edit```
    * Font size: ```12```
    * Text alignment: ```Align.Center```
    * Position: ```1122 x 147```
    * Size: ```188 x 53```
    * Color: ```RGBA(255, 255, 255, 1)```

5. Click the **+ Insert** button and search for **Document checkmark** and then select it when it pops up. Rename it to ```icoSelectItem```.

6. Configure the ```icoSelectItem``` properties:
    * Display mode: ```View```
    * Position: ```1196 x 116```
    * Size: ```40 x 40```
    * Color: ```RGBA(255, 255, 255, 1)```

7. Let's go ahead and **Save** our work.

## Adding a "form" to edit List Items

1. Click the **+ Insert** button and select **Rectangle**. Rename it to ```recFormBackground``` and then configure the following properties:
    * Position: ```1066 x 116```
    * Size: ```300 x 652```
    * Fill: ```RGBA(50, 49, 48, 1)```

2. Click the **+ Insert** button and select **Text label**. Rename it to ```lblCurrentItem``` and then configure the following properties:
    * Text: ```List Item Name```
    * Font: ```Segoe UI```
    * Font size: ```12```
    * Font weight: ```Bold```
    * Position: ```1066 x 70```
    * Size: ```252 x 46```
    * Padding: ```5 (top) x 5 (bottom) x 15 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(59, 58, 57, 1)```

3. Click the **+ Insert** button and search for **Trash** and then select it when it pops up. Rename it to ```icoDeleteItem``` and then configure the following properties:
    * Position: ```1318 x 70```
    * Size: ```48 x 46```
    * Padding: ```10 (top) x 10 (bottom) x 10 (left) x 10 (right)```
    * Focused border thickness: ```0```
    * Color: ```RGBA(0, 120, 212, 1)```
    * Fill: ```RGBA(59, 58, 57, 1)```

4. Click the **+ Insert** button and select **Text label**. Rename it to ```lblName``` and then configure the following properties:
    * Text: ```Name```
    * Font: ```Segoe UI```
    * Font size: ```12```
    * Font weight: ```Semibold```
    * Position: ```1066 x 123```
    * Size: ```150 x 31```
    * Padding: ```5 (top) x 5 (bottom) x 15 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```

5. Click the **+ Insert** button and select **Text Input**. Rename it to ```txtItemName``` and then configure the following properties:
    * Default: remove "Text Input" and keep Default empty
    * Hint text: ```Name```
    * Position: ```1078 x 156```
    * Size: ```270 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 12 (left) x 40 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```RGBA(41, 41, 41, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Hover border color: ```RGBA(255, 255, 255, 1)```
    * Focused border thickness: ```3```
    * Focused border color: ```RGBA(2, 69, 120, 1)```

Here's a UI check-in to see if you're on the right track:

![Screenshot of Form UI thus far](/Workshops/DotNetAndPowerApps/Lab5/assets/completed-form-name-field.png)

6. Click the **+ Insert** button and select **Text label**. Rename it to ```lblDescription``` and then configure the following properties:
    * Text: ```Description```
    * Font: ```Segoe UI```
    * Font size: ```12```
    * Font weight: ```Semibold```
    * Position: ```1066 x 200```
    * Size: ```150 x 31```
    * Padding: ```5 (top) x 5 (bottom) x 15 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```

7. Click the **+ Insert** button and select **Text Input**. Rename it to ```txtItemDescription``` and then configure the following properties:
    * Default: remove "Text Input" and keep Default empty
    * Hint text: ```Item Description```
    * Mode: ```Multiline```
    * Position: ```1078 x 233```
    * Size: ```270 x 100```
    * Padding: ```10 (top) x 5 (bottom) x 12 (left) x 10 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```RGBA(41, 41, 41, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Hover border color: ```RGBA(255, 255, 255, 1)```
    * Focused border thickness: ```3```
    * Focused border color: ```RGBA(2, 69, 120, 1)```

8. Click the **+ Insert** button and select **Text label**. Rename it to ```lblState``` and then configure the following properties:
    * Text: ```State```
    * Font: ```Segoe UI```
    * Font size: ```12```
    * Font weight: ```Semibold```
    * Position: ```1066 x 340```
    * Size: ```150 x 31```
    * Padding: ```5 (top) x 5 (bottom) x 15 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```

9. Click the **+ Insert** button and select **Text Input**. Rename it to ```txtStateBackground``` and then configure the following properties:
    * Default: remove "Text Input" and keep Default empty
    * Position: ```1078 x 373```
    * Size: ```270 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 12 (left) x 40 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```RGBA(41, 41, 41, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Hover border color: ```RGBA(255, 255, 255, 1)```
    * Focused border thickness: ```3```
    * Focused border color: ```RGBA(2, 69, 120, 1)```

10. Click the **+ Insert** button and search for **Drop Down** and then select it when it pops up. Rename it to ```ddItemState``` and then configure the following properties:
    * Items: ```["To Do", "Done"]```
    * Position: ```1078 x 374```
    * Size: ```269 x 30```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover fill: ```RGBA(0, 0, 0, 0)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Border thickness: ```0```
    * Focused border thickness: ```0```
    * Chevron background: ```RGBA(0, 0, 0, 0)```
    * Chevron hover background: ```RGBA(0, 0, 0, 0)```
    * Pressed fill: ```RGBA(0, 0, 0, 0)```
    * Selection fill: ```RGBA(72, 72, 72, 1)```

Here's another UI check-in to see if you're on the right track:

![Screenshot of Form UI thus far](/Workshops/DotNetAndPowerApps/Lab5/assets/completed-form-description-state-field.png)

11. Click the **+ Insert** button and select **Text label**. Rename it to ```lblDueDate``` and then configure the following properties:
    * Text: ```Due Date```
    * Font: ```Segoe UI```
    * Font size: ```12```
    * Font weight: ```Semibold```
    * Position: ```1066 x 418```
    * Size: ```150 x 31```
    * Padding: ```5 (top) x 5 (bottom) x 15 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```

12. Click the **+ Insert** button and select **Text Input**. Rename it to ```txtDueDateBackground``` and then configure the following properties:
    * Default: remove "Text Input" and keep Default empty
    * Position: ```1078 x 451```
    * Size: ```270 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 12 (left) x 40 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```RGBA(41, 41, 41, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Hover border color: ```RGBA(255, 255, 255, 1)```
    * Focused border thickness: ```3```
    * Focused border color: ```RGBA(2, 69, 120, 1)```

13. Click the **+ Insert** button and select **Date picker**. Rename it to ```dpItemDueDate``` and then configure the following properties:
    * Position: ```1078 x 450```
    * Size: ```270 x 35```
    * Padding: ```5 (top) x 5 (bottom) x 12 (left) x 5 (right)```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Font size: ``12``
    * Border thickness: ```0```
    * Fill: ```RGBA(0, 0, 0, 0)```
    * Focused border thickness: ```0```
    * Icon background: ```RGBA(0, 0, 0, 0)```

14. Click the **+ Insert** button and select **Button**. Rename it to ```btnSave``` and then configure the following properties:
    * Text: ```Save```
    * Position: ```1078 x 710```
    * Size: ```100 x 40```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(0, 120, 212, 1)```
    * Border thickness: ```1```
    * Border radius: ```5```
    * Font: ```Segoe UI```
    * Font size: ``12``
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```ColorFade(RGBA(0, 120, 212, 1), 20%)```
    * Pressed color: ```RGBA(255, 255, 255, 1)```
    * Pressed fill: ```RGBA(0, 120, 212, 1)```
    * Focused border thickness: ```0```

15. Click the **+ Insert** button and select **Button**. Rename it to ```btnCancel``` and then configure the following properties:
    * Text: ```Cancel```
    * Position: ```1196 x 710```
    * Size: ```100 x 40```
    * Color: ```RGBA(255, 255, 255, 1)```
    * Fill: ```RGBA(41, 41, 41, 1)```
    * Border color: ```RGBA(255, 255, 255, 1)```
    * Border thickness: ```1```
    * Border radius: ```5```
    * Font: ```Segoe UI```
    * Font size: ``12``
    * Hover color: ```RGBA(255, 255, 255, 1)```
    * Hover fill: ```ColorFade(RGBA(41, 41, 41, 1), 20%)```
    * Pressed color: ```RGBA(255, 255, 255, 1)```
    * Pressed fill: ```RGBA(41, 41, 41, 1)```
    * Focused border thickness: ```0```

16. Let's go ahead and **Save** our work.

And there you go! The Canvas App UI is now complete. 

![Complete canvas app UI without data](/Workshops/DotNetAndPowerApps/Lab5/assets/completed-app-ui.png)

Now it's time to use our Custom Connector Actions in the Canvas App.

### Next: [Lab 6 - Adding data to a Power Apps Canvas App](/Workshops/DotNetAndPowerApps/Lab6/)
