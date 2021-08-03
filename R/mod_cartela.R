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
    
    fluidRow(
      shinydashboard::box(
        status = "primary", width = 2,
        numericInput(
          ns("n_cards"), "Número de Cartelas",
          value = " "
        ),
        downloadButton(ns("downalod_cards"), "Download")
      )
    )
  )
}
    
#' cartela Server Functions
#'
#' @noRd 
mod_cartela_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$downalod_cards <- downloadHandler(
      
      filename = "cartelas.zip",
      
      content = function(fname) {
        
        tmpdir <- tempdir()
        
        list_plots <- purrr::map(seq_len(input$n_cards), ~bingo_card())
        
        id_names <- stringr::str_pad(seq_len(input$n_cards), 2, "left", "0")
        
        vec_names <- stringr::str_glue("{tmpdir}/cartela_{id_names}.pdf")
        
        purrr::walk2(
          vec_names,
          list_plots,
          ~ggplot2::ggsave(.x, .y, width = 8, height = 4, dpi = 300)
        )
        
        fs <- list.files(tmpdir, pattern = "cartela_\\d+.pdf", full.names = TRUE)
        
        zip::zipr(zipfile=fname, files=fs)
        
        file.remove(fs)

      },
      contentType = "application/zip"
    )
 
  })
}
    
## To be copied in the UI
# mod_cartela_ui("cartela_ui_1")
    
## To be copied in the server
# mod_cartela_server("cartela_ui_1")
