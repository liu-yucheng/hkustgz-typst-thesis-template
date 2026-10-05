/* List of Publications (LoP) page. */

#import "../template/imports.typ": *
#import "../template/styles.typ": *

= List of Publications <list-of-pubs>

#set par(leading: line-spacing.bib, spacing: line-spacing.bib)

#show: alexandria(prefix: "pubs-journal-", read: path => read(path))
#heading(level: 2, numbering: none)[Journal Publications]
#bibliographyx(
  thesis-hkustgz.info.bib-pubs-journal,
  prefix: "pubs-journal-",
  title: none,
  style: "ieee",
  full: true,
) // end #bibliographyx

#show: alexandria(prefix: "pubs-conf-", read: path => read(path))
#heading(level: 2, numbering: none)[Conference Publications]
#bibliographyx(
  thesis-hkustgz.info.bib-pubs-conf,
  prefix: "pubs-conf-",
  title: none,
  style: "ieee",
  full: true,
) // end #bibliographyx
