# Coordinates and Faceting
library(ggplot2)

# Data and Aesthetic
pl <- ggplot(mpg, aes(x=displ, y=hwy)) 

# Geometry
pl <- pl + geom_point()
pl

# x and y lim
pl2 <- pl + coord_cartesian(xlim=c(1,4), ylim=c(15,30))
pl2

# aspect ratios
pl2 <- pl + coord_fixed(ratio=1/3)
pl2


# Facet Grids (subplots)
pl + facet_grid(. ~ cyl) + theme_dark()

pl + facet_grid(drv ~ .) + theme_dark()

pl + facet_grid(drv ~ cyl) + theme_dark()

pl + facet_grid(cyl ~ drv) + theme_dark()



