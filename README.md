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
Use this function (check all possible arguments and their default values). You may also use the utility functions included with this template:

```typst
#import "@preview/uo-ucsp-thesis:0.1.0": *

#show: uo-ucsp-thesis.with(
    kind: "Tesis", // If kind: "Plan de Tesis", sections like dedication, acknowledgements, and abstracts are ignored
    title: "Título de la Tesis",
    authors: ("Autor 1", "Autor 2"), // It is possible to include a single author like -> authors: "Autor"
    thesis-advisor: "Nombre del asesor",
    grade: "Título Profesional",
    degree: "Ingeniería Civil",
    faculty: "Facultad de Ingeniería y Computación",
    department: "Escuela Profesional de Ingeniería Civil",
    dedication: [],
    acknowledgements: [],
    abstract_es: [], // Spanish version of the abstract
    abstract_en: [], // English version of the abstract
    font: "Times New Roman", // Use "TeX Gyre Termes" if you use the Typst web app
    bib: bibliography("references.bib", title: [REFERENCIAS BIBLIOGRÁFICAS], style: "american-psychological-association") // Replace with your .bib file
)
```

## Utilities
The template includes helper functions to streamline your workflow:
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