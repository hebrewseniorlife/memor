#' Memor PDF Memo Template
#'
#' @param use_profile T/F value for whether the user profile in 
#' `~/memor-profile.yaml` will be loaded. Default is `TRUE`. 
#' @param logo File path to Company logo file. The logo will be printed on
#' the top right corner of the first page and the size will be adjusted to
#' `logo_height`.
#' @param company Company Name as the page footnote. You can input a list of 
#' values, such as company name, address, telephone and email.
#' @param short_title A shorten version of the title to be printed on the 
#' top-right corner of every page, except the front page.
#' @param watermark Watermark Text to be printed on the page. You can change
#' its color via `watermark_color`.
#' @param confidential T/F value for whether a red confidential sign will
#' be printed.
#' @param logo_height Height of the logo image. This logo image will be scaled
#' to height and the default height is 1.2cm.
#' @param watermark_color Color for the watermark text. Default is "gray".
#' @param footer_on_first_page T/F value for whether the company info footer 
#' will be displayed on the front page.
#' @param toc T/F value for table of contents. See ?rmarkdown::pdf_document
#' for details
#' @param lot T/F value for list of tables.
#' @param lof T/F value for list of figures.
#' @param number_sections logical value for wether sections should be numbered.
#' See ?rmarkdown::pdf_document for details
#' @param latex_engine LaTeX engine. See ?rmarkdown::pdf_document for details
#' @param ... other options to be passed to rmarkdown::pdf_document. See
#' ?rmarkdown::pdf_document for details
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg
#' @import knitr
#' @export
pdf_memo <- function(use_profile = TRUE, 
                     logo = NULL, company = NULL, short_title = NULL, 
                     watermark = NULL, confidential = TRUE, 
                     logo_height = "1.2cm", watermark_color = "gray",
                     footer_on_first_page = TRUE, 
                     toc = FALSE, lot = FALSE, lof = FALSE, 
                     number_sections = TRUE, latex_engine = "xelatex", ...) {
  if (use_profile) {
    profile_yaml <- try(yaml::read_yaml("~/memor-profile.yaml"), silent = TRUE)
    if (!class(profile_yaml) == "try-error") {
      profile_compare <- list(
        logo = list(logo, NULL), company = list(company, NULL), 
        short_title = list(short_title, NULL), 
        watermark = list(watermark, NULL), 
        confidential = list(confidential, TRUE), 
        logo_height = list(logo_height, "1.2cm"), 
        watermark_color = list(watermark_color, "gray"),
        footer_on_first_page = list(footer_on_first_page, TRUE), 
        toc = list(toc, FALSE), lot = list(lot, FALSE), lof = list(lof, FALSE), 
        number_sections = list(number_sections, TRUE), 
        latex_engine = list(latex_engine, "xelatex")
      )
      changed_items <- lapply(profile_compare, function(x){
        !identical(x[[1]], x[[2]])
      })
      changed_items <- names(changed_items)[changed_items == T]
      
      profile_yaml_names <- names(profile_yaml)
      profile_yaml_names <- profile_yaml_names[!profile_yaml_names %in% 
                                                 changed_items]
      profile_yaml <- profile_yaml[profile_yaml_names]
      
      for (i in 1:length(profile_yaml)) {
        assign(profile_yaml_names[i], profile_yaml[[i]])
      }
    }
  }
  
  memor_args <- c()
  
  if (!is.null(logo)) {
    memor_args <- c(memor_args, pandoc_variable_arg("logo", logo), 
                    pandoc_variable_arg("logo_height", logo_height))
  }
  
  if (!is.null(company)) {
    if (is.list(company) && length(company) > 1) {
      company <- paste(unlist(company), 
                       collapse = " \\hspace{.025 in} \\cdot \\hspace{.05 in} ")
    }
    memor_args <- c(memor_args, pandoc_variable_arg("company", company))
  }
  
  if (!is.null(short_title)) {
    memor_args <- c(memor_args, pandoc_variable_arg("shotr_title", short_title))
  }
  
  if (footer_on_first_page) {
    memor_args <- c(memor_args, 
                    pandoc_variable_arg("footer_on_first_page", "yes"))
  }
  
  if (confidential) {
    memor_args <- c(memor_args, pandoc_variable_arg("confidential", "yes"))
  }
  
  if (!is.null(watermark)) {
    memor_args <- c(memor_args, pandoc_variable_arg("watermark", watermark),
                    pandoc_variable_arg("watermark_color", watermark_color))
  }
  
  if (lot) memor_args <- c(memor_args, pandoc_variable_arg("lot", "yes"))
  if (lof) memor_args <- c(memor_args, pandoc_variable_arg("lof", "yes"))
  
  template <- system.file("rmarkdown/templates/memor/resources/memor.tex",
                          package = "memor")
  config <- rmarkdown::pdf_document(
    latex_engine = latex_engine,
    template = template,
    number_sections = number_sections,
    toc = toc,
    ...
  )
  
  pre_pandoc <- config$pandoc$args
  config$pandoc$args <- c(pre_pandoc, memor_args)
  
  return(config)
}


