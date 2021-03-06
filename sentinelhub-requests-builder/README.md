# Requests Builder


Request builder tool for creating [Sentinel Hub](https://www.sentinel-hub.com/develop/api/) Requests.


### Supported features (13/07/2020):


  - Create a Process API Request and see on real-time the curl command generated
  - Select a bounding box or polygon with two different CRS (EPSG:3857 or EPSG:4326)
  - See the response on the request and download it
  - Parse a request to see the form filled automatically (curl commands generated by the tool and the JSON body of the request are supported)
  - Create and track Batch Requests
  - Create TPDI Requests using Airbus or PlanetScope data.
  - Create OGC (WMS/FIS) requests
  - Output SH-PY/SH-JS code on the request preview (PROCESS)
  - Support to Data Fusion
  - Create BYOC requests

### Production deployment

This repository production deployment (based on latest tag) can be found on the following [link](https://apps.sentinel-hub.com/requests-builder/).

### How to run it locally.

1. Clone the repository using `git clone https://github.com/sentinel-hub/requests-builder`
2. Move to the project folder: `cd requests-builder` 
3. Install all the dependencies: `npm install`.

To get authentication running you will need to do the following:

- Go to your dashboard: https://apps.sentinel-hub.com/dashboard/#/ 
- Under `User Settings` create a new OAuth Client using `IMPLICIT` grant type and the following redirect url: http://localhost:3000/oauthCallback.html
4. Inside the root project folder, copy the `.env.example` to an `.env` using: `cp .env.example .env`
5. Fill up the `.env` file with the following values:
    * REACT_APP_CLIENTID=<your_client_ID_from_previous_step>
    * REACT_APP_AUTH_BASEURL=https://services.sentinel-hub.com/
    * REACT_APP_ROOT_URL=http://localhost:3000/
6. Finally, start your local development server using: `npm start` 
