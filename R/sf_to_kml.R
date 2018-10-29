#' sf_to_kml
#'
#' Convert sfc columns in an sf dataframe to KML text to allow automatic
#' georeferencing when uploading to Google Fusion Tables.
#'
#' @param x A sf dataframe
#'
#' @return A dataframe with a new geometry column that is the KML text
#' representation of the sf geometry information
#' @export
#'
sf_to_kml <-
  function(x){
    if(!any(grepl("^sf$", class(x)))){
      stop("x must be a simple feature dataframe")
    }

    geom_column <-
      attr(x, "sf_column")

    UseMethod("sf_to_kml", x[[geom_column]])
  }

#' @rdname sf_to_kml
sf_to_kml.sfc_POINT <-
  function(x){
    if(sf::st_crs(x)$epsg != 4326){
      x <- sf::st_transform(x, 4326)}

    wkt <-
      sf::st_as_text(sf::st_geometry(x))

    coordinates <-
      gsub(pattern = "^[A-z \\(]{1,}([-]{0,1}[0-9\\.]{1,}) ([-]{0,1}[0-9\\.]{1,})\\)$",
           replacement = "\\1, \\2",
           x = wkt)

    kml_string <-
      paste("<Point><coordinates>",
            coordinates,
            "</coordinates></Point>")

    x <-
      sf::st_set_geometry(x, NULL)

    x[[geom_column]] <-
      kml_string

    return(x)
  }
