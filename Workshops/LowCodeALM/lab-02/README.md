# Lab 02 - Work with solutions

In this lab you will learn the following:

* Uploading assets to OneDrive
* Import a solution zip file
* Export a solution from an environment
* Unpack a solution
* Inspect the solution folders
* Clone a solution

## Task 1: Uploading assets to OneDrive

In this task, you will be uploading a couple of assets to your OneDrive. The solution we will be working with later uses **OneDrive for Business** as a connector to retrieve files and images and their respective information directly from OneDrive to be used in a Canvas App.

1. In the browser, navigate to [OneDrive](https://portal.office.com/onedrive) and sign in with your credentials for this workshop

    Since this is most probably your first time signing into OneDrive with these credentials, you will see a welcome screen.

2. Click **Your OneDrive is ready**

    ![Your OneDrive is ready screenshot](assets/onedrive-is-ready.png)

3. Once inside OneDrive, select **My files** on the left navigation bar.

    Now you will be downloading the assets needed to upload to your OneDrive.

4. In a new browser tab, navigate to the [Coral Collection.zip](../assets/OneDrive%20folder/Coral%20Collection.zip) folder in this repository

5. Download the zip file to your computer

    TODO: Add screenshot of download and update download instructions when repo has been moved to official workshop repo

6. Navigate to the folder where you downloaded the zip file and extract the contents. You should now have a folder called **Coral Collection**.

7. Go back to your OneDrive tab and click **Upload** and select **Folder**. 

8. Navigate to the **Coral Collection** folder and select it.

9. Click **Upload** to upload the folder to your OneDrive.

    This may take a few minutes depending on your internet connection. Once the upload is complete, you will see the **Coral Collection** folder in your OneDrive. Open the folder to find 2 additional folders; _Models_ and _Photos_, as well as a CoralCollection.xlsx file.

    ![Screen of OneDrive content](assets/onedrive-contents.png)

## Task 2: Import a solution zip file

In this task you will import a solution zip file into your Developer Environment. The solution that you will be working with throughout this workshop is from our [Mixed Reality Workshop](https://github.com/microsoft/PowerPlatformAdvocates/blob/main/Workshops/MR/README.md). 

Let's open up a new Terminal window. Click on the Burger menu icon in the top left corner and then hover over **Terminal** and then click **New Terminal**

In your codespace terminal, type the following command to import the solution zip file into your **Dev** environment. 

```bash
pac solution import --path assets/solution/MR_Solution.zip
```

Once the import is complete, you will see a message in the terminal saying ```Solution Imported successfully.```

![Solution Imported Successfully](assets/solution-import-success.png)

## Task 3: Export a solution from an environment

For this task, we will be exporting the solution that we just imported into our **Dev** environment.

In your codespace terminal, type the following command to export the solution zip file from your **Dev** environment. 

```bash
pac solution export --path assets/export/Exported_MR_solution.zip --name MixedRealityWorkshop
```

Once the export is complete, you will see a message in the terminal saying ```Solution export succeeded.```

![Solution export succeeded](assets/solution-export-success.png)

## Task 4: Unpack the exported solution

Now, we will be unpacking the solution zip file that we just exported from our **Dev** environment.

In your codespace terminal, type the following command to unpack the solution zip file from your **Dev** environment. 

```bash
pac solution unpack --zipfile assets/export/Exported_MR_solution.zip --folder assets/export/Unpacked_MR_solution
```

Once the unpack is complete, you will see a message in the terminal saying ```Unpacked Solution```

![Unpacked Solution](assets/unpacked-solution.png)

## Task 5: Commit changes

We have made quite a number of changes. Let's commit those changes to our forked repository. To commit is to save the changes that you have made to your repository.

1. In the left navigation bar, click on the **Source Control** icon.

    ![Source Control icon](assets/source-control-icon.png)

2. In the **Source Control** panel, you will see a list of files that have been changed or have been added. 
3. Type in a commit message in the **Message** box. For example, ```Added unpacked MR solution```. A commit message is a short description of the changes that you have made.
4. Click the **✓ Commit** button to commit the changes.

    ![Commit changes](assets/commit-changes.png)

5. A popup dialog may appear alerting you of the fact that there are no staged changes. It may also ask you to stage all changes and commit them directly. Select **Yes**

    ![Stage all changes](assets/stage-all-changes.png)

Now because we're using a codespace, the commit will save the changes inside of this codespace. Let's sync changes to our forked repository.

6. Click **Sync Changes** in the Source Control panel.
7. And then on the popup dialog, click **Ok** to confirm that this action will pull and push commits from and to "origin/main"

Now our codespace is synced with our forked repository.

## Task 6: Clone a solution from an environment

For this task, we will be using the ```pac solution clone``` command to clone the solution inside of the **Dev** environment. This command will do exactly what we did in Task 4 and 5 but in one command instead of two.

In your codespace terminal, type the following command to clone the solution from your **Dev** environment.

```bash
pac solution clone --name MixedRealityWorkshop --outputDirectory assets/export --processCanvasApps
```

Once the clone is complete, you will see a message in the terminal saying:

 ```
 Solution clone extract succeeded.
 Dataverse solution project with name 'MixedRealityWorkshop' created successfully in: '/workspaces/EPPC23-ALM/assets/export'
 ```

![Solution clone extract succeeded](assets/solution-clone-extract-success.png)

## Task 7: Commit Changes

Now that we've added a new folder, let's go ahead and commit these changes as well.

1. In the left navigation bar, click on the **Source Control** icon

2. In the **Source Control** panel, you will see a list of files that have been changed or have been added. Note that this list is MUCH longer than the previous commit. This will be explained shortly

3. Type in a commit message in the **Message** box. For example, ```Added cloned MR solution```

4. Click the **✓ Commit** button to commit the changes

5. A popup dialog may appear alerting you of the fact that there are no staged changes. It may also ask you to stage all changes and commit them directly. Select **Yes**

6. Click **Sync Changes** in the Source Control panel

7. And then on the popup dialog, click **Ok** to confirm that this action will pull and push commits from and to "origin/main"

## Task 8: Review export/unpack folder vs clone folder

TODO

## Task 9: Review solution on the Maker Portal

TODO

## Next lab

This is the end of lab 02, select the link below to move to the next lab.

[⏭️ Move to lab 03](../lab-03/README.md)
