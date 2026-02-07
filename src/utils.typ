#let create_outline(title: "ÍNDICE", target: heading) = {
  context {
    let elems = query(target)
    if elems.len() == 0 and title != "ÍNDICE" {
      return
    }

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
          link(loc, it.prefix() + [. ] + it.body() + box(it.fill, width: 1fr) + h(0.2em) + it.page()),
        )
      } else if it.element.func() == heading and it.element.level == 1 and it.element.numbering != none {
        // Detectar si es un anexo consultando el metadata marker
        let loc = it.element.location()
        let nums = counter(heading).at(loc)

        // Solo aplicar formato especial si el contador > 0
        if nums.first() > 0 {
          let markers = query(selector(<appendix-start>).before(loc, inclusive: false))
          let is-anexo = markers.len() > 0

          if is-anexo {
            // Formato para anexos: "ANEXO A: TITULO"
            let prefix = "ANEXO " + numbering("A:", ..nums)
            block(
              link(loc, [#prefix #it.body() #box(it.fill, width: 1fr) #h(0.2em) #it.page()]),
            )
          } else {
            // Formato para capítulos: "CAPÍTULO 1: TITULO"
            let prefix = "CAPÍTULO " + numbering("1:", ..nums)
            block(
              link(loc, [#prefix #it.body() #box(it.fill, width: 1fr) #h(0.2em) #it.page()]),
            )
          }
        } else {
          it
        }
      } else {
        it
      }
    }

    outline(
      title: block(
        width: 100%,
        [#title \ #align(right, text(size: 12pt, weight: "regular", [Página]))],
      ),
      depth: 4,
      indent: 0.7em,
      target: target,
    )
    pagebreak()
  }
}

#let txt_cover(kind, grade, department, degree) = {
  let init_txt = if kind == "Tesis" {
    [#kind presentada]
  } else {
    [Plan de Tesis presentada]
  }
  let mid_txt = [ a la #department como parte de los requisitos para optar el]
  let degree_txt = if grade == "Título Profesional" {
    let d_txt = if degree.contains("Ingeniería") [Ingeniero #degree.split().at(1)] else [#degree]
    [Título Profesional de #d_txt]
  } else {
    [grado académico de #grade en #degree]
  }
  return par(first-line-indent: 5cm, justify: true)[#init_txt #mid_txt #degree_txt]
}

#let in-outline = state("in-outline", false)
#let is-appendix = state("is-appendix", false)
#let first-appendix-num = state("first-appendix-num", none)
