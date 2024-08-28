# Renders a single SEO dashboard

library(quarto)
library(lubridate)

name <- "marekp-cz"
site <- "http://www.marekp.cz/"
country = "cze"

quarto_render(
  input = "seo-dashboard.qmd",
  output_file = paste0(name, ".html"),
  execute_params = list(
    site = site,
    country = country
  ),
  metadata = list(
    title = paste0("SEO Dashboard for **", site, "** as of ", today() - 3),
    date = lubridate::today() - 3
  )
)
