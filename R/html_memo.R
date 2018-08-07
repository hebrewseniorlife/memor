#'
#' @importFrom rmarkdown html_document pandoc_variable_arg includes
#'
#' @export
html_memo <- function(style = NULL,
                      use_profile = TRUE,
                      logo = NULL, company = NULL, short_title = NULL,
                      watermark = NULL, confidential = FALSE,
                      libertine = FALSE, chinese = FALSE,
                      logo_height = 128, watermark_color = "gray",
                      footer_on_first_page = TRUE,
                      # toc = FALSE, lot = FALSE, lof = FALSE,
                      fancy_captions = TRUE,
                      number_sections = TRUE, ...) {
  
  # memor_args <- c()
  
  # if (!is.null(title))
  #   memor_args <- c(memor_args, pandoc_variable_arg("title", title))
  
  # if (!is.null(logo)) {
  #   memor_args <- c(memor_args, pandoc_variable_arg("logo", logo),
  #                   pandoc_variable_arg("logo_height", logo_height))
  # }
  
  if (!is.null(company)) {
    if (is.list(company) && length(company) > 1) {
      company <- paste(unlist(company),
                       collapse = "  &centerdot;  ")
    }
    # memor_args <- c(memor_args, pandoc_variable_arg("company", company))
  }
  
  # if (!is.null(short_title)) {
  #   memor_args <- c(memor_args, pandoc_variable_arg("short_title", short_title))
  # }
  
  # if (footer_on_first_page) {
  # memor_args <- c(memor_args,
  # pandoc_variable_arg("footer_on_first_page", "yes"))
  # }
  
  # if (confidential) {
  # memor_args <- c(memor_args, pandoc_variable_arg("confidential", "yes"))
  # }
  
  # if (libertine) {
  # memor_args <- c(memor_args, pandoc_variable_arg("libertine", "yes"))
  # }
  
  # if (chinese) {
  # memor_args <- c(memor_args, pandoc_variable_arg("chinese", "yes"))
  # }
  
  # if (!is.null(watermark)) {
  # memor_args <- c(memor_args, pandoc_variable_arg("watermark", watermark),
  # pandoc_variable_arg("watermark_color", watermark_color))
  # }
  
  # if (lot) memor_args <- c(memor_args, pandoc_variable_arg("lot", "yes"))
  # if (lof) memor_args <- c(memor_args, pandoc_variable_arg("lof", "yes"))
  
  # if (fancy_captions) {
  # memor_args <- c(memor_args, pandoc_variable_arg("fancy_captions", "yes"))
  # }
  
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
    sprintf('" style="height:%dpx" /></div>', logo_height))#,
  
  temp_header = tempfile()
  write(text, temp_header)
  # system(paste0("cat ", temp_header))
  
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
