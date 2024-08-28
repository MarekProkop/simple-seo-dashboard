# Renders SEO dashboards for selected websites

library(quarto)
library(lubridate)
library(purrr)

list(
  list(
    name = "marep-cz",
    site = "http://www.marekp.cz/",
    country = "cze"
  ),
  list(
    name = "caj-tydne",
    site = "https://www.cajtydne.cz/",
    country = "cze"
  )
) |>
  walk(\(x) {
    quarto_render(
      input = "seo-dashboard.qmd",
      output_file = paste0(x$name, ".html"),
      execute_params = list(
        site = x$site,
        country = x$country
      ),
      metadata = list(
        title = paste0("SEO Dashboard for **", site, "** as of ", today() - 3),
        date = lubridate::today() - 3
      )
    )
  })
