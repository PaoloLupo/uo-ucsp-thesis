# uo-ucsp-thesis
**Unofficial** thesis template for the Faculty of Civil Engineering at UCSP

## Usage

### Using the Typst Web App  
You can use the template directly in the Typst web app:  
1. Click **"Start from template"**.  
2. Search for **uo-ucsp-thesis** and select it. 

### Local usage
To use the template locally with the Typst CLI, run the following command:  

```sh
typst init @preview/uo-ucsp-thesis:0.1.0 mi-tesis
```

## Getting Started
To use this template,

## Utilities
Helpers functions like:
```typst
// Use for custom figure caption that includes bibliographic source
#c(caption, source)
// Custom table layout similar to booktabs (see the tblr package for more details)
#apa_tbl(columns, header-rows, caption, remarks, ..args)
// Custom cite for caption figures
#fig_cite(key)
```

## Fonts
This template requires the **Times New Roman** font; alternatively, if using the web app, the **TeX Gyre Termes** font can be used as it is the most similar.