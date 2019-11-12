# NDVI Timeline Viewer
A simple configurable NDVI timeline viewer connected to Euro Data Cube's Sentinel-Hub service.

## Live Demo
[**Demonstrator deployed on EOxHub**](https://ndvi-timeline-0652eab6-e5d0-11e9-a359-2a2ae2dbcce4.edc.hub.eox.at) 

## Requirements
[![Euro Data Cube / Sentinel-Hub](https://img.shields.io/badge/Service%20Requirements-Sentinel--Hub-brightgreen)](/marketplace/services/eurodatacube/sentinel-hub)

This app connects to the [Euro Data Cube Sentinel-Hub Service](https://hub.eox.at/services/eurodatacube/sentinel-hub) for EO data. To deploy this app a binding on a Sentinel-Hub subscription with name `ndvi-timeline` is required.

## Usage
During deployment, you are able to define a custom polygon as area of interest (AOI). The default polygon is defined as `INPUT_GEOMETRY=POLYGON ((12 42.1, 12.1 42.1, 12.1 41.6, 12 41.6, 12 42.1))`.

## Additional Information
Additional information on the Euro Data Cube project can be found on the [Euro Data Cube Website](https://eurodatacube.com/).