# memor <img src="https://hebrewseniorlife.github.io/memor/memor.svg" align="right" alt="logo" width="120" height = "139" style = "border: none; float: right;">
We, the biostatistics group at Institute for Aging Research, love rmarkdown. However, in practice, we realized the gap between the default rmarkdown template and what we really want. Some of these needs are quite universal, such as company logo, contact info and so on. Therefore, we created this `memor` package designed to let people easily customize these common "gadgets" of a printable document. Furthermore, this package also allow you to save your common setups in a profile file, which can be shared among the team within a working environment. 

# Installation
```{r}
devtools::install_github("hebrewseniorlife/memor")
```

# Get Started
Here are the list of options that is available in `memor`. Similar with `rmarkdown`, you don't need to use all of them. Just pick the ones you need. 
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

At the same time, we understand that everyone hates lengthful `yaml` section and we believe it's also a good behavior to keep everything constant across report within a team. Therefore, we added a mechanism which allows you to save your "profile" in an isolated file, which can be reused for other reports and shared within the team. During the process of rendering, information saved in the profile file will be automatically pulled and used to generate the final document. 

Also, if you are a RStudio user, we created a RStudio Addin to help you quickly locate the file. This addin does nothing but to open up the `~/memor-profile.yaml` file in your home directory (if this file doesn't exist, it will create one). Note that if you have a profile but you don't want to use the profile for certain document, you can disable this behavior by setting `use_profile` to be `false` in your document.

![RStudio Addin](https://raw.githubusercontent.com/hebrewseniorlife/memor/master/docs/addin.png)

# Acknowledgement
We appreciate funding support from [Institute for Aging Research](https://www.instituteforagingresearch.org/) and [Boston Pepper Center](http://pepper.bwh.harvard.edu/).