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
  file.copy(from = logo_file, to = paste0("./", path))
  return(file_name)
}
