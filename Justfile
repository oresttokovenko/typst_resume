src := "tests/src"
pdf := "tests/pdf"

[private]
watch name:
    typst watch {{ src }}/{{ name }}.typ {{ pdf }}/{{ name }}.pdf --root .

[private]
compile name:
    typst compile {{ src }}/{{ name }}.typ {{ pdf }}/{{ name }}.pdf --root .

watch-job-title-primary: 
  (watch "test-job-title-primary")

watch-company-primary: 
  (watch "test-company-primary")

build: (compile "test-job-title-primary") (compile "test-company-primary")

format:
    typstyle -i .
