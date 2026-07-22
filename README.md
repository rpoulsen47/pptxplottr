# pptxplottr
[![R: 4.6.1](https://img.shields.io/badge/R-4.6.1-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An ```rvg```-based package to easily send ggplots to Microsoft Powerpoint in R as Separate-and-Editable figures.

## Installation
At this time, this package is only available through GitHub. To install `pptxplottr`, run the following command. (If you don't have `devtools` installed, make sure that is installed first.)
```{r eval=FALSE}
devtools::install_github("rpoulsen47/pptxplottr")
```

## Example
```{r eval=FALSE}
library(pptxplottr)
library(ggplot2)

# Example data
df <- data.frame(
  value = c("A", "B", "C"),
  count = c(54779, 271052, 93000),
  stringsAsFactors = TRUE
)

# Example ggplot
plt <- ggplot(df, aes(x = factor(value), y = count)) +
  geom_col() +
  labs(title = "pptxplottr Test Figure") +
  geom_text(aes(label = count))

# Export plt to specified filepath
pptx_plot(plt, "filepath/plot_export.pptx")
```
