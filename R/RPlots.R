# Plots
# Grammar of graphics with ggplot2
# built on the idea of adding layers to visualisations
# data -> aesthetics -> geometries ->
# Facets -> Statistics -> Coordinates -> Theme
# There is a reason why news outlets use R for their vis instead of py

library(ggplot2)
library(ggplot2movies)

## Histograms
# Data and Aesthetics
colnames(movies)
head(movies)
pl <- ggplot(movies, aes(x=rating))

# geometry
pl + geom_histogram()

# every bin to have a unit of 0.1
pl + geom_histogram(binwidth = 0.1)

# color
pl + geom_histogram(binwidth = 0.1, color='red')
pl + geom_histogram(binwidth = 0.1, 
                    color='red', fill='pink')

pl + geom_histogram(binwidth = 0.1, 
                    color='red', fill='pink',
                    alpha=0.4)


# adding labels

pl2 <- pl + geom_histogram(binwidth = 0.1, 
                           color='red', fill='pink',
                           alpha=0.4)
pl3 <- pl2 + xlab('Movie Rating') + ylab('Count')
pl3

pl3 + ggtitle("My Title")



## filling out histograms
## filling out histograms
