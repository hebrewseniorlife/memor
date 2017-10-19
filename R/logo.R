#' Download any Logo (url or local) to current working directory
#'
#' @description This function is a generic function that will download any image
#'  files to current working directory.
#'
#'  @param path File path or web links to an image file
#'
#'  @export
get_logo <- function(path) {
  wd_path <- getwd()

}

is_url


#' HSL Logo
#'
#' @description Put the HSL logo file stored in this package in the local folder
#' and then return the new file path.
#'
#' @param path If the rmd file is in a subdirectory, set the path here.
#'
#' @export
hsl_logo <- function(path = NULL) {
  file_name <- "hsl.pdf"
  logo_file <- system.file("rmarkdown/templates/handout_lite/resources",
                           file_name,
                           package = "ifar.reports")
  file.copy(from = logo_file, to = path)
  return(file_name)
}

