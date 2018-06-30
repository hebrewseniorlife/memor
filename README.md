# memor <img src="https://hebrewseniorlife.github.io/memor/memor.svg" align="right" alt="logo" width="120" height = "139" style = "border: none; float: right;">
This package is intended for data scientists, statisticians, and allied scientists who use rmarkdown to conduct reproducible research but require flexibility in document formatting. It is based on a pre-existing latex template that we have updated for use in RStudio or equivalent environments. A notable inclusion is a feature allowing the user to save develop a common configuration file, which can be shared among the team within a working environment. 

[Sample 1](https://hebrewseniorlife.github.io/memor/demo.pdf)

[Sample 2](https://hebrewseniorlife.github.io/memor/demo2.pdf)


# Installation
```{r}
devtools::install_github("hebrewseniorlife/memor")
```

# Getting Started
Here are the list of options that is available in `memor`. As with the default `rmarkdown` template, not all need be specified. At the same time, it can also take all the other options from `rmarkdown::pdf_document`, such as `keet_tex`, `includes`, etc.
 
```
output: 
  memor::pdf_memo:
    use_profile: false
    logo: "logo.png"
    company: 
      name: Your company's name
      address: Your address
      phone: 888.888.8888
      email: your_email@email.com
    short_title: short title
    watermark: Top Secret
    confidential: true
    logo_height: 1.2cm
    watermark_color: gray
    footer_on_first_page: true
    toc: false
    lot: false
    lof: false
    number_sections: true
    latex_engine: xelatex
```

In the interest of reducing the length of 'yaml' headers and allowing for standardization within teams, we have developed a mechanism that allows one to save one's configuration or "profile" in an isolated file, which can be reused for other reports and shared with colleagues. During the process of rendering, information saved in the profile file will be automatically pulled and used to generate the final document (but information defined in local environment will be used with priority). 

To better facilitate this process, we created a RStudio Addin to help you quickly locate the file. This addin does nothing but to open up the `~/memor-profile.yaml` file in your home directory (if this file doesn't exist, it will create one). Note that if you have a profile but you don't want to use the profile for certain document, you can disable this behavior by setting the `use_profile` option to `false.` Furthermore, if you are customizing the location of the profile file using the `memor_profile` option, which can be specified in a `.Rprofile`, so your group can put this file in a shared space. 

![RStudio Addin](https://raw.githubusercontent.com/hebrewseniorlife/memor/master/docs/addin.png)

# Acknowledgement
This package was funded in part by a development project from the Biostatistical Design and Analysis Core of the [Boston Pepper Center](http://pepper.bwh.harvard.edu/) (AG031679-07). We appreciate additional support from the Hebrew SeniorLife [Institute for Aging Research](http://www.instituteforagingresearch.org/).
