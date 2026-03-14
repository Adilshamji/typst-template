// New computer modern
#let language = (
  "en": (
    email: "E-mail",
    references: "References",
    section: "Section",
    figure: "Figure",
    table: "Table",
  ),
  "sv": (
    email: "E-post",
    references: "Referenser",
    section: "Avsnitt",
    figure: "Figur",
    table: "Tabell",
  ),
)

#let conf(
  title: [Report Title],
  author: (name: "Adil Shamji", email: "adil02.shamji@gmail.com"),
  lang: "en",
  rectangle_color: black,
  doc,
) = {
  let t = language.at(lang, default: language.at("en"))

  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm), numbering: "1"
  )
  set text(
    font: "New Computer Modern",
    lang: lang, 
  )
   set par(
    first-line-indent: 0em,
    spacing: 1.4em,
    justify: true,
    leading: 0.7em,
  )

// https://github.com/coli-saar/bananote/blob/main/lib.typ
set heading(numbering: "1.1 ")
let heading_size = 12pt

show heading.where(level: 1): it => {
  v(2em, weak: true)

  block(below: 1em)[
    #place(dx: -3mm - 2em, dy: -3.5pt)[
      #box(width: 2em)[
        #context {
          align(right)[
            #box(fill: rectangle_color, width: 1em, height: 1em)[
              #if it.numbering != none {
                align(center + horizon)[
                  #text(
                    font: "New Computer Modern Sans",
                    weight: 800,
                    size: heading_size,
                    fill: white,
                  )[
                    #counter(heading).get().first()
                  ]
                ]
              }
            ]
          ]
        }
      ]
    ]

    #it.body
    ]
  }
  if title != none {
    align(Left, text(size: 22pt, weight: "bold", title))
    v(1em)
  }
  doc
}
  
