#import "utils.typ": *
#import "@local/apa-tblr:0.1.0": * 

#let c(caption, source) = context if in-outline.get() {caption} else {caption + [. ] + source}

#let fig_cite(key) = [
  #cite(key, style:"custombib.csl")
]

#let uo-ucsp-thesis(
  title: "Título de la Tesis",
  authors: ("Autor 1", "Autor 2"),
  kind: "Tesis",
  thesis-advisor: "Nombre del asesor",
  grade: "Título Profesional",
  degree: "Nombre de la carrera",
  faculty: "Nombre de la facultad",
  department: "Nombre del departamento",
  dedication: [El texto de dedicatoria #lorem(50)],
  acknowledgements: [El texto de agradecimiento #lorem(50)],
  abstract_es: [#lorem(50) #parbreak() #lorem(50)],
  abstract_en: [],
  cronograma: [],
  bib: [],
  body
) = {
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
  )

  set text(size: 12pt, lang: "es", font: ("Times New Roman", "TeX Gyre Termes"))
  let leading = 1.06em 
  set par(leading: leading, spacing: leading *1.5)
  let spacing-heading = leading * 1.5

  // CARÁTULA
  {
    set align(center)
    image("img/logo.png", width: 5.53cm)
    text[#upper(faculty) \ #upper(department) #parbreak()]

    set text(size: 10pt)
    [ \ \ #parbreak()]
    
    set text(size: 20pt, weight: "bold")
    [#upper(title) #parbreak()]
    set text(size: 10pt)
    [ \ #parbreak()  \ #parbreak() ]
  }

  {
    set text(size: 14pt, weight: "bold")
    if authors.len() > 1 and type(authors) == array {
      let txt = "Autores: "
      [#grid(
        columns: 2,
        row-gutter: leading,
        [#txt],
        upper(authors.join([\ ]))
      )]
    } else {
      [Autor: #upper(authors) #parbreak()]
    }
    [Asesor: #thesis-advisor #parbreak()]
    set text(size: 10pt)
    [\ \ ]
  }
  
  txt_cover(kind, grade, department, degree)

  {
    set text(size: 10pt)
    [ \ #parbreak() \ ]
    set align(center)
    set text(size: 12pt )
    [*AREQUIPA-PERÚ \ #datetime.today().display("[year]")*]
    v(1em)
  }

  pagebreak()
  

  counter(page).update(1) // Inicio de conteo de paginas
  set page(numbering: "i", ) // Paginas antes del Cap 1 contados en romanos

  set par(justify: true)
  set text(hyphenate: false)
  show heading: set block(above: spacing-heading, below: spacing-heading)

  if kind == "Tesis" {
    show heading: set align(right + bottom)
    show heading: set text(size: 14pt)
    [
      = DEDICATORIA
      #pad(left: 6.25cm, emph(dedication))
      #pagebreak()
    ]

    show heading: set align(center + top)
    set par(first-line-indent: (all:true, amount: 1.25cm))

    [
      = AGRADECIMIENTOS
      #acknowledgements
      #pagebreak()

      = RESUMEN
      #abstract_es
      #pagebreak()
      
      = ABSTRACT
      #abstract_en
      #pagebreak()
    ]
  }


// PAR CONFIG

  set par(first-line-indent: (all:true, amount: 1.25cm))


  set heading(numbering: (..nums) => {
    let numbers = nums.pos()
    if numbers.len() == 1 {
      return "CAPÍTULO " + numbering("1:", ..numbers)
    } else {
      numbering("1.1.", ..numbers)
    }
  })

  // HEADING CONFIG

  show heading: it => if it.level > 1 {
    set text(size: 12pt)
    pad(left: 0.5cm * (it.level - 2), [#it])
  } else {
    set text(size: 14pt)
    it
  }


  // Heading lvl > 4 in italics
  show heading: it => if it.level > 3 {
    emph(it)
  } else {
    it
  }

  // OUTLINES
  show outline: it => {
    show heading: set align(center)
    in-outline.update(true)
    it
    in-outline.update(false)
  }

  show outline: set par(justify: true)
  show outline: set text(hyphenate: false)

  set figure.caption(separator: [.])

  create_outline()
  create_outline(title: "LISTA DE FIGURAS", target: figure.where(kind: image))
  create_outline(title: "LISTA DE TABLAS", target: figure.where(kind: table))

  // HEADING CUSTOM STYLE
  show heading.where(level: 1) : it => {
    pagebreak(weak: true)
    set align(center)
    set text(size: 14pt)
    upper([#counter(heading).display().trim(":") #parbreak() #it.body])
  }

  // FOOTER STYLE
  set page(numbering: "1", footer: context[
    #set align(right)
    #set text(11pt)
    #counter(page).display()
  ])


  // FIGURE STYLE
  show figure.caption.where(kind: image): it => [
    #v(leading)
    #set par(leading: leading * 0.46)
    #emph([#it.supplement #context it.counter.display(it.numbering)#it.separator])
    #it.body
  ]


  show figure.where(kind: table): set figure.caption(position: top)

  show figure.caption.where(kind: table): it => [
    #set par(leading: leading * 0.46)
    #set text(size: 12pt)
    #it.supplement  #context it.counter.display(it.numbering).
    #emph(it.body)
    #v(leading*0.8)
  ]

  show table.cell: set par(justify: false)

    // CONFIGURACION DE ECUACIONES Y FORMULAS CON PADDING Y NUMERACION
  show math.equation: set text(font: "TeX Gyre Termes Math")
  show math.equation.where(block: true): it => {
    set align(left)
    pad(left:1.25cm, it)
  }

  set math.equation(numbering: "(1)")

  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      link(el.location(),numbering(
        el.numbering,
        ..counter(eq).at(el.location())
      ))
    } else {
      it
    }
  }

  // CONFIGURACION DE LISTAS Y ENUMERACIONES CON IDENTACION 
  set list(indent: 1.25cm)
  set enum(indent: 1.25cm)
  
  // Reinicio del contador del FOOTER a partir del CAP1
  counter(page).update(1)

  body

  set heading(numbering: none)
  
  show heading.where(level: 1) : it => {
      pagebreak(weak: true)
      set align(center)
      set text(size: 14pt, weight: "bold")
      [#upper(it.body)]
  }
  cronograma
  
  bib
}