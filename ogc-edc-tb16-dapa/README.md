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

## Tutorials
We have made the following tutorials as Jupyter Notebooks available: 
1. [DAPA Tutorial #1: Cube - Sentinel-2 - OGC Testbed 16](https://eurodatacube.com/marketplace/notebooks/contributions/DAPA/DAPA_Tutorial_1_-_Cube_-_Sentinel-2.ipynb)
2. [DAPA Tutorial #2: Area - Sentinel-2 - OGC Testbed 16](https://eurodatacube.com/marketplace/notebooks/contributions/DAPA/DAPA_Tutorial_2_-_Area_-_Sentinel-2.ipynb)
3. [DAPA Tutorial #3: Timeseries - Sentinel-2 - OGC Testbed 16](https://eurodatacube.com/marketplace/notebooks/contributions/DAPA/DAPA_Tutorial_3_-_Timeseries_-_Sentinel-2.ipynb)
4. [DAPA Tutorial #4: Value - Sentinel-2 - OGC Testbed 16](https://eurodatacube.com/marketplace/notebooks/contributions/DAPA/DAPA_Tutorial_4_-_Value_-_Sentinel-2.ipynb)
5. [DAPA Tutorial #5: DEM example – OGC Testbed 16](https://eurodatacube.com/marketplace/notebooks/contributions/DAPA/DAPA_Tutorial_5_-_DEM.ipynb)

## API Documentation

This API definition has been developed by EOX and DLR. This definition focuses on the provision of raster/coverage data, but might also be applied for scattered time-series data. 

**Please note:** This is an early draft proposal of the API definition. It is subject to change within the time frame of OGC Testbed 16. Also other proposals exist with different API definitions.

**Overview of URL endpoints:**

    /oapi/collections/{collection}/dapa/
        fields/
        cube/
        area/
        timeseries/
            area/
            position/
        value/
            area/
            position/

The first hierarchy level after /dapa/ describes the output type of the data requested (except for "fields"): 
- cube: 2d raster time-series (each with one or multiple bands)
- area: Single 2d raster (with one or multiple bands)
- timeseries: 1d time-series (each with values from one or multiple fields)
- value: Single value (with values from one or multiple fields)

The second hierarchy level after /dapa/ describes the input geometry (if not implicitly given from the output type):
- area: Polygon/Bounding box
- position: Point

With this definition, aggregation is automatically conducted based on the `aggregate` parameter to achieve
 the output type requested (see the Parameter section below). 

### /collections/{collection}/dapa/fields

Output fields/variables/properties/bands to be included in the request/processing/aggregation. 

The `fields` parameter for the DAPA request can consists values either from the selected collection (e.g., all band
 names from Sentinel-2) or declared dynamically (e.g., bands algebra NDVI=(B08-B04/B08+B04)) (see the Parameter
  section below).

### /collections/{collection}/dapa/cube

**2d raster time-series** (each with one or multiple bands)

- Available only if the collection is a multi-temporal raster dataset. 

**Parameters:**
- bbox/geom/cell
- time
- (fields) defaults to all fields (bands) available
- format

**Example UC 1.1:** Produce an animated video of ozone concentration from Sentinel-5p for a given time and space

    /collections/S5PL2/dapa/cube?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&bbox=11.49,48.05,11.66,48.22&fields=SO2&format=video/avi

Results in an animated video.

**Example UC 2.1:** Retrieve a raster time-series of NDVI calculated from Sentinel-2 scenes for a given time and space 

    /collections/S2L1C/dapa/cube?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&bbox=11.49,48.05,11.66,48.22&fields=NDVI=(B08-B04/B08+B04)&format
    =application/metalink

Results in a metalink file with download links to multiple raster files (one per time).

### /collections/{collection}/dapa/area

**Single 2d raster** (e.g., results in TIFF with num(aggregates) x num(fields) bands)

- If the collection is a **multi-temporal raster dataset**, **aggregation over time** is automatically conducted
 based on the `aggregate` parameter.
- If the collection is a **single raster dataset**, **no aggregation over time** is conducted. 

**Parameters:**
- bbox/geom/cell
- time
- aggregate
- (fields) defaults to all fields (bands) available
- (format) defaults to image/tiff

**Example UC 1.2:** Retrieve the maximum sulphor dioxide concentration in a given time span as a single coverage
 (aggregation over time)

    /collections/S5PL2/dapa/area?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&bbox=11.49,48.05,11.66,48.22&aggregate=max&fields=SO2

Results in TIFF with a single field/band: SO2_max

**Example UC 2.2:** Retrieve the minimum and maximum NDVI and NDBI in a given time span (aggregation over time)

    /collections/S2L2A/dapa/area?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&bbox=11.49,48.05,11.66,48.22&aggregate=min,max&fields=NDVI=(B04-B08)/(B04+B08),NDBI=(B01-B02)/(B01+B02)

Results in TIFF with 4 fields/bands: NDVI_min, NDVI_max, NDBI_min, NDBI_max.


### /collections/{collection}/dapa/timeseries

#### /collections/{collection}/dapa/timeseries/area

**1d time-series** (each with values from one or multiple fields)

- If the collection is a **multi-temporal raster dataset**, **aggregation over space** is automatically conducted
 base on the `aggregate` parameter.
 - Can not be used for a single raster dataset

**Parameters:**
- bbox/geom/cell
- time
- aggregate
- (fields) defaults to all fields (bands) available
- (format) defaults to text/csv

**Example UC 1.3:** Retrieve the maximum sulphor dioxide concentration in a given area as a time-series (aggregation
 over space)

    /collections/S5PL2/dapa/timeseries/area?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&bbox=11.49,48.05,11.66,48.22&aggregate=max&fields=SO2

Results in CSV with two columns: date and SO2_max

#### /collections/{collection}/dapa/timeseries/position

**1d time-series** (each with values from one or multiple fields)

- Extraction of a time series at a point specified in the request
- No aggregation is conducted because only a single pixel is extracted
- Can not be used for a single raster dataset

**Parameters:**
- point
- time
- (fields) defaults to all fields (bands) available
- (format) defaults to text/csv

**Example UC 1.3:** Retrieve the maximum sulphor dioxide concentration at a given point as a time-series

    /collections/S5PL2/dapa/timeseries/area?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&point=11.49,48.05&fields=SO2

Results in CSV with two columns: date and SO2

### /collections/{collection}/dapa/value

#### /collections/{collection}/dapa/value/area

**Single value** (with values from one or multiple fields)

- If the collection is a multi-temporal dataset, **aggregation over space and time** is automatically conducted base on
 the `aggregate` parameter.
- If the collection is a single dataset/coverage, **aggregation over space** is automatically conducted base on
 the `aggregate` parameter.

**Note:** If multiple methods are given in the `aggregate` parameter or multiple `fields` are given, text/plain is not
 sufficient! `TODO`

**Parameters:**
- bbox/geom/cell
- time
- aggregate
- (fields) defaults to all fields (bands) available
- (format) defaults to text/plain


**Example:** Retrieve the minimum sulphor dioxide concentration in a given area and time span (aggregated over space and
 time)

    /collections/S5PL2/value/area?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&bbox=11.49,48.05,11.66,48.22&aggregate=min&fields=SO2&format=text/plain

Results in a single value

#### /collections/{collection}/dapa/value/position

**Single value** (with values from one or multiple fields)

- If the collection is a **multi-temporal raster dataset**, **aggregation over time** is automatically conducted
 based on the `aggregate` parameter.
- If the collection is a **single raster dataset**, **no aggregation** is conducted.

**Note:** If multiple methods are given in the `aggregate` parameter or multiple `fields` are given, text/plain is not
 sufficient! `TODO`

**Parameters:**
- point
- time
- aggregate
- (fields) defaults to all fields (bands) available
- (format) defaults to text/plain


**Example:** Retrieve the minimum value of all fields (bands) of Sentinel-5p at a given point in a given time
 span (aggregated over time).

    /collections/S5PL2/value/position?time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z&point=11.49,48.05&aggregate=min&format=application/json

Results in JSON file with a single value for each field (band): SO2_min, O3_min, NO2_min, ...

### Parameters

#### `point`

Specific location in `x,y`, WKT (?), or reference to point (Link to feature?) `TODO`

**Example:**

    &point=14.2,15.3

#### `bbox`

Bounding box in `minx,miny,maxx,maxy` or reference to geometry (Link to feature?) `TODO`

**Example:**

    &bbox=12.3,0.3,14.4,2.3

### `geom`

WKT geometry or reference to geometry (Link to feature?) `TODO`

**Example:**

    &geom=POLYGON ((...))

#### `time`

Time point or time span

**Examples:**

Start/End

    &time=2018-05-04T12:12:12Z/2018-06-04T12:12:12Z

Instant

    &time=2018-05-04T12:12:12Z

Start and period after (not yet supported)

    &time=2018-05-04T12:12:12Z/P5D

End and period before (not yet supported)

    &time=P5D/2018-05-04T12:12:12Z

Whole day

    &time=2018-05-04

Whole month

    &time=2018-05

Whole year

    &time=2018


#### `fields`

Comma-separated list of fields, derived (calculated) fields are possible

**Syntax:**

    field-parameter = field-selection , { ',' , field-selection }

    field-selection = identifier | ( identifier , '=' , expression )


**Please note:** + sign need to be URL encoded to %2B

**Examples:**

Listing:

    &fields=B04,B08

Simple aliasing:

    &fields=NIR=B08,RED=B04

Derived field:

    &fields=NDVI=(B04-B08)/(B04+B08)

Combined example:

    &fields=NIR=B08,RED=B04,NDVI=(RED-NIR)/(RED+NIR)


#### `aggregate`

Specify aggregation

**Syntax:**

    aggregate-param = method { ',' , method }

    method = identifier  [ '(' , method-arg , ')' ]

**Examples:**

Aggregation (min+max)

    aggregate=max,min

Aggregation (min+max+linear average)  (`avg(linear)` not yet supported - only avg)

    aggregate=max,min,avg(linear)


#### `cql` (not yet supported)

Metadata filter using CQL

**Example:**

    cql=cloudCover < 0.5


#### `datafilter` (not yet supported)

**Syntax:**

    datafilter-parameter = datafilter , { ',' , datafilter }

    datafilter = boolean-expression


**Example:**

    datafilter=area(NDVI > 1) >= 0.5


#### `format` (not yet supported)

##### cube formats (~3D)

- AVI
- application/x-netcdf
- application/metalink
- WCS-EO DatsetSeries / CIS

##### coverage (~2D)

- image/tiff

##### timeseries (~1D)

- text/csv
- application/json

##### value (~0D)

- text/plain
- application/json
