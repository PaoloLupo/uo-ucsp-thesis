#import "../src/lib.typ": uo-ucsp-thesis, c, apa_tbl, fig_cite
#import "@preview/tblr:0.3.1": *

#show: uo-ucsp-thesis.with(
  font: "Times New Roman",
  bib: bibliography("references.bib", title: [REFERENCIAS BIBLIOGRÁFICAS], style: "american-psychological-association"),
)

= MARCO TEÓRICO
== Título secundario
#figure(
  image("../src/img/logo.png", width: 50%),
  caption: c([#lorem(20)], "Fuente: Elaboración Propia")
)

== Ecuaciones
=== Titulo terciario


Este es un parrafo $f'_c rho beta dot frac(a,b) sqrt(alpha^2)$ #lorem(20)

$ sum_(k=1)^n k = (n(n+1)) / 2 $<eq1> 


Referencia al Ecuación @eq1 #lorem(50)

== Tabla

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
  caption: [Resistencias características a compresión axial y corte de la albañilería],
  remarks: [_Nota:_ Unidades: $"MPa" ("kg" slash "cm"^2)$. Adaptado de: #fig_cite(<Quiun2010>) ],
)<tb:res_alb_070>
