## Scatterplots
library(ggplot2)

df <- mtcars
head(df)

# Data & Aesthetics
pl <- ggplot(df, aes(x=wt, y=mpg))

# Geometry
pl + geom_point()

# x, y, alpha, color, fill, shape, size, stroke

# alpha - overlapping points become darker
pl + geom_point(size=5, alpha=0.5)


# using another column as a size
pl + geom_point(aes(size=hp), alpha=0.5)

# also as color
pl + geom_point(aes(color=hp), alpha=0.5) + 
  scale_color_gradient(low='blue', high='red')

# cylinders as categories
pl + geom_point(aes(size=cyl), alpha=0.5)

# but cylinders are not continuous
pl + geom_point(aes(size=factor(cyl)))

# we can also use shape as a separator
pl + geom_point(aes(shape=factor(cyl)), size=3)

# we can also users
pl + geom_point(aes(shape=factor(cyl), 
                    color=factor(cyl)), size=3)

# scale color gradients
