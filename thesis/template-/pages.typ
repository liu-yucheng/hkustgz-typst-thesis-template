/* Pages. */

#import "imports.typ": *
#import "styles.typ": *

/* Render a title page with the given `thesis`. */
#let title-page(thesis: thesis-hkustgz) = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #let degree = setup-degree(thesis.info.degree)
  #set align(center)
  #invisible-heading("Title Page")
  #heading(outlined: false)[
    #set par(leading: line-spacing.title, spacing: line-spacing.title)
    #set text(size: font-size.title)
    #thesis.info.title.join("\n")
  ] // end #heading
  #repeat([#linebreak()], 5)

  by

  #repeat([#linebreak()], 1)

  #thesis.info.author

  #repeat([#linebreak()], 5)

  A Thesis Submitted to\
  The Hong Kong University of Science and Technology (Guangzhou)\
  in Partial Fulfillment of the Requirements for\
  the Degree of #degree.full of #degree.type\
  #if degree.abbr == "DBA" [] else [in #thesis.info.program]

  #repeat([#linebreak()], 3)

  #thesis.info.submit-date.month #thesis.info.submit-date.year, #thesis.info.city
]} // end #let title-page

/* Render an abstract page with the given `thesis` and `content`. */
#let abstract-page(thesis: thesis-hkustgz, content) = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #let degree = setup-degree(thesis.info.degree)
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading("Abstract")
  #heading(outlined: false)[
    #set par(leading: line-spacing.title, spacing: line-spacing.title)
    #set text(size: font-size.title)
    #thesis.info.title.join("\n")
  ] // end #heading
  #repeat([#linebreak()], 1)

  by #thesis.info.author

  #repeat([#linebreak()], 2)

  #if degree.abbr == "DBA" [Doctor of Business Administration Program] else [#thesis.info.thrust]

  #repeat([#linebreak()], 1)

  The Hong Kong University of Science and Technology (Guangzhou)

  #repeat([#linebreak()], 2)

  Abstract

  #repeat([#linebreak()], 1)
  #set align(left)
  #set par(leading: line-spacing.abstract)

  #content
]} // end #let abstract-page

/* Render an authorization page with the given `thesis`. */
#let auth-page(thesis: thesis-hkustgz) = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #let degree = setup-degree(thesis.info.degree)
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading("Authorization Page")
  #heading(outlined: false)[#text(
      size: font-size.title,
      underline[Authorization],
  )] // end #heading
  #repeat([#linebreak()], 2)
  #align(left)[
    #set par(first-line-indent: 2em)
    
    I hereby declare that I am the sole author of the thesis.

    #repeat([#linebreak()], 1)

    I authorize the Hong Kong University of Science and Technology (Guangzhou) to lend this thesis to other institutions or individuals for the purpose of scholarly research.\

    #repeat([#linebreak()], 1)

    I further authorize the Hong Kong University of Science and Technology (Guangzhou) to reproduce the thesis by photocopying or by other means, in total or in part, at the request of other institutions or individuals for the purpose of scholarly research.

  ] // end #align
  #repeat([#linebreak()], 7)
  #signature-line()

  #thesis.info.author
  
  #repeat([#linebreak()], 1)
  
  #thesis.info.submit-date.day #thesis.info.submit-date.month #thesis.info.submit-date.year
]} // end #let auth-page

/* Render a signature page with the given `thesis`. */
#let signature-page(thesis: thesis-hkustgz) = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #let title-str = thesis.info.title.join(" ")
  #let degree = setup-degree(thesis.info.degree)
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading("Signature Page")
  #heading(outlined: false)[
    #set par(leading: line-spacing.title, spacing: line-spacing.title)
    #set text(size: font-size.title)
    #thesis.info.title.join("\n")
  ] // end #heading
  #repeat([#linebreak()], 5)

  by

  #repeat([#linebreak()], 1)

  #thesis.info.author

  #repeat([#linebreak()], 2)

  This is to certify that I have examined the above #degree.abbr thesis\
  and have found that it is complete and satisfactory in all respects,\
  and that any and all revisions required by\
  the thesis examination committee have been made.

  #repeat([#linebreak()], 4)
  #for (position, details) in thesis.info.supervisors {
    signature-line()
    [#details.name, #details.role]
    repeat([#linebreak()], 3)
  } // end #for
  
  #signature-line()
  #thesis.info.thrust-head.name, #thesis.info.thrust-head.position
  
  #repeat([#linebreak()], 1)
  
  #if degree.abbr == "DBA" [Doctor of Business Administration Program] else [#thesis.info.thrust]
  
  #thesis.info.submit-date.day #thesis.info.submit-date.month #thesis.info.submit-date.year
]} // end #let signature-page

/* Render a dedication page with the given `thesis` and `content`. */
#let dedication-page(thesis: thesis-hkustgz, content) = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #let degree = setup-degree(thesis.info.degree)
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading("Dedication")
  #heading(outlined: false)[#text(
      size: font-size.title,
      [Dedication],
  )] // end #heading
  #repeat([#linebreak()], 1)
  #set align(left)
  #set par(first-line-indent: 2em)

  #content
]} // end #let dedication-page

/* Render an acknowledgments page with the given `thesis` and `content`. */
#let acknowledgments-page(thesis: thesis-hkustgz, content) = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #let degree = setup-degree(thesis.info.degree)
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading("Acknowledgments")
  #heading(outlined: false)[
    #text(
      size: font-size.title,
      "Acknowledgments",
    ) // end #text
  ] // end #heading
  #repeat([#linebreak()], 1)
  #set align(left)
  #set par(first-line-indent: 2em)

  #content
]} // end #let acknowledgments-page

/* Render a table-of-contents page. */
#let table-of-contents-page() = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading("Table of Contents")
  #heading(outlined: false)[
    #set par(leading: line-spacing.title, spacing: line-spacing.title)
    #set text(size: font-size.title)
    #upper("Table of Contents")
  ] // end #heading
  #repeat([#linebreak()], 1)
  #set align(left)
  #set par(leading: line-spacing.table-of-contents, spacing: line-spacing.table-of-contents)
  #outline(title: none, depth: 3)
]} // end #let table-of-contents-page

/* Render a list-of-kind page with the given `kind` and `title`. */
#let list-of-kind-page(kind: image, title: "List of Figures") = {[
  #show: global-style
  #set heading(numbering: none)
  #set page(numbering: "i")
  #set align(center)
  #pagebreak(weak: true, to: blank-page-mode)
  #invisible-heading(title)
  #heading(outlined: false)[
    #set par(leading: line-spacing.title, spacing: line-spacing.title)
    #set text(size: font-size.title)
    #upper(title)
  ] // end #heading
  #repeat([#linebreak()], 1)
  #set align(left)
  #set par(leading: line-spacing.table-of-contents, spacing: line-spacing.table-of-contents)
  #outline(title: none, target: figure.where(kind: kind))
]} // end #let list-of-kind-page
