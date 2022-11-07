# Variable Plotting
library(ggplot2)
library(ggplot2movies)

# Data & Aesthetics
pl <- ggplot(movies, aes(x=year, y=rating))

# Geometry
pl + geom_bin2d()

pl2 <- pl + geom_bin2d() +
  scale_fill_gradient(high='red', low='green')
pl2

# bin width
pl2 <- pl + geom_bin2d(binwidth=c(3,1)) +
  scale_fill_gradient(high='red', low='blue')
pl2


## Hex Plots
pl2 <- pl + geom_hex()
pl2

# Hex plot with gradients
pl2 <- pl + geom_hex() +
  scale_fill_gradient(high='red', low='blue')
pl2

# Density plots
pl2 <- pl + geom_density2d()
pl2
