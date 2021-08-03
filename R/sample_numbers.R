#' Base numbers to play
#'
#' @export
bingo_samples <- function() {
  
  dplyr::tibble(
    id = 1:75,
    number = sample(1:75, replace = FALSE),
    letter = dplyr::case_when(
      dplyr::between(number,  1, 15) ~ "B",
      dplyr::between(number, 16, 30) ~ "I",
      dplyr::between(number, 31, 45) ~ "N",
      dplyr::between(number, 46, 60) ~ "G",
      dplyr::between(number, 61, 75) ~ "O"
    ),
   label = paste0(letter, "-", number)
  )
  
}

#' Grid of Bingo numbers
#'
#' @export
bingo_grid <- function() {
  
  dplyr::tibble(
    B = 1:15,
    I = 16:30,
    N = 31:45,
    G = 46:60,
    O = 61:75
  ) %>% 
  tidyr::gather() %>% 
  dplyr::mutate(
    id = rep(1:15, 5),
    key = forcats::fct_relevel(key, "B", "I", "N", "G", "O")
  )
}
