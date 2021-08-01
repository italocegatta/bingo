
# testar app --------------------------------------------------------------
options(shiny.launch.browser = .rs.invokeShinyPaneViewer)
devtools::load_all()
bingo:::run_app()

bingo:::mod_cartela_ui
library(shiny)

reactiveValues()

library(tidyverse)
library(bingo)

x <- bingo_samples()

y <- bingo_grid()

drawn <- c(10, 50, 73)

library()

 y %>% 
  mutate(is_drawn = value %in% drawn) %>% 
  ggplot(aes(key, id, label = value, color = is_drawn, size = is_drawn)) +
    geom_text(show.legend = FALSE) +
    scale_y_reverse() + 
    scale_color_manual(
      values = c("TRUE" = "black", "FALSE" = "grey") 
    ) +
     scale_size_manual(
       values = c("TRUE" = 5, "FALSE" = 3) 
     ) +
    theme_void(14) +
    theme(axis.text.x = element_text()) +
    guides(x.sec = guide_axis_label_trans(~.))


