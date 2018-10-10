#' Fetch/Refresh a cached OAuth Token
#'
#' @param path
#' @param file
#'
#' @return
#' @export
#'
#' @examples
gft_get_token <-
  function(path = ".",
           file = ".httr-oauth"){
    token_file <-
      file.path(path, file)

    if(!file.exists(token_file)){
      stop("The token file specified ",
           token_file,
           " does not exist")
    }

    token <-
      readRDS(token_file)[[1]]
    token$refresh()
    return(token)
  }
