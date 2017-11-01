#' Memo
#'
#' @param logo Local file path or url to the Company logo file. Default FALSE
#' @param
#' @param toc logical value for table of contents. See ?rmarkdown::pdf_document
#' for details
#' @param number_sections logical value for wether sections should be numbered.
#' See ?rmarkdown::pdf_document for details
#' @param latex_engine LaTeX engine. See ?rmarkdown::pdf_document for details
#' @param ... other options to be passed to rmarkdown::pdf_document. See
#' ?rmarkdown::pdf_document for details
#'
#' @importFrom rmarkdown pdf_document
#' @export
memo <- function(toc = TRUE, number_sections = TRUE,
                 latex_engine = "xelatex", ...) {


  template <- system.file("rmarkdown/templates/memo/resources/memo.tex",
                          package = "prettymemo")

  format <- rmarkdown::pdf_document(
    latex_engine = latex_engine,
    template = template,
    number_sections = number_sections,
    toc = toc,
    ...
  )

  return(format)
}
