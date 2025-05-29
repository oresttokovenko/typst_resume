// Orest Tokovenko
// Resume Template

#import "./helper.typ": *

#let resume(
  author: "",
  author-position: center,
  personal-info-position: center,
  pronouns: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  accent-color: "#3A5FCD",
  font: "SF Pro Display",
  paper: "us-letter",
  author-font-size: 20pt,
  font-size: 10pt,
  body,
) = {

  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: font,
    size: font-size,
    lang: "en",
    // Disable ligatures so ATS systems do not get confused when parsing fonts
    ligatures: false
  )

  // 0.5in margin on all sides
  set page(
    margin: (0.5in),
    paper: paper,
  )

  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 0.5pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(author-position)
    #set text(
      weight: 800,
      size: author-font-size,
    )
    #pad([#smallcaps(it.body)])
  ]

  // Level 1 Heading
  [= #(author)]

  // Personal Info Helper
  let contact-item(value, prefix: "", link-type: "") = {
    if value != "" {
      if link-type != "" {
        link(link-type + value)[#(prefix + value)]
      } else {
        value
      }
    }
  }

  // Personal Info
  pad(
    top: 0.25em,
    align(personal-info-position)[
      #{
        let raw_items = (
          contact-item(phone),
          contact-item(location),
          contact-item(email, link-type: "mailto:"),
          contact-item(github, link-type: "https://"),
          contact-item(linkedin, link-type: "https://"),
          contact-item(personal-site, link-type: "https://"),
        )

      let items = raw_items.filter(x => x != none)
      let half = calc.floor(items.len() / 2)
      let line1 = items.slice(0, half).join("  |  ")
      let line2 = items.slice(half, items.len()).join("  |  ")

      [
        #line1 \
        #line2
      ]
      }
    ],
  )

  // Main body.
  set par(justify: true)

  body
}

// Education

#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
  // Makes dates on upper right like rest of components
  consistent: false,
) = {
  if consistent {
    // edu-constant style (dates top-right, location bottom-right)
    generic-two-by-two(
      top-left: strong(institution),
      top-right: dates,
      bottom-left: emph(degree),
      bottom-right: emph(location),
    )
  } else {
    // original edu style (location top-right, dates bottom-right)
    generic-two-by-two(
      top-left: strong(institution),
      top-right: location,
      bottom-left: emph(degree),
      bottom-right: emph(dates),
    )
  }
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}

// Certificates

#let certificates(
  name: "",
  issuer: "",
  date: "",
) = {
  [
    *#name* | #issuer
    #h(1fr) #date
  ]
}
