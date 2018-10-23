#' Fetch/Refresh a cached OAuth Token
#'
#' If \code{token} is supplied then the same token is returned. If a path and
#' file are supplied then the token located there is loaded and refershed if
#' necessary.
#'
#' @param path A character string representing the path to a cached token
#' @param file A character string representing the filename of a cached token
#' @param token An object representing an OAuth token
#'
#' @return An object of class \link[httr]{Token}
#' @export
#'
#' @examples
gft_get_token <-
  function(path = ".",
           file = ".httr-oauth",
           token = NULL){

    if(!is.null(token)){
      return(token)
    }

    token_file <-
      file.path(path,
                file)

    if(!file.exists(token_file)){
      stop("The token file specified ",
           token_file,
           " does not exist")
    }

    cached_tokens <-
      readRDS(token_file)

    gft_token <-
      cached_tokens[
      sapply(cached_tokens,
             function(x){x[["app"]][["key"]] == "164658514984-n76dncb6hqi3tktn3h5tqud82ug3dh89.apps.googleusercontent.com"})]

    if(length(gft_token) > 1){
      stop("More than one token generated via gft_auth() was found in the token file.")
    }

    if(length(gft_token) == 0){
      stop("No oauth token for gft was found in the token file, run gft_auth().")
    }

    gft_token <-
      gft_token[[1]]

    if(!gft_token$validate()){
      gft_token$refresh()
    }

    return(gft_token)
  }
