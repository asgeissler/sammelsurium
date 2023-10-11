# Input: Some random rabit-duck bitmap downloaded from the internet
# Output:  Dataframe with
# - x-y points of the rabbit-duck
# - additional entries for dinosaur etc of same ansombe residuals

library(tidyverse)

library(anscombiser)
library(datasauRus)
library(maps)

# 3D matrix of RGB values of image
dat <-
  'rabbit-duck-raster.jpg' |>
  jpeg::readJPEG()
# lower resolution to every 5th pixel
dat <-
  dat[seq(1, nrow(dat), 5),
      seq(1, ncol(dat), 5), ]

# Background is mostly black, thus find spots with some
# color for drawing detection
lines <- apply(dat > 0.8, c(1, 2), any)

# Rabbit-Duck As data frame
animal <-
  lines  |>
  which(arr.ind = TRUE) |>
  as_tibble() |>
  set_names(c('x', 'y'))

# other shapes, but all with same anscome regression residuals
dino <- datasaurus_dozen_wide[, c("dino_x", "dino_y")] |>
  mimic(animal) |>
  as_tibble() |>
  set_names(c('x', 'y')) |>
  mutate_all(as.double)
italy <- mapdata("italy") |>
  mimic(animal) |>
  as_tibble() |>
  set_names(c('x', 'y')) |>
  mutate_all(as.double)

# Combine as one table
res <-
  list(
    'rabbit-duck' = animal,
    'dino' = dino,
    'italy' = italy
  ) %>%
  map2(names(.), ~ mutate(.x, dataset = .y)) |>
  bind_rows()

write_tsv(res, 'fun-data.tsv')

# Pairwise correlations
res |>
  group_by(dataset) |>
  summarize_all(
    ~ sprintf('%.1f ± %.1f', mean(.x), sd(.x))
  ) |>
  ungroup() |>
  left_join(
    res |>
      group_by(dataset) |>
      summarize('Pearson correlation' = cor(x, y)),
    'dataset'
  ) |>
  knitr::kable()
#|dataset     |x           |y           | Pearson correlation|
#|:-----------|:-----------|:-----------|-------------------:|
#|dino        |38.2 ± 18.7 |47.3 ± 35.2 |          -0.1037933|
#|italy       |38.2 ± 18.7 |47.3 ± 35.2 |          -0.1037933|
#|rabbit-duck |38.2 ± 18.7 |47.3 ± 35.2 |          -0.1037933|

# scatter plot
res |>
    ggplot(aes(x, y)) +
    geom_point() +
    facet_wrap(~ dataset) +
    theme_bw(24)

ggsave('fun-data.jpg', width = 12, height = 9)


dino
ls()
datas

