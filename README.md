# git-hired

![Typst](https://img.shields.io/badge/typst-239DAD.svg?style=for-the-badge&logo=typst&logoColor=white)

See an [example resume](https://github.com/oresttokovenko/git-hired/blob/main/tests/pdf/test-job-title-primary.pdf) to get a feel for the template.

A clean, minimal resume template built in [Typst](https://typst.app), designed to be highly customizable and visually professional. Strongly inspired by [stuxf's basic-typst-resume-template](https://github.com/stuxf/basic-typst-resume-template).

## Features

- Clean, ATS-friendly design with ligatures disabled
- Customizable fonts, colors, and spacing
- Flexible work experience format (job-title-primary or company-primary)
- Support for multiple roles at the same company

## Work Experience Format

The template supports two formats for displaying work experience via the `work-format` parameter:

### Job Title Primary (default)

```
Senior Software Engineer                    Jun 2022 - Present
TechNova Inc.                              San Francisco, CA
```

Use this when your job titles are more impressive or relevant than the company names.

### Company Primary

```
TechNova Inc.                              San Francisco, CA
Senior Software Engineer                    Jun 2022 - Present
```

Use this when:
- You work for a well-known company and want to highlight that
- You have career progression within a single company (multiple roles are grouped under the company name)

### Configuration

```typst
#show: resume.with(
  author: "Jane Doe",
  work-format: "company-primary",  // or "job-title-primary"
  ...
)
```

### Multiple Roles at One Company

With `company-primary`, you can show promotions by omitting company/location on subsequent entries:

```typst
#work(
  company: "TechNova Inc.",
  location: "San Francisco, CA",
  title: "Senior Software Engineer",
  dates: dates-helper(start-date: "Jun 2022", end-date: "Present"),
)
- Accomplishment 1
- Accomplishment 2

#work(
  title: "Software Engineer",
  dates: dates-helper(start-date: "Jun 2020", end-date: "Jun 2022"),
)
- Accomplishment 1
- Accomplishment 2
```

## Installation & Usage

See [USAGE.md](USAGE.md) for installation instructions and development setup.

## License

[MIT](LICENSE)
