# Lab 04 - View in 3D in Canvas Apps

1. Go to [make.powerapps.com](https://make.powerapps.com) and select **Solutions** in the left navigation.
1. Select our **Mixed Reality Workshop** solution.
1. Click on the display name of the `Mixed Reality App` to open up the Power App in edit mode.

## Edit the Overview Screen

First, make sure you are on the **Overview Screen**. You can check this, by looking at the tree view. **Overview Screen** should have a darker gray background.

1. In the **Insert** tab, **Input > Button**. Rename the component **btn3DSearch**. In the right panel, change the following properties:

   - **Text**: Smithsonian 3D Search
   - **Position**: 20 x 280
   - **Size**: 601 x 70
   - **Padding Left**: 10
   - **Color-Fill**: ColorValue("#066563")
   - **Border Thickness**: 0
   - **Border Radius**: 20
   - **Font**: Lato
   - **Font Size**: 24
   - **Font Weight**: Semibold
   - **HoverFill**: ColorValue("#FA7E01")

Next, you would like to have a screen where this button should navigate to.

## Create the Smithsonian 3D Search Screen

1. In the top navigation menu, click **New Screen > Blank**.
1. In the left panel, rename the new screen **Smithsonian 3D Search Screen**.

Leave the screen empty, and go back to the **Overview Screen**. Change the following property:

- **OnSelect**: Navigate('Smithsonian 3D Search Screen', Fade)

Go back to the screen you just created. Here, you will start by adding a couple of components:

1. In the **Insert** tab, click **Text label** to add a heading for the screen. Rename the component **lblSearchTitle**. In the right panel, change the following properties:

   - **Text**: Smithsonian 3D Search
   - **Font**: Lato Black
   - **Font Size**: 44
   - **Font Weight**: Bold
   - **Position**: 21 x 18
   - **Size**: 600 x 160
   - **Color**: Black or ColorValue("#000000")

2. Select the **Insert** icon in the left navigation and search for **'home'**. This will show you the home icon. Click on home icon and it will get added to your screen. Rename the icon to **icoSearchHome**. In the right panel, change the following properties:

   - **Position**: 555 x 47
   - **Color**: Black or ColorValue("#000000")
   - **OnSelect** (under the Advanced tab): Navigate('Overview Screen', Fade)

3. We'll create a divider to separate the sections. In the **Insert** tab, search for **Rectangle**. Rename the component **divSearch**. In the right panel, change the following properties:

   - **Position**: 18 x 190
   - **Size**: 601 x 4
   - **Color**: ColorValue("#FA7E01")
   - **Border Thickness**: 0

4. In the **Insert** menu on the left, search for **Search** and you will be able to select the **SearchBox** component from the Creator Kit we imported before. Click on **SearchBox** to add in to your screen. Rename the component to **sbSmithsonian**. In the right panel, change the following properties:

   - **Position**: 19 x 220
   - **Size**: 601 x 40

### Connect to the custom connector

To add the custom connector to the app, you have to select the database icon below the insert icon in the left navigation. This will open the `Data` menu.

In the data menu, click on the `Add data` button. This will open the `Select a data source` popup, where you will be able to search for a connector. Enter `Smithsonian` in the search box and click on the `Smithsonian 3D` connector.

![](./assets/Canvas-App-Add-Custom-Connector.png)

You will see a panel open on the right side of the screen where you have to select the `Connect` button. There will be a warning because you are adding a premium connector, but in this case, you can click the `Got it` button.

If all went well, the Smithsonian 3D connector should be visible in the data menu. The title of the data source is **Defaulttitle**, which is not the most useful title, so rename this by clicking on the **...** > **Rename** and name it **Smithsonian3D**.

### Add the search result gallery

1. Let's add a gallery to the screen so that we can display the search results:

   - In the left panel, click the **Insert** icon and search for **Blank vertical gallery**.
   - On the **Select a data source** window that appears, hit the escape key on your keyboard, since we will change that later on.
   - Rename the **Gallery** component **galSearch**.

In the right panel, change the following properties:

- **Position**: 0 x 270
- **Size**: 640 x 866
- **TemplateSize**: 60
- **Items**: Filter(Smithsonian3D.FileSearch({q: sbSmithsonian.SearchText, start: 0, rows: 100, quality: "High", file_type: "glb"}).rows, ThisRecord.content.quality = "High", ThisRecord.content.file_type = "glb", !IsBlank(ThisRecord.title))

Click on the **Add an item from the Insert pane** text inside the gallery and select **Label** in the **Insert** tab at the top of your screen. In the right panel, change the following properties:

- **Text**: ThisItem.title
- **Font**: Lato
- **Font size**: 18
- **Font weight**: Semibold
- **Position**: 15 x 0
- **Size**: 540 x 60

After that, add another item to the gallery by using the left **Insert** panel and search for **View**. Before you select the icon **View** from the list to add it to the gallery, make sure to select the first label in the gallery, so that it will drop the component inside of the gallery. In the right panel, change the following properties:

- **Position**: 550 x 0
- **Size**: 60 x 60
- **Padding**: 10, 10, 10, 10
- **Focused border**: 0

## Create the 3D Viewer Screen

Now, we are going to add a 3D viewer screen.

1. In the left navigation menu, click on the **...** next to the **Coral Information Screen** and select **duplicate screen**.
2. Rename the duplicated screen to **Smithsonian 3D Viewer**.
3. Remove **CoralDesc_1** from the screen.
4. Remove **CoralMR_1** from the screen.
5. Rename **Coral3D_1** to **3DViewer3D**.
6. Change the **Source** property of **3DViewer3D** to **galSearch.Selected.content.uri**.
7. Rename **CoralBackArrow_1** to **3DViewerBackArrow**.
8. Change the **OnSelect** property of **3DViewerBackArrow** to **Navigate('Smithsonian 3D Search Screen', Fade)**.
9. Rename **CoralSpecies_1** to **3DViewerObjectTitle**.
10. Change the **Text** property of **3DViewerObjectTitle** to **galSearch.Selected.title**.
11. Change the **Size height** property of **3DViewerObjectTitle** to **80**.
12. Rename **CoralTitle_1** to **3DViewerTitle**.
13. Change the **Text** property of **3DViewerTitle** to **"Smithsonian 3D"**.

Last but not least, go back to the **Smithsonian 3D Search Screen** and select the **View** icon in the first item of the **galSearch** component. In the right panel, change the following property:

- **OnSelect** (under the Advanced tab): Select(Parent) && Navigate('Smithsonian 3D Viewer', Fade)

Make sure to save your app after this change. Publish it and check it out on your mobile phone! With this, we are at the end of the lab.
