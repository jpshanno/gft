<!-- README.md is generated from README.Rmd. Please edit that file -->
gft
===

The goal of gft is to provide R functions to access the (Google Fusion
Table API)\[<https://developers.google.com/fusiontables/>\]. Currently
the package can  
- Get and cache an OAuth token  
- List table IDs and table names  
- Read tables and table descriptions  
- Write dataframes to a new table

To Do
-----

At the moment I was focused on getting the functionality I needed for my
work so documentation is non-existent, but I intend to improve that
before tackling any knew features. These planned features will be added
as Issues as the project matures.

-   \[ \] Add example code to README
-   \[ \] Add gft\_append\_rows
-   \[ \] Add arguments to use table name not id
-   \[ \] Add checks if table name exists already (with override
    argument)
-   \[ \] Add SQL escapes
-   \[ \] Include confirmations for DROP/DELETE
-   \[ \] Put in a call to gft\_tables() and check for the table ID
    before attempting to fetch
-   \[ \] Add an option to fetch column types for gft\_fetch() and
    supply them to read\_csv()
-   \[ \] Output a sfc if there is a LOCATION type column, but this
    needs some testing to determine how to convert geocoded locations.
    Does gft give you the coordinates when you fetch the table?
