#' Curator Template
#'
#' @param toc logical value for table of contents. See ?rmarkdown::pdf_document
#' for details
#' @param number_sections logical value for wether sections should be numbered.
#' See ?rmarkdown::pdf_document for details
#' @param latex_engine LaTeX engine. See ?rmarkdown::pdf_document for details
#' @param ... other options to be passed to rmarkdown::pdf_document. See
#' ?rmarkdown::pdf_document for details
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg
#' @import knitr
#' @export
memor <- function(use_profile = FALSE, 
                  logo = NULL, company = NULL, short_title = NULL, 
                  footer_on_first_page = TRUE, confidential = TRUE,
                  toc = FALSE, lot = FALSE, lof = FALSE, 
                  number_sections = TRUE, latex_engine = "xelatex", ...) {
  template <- system.file("rmarkdown/templates/memor/resources/memor.tex",
                          package = "memor")
  config <- rmarkdown::pdf_document(
    latex_engine = latex_engine,
    template = template,
    number_sections = number_sections,
    toc = toc,
    ...
  )
  
  memor_args <- c()
  
  if (!is.null(logo)) {
    memor_args <- c(memor_args, pandoc_variable_arg("logo", logo))
  }
  
  if (!is.null(company)) {
    if (is.list(company) && length(company) > 1) {
      company <- paste(unlist(company), 
                       collapse = "\\hspace{.025 in} \\cdot \\hspace{.05 in}")
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
  
  if (lot) memor_args <- c(memor_args, pandoc_variable_arg("lot", "yes"))
  if (lof) memor_args <- c(memor_args, pandoc_variable_arg("lof", "yes"))
  
  pre <- config$pre_processor
  config$pre_processor <- function(...) {
    c(if (is.function(pre)) pre(...), memor_args)
  }
  return(config)
}
