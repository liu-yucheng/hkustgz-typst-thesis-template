/* Imports. */

#import "@preview/physica:0.9.8": *
#import "@preview/unify:0.7.1": num, unit, qty,numrange, qtyrange
#import "@preview/typsium:0.3.1":*
#import "@preview/mitex:0.2.7": *
#import "@preview/numblex:0.2.0": numblex
#import "@preview/alexandria:0.2.2": *

/* Line spacing configs. */
#let line-spacing = (
  main: 1.07em,
  abstract: 0.49em,
  bib: 0.8em,
  title: 0.8em,
  table-of-contents: 0.8em,
) // end #let line-spacing

/* Page margin configs. */
#let page-margin = 25mm

/* Font family configs. */
#let font-family = (
  main: ("Cambria", "Go Noto Current Serif",),
  table-of-contents: ("Cambria", "Go Noto Current Serif",),
  title: ("Cambria", "Go Noto Current Serif",),
  math: ("XITS",),
  mono: ("Cascadia Mono", "Courier New",),
) // end #let font-family

/* Font size configs. */
#let font-size = (
  main: 12pt,
  title: 20pt,
  chapter-title: 16pt,
  table-of-contents: 12pt,
) // end #let font-size

#import "../info.typ": thesis-hkustgz

/* Blank page mode. */
#let blank-page-mode = if thesis-hkustgz.configs.blank-page-enabled { "odd" } else { none }

#set document(
  title: (("",) + thesis-hkustgz.info.title).sum(),
  author: thesis-hkustgz.info.author,
) // end #set document

/*
Create an invisible heading with given `..args`.
`..args` passed to an internal `heading` invocation.
*/
#let invisible-heading(..args,) = {
  set text(size: 0pt, fill: white)
  heading(numbering: none, ..args)
} // end #let invisible-heading

/*
Render a signature line with the given `length`.
`length` given in percentage of page width.
*/
#let signature-line(length: 70%) = (align(center)[#line(length: length, stroke: 0.5pt)])

/* Repeat `content` in code mode for `num` times. */
#let repeat(content, num) = (
  for time in range(num) {
    [#content]
  } // end for
) // end #let repeat

/* Clear double page. */
#let clear-double-page() = (pagebreak(weak: true, to: blank-page-mode))

/*
Set up the pursued `degree`.
`degree` supported: `"PhD" | "MPhil" | "DBA"`.
Return dictionary `(full: str, abbr: str, type: str)`,
  where `full`: The full name of degree,
  `abbr`: The abbreviation of degree,
  `type`: The type of degree.
*/
#let setup-degree(degree) = {
  let full = ""
  let abbr = ""
  let type = ""
  if (lower(degree) == "phd") {
    full = "Doctor"
    abbr = "PhD"
    type = "Philosophy"
  } else if (lower(degree) == "mphil") {
    full = "Master"
    abbr = "MPhil"
    type = "Philosophy"
  } else if (lower(degree) == "dba") {
    full = "Doctor"
    abbr = "DBA"
    type = "Business Administration"
  } else {
    full = "<Degree full name>"
    abbr = "<Degree abbreviation>"
    type = "<Degree type>"
  } // end if
  return (
    full: full,
    abbr: abbr,
    type: type
  ) // end return
} // end #let setup-degree

/* Three-line-table configs. */
#let three-line-table = (
  bottom-rule: table.hline(stroke: 0.08em),
  mid-rule: table.hline(stroke: 0.05em),
  top-rule: table.hline(stroke: 0.08em),
) // end #let three-line-table

/* The "TeX" symbol. */
#let tex = context {
  let e-measure = measure(text(1em, "E"))
  let letter-t = "T"
  let letter-e = text(1em, baseline: e-measure.height / 4, "E")
  let letter-x = "X"
  box(letter-t + h(-0.1em) + letter-e + h(-0.125em) + letter-x)
} // end #let tex

/* The "LaTeX" symbol. */
#let latex = context {
  let l-measure = measure(text(1em, "L"))
  let a-measure = measure(text(0.7em, "A"))
  let letter-l = "L"
  let letter-a = text(0.7em, baseline: a-measure.height - l-measure.height, "A")
  box(letter-l + h(-0.3em) + letter-a + h(-0.1em) + tex)
} // end #let latex
