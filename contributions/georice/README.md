Georice processor creates classified maps of the presence of rice fields based on Sentinel 1A and Sentinel 1B imagery. Classification script was created by CNES. Sentinel 1 scenes are acquired from Sentinel-hub (https://www.sentinel-hub.com/).

The processor can not be used without specifying of Sentinel hub credentials:

* client_id
* client_secret
* instance_id

Rice map generation consisting of three steps. Acquisition of orthorectified and Gamma 0 Backscattered scenes from SentinelHub, applying of SAR multi-temporal speckle filter developed by CNES. This step is optional. The last step is the generation of classified rice map itself.

*EuroDataCube version*

``docker run -it -p 5000:5000 eurodatacube/georice``

Command will invoke Jupyter notebook and will be navigated into folder georice/jupyter/ with notebook main.ipynb where is a preprepared example of a processor usage
