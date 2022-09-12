# Lab 03 - View in 3D in Canvas Apps

Open the

## Build the app

Expand the `Library components` group and click on the `Header` component. This will add the `Header` component to your screen.

![Power Apps Studio with the header component selected and the properties pane open.](assets/Canvas-App-Property-Menu.png)

Change the following properties in the `Properties` pane on the right.

- **Text**: `Mixed Reality`
- **Left button visible**: `Off`
- **Right button visible**: `Off`

Click on the `SearchBox` component in the `Library components` group in the insert menu to add the search box to the screen. Select the `Advanced` tab in the pane on the right. In the `Advanced` part of the property pane, you can find more properties. At the top of that pane, you can search for a property, which saves you a lot of time.

Search for `Y` and change that property from `0` to `Header_1.Height`. Next, search for `Width` and change it from `300` to `App.Width`.

#### Connect to the custom connector

To add the custom connector to the app, you have to select the database icon below the insert icon in the left navigation. This will open the `Data` menu.

In the data menu, click on the `Add data` button. This will open the `Select a data source` popup, where you will be able to search for a connector. Enter `Smithsonian` in the search box and click on the `Smithsonian 3D` connector.

![](./assets/Canvas-App-Add-Custom-Connector.png)

You will see a panel open on the right side of the screen where you have to select the `Connect` button. There will be a warning because you are adding a premium connector, but in this case, you can click the `Got it` button.

If all went well, the Smithsonian 3D connector should be visible in the data menu.
