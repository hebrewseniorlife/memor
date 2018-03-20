#' Manage memor profile
#'
#' @description This RStudio Addin opens up the ~/memor-profile.yaml file for
#' users to edit. If the file doesn't exists, it will create one.
#' @export
memor_profile <- function() {
  if (!file.exists("~/memor-profile.yaml")) {
    file.copy(
      from = system.file("memor-profile.yaml", package = "memor"),
      to = "~/memor-profile.yaml"
    )
  }
  file.edit("~/memor-profile.yaml")
}