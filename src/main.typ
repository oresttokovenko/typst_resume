// Orest Tokovenko
// Resume Template

#import "./helper.typ": *

#let resume(
  author: "",
  author-position: center,
  personal-info-position: center,
  vertical-spacing: 7pt,
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
  author-font-size: 25pt,
  font-size: 10pt,
  body,
) = {

  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
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
    #pad(top: -5pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 0.5pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  // Name will be aligned, bold and big
  show heading.where(level: 1): it => [
    #set align(author-position)
    #set text(
      weight: 800,
      size: author-font-size,
    )
    #pad(top: -10pt, bottom: -5pt, [#smallcaps(it.body)])
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
    ]

  // Main body
  set par(justify: true, spacing: vertical-spacing)

  body
}

// Education

#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
) = {
    generic-two-by-two(
      top-left: strong(institution),
      top-right: dates,
      bottom-left: degree,
      bottom-right: emph(location),
    )
}

// Work Experience

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

// Certifications

#let certifications(
  name: "",
  issuer: "",
  date: "",
) = {
  [
    *#name* | #issuer
    #h(1fr) #date
  ]
}
