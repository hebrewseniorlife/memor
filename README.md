# prettymemo
`prettymemo` is a R package containing a well-defined rmarkdown PDF template with some modern design elements. It comes with easily-accessible features, such as company logo and company contact info as page footer.

![first page of prettymemo](docs/firstpage.png)

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


