#'
#' test_pptx_plottr.r
#' A script designed to test the functionality of pptx_plottr.r
#'
#' Author....Ryan Poulsen
#' Created...07/21/2026
#' Updated...07/21/2026
#'
#' Made with <3
#'

library(testthat)
library(ggplot2)
library(gridExtra)
library(pptxplottr)

# Example data frame
df <- data.frame(
  value = c("Contraction", "Expansion", "Persistence"),
  count = c(54779, 271052, 93000),
  pc = c(13.1, 64.7, 22.2),
  area_m2 = c(5477900, 27105200, 9300000),
  area_acres = c(1353.619, 6697.841, 2298.080),
  stringsAsFactors = TRUE
)

# Example ggplot
plt <- ggplot(df, aes(x = factor(value), y = area_acres)) +
  geom_col(fill = c("#f0ac45", "#6aeb82", "#4e9723")) +
  xlab("Aspen Condition") +
  ylab("Area (Acres)") +
  labs(title = "Cameron Peak Aspen Change") +
  geom_text(aes(label = pc), size = 8, nudge_y = 1) +
  coord_cartesian(ylim = c(0, 10000)) +
  theme(text = element_text(size = 14))

# Example ggplot (2)
plt2 <- ggplot(df, aes(x = factor(value), y = pc)) +
  geom_col(fill = c("#f0ac45", "#6aeb82", "#4e9723")) +
  xlab("Aspen Condition") +
  ylab("Percent Aspen Cover") +
  labs(title = "Cameron Peak Aspen Change") +
  coord_cartesian(ylim = c(0, 100)) +
  theme(text = element_text(size = 14))

# Example gridExtra
grid_plt <- grid.arrange(
  plt,
  plt2,
  top = "Aspen Status in Cameron Peak Burn Area",
  bottom = "Aspen Status"
)

test_that("pptx_plot() works with ggplot objects", {
  expect_no_error(pptx_plot(plt, "tests/testthat/test_ggplot.pptx"))
})

test_that("pptx_plot() works with extraGrid objects", {
  expect_no_error(pptx_plot(grid_plt, "tests/testthat/test_gridExtra.pptx"))
})
