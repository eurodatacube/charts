
# CARD4L ordering tool

CARD4L tool is a frontend app based on Sentinel Hub services to order on-demand  CARD4L compliant Sentinel-1 RTC data 

CARD4L data specifications for Normalised Radar Backscatter are described [here](https://ceos.org/ard/)

## Data Specifications

| Specification           | Description                                                  |
| ----------------------- | ------------------------------------------------------------ |
| Data source             | Sentinel-1 GRD                                               |
| Backscatter coefficient | RTC Gamma-0 (γ°)                                             |
| Backscatter scaling     | Linear power                                                 |
| Digital Elevation Model | [ Copernicus DEM](https://collections.eurodatacube.com/copernicus-dem/) (10m in EEA, 30m elsewhere) |

Registered Sentinel Hub users  can access archived Sentinel-1 RTC products covering the African continent  from [Sentinel_1 RTC collection](https://collections.eurodatacube.com/card4l/)

## Supported features

- Data search options
- Select the desired time range and area of interest. 
- Configure  evalscript
- Set up bucket name, and output information
- Catalog search and analyse datatakes (a datatake is equivalent to one data acquisition)
- Check the estimated area size and the number of datatakes ( limited to maximum 20 datatakes per request.)
- Create Sentinel Hub BYOC collection
- Create and track orders

## How to order CARD4L compliant Sentinel-1 RTC data 

Refer to the detailed [user guide](https://www.sentinel-hub.com/docs/UserGuide_CARD4L_Tool.pdf) 

## Output

Radar Backscatter bands and STAC metadata are delivered to specified aws bucket. 

## Requirements:

To use the app, Sentinel Hub enterprise account is required


