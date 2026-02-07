#import "@local/uo-ucsp-thesis:0.3.0": *

// --- CONFIGURACIÓN DE SECCIONES PREVIAS ---

#let dedicatoria = [
  A mis padres, por ser mi fuente inagotable de apoyo, amor y sabiduría. Su guía y confianza en mí han sido la base sobre la que he construido cada paso de este camino.

  *Tom*
]

#let agradecimientos = [
  A la Dra. Emma, mi asesora, por su invaluable guía, paciencia y dedicación a lo largo de este proceso. Su conocimiento, consejos y constante motivación fueron fundamentales para el desarrollo de esta tesis.

  Su acompañamiento no solo enriqueció mi trabajo, sino que también dejó una huella profunda en mi crecimiento profesional y personal.
]

#let resumen_es = [
  El presente estudio aborda la optimización de materiales sostenibles para la construcción de puentes de larga duración en zonas de alta sismicidad. La investigación se centra en la selección y evaluación de materiales innovadores, como concretos reforzados con fibras recicladas y aleaciones metálicas de alta resistencia.

  Mediante simulaciones computacionales y ensayos a escala, se analizaron los comportamientos dinámicos de diferentes configuraciones de puente. Los resultados revelaron que la combinación de materiales reciclables con tecnologías de disipación de energía puede aumentar la vida útil de las construcciones.
]

#let resumen_en = [
  This study addresses the optimization of sustainable materials for the construction of long-lasting bridges in high-seismicity areas. The research focuses on the selection and evaluation of innovative materials, such as fiber-reinforced recycled concrete and high-strength metal alloys.

  Through computational simulations and scaled tests, the dynamic behavior of various bridge configurations was analyzed. The results showed that combining recyclable materials with energy dissipation technologies can increase the lifespan of constructions.
]

#let anexos = [
  = PRUEBAS DE LABORATORIO <lab_tests>
  #lorem(50)

  == PROTOCOLO DE ENSAYO
  #lorem(20)

  = PLANOS DE ESTRUCTURAS <blueprints>
  #lorem(50)
]

// --- CONFIGURACIÓN PRINCIPAL DE LA TESIS ---

#show: uo-ucsp-thesis.with(
  kind: "Tesis", // "Tesis" o "Plan de Tesis"
  title: "Optimización de Materiales Sostenibles para la Construcción de Puentes de Larga Duración en Zonas de Alta Sismicidad",
  authors: ("Tom Christopher Hanks", "Michael Jeffrey Jordan"),
  thesis-advisor: "Dr. Emma Charlotte Watson",

  // Secciones previas (se ignoran si kind != "Tesis")
  dedication: dedicatoria,
  acknowledgements: agradecimientos,
  abstract_es: resumen_es,
  abstract_en: resumen_en,

  // Palabras clave (opcional)
  keywords_es: ("ingeniería civil", "puentes", "materiales sostenibles", "sismos"),
  keywords_en: ("civil engineering", "bridges", "sustainable materials", "earthquakes"),

  // Anexos (opcional)
  anexos: anexos,

  // Bibliografía
  bib: bibliography("references.bib", title: [REFERENCIAS BIBLIOGRÁFICAS], style: "american-psychological-association"),

  // Fuente (opcional, por defecto Times New Roman)
  // font: ("Times New Roman", "TeX Gyre Termes"),
)

// --- CUERPO DE LA TESIS ---

= INTRODUCCIÓN <intro>
== Motivación

@intro

Los siguientes son ejemplos de los usos de las funciones custom presentes en el template. Como se detalla en el @lab_tests, los materiales seleccionados fueron sometidos a rigurosas pruebas.

=== Figura sugerida
#figure(
  rect(fill: red, width: 50%, height: 20%),
  caption: c("Rectangulo de prueba", "Fuente: Elaboración Propia"),
) <red_rect>

Como se observa en la @red_rect, el formato de subtítulo sigue las normas APA.

=== Tabla sugerida
#apa_tbl(
  columns: 3,
  header-rows: 1,
  [Categoría],
  [Valor A],
  [Valor B],
  [Ejemplo 1],
  [10.5],
  [20.1],
  [Ejemplo 2],
  [15.2],
  [18.4],
  caption: [Resistencia de materiales de prueba],
  remarks: [_Nota:_ Datos obtenidos en simulaciones computacionales. Adaptado de @Quiun2010],
)

== Problemática
== Justificación
== Objetivos
=== Objetivo general
=== Objetivos específicos
== Hipótesis
== Metodología de la investigación

= MARCO TEÓRICO
== Bases Teóricas
En esta sección se presentan los fundamentos de la investigación iniciada en la @intro. La optimización de puentes requiere un análisis exhaustivo de las fuerzas dinámicas.

Como se define en la mecánica clásica, la relación entre fuerza, masa y aceleración se expresa mediante la conocida fórmula $F = m a$. En términos de energía cinética, podemos decir que $E_k = 1/2 m v^2$.

Para sistemas más complejos, consideramos la ecuación de equilibrio dinámico:
$ M accent(x, dot.double) + C accent(x, dot) + K x = F(t) $ <eq_equilibrium>

La Ec. @eq_equilibrium es fundamental para entender el comportamiento de estructuras bajo cargas sísmicas.

== Antecedentes
De acuerdo con lo mencionado en el @lab_tests, los estudios previos sugieren que...
= ESTADO DEL ARTE
= DESARROLLO DE LA TESIS
= RESULTADOS Y DISCUSIÓN
= CONCLUSIONES
= RECOMENDACIONES
