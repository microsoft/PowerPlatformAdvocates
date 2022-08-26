# Lab 01 - Create your first Custom Connector

When you're ready to create a Power Platform solution, like we're going to do today, you always want to start by going to the maker portal. In this case, we're going to the Power Automate maker portal.

🤖 [Power Automate Maker Portal](https://make.powerautomate.com)

> **Note:**
>
> It's very important to create a solution and not start from Data > Custom connectors. Solutions give you a lot more possibilities. For instance, you can more easily perform application lifecycle management (ALM) on it.

![View of the left hand navigation of the Power Automate Maker Portal with an arrow pointed at the Solutions menu item.](assets/solution-left-hand-menu.png)

## Create a solution

Navigate to solutions in the left hand menu. In the solution view, click the '**+ New Solution**' button at the top. A side bar will open where you can add your solutions' display name, name (internal name), a publisher and a version. When creating a new publisher, only fill in the required fields.

> **Note:**
>
> Be aware that the new publisher will have a prefix value. That prefix value will be added to the internal name of every component you create in this solution. When you use 'msft' as a prefix, you will get 'msft\_' as a prefix before every component that gets created in the solution.

For this solution, we will use the following values:

- **Display Name**: `Mixed Reality Workshop`
- **Name**: `MixedRealityWorkshop`
- **Publisher**: `create a new one to your own liking and select that one when you are done creating it`
- **Version**: `1.0.0.0`

There is also a 'more options' option available, but we will not use that in this workshop.

When you have filled in all the values above, click on the **Create** button and your solution will be created. The solution you have created should appear in the solution list after you clicked on the create button.

Click on the display name of your solution to open the solution. This should lead you to the following screen:

![View of the empty Mixed Reality Workshop solution](assets/solution-empty.png)

## Create the custom connector

Click on the **+ New** button and take a look at all the options that are in this menu. These are all the solution components that you can create in a solution. In this case, we want to hover the **Automation** menu item, and then select **Custom Connector**.

This will open the custom connector creation wizard. In this wizard, we will create the custom connector for the [Smithsonian 3D API](https://3d.si.edu/). This API is very well documented. You can find the documentation [here](https://3d-api.si.edu/api-docs/). The only action available in this API is file search. This is the only action we need for this workshop, so don't worry!

![Screenshot of the Smithsonian 3D API Documentation.](assets/smithsonian-3d-api-docs.png)

Back in the Power Automate custom connector wizard, let's name the connector `Smithsonian 3D`.

In this screen, we can also add a connector icon, color, and a description. We will skip that for now, but we do fill in the host field. As you can see, the file search action in the API is a GET request to `https://3d-api.si.edu/api/v1.0/content/file/search`. This means that we can add **3d-api.si.edu** in the host field.

Navigate to the security part of the wizard by clicking on the tab `2. Security` or by clicking on the **Security →** button on the bottom right.

### Security

In our case, the security tab is not that interesting, but in various other cases, this will be the place where you define your authentication. For instance, when connecting to the Microsoft Graph API, you will have to use the `OAuth2.0` authentication type.

For now, we will leave this on the `No authentication` authentication type. Let's move on to the `3. Definition` tab.

### Definition

The definition tab is where you can add:

- Actions
- Triggers
- Policy templates

In this lab, we will only add one action. This is the file search, which you already read about earlier in this lab.

#### Add a new operation

Select the **⨁ New action** button on the left and fill in the following fields:

- **Summary**: `File search`
- **Description**: `This action searches the Smithsonian 3D API and fetches content based on a query/filter.`
- **Operation ID**: `FileSearch`
- **Visibility**: `important`

> **NOTE**:
>
> Most of the fields have blue 'Learn more' links next to the title of the field. The links lead you to the docs, which explain where these fields are shown in the products and what the best practices are. Most of the fields link to [this docs page](https://aka.ms/CustomConnectorsOpenAPISummary).

In the request section, select the **+ Import from sample** button and fill in the following fields:

- **Verb**: `GET`
- **URL**: `https://3d-api.si.edu/api/v1.0/content/file/search?q={q}&file_type={file_type}&quality={quality}&model_type={model_type}&gltf_orientation_compliant=true&draco_compressed=true&start=0&rows=10`

The header field can be blank in this case. If you filled the fields, click on the **Import** button.

The following request should get generated:

![View of the imported sample as a request.](assets/custom-connector-request-view.png)

#### Query parameters

Next, we are going to improve the query parameters, so that they are more useful for the users of the custom connector.

> **NOTE**:
>
> Make sure to check out the [docs](https://3d-api.si.edu/api-docs/) of the API. Most APIs already documented a lot of information that you can reuse. For instance: the Smithsonian 3D API has all the parameters documented. You can easily get all the information from there.
>
> ![An overview of all the parameters in the Smithsonian 3D API.](assets/custom-connector-parameters.png)

##### Query

Select the **˅** next to the 'q' in the query section which is visible in the screenshot above and select the **✏️ Edit** button.

In this screen, you will be able to change the properties of the 'q' query parameter:

![An example of the parameter 'q' with all the different input fields, like name, description, summary, default value, and more.](assets/custom-connector-parameter-edit.png)

Fill in the following fields for the 'q' parameter:

- **Name**: `q`
- **Description**: `The query term you would like to issue. Examples: Mandible, Space Shuttle, Crab.`
- **Summary**: `Query`
- **Is required**: `No`
- **Visibility**: `important`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### File Type

Select the **˅** next to the 'file_type' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'file_type' parameter:

- **Name**: `file_type`
- **Description**: `The file type to filter results against.`
- **Summary**: `File Type`
- **Is required**: `No`
- **Visibility**: `advanced`
- **Dropdown type**: `Static`
- **Values**: `jpg, glb, ply, zip`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### Quality

Select the **˅** next to the 'quality' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'quality' parameter:

- **Name**: `quality`
- **Description**: `The quality type to filter results against.`
- **Summary**: `Quality`
- **Is required**: `No`
- **Visibility**: `advanced`
- **Dropdown type**: `Static`
- **Values**: `Low, Medium, High, Thumb, Low_resolution, Medium_resolution, Full_resolution, Water_tight`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### Model Type

Select the **˅** next to the 'model_type' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'model_type' parameter:

- **Name**: `model_type`
- **Description**: `The model type to filter results against.`
- **Summary**: `Model Type`
- **Is required**: `No`
- **Visibility**: `advanced`
- **Dropdown type**: `Static`
- **Values**: `glb, ply, obj, gltf, f3z, blend, stl`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### glTF Orientation Compliant

Select the **˅** next to the 'gltf_orientation_compliant' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'gltf_orientation_compliant' parameter:

- **Name**: `gltf_orientation_compliant`
- **Description**: `Restrict results to glTF orientation compliant files.`
- **Summary**: `glTF Orientation Compliant`
- **Is required**: `No`
- **Visibility**: `advanced`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### Draco Compressed

Select the **˅** next to the 'draco_compressed' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'draco_compressed' parameter:

- **Name**: `draco_compressed`
- **Description**: `Restrict results to Draco compressed files.`
- **Summary**: `Draco Compressed`
- **Is required**: `No`
- **Visibility**: `advanced`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### Start

Select the **˅** next to the 'start' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'start' parameter:

- **Name**: `start`
- **Description**: `The start of the result set.`
- **Summary**: `Start`
- **Default value**: `0`
- **Is required**: `No`
- **Visibility**: `advanced`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.

##### Rows

Select the **˅** next to the 'rows' in the query section and select the **✏️ Edit** button.

Fill in the following fields for the 'rows' parameter:

- **Name**: `rows`
- **Description**: `The number of rows in a result set (maximum is 100).`
- **Summary**: `Rows`
- **Default value**: `10`
- **Is required**: `No`
- **Visibility**: `advanced`

The other fields can be left on the default value. When done, scroll up and select the **← Back** button.
