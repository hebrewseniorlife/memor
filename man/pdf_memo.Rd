% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/memor.R
\name{pdf_memo}
\alias{pdf_memo}
\title{Memor PDF Memo Template}
\usage{
pdf_memo(
  use_profile = FALSE,
  logo = NULL,
  company = NULL,
  short_title = NULL,
  watermark = NULL,
  confidential = FALSE,
  libertine = FALSE,
  chinese = FALSE,
  logo_height = "1.2cm",
  watermark_color = "gray",
  footer_on_first_page = TRUE,
  toc = FALSE,
  lot = FALSE,
  lof = FALSE,
  fancy_captions = TRUE,
  number_sections = TRUE,
  latex_engine = "xelatex",
  ...
)
}
\arguments{
\item{use_profile}{T/F value for whether the user profile in
\verb{~/memor-profile.yaml} will be loaded. Default is \code{FALSE}.}

\item{logo}{File path to Company logo file. The logo will be printed on
the top right corner of the first page and the size will be adjusted to
\code{logo_height}.}

\item{company}{Company Name as the page footnote. You can input a list of
values, such as company name, address, telephone and email.}

\item{short_title}{A shorten version of the title to be printed on the
top-right corner of every page, except the front page.}

\item{watermark}{Watermark Text to be printed on the page. You can change
its color via \code{watermark_color}.}

\item{confidential}{T/F value for whether a red confidential sign will
be printed.}

\item{libertine}{T/F. Libertine is a collection of open fonts for western
languages. We found it fits this template quite well. Default is \code{FALSE}
though we highly recommend you to turn it on.}

\item{chinese}{T/F for Chinese language support. Default is \code{FALSE}.}

\item{logo_height}{Height of the logo image. This logo image will be scaled
to height and the default height is 1.2cm.}

\item{watermark_color}{Color for the watermark text. Default is "gray".}

\item{footer_on_first_page}{T/F value for whether the company info footer
will be displayed on the front page.}

\item{toc}{T/F value for table of contents. See ?rmarkdown::pdf_document
for details}

\item{lot}{T/F value for list of tables.}

\item{lof}{T/F value for list of figures.}

\item{fancy_captions}{T/F value for whether to apply special formatting to
captions.}

\item{number_sections}{T/F value for whether sections should be numbered.
See ?rmarkdown::pdf_document for details}

\item{latex_engine}{LaTeX engine. See ?rmarkdown::pdf_document for details}

\item{...}{other options to be passed to rmarkdown::pdf_document. See
?rmarkdown::pdf_document for details}
}
\description{
Memor PDF Memo Template
}
\examples{
\dontrun{
library(rmarkdown)
 example <- system.file("example/demo.Rmd", package = "memor")
 render(example, memor::pdf_memo())
}

}
