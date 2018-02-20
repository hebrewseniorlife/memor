# prettymemo
`prettymemo` is a R package containing a well-defined rmarkdown PDF template with some modern design elements. It comes with easily-accessible features, such as company logo and company contact info as page footer.

See the sample documentation [here](https://github.com/hebrewseniorlife/prettymemo/raw/master/docs/skeleton.pdf) or check out the documentation site at [https://hebrewseniorlife.github.io/prettymemo/](https://hebrewseniorlife.github.io/prettymemo/)

# Install
```{r}
devtools::install_github("hebrewseniorlife/prettymemo")
```

# Features
Here is a typical yaml section for a `prettydoc` document.

```
---
title: "Title"
author: 
- You Name
- Second Author
date: "`r Sys.Date()`"
documentclass: article
output: 
  prettymemo::memo:
    keep_tex: true
company: Interventional Studies in Aging Center
address: 1200 Centre St. Boston, MA, USA 02131
phone: 617.971.5386
email: stats@hsl.harvard.edu
logo: "`r prettymemo::hsl_logo()`"
short_title: "short title"
footer_on_first_page: true
confidential: true
toc: false
lot: false
lof: false
abstract: "Here is the abstract of this memo."
---
```

## Logo
The `logo` item here only needs the file path to your logo file, which can be a png, jpg, pdf, etc. So if you have your company logo file `logo.png` in your document folder (and you are rendering from document location), you can just say `logo: "logo.png"` in your `yaml` section. 

If you are not satisfied with the size of your logo, you can adjust it through the `logo_height` option and the width will be automatically adjusted. For example, `logo_height: 2cm`.

