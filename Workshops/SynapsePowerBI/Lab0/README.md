## SETTING UP YOUR EVIRONMENT
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

It's time to get to work! In this lab, you will learn about components. The Creator Kit offers a set of components that are ready for reuse and that's what we are going to use in this lab.

🚀 [Lab 1 - Creator Kit and Canvas Apps](Lab1)

### 👩🏾‍💻 Lab 2 - Building End to End with Power BI

In this lab, you'll create two galleries that'll provide a list of all objects available for view in mixed reality. Once the galleries are configured, you'll create a information screen that'll provide details about the object in addition to functionality to view the model in your physical environment.