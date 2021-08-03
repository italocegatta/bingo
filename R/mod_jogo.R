#' jogo UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_jogo_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    #waiter::autoWaiter(ns("plot"), ns("last_num"), ns("num")),
    
    fluidRow(
      column(
        2,
        shinyWidgets::actionBttn(
          ns("sortear"), "Sortear",
          style = "fill", color = "primary", icon = icon("refresh"),
          size = "lg", block = TRUE
        )
      ),
      column(
        2,
        shinydashboard::valueBoxOutput(
          ns("last_num"), width = 12
        )
      ),
      column(
        8,
        shinydashboard::box(
          width = 12, height = "100px", status = "success",
          textOutput(ns("num"))
        )
      )
    ),
    
    fluidRow(
      shinydashboard::box(
        collapsible = FALSE, width = 12, height = "400px",
        plotOutput(ns("plot"))
      )
    )
  )
}
    
#' jogo Server Functions
#'
#' @noRd 
mod_jogo_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # valores base
    bingo_numbers <- bingo_samples()
    
    grid <- bingo_grid()
    
    counter <- reactiveValues(countervalue = 0)
    
    # contador de sorteio
    observeEvent(input$sortear, {
      
      if (counter$countervalue < 75) {
        
        counter$countervalue <- counter$countervalue + 1  
        
      }
        
      
    })
    
    
    reac_vec_drawn_numbers <- reactive({
      bingo_numbers$number[seq_len(counter$countervalue)]
    })
    
    reac_vec_drawn_labels <- reactive({
      bingo_numbers$label[seq_len(counter$countervalue)]
    })
    
    output$last_num <- shinydashboard::renderValueBox({
      
      if (length(reac_vec_drawn_labels()) == 0) {
        v <- c(" - ")
      }  else {
        v <- dplyr::last(reac_vec_drawn_labels())
      }
      
      shinydashboard::valueBox(v, "Último número", color = "green", width = 12)
      
    })
    
    output$num <- renderText(paste(reac_vec_drawn_labels(), collapse = ", "))
    
    output$plot <- renderPlot({
      # 
      # drawn <- bingo_numbers$number[seq_len(counter$countervalue)]
      
      grid %>%
        dplyr::mutate(is_drawn = value %in% reac_vec_drawn_numbers()) %>%
        ggplot2::ggplot(ggplot2::aes(key, id, label = value, color = is_drawn, size = is_drawn)) +
        ggplot2::geom_text(show.legend = FALSE) +
        ggplot2::scale_y_reverse() + 
        ggplot2::scale_color_manual(
          values = c("TRUE" = "black", "FALSE" = "grey") 
        ) +
        ggplot2::scale_size_manual(
          values = c("TRUE" = 2, "FALSE" = 1) 
        ) +
        ggplot2::theme_void(10) +
        ggplot2::theme(axis.text.x = ggplot2::element_text()) +
        ggplot2::guides(x.sec = guide_axis_label_trans(~.))
    },  res = 300, height = 380
    )
    
    # output$table <- renderDataTable({
    #   bingo_numbers %>%
    #     head(n = counter$countervalue)
    # })

 
  })
}
    
## To be copied in the UI
# mod_jogo_ui("jogo_ui_1")
    
## To be copied in the server
# mod_jogo_server("jogo_ui_1")
