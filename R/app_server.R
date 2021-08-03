#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {

  mod_jogo_server("jogo_ui_1")
  
  mod_cartela_server("cartela_ui_1")
  
}
