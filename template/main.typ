#import "@preview/uo-ucsp-thesis": uo-ucsp-thesis, c, apa_tbl, fig_cite
#import "@preview/tblr:0.3.1": *

#let dedicatoria = [
  A mis padres, por ser mi fuente inagotable de apoyo, amor y sabiduría. Su guía y confianza en mí han sido la base sobre la que he construido cada paso de este camino.

  *Tom*
]

#let agradecimientos = [
  A la Dra. Emma, mi asesora, por su invaluable guía, paciencia y dedicación a lo largo de este proceso. Su conocimiento, consejos y constante motivación fueron fundamentales para el desarrollo de esta tesis. Gracias por creer en mí, por impulsar mis ideas y por enseñarme a enfrentar los desafíos con determinación y rigor académico.

  Su acompañamiento no solo enriqueció mi trabajo, sino que también dejó una huella profunda en mi crecimiento profesional y personal.
]

#let resumen_es = [
  El presente estudio aborda la optimización de materiales sostenibles para la construcción de puentes de larga duración en zonas de alta sismicidad. La investigación se centra en la selección y evaluación de materiales innovadores, como concretos reforzados con fibras recicladas y aleaciones metálicas de alta resistencia, con el objetivo de mejorar la capacidad estructural y la resiliencia de las infraestructuras frente a eventos sísmicos de gran magnitud.

  Mediante simulaciones computacionales y ensayos a escala, se analizaron los comportamientos dinámicos de diferentes configuraciones de puente, considerando factores como la amortiguación de vibraciones, la flexibilidad estructural y la durabilidad frente a ciclos de carga. Los resultados revelaron que la combinación de materiales reciclables con tecnologías de disipación de energía puede reducir significativamente los desplazamientos estructurales y aumentar la vida útil de las construcciones.

  Este estudio contribuye al campo de la ingeniería civil al proponer soluciones viables y ambientalmente responsables para la infraestructura vial, promoviendo el desarrollo de puentes más seguros, eficientes y sostenibles en regiones propensas a la actividad sísmica.

  *Palabras clave:* ingeniería civil, puentes, materiales sostenibles, sismos, optimización estructural.
]

#let resumen_en = [
  This study addresses the optimization of sustainable materials for the construction of long-lasting bridges in high-seismicity areas. The research focuses on the selection and evaluation of innovative materials, such as fiber-reinforced recycled concrete and high-strength metal alloys, with the aim of improving structural capacity and infrastructure resilience to large-magnitude seismic events.

  Through computational simulations and scaled tests, the dynamic behavior of various bridge configurations was analyzed, considering factors such as vibration damping, structural flexibility, and durability under load cycles. The results showed that combining recyclable materials with energy dissipation technologies can significantly reduce structural displacements and increase the lifespan of constructions.

  This study contributes to the field of civil engineering by proposing viable and environmentally responsible solutions for road infrastructure, promoting the development of safer, more efficient, and sustainable bridges in earthquake-prone regions.

  *Keywords:* civil engineering, bridges, sustainable materials, earthquakes, structural optimization.
]

#show: uo-ucsp-thesis.with(
  kind: "Tesis",
  title: "Optimización de Materiales Sostenibles para la Construcción de Puentes de Larga Duración en Zonas de Alta Sismicidad",
  authors: ("Tom Christopher Hanks", "Michael Jeffrey Jordan"),
  thesis-advisor: "Dr. Emma Charlotte Watson",
  font: "Times New Roman",
  dedication: dedicatoria,
  acknowledgements: agradecimientos,
  abstract_es: resumen_es,
  abstract_en: resumen_en,
  bib: bibliography("references.bib", title: [REFERENCIAS BIBLIOGRÁFICAS], style: "american-psychological-association"),
)

= INTRODUCCIÓN 
== Motivación
Los siguientes son ejemplos de los usos de las funciones custom presentes y el formato para los distintos elementos en el template.

=== Parrafos
#lorem(30)

#lorem(30)

=== Figura

#figure(
  rect(fill:red, width: 50%, height: 20%),
  caption: c("Rectangulo rojo", "Fuente: Elaboración Propia")
)<red_rect>

=== Tabla

#apa_tbl(
  columns: 5,
  header-rows: 2,
  cells((2, 0), align: horizon, rowspan: 5),
  cells((0, (2,2)), colspan: 2, stroke: (bottom:0.03em)),
  cells((0, (3,4)), stroke: (bottom: 0.03em)),
  cells((0, (0,1)), rowspan: 2, align : horizon),
  hline(y: 7, stroke: 0.03em),
  hline(y: 8, stroke: 0.03em),
  
  [Materia Prima], [Clase], [Axial], [], [Corte],
  [],[],[Unidad $f'_b$], [Pilas $f'_m$], [Muretes  $v'_m$],
  [Arcilla], [Clase I - Artesanal], [4.9 (50)], [3.4 (35)], [0.5 (5.1)],
  [ ], [Clase II - Artesanal], [6.9 (70)], [3.9 (40)], [0.55 (5.6)],
  [ ], [Clase III - Artesanal], [9.3 (95)], [4.6 (47)], [0.64 (6.5)],
  [ ], [Clase IV - Industrial], [12.7 (130)], [6.4 (65)], [0.79 (8.1)],
  [ ], [Clase V - Industrial], [17.6 (180)], [8.3 (85)], [0.90 (9.2)],
  [Concreto],[Industrial portante], [17.5 (178)], [7.0 (71)], [0.44 (4.5)],
  [Sílice-cal], [Industrial portante], [12.6 (129)], [10.1 (103)], [0.93 (9.5)],
  caption: [Resistencias características a compresión axial y corte de la albañilería ],
  remarks: [_Nota:_ Unidades: $"MPa" ("kg" slash "cm"^2)$. Adaptado de: #fig_cite(<Quiun2010>) ],
)

=== Ecuación
$ sum_(k=1)^n k = (n(n+1)) / 2 $

== Problemática
== Justificación
== Objetivos
=== Objetivo general
=== Objetivos específicos 
== Hipótesis
== Variables de la investigación
== Metodología de la investigación
== Estructura de la tesis
= MARCO TEÓRICO
= ESTADO DEL ARTE
= DESARROLLO DE LA TESIS
= RESULTADOS Y DISCUSIÓN DE RESULTADOS
= CONCLUSIONES
= RECOMENDACIONES
