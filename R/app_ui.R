#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    
    # Your application UI logic
    shinydashboard::dashboardPage(
      skin = "green",
      
      header = shinydashboard::dashboardHeader(
        title = "Bingo!"
      ),
      
      sidebar = shinydashboard::dashboardSidebar(

        shinydashboard::sidebarMenu(
          
          shinydashboard::menuItem(
            "Jogar",
            tabName = "jogo",
            icon = icon("play-circle")
          ),
          
          shinydashboard::menuItem(
            "Gerador de cartelas",
            tabName = "cartela",
            icon = icon("table")
          )
        )
      ),
      
      body = shinydashboard::dashboardBody(
        
        shinydashboard::tabItems(
          shinydashboard::tabItem(
            tabName = "cartela"
          ),
          
          shinydashboard::tabItem(
            tabName = "jogo",
            mod_jogo_ui("jogo_ui_1")
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'Bingo!'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
