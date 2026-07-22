#'
#' pptx_plottr.r
#' This script allows you to easily create separate-and-editable plots in R.
#' An officer-based package.
#'
#' Made with <3
#'

# Import Libraries
library(ggplot2)
library(officer)
library(rvg)
library(here)

#'
#' Powerpoint Ready Plot
#' @description Powerpoint Ready Plots for Separate-and-Editable Figures Made Easy
#' @param plt A ggplot or R plot object.
#' @param pptx_path Path to powerpoint presentation to export.
#' @export
#'
pptx_plot <- function(plt, pptx_path) {
  if (ggplot2::is_ggplot(plt)) { # if plt is a ggplot object
    plt_dml <- rvg::dml(ggobj = plt)
  } else { # if plt is not a ggplot object, perhaps gridExtra or other plot
    plt_dml <- rvg::dml(code = plt)
  }
  # initialize PowerPoint slide
  officer::read_pptx() |>
    # add slide
    officer::add_slide(layout = "Blank") |>
    # add plot to slide at full-size
    officer::ph_with(plt_dml, officer::ph_location_fullsize()) |>
    # export slide; if .pptx already exists, update file, otherwise create new .pptx
    print(target = here::here(pptx_path)
    )
  print(paste("Plot exported to '", pptx_path, "'", sep = ""))
}
