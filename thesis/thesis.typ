/* Thesis. */

#import "template-/imports.typ": *
#import "template-/styles.typ": *
#import "template-/pages.typ": *

#show: global-style
#show: alexandria(prefix: "bib-", read: path => read(path))
#show footnote.entry: content => {
  set align(left)
  content
} // end #show footnote.entry
#set footnote.entry(separator: [
  #set align(left)
  #line(length: 35%, stroke: 0.5pt)
]) // end #set footnote.entry
#title-page()
#abstract-page()[#include "thesis-/abstract.typ"]
#auth-page()
#signature-page()
#dedication-page()[#include "thesis-/dedication.typ"]
#acknowledgments-page()[#include "thesis-/acknowledgments.typ"]
#table-of-contents-page()
#list-of-kind-page(kind: image, title: "List of Figures")
#list-of-kind-page(kind: table, title: "List of Tables")

#show: main-style

= Introduction <intro>

#include "thesis-/inrto.typ"

= Literature Review <lit-review>

#include "thesis-/lit-review.typ"

= Methodologies <methods>

#include "thesis-/methods.typ"

= Experiments <experiments>

#include "thesis-/experiments.typ"

= Discussions <discussions>

#include "thesis-/discussions.typ"

= Limitations <limitations>

#include "thesis-/limitations.typ"

= Conclusions <conclusions>

#include "thesis-/conclusions.typ"

#show: refs-style
#include "thesis-/refs.typ"

#show: appendix-style
#include "thesis-/appendix-list-of-pubs.typ"
#include "thesis-/appendix-others.typ"
