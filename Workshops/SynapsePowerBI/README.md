# End to End Data Solution with Power BI and Synpase Workshop using SerengetiDataLab

An E2E solution of the Data Resources on Azure using the Snapshot Serengeti dataset. This E2E solution focuses Azure Synapse Analytics and Power BI

## 🤔 Prerequisites
1. An active Azure Subscription. if you do not have one you can [create a free Azure Subscription](https://azure.microsoft.com/en-in/free/?WT.mc_id=data-89327-jndemenge). 
2. Appropriate permissions within the Azure subscription that will allow for creating resources, assigning roles, registering providers and deleting resources.

    To proceed you need to deploy the following azure resources:
    * Microsoft.KeyVault
    * Microsoft.Synapse
    * Microsoft.ContainerRegistry
    * Microsoft.Storage
    * Microsoft.MachineLearningServices
    * Microsoft.Insights
    * Microsoft.OperationalInsights
    * Microsoft.Sql


    > :warning: In case any of these resources providers are not registered, follow the [steps from the documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types/?WT.mc_id=data-89327-jndemenge) to register them. 

3. Fork this repository to your GitHub account so that you can link it to the synapse workspace.


## 🚀 Lab Deployment
1. Right-click or `Ctrl + click` the button below to open the Azure Portal in a new tab and begin deployment.

    [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJcardif%2FSerengetiDataLab%2Fmain%2Fdeploy%2Fmain.json)

2. On the opened azure portal custom deployment page select the subscription from the drop-down, next click on the create new and provide a unique name to your resource group then select a [valid location](https://azure.microsoft.com/en-gb/explore/global-infrastructure/products-by-region/?products=machine-learning-service,synapse-analytics&regions=all&WT.mc_id=data-89327-jndemenge) for the resources. 

    ![](/images/lab_deployment.png)

3. Provide the SQL login password which should contain at least `8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character` then click on the **Review + create** button.

4. Once the validation is done, click on the **Create** button to start the deployment.

5. The deployment should take approximately 10 minutes to complete. Once the deployment is completed, you can navigate to the resource group to check the deployed resources.

6. If Successful you should see 10 resources in your resource group.
    ![](/images/deployed_resources.png)

##  🧪 Lab Configuration
1. Click on the Synapse Workspace resource and then launch Synapse Studio. 
    ![](/images/open_synapse_studio.png)

2. We'll need to link the synapse workspace to the repo you forked in the pre-requisites so that we can import the necessary notebooks and scripts.  Click on `Manage` > `Git Configuration` > `Configure` 
    ![](/images/configure_git_01.png)

3. On the wizard that opens, select the Repository type to be `GitHub` the GitHub repository owner as `your GitHub username`, then proceed to authenticate to your GitHub. 

3. After successful authentication, select the repository name from the dropdown. For the `Collaboration branch`select the default `main` branch and similarly for the  `Publish branch` select the `main` branch.

4. The `Root folder` input `synapse-worspace` then finally click **Apply**

    ![](/images/configure_git_02.png)

5. When this completes select your working branch then save.
> :information_source: To learn more about Git & source control in a Synapse Workspace [read more here](https://learn.microsoft.com/en-us/azure/synapse-analytics/cicd/source-control/?WT.mc_id=data-89327-jndemenge)

## 🧹 Clean Up Resources
To save up on your cloud costs,delete the resource group that was created for this lab, after completing the workshop. To do so, navigate to the resource group and click on the delete button.
  
  ![](/images/delete_rg.png)




## Agenda
The Agenda for this workshop will be done in 2 labs, the Lab 1 will focus on the backend of data and how work with the datasets and Lab 2 will be how you connect to the data source and create a report.

### 👩🏾‍💻 Lab 1 - Create a Data Solution on Azure Synapse Analytics with Snapshot Serengeti

This Lab describes a solution that combines a range of Azure services to ingest, store, transform, and serve data and insights from different sources:

Semi-structured data - these are Json files that contain the split of the dataset into train, test, and validation sets.
Unstructured data - these are the images in the dataset and the zipped files that contain the metadata of the images.

🚀 [Lab 1 -  Create a Data Solution on Azure Synapse Analytics with Snapshot Serengeti](Lab1)


### 👩🏾‍💻 Lab 2 - Building End to End with Power BI

In this lab, you will have your data in synapse and you will need to connect to the data source, model your data and buils a report in Power BI.

🚀 [Lab 2 -  Building End to End with Power BI](Lab2)
