#' Manage memor profile
#'
#' @description This RStudio Addin opens up the ~/memor-profile.yaml file for
#' users to edit. If the file doesn't exists, it will create one.
#' 
#' @importFrom utils file.edit
#' @export
memor_profile <- function() {
  profile_file <- getOption("memor_profile", "~/memor-profile.yaml")
  if (!file.exists(profile_file)) {
    file.copy(
      from = system.file("memor-profile.yaml", package = "memor"),
      to = profile_file
    )
  }
  file.edit(profile_file)
}