#' cartela UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_cartela_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' cartela Server Functions
#'
#' @noRd 
mod_cartela_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_cartela_ui("cartela_ui_1")
    
## To be copied in the server
# mod_cartela_server("cartela_ui_1")
