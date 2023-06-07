# Lab 04 - Deploy the solution to test and production environments

In this lab, you will work on the outer loop. You will perform the following tasks:

* Deploy the pipelines solution to your dev environment
* Setup your first pipeline
* Create a first deployment of the imported solution from lab 02

## Task 1: Deploy the pipelines solution to your dev environment

In this task, you will learn how to install the pipelines for Power Platform solution in your dev environment. This solution is needed to configure pipelines. Normally you would install this on a seperate environment, but in this case, you will install it on the dev environment.

1. Go to the [Power Platform Admin Center](https://aka.ms/ppac)
![](./assets/admin-center.png)
1. Select the `Dev` environment you created before
1. In the command bar at the top, select `Resources` and `Dynamics 365 apps` 
![](./assets/dev-env-dynamics-365-apps.png)
1. Here you can find the apps that are installed on your `Dev` environment by default. Select the `Install App` button in the command bar at the top
![](./assets/dev-env-install-app.png)
1. In the sidebar that opens, scroll all the way down select the `Power Platform Pipelines` app and select the `Next` button at the bottom of the sidebar
![](./assets/dev-env-select-app.png)
1. Next, make sure to agree to the terms and select the `Install` button at the bottom of the sidebar
![](./assets/dev-env-agree-terms.png)

This process will take a couple of minutes, you can refresh the page by selecting the `Refresh` button in the command bar at the top.

When finished, you can go to the [maker portal](https://make.powerapps.com) and select the right environment (`Dev`). If all went well, you should be able to see the `Deployment Pipeline Configuration` app in the Apps section in the maker portal.

![](./assets/dev-env-pipelines-installed.png)
