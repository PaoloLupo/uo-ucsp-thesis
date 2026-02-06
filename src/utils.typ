#let create_outline(title: "ÍNDICE", target: heading)= {
  {
    show heading: none
    set heading(numbering: none)
    heading(bookmarked: true, [#title])
  }

  set outline.entry(fill: repeat([.], gap: 0.15em))

  show outline.entry: it => context {
    if it.element.has("kind") {
      let loc = it.element.location()

      if counter(figure.where(kind: it.element.kind)).at(loc).first() == 1 {
        v(1em)
      }

      block(
        link(loc,
          it.prefix()
          + [. ]
          + it.body() 
          + box(it.fill, width: 1fr)
          + h(0.2em)
          + it.page()
        )
      )
    } else {
      it
    }
  }

  outline(
    title: block(
      width: 100%,
      [#title \ #align(right,text(size: 12pt, weight: "regular", [Página]))]
    ),
    depth: 4,
    indent: 0.7em,
    target: target,
  )
  pagebreak()
}

#let txt_cover(kind, grade, department, degree) = {
  let init_txt = if kind == "Tesis" {
    [#kind presentada]
  } else {
    [Plan de Tesis presentada]
  }
  let mid_txt = [ a la Escuela Profesional de Ingeniería Civil como parte de los requisitos para optar el]
  let degree_txt = if grade == "Título Profesional" {
    [Título Profesional de Ingeniero Civil] //CORREGIDO
  } else {
    [grado académico de #grade en #degree]
  }
  return par(first-line-indent: 5cm, justify: true)[#init_txt #mid_txt #degree_txt]
}

#let in-outline = state("in-outline", false)