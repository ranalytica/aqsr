# aqsr
R Package for Accessing EPA AQS data

This package provides an R interface for the EPA Air Quality System (AQS) API. Information about the API, including Terms of Service, is available at https://aqs.epa.gov/aqsweb/documents/data_api.html.


### Installation

The `aqsr` package can be installed by running
```
devtools::install_github("jpkeller/aqsr")
```

### Creating a User Key

The AQS API requires an email address and key for all queries. The key is not used for authentication (as in a password), but it is used for identification. Sign-up using the `aqs_signup()` function, and your key phrase will be emailed.

Once an email address and key are registered, assign them to a list in the working environment using `create_user()`. For example:
```
myuser <- create_user(email="myemail@mydomain",
                    key="mykeyhere")
```
Alternatively, the email address and key can be stored as the environment variables `AQS_EMAIL` and `AQS_KEY`, respectively, to avoid directly storing the values in code that might be part of a public repository. To do this, add the lines 
```
AQS_EMAIL="myemail@mydomain"
AQS_KEY="mykehere"
```
to the .Renviron file in your home directory.
Calling `create_user()` without any argument will then read from these values. Care should still be taken to avoid storing the resulting object in a public repository.

All functions for requesting data from the API require that the list generated by `create_user()` be provided in the `aqs_user` argument.

### Requesting Data

The primary functions for requesting measurements stored in the AQS database are `aqs_annualData()`, `aqs_dailyData()`, and `aqs_sampleData()`. Variations of each function exist for queries targeting a specific criteria, e.g. `aqs_annualData_byState()`.  The underlying function that queries the API is `aqs_get()`, which can be called directly if desired.

### Available Services
A full list of services provided by the AQS API can be accessed by calling `list_services()`. These services include `sampleData`, `signup`, `list`, and `metaData`, among others.  The endpoints for each service are listed in `list_endpoints()`, and the variables required for each endpoint are listed in `list_required_vars()`. For example:

```
# List all services
list_services() 
# List endpoints for "dailyData" service
list_endpoints(service="dailyData") 
# List variables needed for obtaining data using the  "byCounty" endpoint
list_required_vars(endpoint="byCounty") 
```

### Available Data
Information on parameter codes and required input for defining data requests can be obtained from the API using `aqs_list()`, `aqs_list_parameters()`, and the related functions.

For example, to list the available parameter classes (groups of parameters), use the function
```
> aqs_list_classes(aqs_user=myuser)

                      code                                                     value_represented
2              AIRNOW MAPS   The parameters represented on AirNow maps (88101, 88502, and 44201)
27                     ALL                                       Select all Parameters Available
3           AQI POLLUTANTS                                   Pollutants that have an AQI Defined
4                CORE_HAPS                                            Urban Air Toxic Pollutants
5                 CRITERIA                                                   Criteria Pollutants
6                 CSN DART       List of CSN speciation parameters to populate the STI DART tool
7                 FORECAST                        Parameters routinely extracted by AirNow (STI)
8                     HAPS                                              Hazardous Air Pollutants
9           IMPROVE CARBON                                             IMPROVE Carbon Parameters
10      IMPROVE_SPECIATION                  PM2.5 Speciated Parameters Measured at IMPROVE sites
11                     MET                                             Meteorological Parameters
12         NATTS CORE HAPS             The core list of toxics of interest to the NATTS program.
13          NATTS REQUIRED Required compounds to be collected in the National Air Toxics Network
14                    PAMS                            Photochemical Assessment Monitoring System
15                PAMS_VOC               Volatile Organic Compound subset of the PAMS Parameters
16               PM COARSE                                     PM between 2.5 and 10 micrometers
17         PM10 SPECIATION                                             PM10 Speciated Parameters
18       PM2.5 CONT NONREF                                PM2.5 Continuous, Nonreference Methods
19           PM2.5 MASS/QA                                          PM2.5 Mass and QA Parameters
20       SCHOOL AIR TOXICS                                  School Air Toxics Program Parameters
21              SPECIATION                                            PM2.5 Speciated Parameters
22       SPECIATION CARBON                                    PM2.5 Speciation Carbon Parameters
23 SPECIATION CATION/ANION                              PM2.5 Speciation Cation/Anion Parameters
24       SPECIATION METALS                                     PM2.5 Speciation Metal Parameters
25          UATMP CARBONYL                         Urban Air Toxics Monitoring Program Carbonyls
26               UATMP VOC                              Urban Air Toxics Monitoring Program VOCs
```
To list the codes for the criteria air pollutants, use:
```
> aqs_list_parameters(myuser, pc="CRITERIA")
    code        value_represented
2  14129            Lead (TSP) LC
21 42101          Carbon monoxide
3  42401           Sulfur dioxide
4  42602   Nitrogen dioxide (NO2)
5  44201                    Ozone
6  81102    PM10 Total 0-10um STP
7  85129     Lead PM10 LC FRM/FEM
8  88101 PM2.5 - Local Conditions
```






