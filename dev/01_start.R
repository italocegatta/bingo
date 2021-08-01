
golem::fill_desc(
  pkg_name = "bingo", # The Name of the package containing the App 
  pkg_title = "Shiny App to play bingo", # The Title of the package containing the App 
  pkg_description = "Here you will be able to create Bingo cards and generate numbers to play with friends.", # The Description of the package containing the App 
  author_first_name = "Italo", # Your First Name
  author_last_name = "Cegatta", # Your Last Name
  author_email = "italocegata@gmail.com", # Your Email
  repo_url = "https://github.com/italocegatta/bingo" # The URL of the GitHub Repo (optional) 
) 

## Set {golem} options ----
golem::set_golem_options()

usethis::use_readme_rmd( open = FALSE )

## Add helper functions ----
golem::use_utils_ui()
golem::use_utils_server()

golem::use_favicon("inst/app/www/favicon.ico")

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

