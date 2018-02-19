#' Download any Logo (url or local) to current working directory
#'
#' @description This function is a generic function that will download any image
#'  files to current working directory.
#'
#' @param path File path or web links to an image file
#'
#'  @export
get_logo <- function(path) {
  wd_path <- getwd()
  if (is_url(path)) {

  } else {
    file.copy(from = path, to = wd_path)
    return
  }
}

is_url <- function(path) {
  substr(path, 1, 7) %in% c("http://", "https://")
}


#' HSL Logo
#'
#' @description Put the HSL logo file stored in this package in the local folder
#' and then return the new file path.
#'
#' @export
hsl_logo <- function() {
  logo_filename <- "hsl.pdf"
  current_dir <- knitr::opts_knit$get("output.dir")
  logo_file <- system.file("rmarkdown/templates/memo/resources",
                           logo_filename,
                           package = "prettymemo")
  new_logo_file <- file.path(current_dir, logo_filename)
  file.copy(from = logo_file,
            to = new_logo_file, overwrite = T)
  return(new_logo_file)
}

