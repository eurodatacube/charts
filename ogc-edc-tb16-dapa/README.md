# OGC Testbed 16 DAPA experimental interfaces

Within the OGC Testbed 16, a new *Data Access and Processing API* (DAPA) is being defined and developed. EOX and the
 German Aerospace Center (DLR) teamed up for DAPA to develop, evaluate, and test this new interface.
 
 With this application, we have now a first DAPA prototype ready, which can be used in the Jupyter Notebooks listed
  here: https://eurodatacube.com/marketplace?tag=DAPA   

Further information about DAPA in general is provided in the *Call for Participation* document:  
https://portal.opengeospatial.org/files/?artifact_id=91644#PartDAPA

## Step-by-step guide to set up the DAPA service endpoint

1. Register as a user in the EuroDataCube (https://eurodatacube.com/register) and fill out billing information: With
 a free 3-months promotional plan you will not be charged! Find further information on this step in the documentation
 : https://eurodatacube.com/documentation/creating-user-account
 
2. Activate service "EDC EOxHub Workspace" with the free promotional plan: https://eurodatacube.com/marketplace/infra/edc_eoxhub_workspace 

3. Please go back to the Dashboard. After a few seconds the EOxHub - Promotional Plan should be activated and is
 valid for the next three months. On the Dashboard you will find your "Deployed Apps" with a JupyterLab activated
  automatically with the EOxHub Workspace. 
  
 4. Now you can deploy this DAPA app: https://eurodatacube.com/marketplace/apps/ogc-edc-tb16-dapa. Please click on
  the `Deploy app` button and input a name of the app instancen (e.g., ogc-workshop). 
  
 5. You will be automatically redirected to the Dashboard. Scroll down to the "Deployed Apps" part. Deploying the app
  can take a few minutes. Please refresh the page after a while until the "access URL" of the DAPA app is shown. 
  
 6. Please copy the access URL of the DAPA app and open the JupyerLab environment: https://edc-jupyter.hub.eox.at
 . Please login again with your EuroDataCube credentials, select the "Promotional" item, and start the server. 
 
 7. After the JupyerLab environment has been loaded, use the menu on the top to create a new text file ("File > New > Text File"). 
 Within the text editor include the following and replace `YOUR-DAPA-URL` with your DAPA access URL copied before: 
     > DAPA_URL=YOUR-DAPA-URL
 
     Again use the menu on the top to save the file ("File > Save file") and to rename the file to `custom.env` (no
      .txt file ending) ("File > Rename File").
 
 8. You can now use the DAPA Tutorial Notebooks by using the `Execute Notebook` button. You will find all notebooks
  on the marketplace with the DAPA tag filter: https://eurodatacube.com/marketplace?tag=DAPA 
