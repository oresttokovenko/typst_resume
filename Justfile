src := "tests/src"
pdf := "tests/pdf"
txt := "tests/txt"

[private]
watch name:
    typst watch {{ src }}/{{ name }}.typ {{ pdf }}/{{ name }}.pdf --root .

[private]
compile name:
    typst compile {{ src }}/{{ name }}.typ {{ pdf }}/{{ name }}.pdf --root . --pdf-standard a-2u

[private]
extract name:
    pdftotext {{ pdf }}/{{ name }}.pdf {{ txt }}/{{ name }}.txt

[doc('Watch job-title-primary test for changes')]
watch-job-title-primary:
  (watch "test-job-title-primary")

[doc('Watch company-primary test for changes')]
watch-company-primary:
  (watch "test-company-primary")

[doc('Compile all test resumes to PDF')]
build: (compile "test-job-title-primary") (compile "test-company-primary")

[doc('Export all test PDFs to text')]
export: (extract "test-job-title-primary") (extract "test-company-primary")

[doc('Format all Typst files')]
format:
    typstyle -i .
