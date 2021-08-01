usethis::use_package("shinydashboard")
usethis::use_package("shinyWidgets")
usethis::use_package("waiter")
usethis::use_package("dplyr")
usethis::use_package("tidyr")
usethis::use_package("forcats")
usethis::use_package("ggplot2")
usethis::use_package("rlang")



golem::add_module( name = "cartela" ) 
golem::add_module( name = "jogo" ) 

# usethis::use_data_raw( name = "my_dataset", open = FALSE ) 

usethis::use_pipe()

# usethis::use_github_action() 
# # Chose one of the three
# # See https://usethis.r-lib.org/reference/use_github_action.html
# usethis::use_github_action_check_release() 
# usethis::use_github_action_check_standard() 
# usethis::use_github_action_check_full() 
# # Add action for PR
# usethis::use_github_action_pr_commands()


# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

