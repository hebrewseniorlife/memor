# memor <img src="https://hebrewseniorlife.github.io/memor/memor.svg" align="right" alt="logo" width="120" height = "139" style = "border: none; float: right;">
`memor` is a beautifully designed rmarkdown LaTeX template with lots of customizable options. It provides useful features such as company/institution logo, contact info, watermark as so on. It also allow users to have a small yaml section in their rmarkdown by allowing them to save their preference in a profile file. 

# Install
```{r}
devtools::install_github("hebrewseniorlife/memor")
```

# Get Started
Here are the list of options that is available in `memor`. Similar with `rmarkdown`, you don't need to use all of them. Just pick the ones you need. 
```
output: 
  memor::memor:
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

At the same time, it's encouraged to use a separated "profile" file to store your personal/company info and common setups. Here, if you are using RStudio, you can use the "Edit memor profile" RStudio addin coming together with this package. This addin does nothing more than opening up the `~/memor-profile.yaml` file in your home directory (if this file doesn't exist, it will create one). Note that if you have a profile but you don't want to use the profile for certain document, you can disable this behavior by setting `use_profile` to be `false` in your document.

![RStudio Addin](https://raw.githubusercontent.com/hebrewseniorlife/memor/master/docs/addin.png)
