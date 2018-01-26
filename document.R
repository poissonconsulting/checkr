devtools::document()
if(file.exists("DESCRIPTION")) unlink("docs", recursive = TRUE)
pkgdown::build_site()
devtools::check()
