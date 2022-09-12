# Lab 03 - Use View in MR in Canvas Apps

## Upload Assets to OneDrive

For this app, we'll leverage OneDrive as our repository for the coral collection objects and their respective information. This enables us to utilize **OneDrive for Business** as a data connector.  

We've provided the following assets that'll need to be uploaded to OneDrive:

|Type  |Asset  |Description  |
|---------|---------|---------|
|Folder     |   Models      |  Contains model files for coral and reef occupants       |
|Folder     |    Photos     |  Contains photos of the coral and reef objects       |
|Excel Spreadsheet     |  CoralCollection.xlsx       |   Object information (species, description, relative links to model and photo)      |

> **Note:**
>
> Within the Excel spreadsheet are **Coral** and **Occupants** tables which includes a specified range of rows and columns. In addition, the spreadsheet uses relative links which references files within the **Models** and **Photos** folders. If you later plan to add your own models, be sure to follow the format provided in the spreadsheet and modify the range for the respective table.

Let's create a new **Coral Collection** folder in OneDrive and upload these assets.

1. In the browser, navigate to [portal.office.com/onedrive](https://portal.office.com/onedrive).
1. Sign-in using your **administrator credentials** for the M365 Developer Program.
1. In OneDrive, click **+New** to create a new folder. Name the folder **Coral Collection**.

    ![A screenshot of the OneDrive explorer. Listed under My Files is a Coral Collection folder.](assets/coral-collection-folder.jpg)

1. Inside the **Coral** folder, drag or upload the **Models**, **Photos**, and **CoralCollection.xlsx** assets .

    ![The contents of the Coral Collection folder includes a Models and Photos folder. There is also a Coral Collection spreadsheet.](assets/coral-collection-contents.jpg)

## Connect Data

Now that we have our Coral Collection objects stored in OneDrive, we can use **OneDrive for Business** as a data connector to access the collection's assets within the **Coral Collection** folder. Let's connect to **OneDrive for Business** and select the the **Coral** and **Occupants** tables within the **CoralCollection.xlsx** spreadsheet. This connection will enable us to seamlessly reference the object images, photos, and information within the spreadsheet.

1. In Power Apps, in the left panel, click the **Data** icon and click **Add Data**.
1. In the **Select a data source** window, search for **OneDrive for Business** and select the result.

    ![A screenshot of the search results for a data source. The one drive for business result is highlighted in red.](assets/onedrive-for-business.jpg)

1. After you select **OneDrive for Business**, the result will display your email address. Select **OneDrive for Business** once more.
1. In the **Choose an Excel file** tab that appears, select the **Coral Collection** folder.
    ![A screenshot of the choose an excel file screen. The coral collection option is highlighted in red.](assets/choose-excel-coral-collection.jpg)
1. Inside the **Coral Collection** folder, select the **CoralCollection.xlsx** file.
    ![A screenshot of the choose an excel file screen. The coral collection spreadsheet is highlighted in red.](assets/choose-excel-coral-collection-spreadsheet.jpg)
1. Select both the **Coral** and **Occupants** table.
    ![A screenshot of the choose a table screen. The coral and occupants tables are highlighted in red.](assets/choose-a-table.jpg)
1. At the bottom of the panel, click **Connect**.

After the data is connected, Power Apps will add a new **PowerAppsID** column to the spreadsheet. This column contains the Power Apps generated unique ID for the object.

## Create Galleries Screen

With a connection made to the Coral Collection objects, we're now ready to create the galleries! For the app, we'll have a gallery for **Coral** and another for **Reef Occupants**. Each gallery will provide a list of all objects available for view. You'll be able to select an object to learn more and also view the object in both 3D and Mixed Reality.

### Add the Galleries Screen UI

Let's first start with designing some of the basic UI for the Galleries Screen.

![A screenshot of the top of the galleries screen. The screen consists of a heading that says Corals and Coral Reefs. In addition, there is a subheading that says discover the collection.](assets/galleries-basic-ui.jpg)

1. In the **Insert** tab, click **Text label** to add a heading for the screen. Rename the component **CollectionTitle**. In the right panel, change the following properties:
    - **Text**: Corals and Coral Reefs
    - **Font**: Lato Black
    - **Font Size**: 44
    - **Font Weight**: Bold
    - **Position**: 21 x 18
    - **Size**: 600 x 123
    - **Color**: Black (or #000000)
1. In the **Insert** tab, click **Text label** to add a subheading for the screen. Rename the component **Subheading**. In the right panel, change the following properties:
    - **Text**: Discover the collection
    - **Font**: Open Sans
    - **Font Size**: 16
    - **Font Weight**: Semibold
    - **Position**: 21 x 141
    - **Size**: 560 x 41
    - **Color**: Black (or #000000)

We'll now create the section for the **Coral** gallery. Once you've created the **Coral** section, you can duplicate the components to create the **Reef Occupants** section.

![A screenshot of the coral section which consists of a heading, description, and a horizontal gallery.](assets/coral-section.jpg)

1. We'll create a divider to separate the sections. In the **Insert** tab, search for **Rectangle**. Rename the component **Div1**. In the right panel, change the following properties:
    - **Position**: 18 x 190
    - **Size**: 601 x 4
    - **Color**: #FA7E01
    - **Border Thickness**: 0
1. To add a bit of style to the section headings, we'll leverage the **Button** component which enables us to modify the **Border radius**. However, we'll leave the button inactive so that the component cannot be pressed. In the **Insert** tab, **Input > Button**. Rename the component **CoralHeading**. In the right panel, change the following properties:
    - **Text**: Coral
    - **Position** 20 x 200
    - **Size**: 601 x 70
    - **Padding Left**: 10
    - **Color-Fill**: #066563
    - **Border Thickness**: 0
    - **Border Radius**: 20
    - **Font** Lato
    - **Font Size**: 24
    - **Font Weight**: Semibold
1. In the **Insert** tab, click **Text label** to add a description for the section. Rename the component **SubCoral**. In the right panel, change the following properties:
    - **Text**: Explore a variety of coral species collected from around the world.
    - **Font**: Open Sans
    - **Font Size**: 18
    - **Font Weight**: Normal
    - **Position**: 20 x 270
    - **Size**: 601 x 70

### Create the Gallery

We'll now add in the gallery for the **Coral** section. Once complete, we'll have a horizontal collection of objects that you can scroll through and view images of the available objects for viewing.

1. In the left panel, click the **Insert** icon and search for **Blank horizontal gallery**.
1. On the **Select a data source** window that appears, select the **Coral** data source.
1. Rename the **Gallery** component **CoralGallery**.

> **Note:**
>
> The **CoralCollection.xlsx** file must be closed before you complete the next step. If the file is open (whether desktop or in the browser), the data for the gallery will not populate.

 What's great about the gallery component is that the configurations set for one column applies to all columns! We'll configure the first column so that all columns are properly set for each object in the gallery.

1. Select the **CoralGallery**. In the right panel, change the following properties:
    - **Position**: 19 x 295
    - **Size**: 601 x 357
1. On the **CoralGallery** component, click **Add an item from the Insert pane**.
1. In the **Insert** pane, select **Media > Image**** to add an **Image** component to the gallery.
1. We'll now modify the properties for the image component. Select the **Image** component and in the right panel change the following properties:
    - **Image**: `ThisItem.Picture`
    - **Position**: 0 x 48
    - **Size**: 290 x 288
    - **Border radius**: 50

Let's now add navigation to the **Coral Information** screen. Essentially, when you select one of the images, the app will navigate to the **Coral Information** screen.

1. In the first column of the **CoralGallery**, select the **Image** component.
1. In the formula bar, for **OnSelect** enter `Navigate('Coral Information',ScreenTransition.Fade)`.

Since we haven't created the **Coral Information** screen, you'll be given an error - we'll fix that in the next step!

## Create Coral Information Screen

Once an object is selected from the Gallery screen, the app should navigate to **Coral Information** screen which displays the following information about the coral:

- Species
- Description
- 3D Model
- Button to View in MR

We'll setup the screen for the **Coral** objects and later duplicate and reconfigure for the **Reef Occupants**. Let's first create the basic UI for the screen.

 ![A screenshot of the coral information screen. A 3D image takes up the top half of the screen. Below the 3D image is the species and description. A view in M R button displays at the bottom](assets/coral-information.jpg)

1. In the top navigation menu, click **New Screen > Blank**.
1. In the left panel, rename the new screen **Coral Information**.
1. In the left panel, search for the **Back arrow** icon. Rename the component **BackArrow**. In the right panel, change the following properties:
    - **Position**: 20 x 36
    - **Size**: 47 x 47
    - **Font Color**: #FA7E01
    - **Border Thickness**: 0
1. In the formula bar, for the **BackArrow**, change the **OnSelect** to `Navigate(Galleries,Fade)`.
1. In the **Insert** tab, click **Text label** to add a label that'll display the title. Rename the component **CoralTitle**. In the right panel, change the following properties:
    - **Text**: Coral
    - **Font**: Lato Black
    - **Font Size**: 40
    - **Font Weight**: Semibold
    - **Text Alignment**: Align Center
    - **Position**: 105 x 24
    - **Size**: 443 x 70
    - **Font Color**: #066563
1. In the **Insert** tab, click **Text label** to add a label for the species. Rename the component **CoralSpecies**. In the right panel, change the following properties:
    - **Text**: `CoralGallery.Selected.Species`
    - **Font**: Lato
    - **Font Size**: 25
    - **Font Weight**: Semibold
    - **Position**: 25 x 694
    - **Size**: 588 x 51
1. In the **Insert** tab, click **Text label** to add a label for the description. Rename the **Text label** component **CoralDesc**. In the right panel, change the following properties:
    - **Text**: `CoralGallery.Selected.Description`
    - **Font**: Lato
    - **Font Size** 21
    - **Font Weight**: Normal
    - **Position**: 25 x 732
    - **Size**: 604 x 294

Test the app to confirm that when an object is selected from the **Galleries** screen, the **Coral Information** screen displays it's respective information.

## Add the View in 3DControl

![A gif of the 3d coral model being moved around on the screen.](assets/view-in-3d.gif)

We'll now add the **View in 3D** control which will enable you to view 3D content in the app. You can rotate and zoom into the model with simple gestures.

Let's add the control and configure for viewing the object in 3D.

1. In the left panel, click the **Insert** icon and select **Media** > **3D Object**.
1. In the formula bar, for **Source** enter `CoralGallery.Selected.'3DModel'`.
1. In the left panel, rename the **View in 3D** component **Coral3D**.
1. In the right panel, change the following properties:
    - **Background fill**: Transparent
    - **Position**: 40 x 95
    - **Size**: 561 x 536

Test the app to view the 3D model of the object.

## Add the View in MR Control

![A gif of the view in M R control being used. When the view in M R button is pressed, a coral model is overlaid on top of the camera and is visible in the physical environment.](assets/view-in-mr.jpg)

We'll now add the **View in MR** control which will enable you to view the object in your physical environment. The View in MR control creates a button in your app which overlays the respective 3D model onto the live camera feed of your device.

Let's add the control and configure for viewing the object in MR.

1. In the left panel, click the **Insert** icon and select **Mixed Reality** > **View in MR**.
1. In the formula bar, for **Source** enter `CoralGallery.Selected.'3DModel'`.
1. In the right panel, change the following properties:
    - **Position**: 179 x 1037
    - **Size**: 280 x 70
    - **Border radius**: 50
    - **Color-Fill**: #FA7E01
    - **Border Thickness**: 0

Test the app to view the 3D model in Mixed Reality.

![A screenshot of the view in M R control used to display a coral in a physical environment.](assets/view-in-mr-example.jpg)

## Apply What You've Learned

Congratulations - you've setup the configurations for the **Coral** gallery and should now have a functioning app! Now it's time to apply what you've learned and configure the same functionality for the **Reef Occupants** gallery.

### Galleries Screen

![A screenshot of the reef occupants section. This section display the models of the objects within the occupants table.](assets/reef-occupants.jpg )

You can duplicate the existing components created for the **Coral** gallery. Be sure to change the **Text** properties where appropriate. For example, the **description** for the **Reef Occupants** section should read: *Learn more about the animals who inhabit coral and coral reefs.*

To help keep things organize, change the component names where appropriate. For example, consider renaming the gallery **ReefOccupantsGallery**.

Since the gallery is currently using the **Coral** data source, you'll need to switch to the **Occupants** data source instead to view the models within the **Occupants** table. Also, be sure to change the **OnSelect** property so that selecting an image navigates to the **Reef Occupant Information** screen.

### Reef Occupant Information Screen

![A screenshot of the reef occupants information screen. A 3D image takes up the top half of the screen. Below the 3D image is the species and description. A view in M R button displays at the bottom.](assets/reef-occupants-information.jpg)

Likewise, you can duplicate the **Coral Information** screen to create the **Reef Occupant Information** screen. We recommend modifying the component names to reflect the **Reef Occupant** to help keep things organized.

Be sure to change the **Text** properties where appropriate. For example, the **title** for the screen should display: *Reef Occupants*.

The remaining components in the screen are all currently pulling data from the **CoralGallery**. Therefore, be sure to modify the formulas where appropriate so that the data is populated from the **ReefOccupantsGallery**.