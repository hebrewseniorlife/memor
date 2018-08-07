#'
#' @importFrom rmarkdown html_document pandoc_variable_arg includes
#'
#' @export
html_memo <- function(style = NULL,
                      use_profile = TRUE,
                      logo = NULL, company = NULL,
                      logo_height = 128,
                      ...) {
  
  if (use_profile) {
    profile_file <- getOption("memor_profile", "~/memor-profile.yaml")
    profile_yaml <- try(yaml::read_yaml(profile_file), silent = TRUE)
    if (!class(profile_yaml) == "try-error") {
      profile_compare <- list(
        logo = list(logo, NULL), 
        company = list(company, NULL),
        logo_height = list(logo_height, "128"),
        style = list(style, NULL)
      )
      changed_items <- lapply(profile_compare, function(x){
        !identical(x[[1]], x[[2]])
      })
      changed_items <- names(changed_items)[changed_items == T]
      
      profile_yaml_names <- names(profile_yaml)
      profile_yaml_names <- profile_yaml_names[!profile_yaml_names %in% 
                                                 changed_items]
      profile_yaml <- profile_yaml[profile_yaml_names]
      
      if (length(profile_yaml) != 0) {
        for (i in 1:length(profile_yaml)) {
          assign(profile_yaml_names[i], profile_yaml[[i]])
        }
      }
    }
  }
  
  if (!is.null(company)) {
    if (is.list(company) && length(company) > 1) {
      company <- paste(unlist(company),
                       collapse = "  &centerdot;  ")
    }
    # memor_args <- c(memor_args, pandoc_variable_arg("company", company))
  }
  
  config <- html_document(
    includes = includes(
      before_body = createHeader(logo, logo_height),
      after_body = createFooter(company)
    ),
    ...
  )
  
  return(config)
  
}

createHeader <- function(logo, logo_height = 128) {
  text = paste0(
    '<div class="memor_logo" style="text-align:end;padding-top:25px">
    <img src="data:image/png;base64,',
    base64enc::base64encode(logo),
    sprintf('" style="height:%dpx" /></div>', logo_height))
  
  temp_header = tempfile()
  write(text, temp_header)
  
  return(temp_header)
}

createFooter <- function(company) {
  text = paste0(
    '<div class="memor_info" style="text-align:center;padding-bottom:10px"><p><hr> ',
    company,
    '</p></div>'
  )
  
  temp_footer = tempfile()
  write(text, temp_footer)
  
  return(temp_footer)
}
