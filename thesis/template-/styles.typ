/* Styles. */

#import "imports.typ": *

/* Render the given `content` in "global style." */
#let global-style(content) = {
  set page(
    paper: "a4",
    margin: 25mm,
    number-align: center,
  ) // end set page
  set par(
    leading: line-spacing.main,
    justify: true,
  ) // end set par
  set text(
    font: font-family.main,
    size: font-size.main,
  ) // end set text
  show raw: set text(font: font-family.mono)
  // Reference: https://forum.typst.app/t/how-can-i-number-equations-within-sections/1936/7 .
  set math.equation(numbering: index => {
    let appendix = state("backmatter", false).get()
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let header = counter(heading).get().at(0)
    let count = counter(heading.where(level: 1)).at(here()).first()
    if appendix { [(#alphabet.at(header - 1).#index)] } else { numbering("(1.1)", count, index) }
  }) // end set math.equation
  // Reference: https://forum.typst.app/t/how-to-change-numbering-in-appendix/1716/2 .
  set figure(numbering: index => {
    let appendix = state("backmatter", false).get()
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let header = counter(heading).get().at(0)
    if appendix [#alphabet.at(header - 1).#index] else [#header.#index]
  }) // end set figure
  show heading.where(level: 1): content => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(math.equation).update(0)
    content
  } // end show heading.where

  content
} // end #let global-style

/* Render the given `content` in "main content style." */
#let main-style(content) = {
  set page(numbering: "1")
  set heading(numbering: numblex("{Chapter [1]:d==1;[1]}{.[1]}{.[1]}{.[1]}{.[1]}"))
  show heading.where(level: 1): set heading(supplement: none)
  show heading.where(level: 1): content => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(math.equation).update(0)
    set text(size: font-size.chapter-title)
    set align(center)
    clear-double-page()
    upper(counter(heading).display(content.numbering))
    parbreak()
    upper(content.body)
  } // end show heading.where
  counter(page).update(1)

  content
} // end #let main-content-style

/* Render the given `content` in "references style." */
#let refs-style(content) = {
  set page(numbering: "1")
  set heading(numbering: none, supplement: none)
  show heading.where(level: 1): content => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(math.equation).update(0)
    set text(size: font-size.chapter-title)
    set align(center)
    clear-double-page()
    upper(content.body)
  } // end show heading.where
  set par(leading: line-spacing.bib, spacing: line-spacing.bib)

  content
} // end #let ref-page-style

/* Render the given `content` in "appendix style." */
#let appendix-style(content) = {
  set page(numbering: "1")
  set heading(numbering: numblex("{Appendix [A]:d==1;[A]}{.[1]}{.[1]}{.[1]}{.[1]}"))
  show heading.where(level: 1): content => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(math.equation).update(0)
    set text(size: font-size.chapter-title)
    set align(center)
    clear-double-page()
    upper(counter(heading).display(content.numbering))
    parbreak()
    upper(content.body)
  } // end show heading.where
  counter(heading).update(0)
  state("backmatter").update(true)

  content
} // end #let appendix-style
