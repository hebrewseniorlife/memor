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

