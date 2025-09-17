
<!-- README.md is generated from README.Rmd. Please edit that file -->

# seamonas <img src="man/figures/seamonashexsticker.png" align="right" height="200" />

<!-- badges: start -->
<!-- badges: end -->

**seamonas** provides easy access to information based on guidelines for
monitoring seabirds at sea. It includes detailed table content and a
sample dataset to support implementation. Information based on the
HELCOM Monitoring Guidelines for Seabirds at Sea [ESAS
database](https://helcom.fi/wp-content/uploads/2021/11/HELCOM-Monitoring-guidelines-for-seabirds-at-sea-monitoring.pdf).

## About

**seamonas** contains:

- A **list of 549 species** across morphological separated groups.
- Harmonized **column names** and guidance for completing each entry.
- Unified **descriptions** for field entries, includes abiotic
  structures, activity codes, associations.
- One trip example from a fictional monitoring containing basic **trip**
  information.  
- One survey example from a fictional monitoring containing **survey**
  information.
- One survey example from a fictional monitoring containing **species
  detected and specifications**.

## Installation

You can install the development version of seamonas from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("MiriamLL/seamonas")
```

## Start

Load the package

``` r
library(seamonas)
```

## Explanations

`seamonas` contains:  
- Harmonized **column names** and guidance for completing each entry.

``` r
data(Column_Descriptions)
```

### Examples of use

``` r
library(tidyverse)
```

``` r
seamonas::Column_Descriptions %>%
  select(starts_with('Trip'))%>%
  drop_na()%>%
  filter(Trip_Name=='DATE')
#>   Trip_Name                Trip_Description
#> 1      DATE Survey date in YYYYMMDD format.
```

## Descriptions

`seamonas` contains:  
- Unified **descriptions** for field entries, includes abiotic
structures, activity codes, associations.

``` r
data(Code_Descriptions)
```

### Examples of use

``` r
library(tidyverse)
```

``` r
seamonas::Code_Descriptions %>%
  select(starts_with('ACT'))%>%
  drop_na()
#> # A tibble: 6 × 2
#>   ACTIVITY_CODE ACTIVITY_DESCRIPTION    
#>           <dbl> <chr>                   
#> 1             0 Unknown                 
#> 2             1 Swimming                
#> 3             2 Flying                  
#> 4             3 Submerged               
#> 5             4 Breaching surface       
#> 6             5 Associated with platform
```

## Trip

`seamonas` contains:  
- One trip example from a fictional monitoring containing basic **trip**
information.

``` r
data(Trip_test)
```

**Field descriptions**:

- `TRIP`: Used for descriptions of the columns. Data type:
  character/text/string (40 characters).<br>
- `TRIP_ID`: Sequential number of each survey day and any change in
  relevant fields. Data type: numeric (2 characters).<br>
- `Dataset_ID`: Numerical identifier of the dataset in the database.
  Data type: numeric (20 characters).<br>
- `CRUISENO`: Unique code identifying the survey. Data type:
  character/text/string (40 characters). <br>
- `OWPAS`: Identifier for the contracting authority. Data type:
  character/text/string (40 characters). <br>
- `PROJECT`: Identifier for the project. Data type:
  character/text/string (40 characters). <br>
- `CLUSTER`: Identifier for the cluster or study area. Data type:
  character/text/string (40 characters). <br>
- `LAB`: Name of the company conducting the survey. Data type:
  character/text/string (40 characters).<br>
- `SCIENTIST`: Name of the responsible scientist at the surveying
  company. Data type: character/text/string (60 characters). <br>
- `DATATYPE`: Type of data collected (e.g., Seabird Monitoring). Data
  type: character/text/string (60 characters). <br>
- `TECHNIQUE`: Survey method used (e.g., video or still camera for
  digital surveys). Data type: character/text/string (60 characters).
  <br>
- `OBSERVER`: Identifier of the surveyor or aircraft operator. Data
  type: character/text/string (40 characters).<br>
- `PLANE`: Identifier of the aircraft used. Data type:
  character/text/string (40 characters). <br>
- `NUMBER_OF_PLANES`: Number of planes used in the survey. Data type:
  numeric (2 characters).<br>
- `DOUBLE_PLATFORM`: Define if survey include parallel flights (‘Yes’or
  ’No’). Data type: character/text/string (40 characters).<br>
- `DATE`: Survey date in YYYYMMDD format or text (8 characters).<br>
- `STARTTIME`: Time of start of survey in hh:mm:ss format. Data type:
  time (hh:mm:ss) or text (8 characters).<br>
- `STARTTIME`: Time of the end of the survey in hh:mm:ss format. Data
  type: time (hh:mm:ss) or text (8 characters). <br>
- `CAMERA_SYSTEM`: Description of the camera system used. Data type:
  character/text/string (40 characters). <br>
- `RESOLUTION`: Numerical value of the resolution at sea surface. Data
  type: numeric (2 characters). <br>
- `PLANE_FLIGHT_HEIGHT_PLANNED`: Numerical value of planned flight
  altitude. Data type: numeric (4 characters).<br>
- `STRIP_WIDHT`: Numerical value of the width of the survey strip. Data
  type: numeric (3 characters). <br>
- `PLANE_SPEED`: Numerical value for speed of the aircraft during the
  survey. Data type: numeric (3 characters). <br>
- `POSITION_ACCURACY`: Mean deviation between recorded image position
  and actual GPS position. Data type: numeric (2 characters).. <br>
- `METHOD_ID`: Numerical value to define if the survey was made by 1=
  Transect or 2 = Grid. Data type: numeric (1 character). <br>
- `AREA_OBSERVED`: Numerical value of the area observed before
  processing the images. Data type: numeric (6 decimals). <br>
- `AREA_ANALYSED`: Numerical value of the area analysed after processing
  the images. Data type: numeric (6 decimals).<br>
- `AREA_CONTROLLED`: Numerical value of the area that was controlled
  during the screening. Data type: numeric (3 decimals). <br>
- `ID_CONTROLLED`: Numerical value of the total number of controlled
  objects. Data type: numeric (1 decimals). <br>
- `SCREENING_CONTROL_DIFFERENCE`: Percentage of the difference between
  screening and control. Data type: numeric (3 decimals). <br>
- `ID_CONTROL_DIFFERENCE`: Percentage of the difference between initial
  identification and audit. Data type: numeric (3 decimals). <br>
- `QUALITY_IMPROVEMENT`: Description of any quality improvement actions
  taken. Data type: character/text/string (250 characters). <br>
- `POSITIONSYSTEM`: Specification of the positioning system used. Data
  type: character/text/string (20 characters).<br>
- `POSIT_PRECISION_CODE`: Positional accuracy: 1 = decimal degree with 1
  decimal place, 2 = decimal degree with 2 decimal places, 3 = decimal
  degree with 3 decimal places, and so on. Data type: numerical (1
  character). <br>
- `REFSYSTEM`: Geodetic reference system used. Data type:
  character/text/string (20 characters). <br>
- `NOTES`: Additional information not covered in previous fields. Data
  type: character/text/string (250 characters).<br>

### Example of use

``` r
seamonas::Trip_test %>%
  select(LAB)
#>           LAB
#> 1 CompanyName
```

## Basis

`seamonas` contains:  
- One survey example from a fictional monitoring containing **survey**
information.

``` r
data(Basis_test)
```

**Field descriptions**:

- `POSITIONS`: Can be used for descriptions of the columns. Data type:
  character/text/string (40 characters). <br>
- `POSITION_ID`: Unique numeric identifier used to link data between
  “Basis” and “Observations”. Should contain the Area, Date and Time.
  Example (A120251908123200). Data type: character/text/string (40
  characters). <br>
- `POSITION_ID_CONTROLLED`: Numerical codes specifying if an image was
  controlled during screening. Includes values 1 to 3. Controlled during
  screening control (1), controlled during id control (2) and controlled
  both during screening and id control (3). Data type: numeric (1
  character). <br>
- `Dataset_ID`: Numerical identifier of the dataset in the database.
  Data type: character/text/string (40 characters). <br>
- `TRIP_ID`: Sequential number representing each survey day and any
  change in relevant fields. Data type: numeric (2 characters). <br>
- `CRUISENO`: Unique identifier for the survey. Data type:
  character/text/string (40 characters).<br>
- `CAMERA_NUMBER`: Identifier for the camera used. Data type: numeric (1
  character). <br>
- `TRANSECT_NUMBER`: Sequential number representing transect number, if
  the survey was conducted along transects. Data type: numeric (3
  characters).<br>
- `DATE`: Date of the survey in YYYYMMDD format. Data type: date
  (YYYYMMDD) or text (8 characters). <br>
- `TIME`: Time of the image recording in hh:mm:ss format. Data type:
  time (hh:mm:ss) or text (8 characters) <br>
- `LAT_PIC_CENTER`: Latitude of the image center, recorded in WGS 84
  decimal degrees. Data type: numeric (6 decimals).<br>
- `LON_PIC_CENTER`: Longitude of the image center, recorded in WGS 84
  decimal degrees. Data type: numeric (6 decimals).<br>
- `PLANE_FLIGHT_HEIGHT`: Recorded flight height of the aircraft at the
  time of image capture (in meters, ±10 m accuracy). Data type: numeric
  (4 characters).<br>
- `PIC_AREA_ANALYSED`: Surface area of the image. Some variation is
  expected. Data type: numeric (6 decimals).<br>
- `GLARE`: Numerical codes specifying sun glare intensity on the image,
  recorded at regular intervals Values expected are 0 = No glare; 1 =
  Low glare; 2 = Medium glare; 3 = Strong glare. Data type: numeric (1
  character). <br>
- `SEASTATE`: Numerical codes specifying sea state on the image,
  recorded at regular intervals. Values expected are 0 to 7. Data type:
  numeric (1 character). <br>
- `TURBIDITY`: Numerical codes specifying water turbidity level based on
  visibility into the water, recorded at regular intervals. Values
  expected are 1 = No turbidity, 2 = Medium turbidity, 3 = Strong
  turbidity. Data type: numeric (1 character).<br>
- `ICE`: Numerical codes specifying ice coverage, recorded at regular
  intervals. Data type: numeric (1 character).<br>
- `CLARITY`: Numerical codes specifying air clarity, recorded at regular
  intervals. Values expected are 0 = not recorded, 1 = Low clarity, 2 =
  Medium clarity, 3 = High clarity. Some variation is expected. Data
  type: numeric (1 character). <br>
- `PIC_QUALITY`: Numerical codes specifying quality of the image,
  recorded at regular intervals. Values expected are 1 = Good quality, 2
  = Bad quality. Data type: numeric (1 character).<br>
- `PIC_FILENAME`: File name that allows to link information with image.
  Information should include: Area, Date, Position, Species code, Camera
  number and Edition. Example: E_20230213_ID1489_SPECIES5909_c1_m2. Data
  type: character/text/string (60 characters). <br>
- `NOTES`: Additional information not covered in previous fields. Data
  type: character/text/string (250 characters).<br>

### Example of use

``` r
seamonas::Basis_test %>%
  summarise(GLARE_max=max(GLARE))
#>   GLARE_max
#> 1         3
```

## Observations

`seamonas` contains:  
- One survey example from a fictional monitoring containing **species
detected and specifications**.

``` r
data(Observations_test)
```

**Field descriptions**:

- `OBSERVATIONS`: Can be used for descriptions of the columns. Data
  type: character/text/string (40 characters). <br>
- `Observation_ID`: Sequential number of each observation. Data type:
  numeric (10 characters).<br>
- `POSITION_ID`: Unique numeric identifier used to link data between
  “Basis” and “Observations”. Should contain the Area, Date and Time.
  Example (A120251908123200). Data type: character/text/string (40
  characters). <br>
- `Dataset_ID`: Numerical identifier of the dataset in the database.
  Data type: character/text/string (40 characters).<br>
- `CRUISENO`: Unique identifier for the survey. Data type:
  character/text/string (40 characters). <br>
- `ABIOTIC_STRUCTURES`: Numerical codes specifying physical abiotic
  features. Includes ships and infrastructures such as wind farms. Data
  type: numeric (4 characters). <br>
- `ABIOTIC_OBSERVATIONS`: Numerical codes specifying abiotic non-living
  observations. Includes garbage, fishing lines, or any floating objects
  that are not animals (e.g., seaweed). Data type: numeric (4
  characters).<br>
- `OBSERVATION`: Numerical codes specifying the Euring code for every
  animal observation. Data type: numeric (5 characters). <br>
- `ENGLISH_NAME_BEFORE_CONTROL`: English name assigned during initial
  identification. Data type: character/text/string (70 characters). <br>
- `ENGLISH_NAME_CONTROL_ID`: English name assigned during identification
  audit. Data type: character/text/string (70 characters).<br>
- `ID_MATCH_MISMATCH`: Numerical codes specifying identification
  consistency between initial identifier and auditor: match (1) or
  mismatch (2). Data type: numeric (1 character).<br>
- `ENGLISH_NAME`: English name assigned by the referee, corresponding to
  the Euring code. Data type: character/text/string (70 characters).<br>
- `DETECTION_STEP`: Numerical codes specifying the detection stage:
  initial screening (1), control screening (2), both initial and control
  screening (3), initial identification, (4) audited identification (5).
  Data type: numeric (1 character).<br>
- `BEHAVIOUR`: Numerical codes specifying animal behavior, e.g., holding
  fish, dipping, kleptoparasiting. Data type: numeric (3
  characters).<br>
- `ACTIVITY`: Numerical codes specifying animal activity, such as:
  swimming (1), flying (2), submerged (3), breaching surface (4),
  associated with platform (5). For abiotic observations and estructures
  undeclared (0) can be used. Data type: numeric (1 character).<br>
- `GROUP`: Consecutively numbered groups; all members of a group share
  the same number. Data type: numeric (4 characters).<br>
- `FAMILY_GROUP`: Groups consisting of adults and juveniles sharing the
  same number. Examples: Harbour porpoise with calf, Common guillemots
  with fledglings. Data type: numeric (4 characters).<br>
- `ASSOCIATIONS`: Numerical codes specifying animal associations with
  other animals or abiotic structures. Examples include Multi-species
  feeding associations (MSFA). Data type: numeric (3 characters).<br>
- `HEADING`: Absolute movement direction of the animal in numeric
  compass bearings at 45° intervals (e.g., 0°, 45°, 90°, etc.). Data
  type: numeric (3 characters).<br>
- `SUBMERGED`: Specification of the animal’s position relative to the
  water surface: breaching (o), below the surface (u) or unclear (x).
  Data type: character/text/string (1 character).<br>
- `AGE_CLASS`: Specification of the age category of the animal:
  adult (A) or immature (IM). May also include molting (x) or not
  molting (y). Data type: character/text/string (2 characters).<br>
- `AGE_YEAR`: Numerical codes specifying the calendar year from 1 to 7.
  Data type: numeric.<br>
- `PLUMAGE`: Specification of the plumage type includes breeding (B),
  winter (W), and morphs. Data type: character/text/string (1
  characters).<br>
- `SEX`: Specification of the sex of the animal. Includes female (F) or
  male (M). Data type: character/text/string (1 characters). <br>
- `LENGTH`: Linear body length measured from the tip of the beak to the
  tip of the tail in numerical. Data type: numeric (4 characters).<br>
- `WING_SPAN`: Measurement across the full spread of the wings in
  numerical. Data type: numeric (4 characters).<br>
- `FLIGHT_HEIGHT`: Approximate height of flight in flying birds. Data
  type: numeric (3 decimals). <br>
- `FLIGHT_HEIGHT_CONFIDENCE`: Confidence interval of height of flight in
  flying birds. Data type: numeric (3 decimals).<br>
- `FLIGHT_HEIGHT_METHOD_ID`: Numerical codes specifying the method for
  estimation of height of flight in flying birds. Categories include
  Parallax method (1), or calculated based on body size (2). Data type:
  numeric (1 character).<br>
- `LAT_OBJECT`: Latitude of the observation in exact coordinates
  recorded in WGS 84 format. Data type: numeric (6 decimals).<br>
- `LON_OBJECT`: Longitude of the observation in exact coordinates
  recorded in WGS 84 format. Data type: numeric (6 decimals).<br>
- `NOTES`: Additional information not covered in previous fields. Data
  type: character/text/string (250 characters).<br>

### Example of use

``` r
seamonas::Observations_test %>%
  drop_na(ENGLISH_NAME)%>%
  group_by(ENGLISH_NAME)%>%
  tally()%>%
  arrange(desc(n))%>%
  head(3)
#> # A tibble: 3 × 2
#>   ENGLISH_NAME                 n
#>   <chr>                    <int>
#> 1 Common Gull                 73
#> 2 Lesser Black-backed Gull    72
#> 3 unidentified small gull     72
```

## Euring

`seamonas` contains:  
- A list of **549** species names across morphological separated groups.

**Key fields**:

- `Code`: Numerical code based on
  [Euring](https://euring.org/data-and-codes/euring-codes). The species
  codes are primarily based on the EURING list, with additional
  ‘uncertainty codes’ commonly used by ESAS partners to represent
  species groups that are often difficult to identify under at-sea field
  conditions.<br>
- `Scientific_name`: A scientific name is the standardized, universally
  accepted name used to identify and classify living organisms. It
  follows a system called binomial nomenclature.<br>
- `English_name`: Official common name of the species. When the species
  identification is between two different species, two common names are
  allowed separated by a diagonal, without spaces.<br>
- `Artificial_tax_class`: A custom classification system based on
  taxonomic and morphological similarities among species. Serves the
  repository QualityCheck.<br>
- `Groupping`: A custom classification system based on taxonomic and
  morphological similarities among species. Subject to change based on
  suggestions in Screening accuracy calculations.<br>

### Example of use

``` r
Code_Euring %>%
  filter(Groupping=='Gannets_Swans')%>%
  distinct()
#> # A tibble: 0 × 4
#> # ℹ 4 variables: Code <chr>, Scientific_name <chr>, English_name <chr>,
#> #   Groupping <chr>
```

## Citation

If you use **seamonas** for your research, please consider citing this
package.

Lerma M, Schwemmer, H (2025). Package seamonas. Access guidelines
information for monitoring seabirds at sea.
<https://github.com/MiriamLL/seamonas>

Additional references:

- Kotzerka, J., Markones, N., Dierschke, V., & Auniņš, A. (2021).
  Guidelines for monitoring seabirds at sea. In Helsinki Commission.
  <https://helcom.fi/wp-content/uploads/2021/11/HELCOM-Monitoring-guidelines-for-seabirds-at-sea-monitoring.pdf>

- ESAS data model. <https://esas-docs.ices.dk/>

- ICES data portal.
  <https://www.ices.dk/data/data-portals/Pages/European-Seabirds-at-sea.aspx>
