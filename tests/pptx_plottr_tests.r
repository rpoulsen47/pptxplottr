library(ggplot2)
source("pptx_plottr.r")

#---Example using ppt_ready_plot
# Example data frame
cp <- data.frame(
  value = c("Contraction", "Expansion", "Persistence"), 
  count = c(54779, 271052, 93000),
  pc = c(13.1, 64.7, 22.2),
  area_m2 = c(5477900, 27105200, 9300000),
  area_acres = c(1353.619, 6697.841, 2298.080),
  stringsAsFactors = TRUE
)

# Create the plot to display
cp_plt <- ggplot(cp, aes(x = factor(value), y = area_acres)) +
  geom_col(fill = c("#f0ac45", "#6aeb82", "#4e9723")) +
  xlab("Aspen Condition") +
  ylab("Area (Acres)") +
  labs(title = "Cameron Peak Aspen Change") +
  geom_text(aes(label = pc), size = 8, nudge_y = 1) +
  coord_cartesian(ylim = c(0, 10000)) +
  theme(text = element_text(size = 14))

# Call the function with cp_plt (Go check ppt_ready_plots/plot_exports.pptx)
pptx_plot(cp_plt, "test/plot_exports.pptx")
