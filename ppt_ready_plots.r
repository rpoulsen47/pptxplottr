#'
#' ppt_ready_plots.r
#' This script is a template that allows you to easily create separate-and-editable plots in R.
#' Code adapted from https://www.pipinghotdata.com/posts/2020-09-22-exporting-editable-ggplot-graphics-to-powerpoint-with-officer-and-purrr/#'how
#'
#' Author....Ryan Poulsen
#' Created...07/06/2026
#' Updated...07/15/2026
#'
#' Updates:
#' - Bug fix, actually added support for gridExtra plots without removing ggplot support
#' - Added output message
#' - Removed default pptx_path
#'
#' Made with <3
#'

# Import Libraries
library(ggplot2)
library(officer)
library(tidyverse)
library(rvg)
library(here)
library(glue)

#'
#' @description *Powerpoint Ready Plots for Separate-and-Editable Figures Made Easy*
#'
#' @param plt A ggplot or gridExtra plot object.
#' @param pptx_path Path to powerpoint presentation to export.
#'
ppt_ready_plot <- function(plt, pptx_path) {
  if (is_ggplot(plt)) { # if plt is a ggplot object
    plt_dml <- rvg::dml(plot(plt))
  } else { # if plt is not a ggplot object, perhaps gridExtra
    plt_dml <- rvg::dml(plot(plt))
  }
  # initialize PowerPoint slide
  officer::read_pptx() %>%
    # add slide
    officer::add_slide(layout = "Blank") %>%
    # specify object (plot) and location (on slide) of object
    officer::ph_with(plt_dml, ph_location()) %>%
    # export slide; NOTE: Make sure you have already created a pptx file!
    print(target = here::here(pptx_path)
    )
  print(paste("Plot exported to '", pptx_path, "'", sep = ""))
}


# #---Example using ppt_ready_plot
# # Example data frame
# cp <- data.frame(
#   value = c("Contraction", "Expansion", "Persistence"), 
#   count = c(54779, 271052, 93000),
#   pc = c(13.1, 64.7, 22.2),
#   area_m2 = c(5477900, 27105200, 9300000),
#   area_acres = c(1353.619, 6697.841, 2298.080),
#   stringsAsFactors = TRUE
# )

# # Create the plot to display
# cp_plt <- ggplot(cp, aes(x = factor(value), y = area_acres)) +
#   geom_col(fill = c("#f0ac45", "#6aeb82", "#4e9723")) +
#   xlab("Aspen Condition") +
#   ylab("Area (Acres)") +
#   labs(title = "Cameron Peak Aspen Change") +
#   geom_text(aes(label = pc), size = 8, nudge_y = 1) +
#   coord_cartesian(ylim = c(0, 10000)) +
#   theme(text = element_text(size = 14))

# # Call the function with cp_plt (Go check ppt_ready_plots/plot_exports.pptx)
# ppt_ready_plot(cp_plt)
