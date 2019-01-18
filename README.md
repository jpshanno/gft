<!-- README.md is generated from README.Rmd. Please edit that file -->

# gft

*With Google’s announcement of the end of Fusion Tabls, gft will not be
developed any further*

The goal of `gft` is to provide R functions to access the [Google Fusion
Table API](https://developers.google.com/fusiontables/). Currently the
package can  
\- Get and cache an OAuth token  
\- List table IDs and table names  
\- Read tables and table descriptions  
\- Write dataframes to a new Fusion Table (sfc columns are converted to
KML on upload for automatic georeferencing) - Run a query on a table and
retreive the results

## Installation

Currently `gft` can be installed using devtools,

``` r
devtools::install_github("jpshanno/gft")
```

or directly from downloaded source files

``` r
gft_source <- file.path(tempdir(), "gft-master.zip")
download.file("https://github.com/jpshanno/gft/archive/master.zip",
              gft_source)
unzip(gft_source,
      exdir = dirname(gft_source))
install.packages(sub(".zip$", "", gft_source), 
                 repos = NULL,
                 type = "source")
```

## To Do

These planned features will be added as Issues as the project matures.

  - \[ \] Add example code to README
  - \[ \] Add gft\_append\_rows
  - \[ \] Add arguments to use table name not id
  - \[x\] Add checks if table name exists already (with duplicate
    argument)
  - \[ \] Add SQL escapes
  - \[ \] Add DROP/DELETE table functions
  - \[ \] Add an option to fetch column types for gft\_fetch() and
    supply them to read\_csv()
  - \[ \] Output a sfc if there is a LOCATION type column, but this
    needs some testing to determine how to convert geocoded locations.
    Does gft give you the coordinates when you fetch the table?
