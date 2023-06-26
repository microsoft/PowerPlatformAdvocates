# Lab 1.2 - Getting the Python API up and running in Azure (Optional)

This workshop is adapting the [ToDo Application Azure sample with a Python API](https://github.com/Azure-Samples/todo-python-mongo-swa-func). The sample comprises of a "complete ToDo application that includes everything you need to build, deploy, and monitor an Azure solution. This application uses the Azure Developer CLI (azd) to get you up and running on Azure quickly, React.js for the Web application, Python for the API, Azure Cosmos DB API for MongoDB for storage, and Azure Monitor for monitoring and logging. It includes application code, tools, and pipelines that serve as a foundation from which you can build upon and customize when creating your own solutions."

If you want to learn more about the sample and it's architecture, you can check out the Github repo linked above. For this workshop, we're only interested in the Python API which will serve as the backend for the ToDo application we'll be building with Power Apps.

So let's jump in and get the ToDo Python API up and running in Azure.

## Step 1 - Download the prerequisites

The following prerequisites are required to install this application. Please ensure that you have them all installed locally.

* [Azure Developer CLI](https://aka.ms/azd-install)
* [Python (3.10+)](https://www.python.org/downloads/)
* [Node.js with npm (16.13.1+)](https://nodejs.org/)

## Step 2 - Installing the azd template (Adapted from [here](https://github.com/Azure-Samples/todo-python-mongo-swa-func#quickstart))

The fastest way for you to get this API up and running on Azure is to use the ```azd up``` command. This single command will create and configure all the necessary Azure resources that we need.

1. Open a terminal (like Command Prompt) and create a new empty folder called ```Python_ToDo```.

```bash
mkdir Python_ToDo
```

2. Then change into the newly created folder.

```bash
cd Python_ToDo
```

3. Run the following command to initialize the project.
```bash
azd init --template todo-python-mongo
```

This command will clone the code to your current folder and prompt you for the following information:

```Environment Name```: This will be used as a prefix for the resource group that will be created to hold all Azure resources. This name should be unique within your Azure subscription.

4. Run the following command to login to your Azure account.

```bash
azd auth login
```

This command will open your browser; prompting you to sign into your Azure account.

Once you have successfully authenticated, you'll see this message in your browser:

![Message confirming that you have authenticated with Azure](/Workshops/JavaAndPowerApps/Lab1.2/assets/azure-confirmation.png)

Close the browser tab and return to the terminal.

5. Run the following command to package a deployable copy of your application, provision the template's infrastructure to Azure and also deploy the application code to those newly provisioned resources.

```bash
azd up
```

This command will prompt you for the following information:

```Azure Subscription```: The Azure Subscription where your resources will be deployed.

```Azure Location```: The Azure location where your resources will be deployed.

> **Note**: This may take a while to complete as it executes three commands: 
> * ```azd package``` (packages a deployable copy of your application)
> * ```azd provision``` (provisions Azure resources)
> * ```azd deploy``` (deploys application code)
>
> You will see a progress indicator as it packages, provisions and deploys your application.

When ```azd up``` is complete it will output the following URLs:

* Azure Portal link to view resources
* ToDo Web application frontend
* ToDo API application

![Screenshot of URLs that were created and deployed](/Workshops/JavaAndPowerApps/Lab1.2/assets/urls.png)

Click the deployed service API URL to launch the ToDo OpenAPI definition.

> **Note**: Bookmark this API URL or keep it somewhere safe for later reference in Lab 3.2.

![Screenshot  of the ToDo OpenAPI definition](/Workshops/JavaAndPowerApps/Lab1.2/assets/openapi-definition.png)

We will be adding some data in the next lab.

> **Note**: The ```azd up``` command will create Azure resources that will incur costs to your Azure subscription. Once you are done with the workshop, You can clean up those resources manually via the Azure portal or with the [```azd down``` command](https://github.com/Azure-Samples/todo-java-mongo#clean-up-resources).

### Next: [Lab 2 - Adding data with the ToDo API](/Workshops/JavaAndPowerApps/Lab2.2/)
