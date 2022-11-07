library(ggplot2)

head(mpg)

# Histogram
# Highway mpg value

# Data & Aesthetics
pl <- ggplot(mpg, aes(x=hwy))

# Geometry
pl + geom_histogram(bins=20, fill='red', alpha=0.5)


# Bar plot of counts of car manufactures colored by cylinder

# Data & Aesthetics
pl <- ggplot(mpg, aes(x=manufacturer))

# Geometry
pl + geom_bar(aes(fill=factor(cyl)))

# Using another data set that comes from ggplot2
head(txhousing)

# Scatter plot with alpha
# Data & Aesthetics
pl <- ggplot(txhousing, aes(x=sales, y=volume))

# Geometry
# alpha makes the overlapping points darker
pl2 <- pl + geom_point(color='blue', alpha=0.3)
pl2

# adding a smoothing layer
pl2 + geom_smooth(color='red')
