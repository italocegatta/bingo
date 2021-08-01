#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {

  # bingo_numbers <- bingo_samples()
  # 
  # grid <- bingo_grid()
  # 
  # counter <- reactiveValues(countervalue = 0)
  # 
  # observeEvent(input$sortear, {
  # 
  #   counter$countervalue <- counter$countervalue + 1  
  # 
  # })
  # 
  # output$num <- renderText(bingo_numbers$number[seq_len(counter$countervalue)])
  # 
  # output$plot <- renderPlot({
  # 
  #   drawn <- bingo_numbers$number[seq_len(counter$countervalue)]
  # 
  #   grid %>%
  #     dplyr::mutate(is_drawn = value %in% drawn) %>%
  #     ggplot2::ggplot(ggplot2::aes(key, id, label = value, fill = is_drawn)) +
  #     ggplot2::geom_label(show.legend = FALSE)
  # })
  # 
  # # output$table <- renderDataTable({
  # #   bingo_numbers %>% 
  # #     head(n = counter$countervalue)
  # # })
  # # 

  mod_jogo_server("jogo_ui_1")
  
}
