/* Information. */

/* HKUST (GZ) thesis configs. */
#let thesis-hkustgz = (
  configs: (
    // Set to true to add blank pages for printed version.
    blank-page-enabled: false,
    // Committee info only required by ECE.
    committee-enabled: false,
  ), // end configs
  info: (
    // `degree` supported: `"PhD" | "MPhil" | "DBA"`.
    degree: "<Degree>",
    // `title`: Keep the ending comma.
    title: ("<Title>", ),
    author: "<Author name>",
    // Same as thrust name for HKUST (GZ).
    program: "<Program>",
    // Hub or School (optional).
    hub: "<Hub>",
    // Thrust, Department, or Division.
    thrust: "<Thrust>",
    supervisors: (
      main: (
        name: "Prof. <Supervisor name>",
        role: "Thesis Supervisor",
      ), // end main
      co: (
        name: "Prof. <Co-Supervisor name>",
        role: "Thesis Co-Supervisor",
      ), // end co
    ), // end supervisors
    thrust-head: (
      name: "Prof. <Thrust head name>",
      // Head of Thrust, Head of Department, or Head of Division.
      position: "Head of Thrust",
    ), // end thrust-head
    submit-date: (
      day: "01",
      month: "January",
      year: "1970",
    ), // end submit-date
    defend-date: (
      day: "01",
      month: "January",
      year: "1970",
    ), // end defend-date
    // Guangzhou or Hong Kong.
    city: "<City>",
    bib-main: (
      "/thesis/thesis/refs/refs.bib",
      "/thesis/thesis/appendix-list-of-pubs/pubs-conf.bib",
      "/thesis/thesis/appendix-list-of-pubs/pubs-journal.bib",
    ), // end bib-main
    bib-pubs-journal: ("/thesis/thesis/appendix-list-of-pubs/pubs-journal.bib", ),
    bib-pubs-conf: ("/thesis/thesis/appendix-list-of-pubs/pubs-conf.bib", ),
    committee: (
      (
        name: "Prof. <Chairperson name> (Chairperson)",
        thrust: "<Thrust>",
      ),
      (
        name: "Prof. <Supervisor name> (Supervisor)",
        thrust: "<Thrust>",
      ),
      (
        name: "Prof. <Co-Supervisor name> (Co-Supervisor)",
        thrust: "<Thrust>",
      ),
      (
        name: "Prof. <Member name>",
        thrust: "<Thrust>",
      ),
      (
        name: "Prof. <Member name>",
        thrust: "<Thrust>",
      ),
      (
        name: "Prof. <Member name> (External Examiner)",
        // Fill in the department name of external examiner.
        thrust: "<Department>, <University>",
      ),
    ), // end committee
  ), // end info
) // end #let thesis-hkustgz
