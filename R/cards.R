#' Make Bingo card
#'
#' @export
bingo_card <-  function() {
  
  card <- dplyr::tibble(
    B = sample(1:15)[1:5],
    I = sample(16:30)[1:5],
    N = sample(31:45)[1:5],
    G = sample(46:60)[1:5],
    O = sample(61:75)[1:5]
  ) 
  
  card[3, 3] <- NA
  
  card %>% 
    tidyr::gather() %>% 
    dplyr::mutate(
      id_y = rep(1:5, 5),
      id_x = rep(1:5, each = 5),
      key = forcats::fct_relevel(key, "B", "I", "N", "G", "O"),
      value = stringr::str_pad(value, 2, "left", "0")
    ) %>% 
    ggplot2::ggplot(ggplot2::aes(id_x, id_y, label = value)) +
    ggplot2::geom_text(size = 10) +
    ggplot2::geom_point(
      data = data.frame(id_x = 3, id_y = 3, value = NA), 
      shape = 13, size = 8
    ) +
    ggplot2::coord_equal() +
    ggplot2::scale_y_continuous( expand = ggplot2::expansion(add = c(0.5, 0.5))) +
    ggplot2::scale_x_continuous(
      labels = c(NA, "B", "I", "N", "G", "O"),
      sec.axis = ggplot2::dup_axis(),
      expand = ggplot2::expansion(add = c(0.5, 0.5))
    ) +
    ggplot2::theme_linedraw() +
    ggplot2::theme(
      axis.title = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_text(face = "bold", size= 20)
    )
}

#' Export Bingo card
#'
#' @export
bingo_export_card <- function(n_cards, n_per_page) {
  
  list_plots <- purrr::map(seq_len(n_cards), ~bingo_card())

  vec_names <- paste0(seq_len(n_cards), ".pdf")
  
  purrr::walk2(
    vec_names,
    list_plots,
    ~ggplot2::ggsave(.x, .y, width = 8, height = 4, dpi = 300)
  )
  
}