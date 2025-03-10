#import "@preview/tblr:0.3.1": *

#let create_outline(title: "ÍNDICE", target: heading)= {
  {
    show heading: none
    set heading(numbering: none)
    heading(bookmarked: true, [#title])
  }

  outline(
    title: block(
      width: 100%,
    [#title \ #align(right,text(size: 12pt, weight: "regular", [Página]))]),
    depth: 4,
    indent: 0.7em,
    target: target,
  )
  pagebreak()
}

#let txt_cover(kind, grade, department, degree) = {
  let mid_txt = [ presentado a la #department como parte de los requisitos para optar el]
  let degree_txt = if grade == "Bachiller" {
    [grado académico de Bachiller en #carrera]
  } else {
    [Título Profesional de #degree]
  }
  return par(first-line-indent: 5cm, justify: true)[#kind #mid_txt #degree_txt]
}

#let in-outline = state("in-outline", false)

#let c(caption, source) = context if in-outline.get() {caption} else {caption + [. ] + source}

#let fig_cite(key) = [
  #cite(key, style:"custombib.csl")
]

#let apa_tbl(columns: auto, header-rows: auto, caption: none, remarks: none, ..args) = {
  tblr(
    stroke: none,
    column-gutter: 1em,
    placement: none,
    caption: caption,
    remarks: {
      set text(size: 10pt)
      set par(leading: 0.5em)
      [#remarks]
    },
    header-rows: header-rows,
    columns: columns,
    // booktabs style rules
    rows(within: "header", auto, inset: (y: 0.5em)),
    rows(within: "header", auto, align: center),
    hline(within: "header", y: 0, stroke: 0.08em),
    hline(within: "header", y: end, position: bottom, stroke: 0.05em),
    rows(within: "body", 0, inset: (top: 0.5em)),
    hline(y: end, position: bottom, stroke: 0.08em),
    rows(end, inset: (bottom: 0.5em)),
    ..args,
  )
}

#let uo-ucsp-thesis(
  font: "TeX Gyre Termes",
  title: "Título de la Tesis",
  authors: ("Autor 1", "Autor 2"),
  kind: "Tesis",
  thesis-advisor: "Nombre del asesor",
  degree: "Nombre de la carrera",
  faculty: "Nombre de la facultad",
  department: "Nombre del departamento",
  bib: "references.bib",
  body
) = {
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
  )

  set text(size: 12pt, lang: "es", font: font)

  // CARÁTULA
  align(center,
    image("img/logo.png", width: 6cm)
  )

  v(1em)
  align(center, text[#upper(faculty) \ #upper(department)])
  v(4em)
  align(center, text(size: 20pt, weight: "bold")[#upper(title)])
  v(4em)

  if authors.len() > 1 and type(authors) == array {
    text(size:14pt, weight: "bold")[#stack(dir: ltr, spacing: 3pt, [Autores:], for i in authors {stack(dir: ttb, i )})]
  } else {
    text(size: 14pt, weight: "bold")[Autor: #authors]
  }
  
  v(1em)
  text(size: 14pt, weight: "bold")[Asesor: #thesis-advisor]
  v(4.5em)
  txt_cover(kind, degree, department, degree)
  v(4.5em)
  align(center)[*AREQUIPA-PERÚ*]
  align(center)[*#datetime.today().display("[year]")*]

  pagebreak()

  counter(page).update(1) // Inicio de conteo de paginas
  set page(numbering: "i", ) // Paginas antes del Cap 1 contados en romanos


// PAR CONFIG
  let leading = 12.6pt
  let spacing-heading = leading * 1.5

  set par(spacing: leading * 1.5, leading: leading, first-line-indent: (all:true, amount: 1.25cm))

  set par(justify: true)
  set text(hyphenate: false)

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
    pad(left: 1em * (it.level - 2), text(size: 12pt)[#it])
  } else {
    set text(size: 14pt)
    it
  }

  show heading: set block(above: spacing-heading, below: spacing-heading)

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

  create_outline()
  create_outline(title: "LISTA DE FIGURAS", target: figure.where(kind: image))
  create_outline(title: "LISTA DE TABLAS", target: figure.where(kind: table))

  // HEADING CUSTOM STYLE
  show heading.where(level: 1) : it => {
    pagebreak(weak: true)
    set align(center)
    set text(size: 14pt)
    upper([#counter(heading).display().trim(":") #v(spacing-heading, weak: true) #it.body])
  }

  // FOOTER STYLE
  set page(numbering: "1", footer: context[
    #set align(right)
    #set text(11pt)
    #counter(page).display()
  ])

  // FIGURE STYLE
  show figure: set block(above: 1.5em, below: 1em)

  show figure.caption.where(kind: image): it => [
    #v(0.5em)
    #emph([#it.supplement #context it.counter.display(it.numbering).])
    #it.body
    #v(0.5em)
  ]

  show figure.where(kind: table): set figure.caption(position: top)

  show figure.caption.where(kind: table): it => [
    #v(0.5em)
    #it.supplement  #context it.counter.display(it.numbering).
    #emph(it.body)
    #v(0.5em)
  ]

    // CONFIGURACION DE ECUACIONES Y FORMULAS CON PADDING Y NUMERACION
  show math.equation.where(block: true): it => {
    set align(left)
    pad(left:1.25cm,top:0.8em, bottom: 0.8em, it)
  }

  show table : it => {
    set par(leading: 3em)

    it
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
  
  bib
}