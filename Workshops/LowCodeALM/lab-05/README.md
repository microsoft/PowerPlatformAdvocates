# Lab 05 - Add an approval before deploying to production

This lab will consist of the following tasks:

* Extending the pipeline in the Deployment Pipeline Configuration App
* Create a cloud flow that handles the approval

## Task 1: Extending the pipeline in the Deployment Pipeline Configuration App

In this task, you will learn how to extend the pipeline and add an approval before deploying to production.

1. Go to the [maker portal](https://make.powerapps.com)
1. Check if you are in the `Dev` environment and if not, switch to that environment
    ![](./assets/check-environment-dev.png)
1. Look for the `Deployment Pipeline Configuration` app, hover on it and select the play button
    ![](./assets/extend-pipeline-open-deployment-pipeline-configuration-app.png)
1. This will open the `Deployment Pipeline Configuration` app and will enable you to modify your pipeline. Select the `My first pipeline` pipeline
    ![](./assets/extend-pipeline-select-pipeline.png)
1. On the next screen, scroll down to the deployment stages and select the `Deploy to prod` deployment stage by selecting the name
    ![](./assets/extend-pipeline-select-deploy-to-prod-stage.png)
1. Enable the check box in the `Pre-Deployment Step Required` field and select the `Save & Close` button in the command bar at the top
    ![](./assets/extend-pipeline-enable-pre-deployment-step.png)
1. Check in the Deployment Stages subgrid if the `Pre-Deployment Step Required` field is changed to yes. If that's correct, you are done with this task, if not, go back to step 5 and try again 
    ![](./assets/extend-pipeline-enable-pre-deployment-step-saved.png)

## Task 2: Create a cloud flow that handles the approval

In this task, you will learn how to create an approval flow that will handle the approval before deploying to production.

1. Go to the [maker portal](https://make.powerapps.com)
1. Check if you are in the `Dev` environment and if not, switch to that environment
    ![](./assets/check-environment-dev.png)
1. Select `Flows` in the left navigation, select `New flow` in the command bar at the top and select `Automated cloud flow` 
    ![](./assets/extend-pipeline-create-automated-cloud-flow.png)
1. This will open a pop up where you can name your flow and configure a trigger. Name your flow `My first pipeline production approval`, search for `action`, select the Microsoft Dataverse trigger called `When an action is performed` and select the blue `Create` button.  
    ![](./assets/extend-pipeline-cloud-flow-trigger.png)
1. Configure the trigger inputs by making it look like the screenshot below
    ![](./assets/extend-pipeline-cloud-flow-trigger-inputs.png)
1. Select the ellipsis at the top-right corner of the trigger and select settings to open up the trigger settings
    ![](./assets/extend-pipeline-cloud-flow-trigger-open-settings.png)
1. Select the `Add` button below trigger conditions to add a trigger condition in the trigger settings
    ![](./assets/extend-pipeline-cloud-flow-trigger-settings-add-condition.png)
1. Add the following trigger condition to make sure the cloud flow only triggers when the pipeline name is equal to `My first pipeline`
    `@equals(triggerOutputs()?['body/OutputParameters/DeploymentPipelineName'], 'My first pipeline')`
1. Select the `Add` button below the trigger condition above to add another trigger condition
    ![](./assets/extend-pipeline-cloud-flow-trigger-settings-add-another-condition.png)
1. Add the following trigger condition to make sure the cloud flow only triggers when the pipeline name is equal to `Deploy to prod`
    `@equals(triggerOutputs()?['body/OutputParameters/DeploymentStageName'], 'Deploy to prod')`
1. Select the `Done` button at the bottom of the trigger card to save the trigger conditions
    ![](./assets/extend-pipeline-cloud-flow-trigger-settings-save-condition.png)
1. Select the `New step` button to add an action to start and wait for an approval
    ![](./assets/extend-pipeline-cloud-flow-add-action.png)
1. Search for approval and select the `Start and wait for an approval` action
    ![](./assets/extend-pipeline-cloud-flow-add-approval.png)
1. Configure the approval action like the screenshot below:  
      
    For approval type, select `Approve/Reject - First to respond`  
    For title, add `Approval requested for `, select `ActionOutputs DeploymentPipelineName` from the dynamic content fields on the right, add ` - `, and select another dynamic content field from the right called `ActionOutputs DeploymentStageName`.  
    For assigned to, add the email address of your user. In production scenarios, this would be an admin that would approve deployments.  
    For details, add `# Deployment notes`, add a hard return, and select the `ActionOutputs DeploymentNotes` field from the dynamic content fields on the right.  
    For item link, select the `ActionOutputs StageRunDetailsLink` field from the dynamic content fields on the right.  
    For item link description, add `Stage Run Details`.  
      
    ![](./assets/extend-pipeline-cloud-flow-configure-approval.png)
1. Select the `New step` button to add a condition below the `Start and wait for an approval` action
    ![](./assets/extend-pipeline-cloud-flow-new-step-after-start-approval.png)
1. Add the `Condition` action
    ![](./assets/extend-pipeline-cloud-flow-add-condition.png)
1. Add the `Outcome` dynamic content field from the `Start and wait for an approval` action in the first input field of the condition
1. Add the text `Approve` to the other input field of the condition
1. Select the `New step` button in the `If yes` part of the condition and add the `Perform an unbound action` action from the Microsoft Dataverse connector
    Select `UpdatePreDeploymentStepStatus` as Action Name.  
    Add `20` as the PreDeploymentStepStatus (20 is the status ID for approved).  
    Add the `Response summary` dynamic content field from the `Start and wait for an approval` action as Comments.  
    Add the following expression via the expression panel to the Comments field: `first(outputs('Start_and_wait_for_an_approval')?['body/responses'])?['comments']`  
    ![](./assets/extend-pipeline-cloud-flow-unbound-action1-expression.png)      
    Add the `ActionInputs StageRunId` dynamic content field from the `When an action is performed` trigger as StageRunId.  
1. Select the `New step` button in the `If no` part of the condition and add the `Perform an unbound action` action from the Microsoft Dataverse connector
    Select `UpdatePreDeploymentStepStatus` as Action Name.  
    Add `30` as the PreDeploymentStepStatus (30 is the status ID for rejected).  
    Add the `Response summary` dynamic content field from the `Start and wait for an approval` action as Comments.  
    Add the following expression via the expression panel to the Comments field: `first(outputs('Start_and_wait_for_an_approval')?['body/responses'])?['comments']`  
    ![](./assets/extend-pipeline-cloud-flow-unbound-action2-expression.png)  
    Add the `ActionInputs StageRunId` dynamic content field from the `When an action is performed` trigger as StageRunId.  
      
    ![](./assets/extend-pipeline-cloud-flow-unbound-actions.png)
1. Save the flow

## Task 3: Test out the approval

TODO test out the approval
