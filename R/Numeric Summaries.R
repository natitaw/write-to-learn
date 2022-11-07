# center and spread of the data
library(ggplot2)

df <- read.csv("LungCapData.csv", sep='\t')
head(df)

# Frequency table
table(df$Smoke)

# Frequency table in percentages
table(df$Smoke)/length(df$Smoke)

table(df$Smoke, df$Gender)/length(df$Smoke)


# Continuous variables
mean(df$LungCap)

median(df$LungCap)

var(df$LungCap)

sd(df$LungCap)

sqrt(var(df$LungCap))

min(df$LungCap)

max(df$LungCap)

range(df$LungCap)

# quantiles and percentiles
quantile(df$LungCap, probs=0.9)

quantile(df$LungCap)

quantile(df$LungCap, probs=0.24)

# pearson corr
cor(df$LungCap, df$Age)

cor(df$LungCap, df$Age, method="spearman")

cov(df$LungCap, df$Age)

summary(df)

summary(df$LungCap)

# Plots
plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7)


# fonts
plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, font.main=3)

plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, font.main=4)

plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, font.main=4, font.lab=2)

plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, font.main=4, font.lab=2,
     font.axis=3)


# colors
plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, col='purple')

# Plots
plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, col.lab='blue')

# Plots
plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, col.axis=4)

# Plots
plot(df$Age, df$Height, main="Scatterplot", 
     cex=0.5, cex.main=2, cex.lab=1.5,
     cex.axis=1.7, pch="x")

# add regression line
abline(lm(df$Height~df$Age), col=4, lty=2, lwd=6)

attach(df)
plot(Age[Gender=='male'], Height[Gender=='male'], col=4, pch='m')

plot(Age[Gender=='male'], Height[Gender=='male'], col=4, pch='M',
     xlab="Age", ylab="Height", main="Height vs Age")

# add females
points(Age[Gender=='female'], Height[Gender=='female'], col=6, pch="F")

# Multiple Plots on one screen
par(mfrow=c(2,1))
plot(Age[Gender=='male'], Height[Gender=='male'], col=4, pch='M',
     xlab="Age", ylab="Height", main="Height vs Age for Males",
     xlim=c(0,20), ylim=c(45,85))
plot(Age[Gender=='female'], Height[Gender=='female'], col=4, pch='F',
     xlab="Age", ylab="Height", main="Height vs Age for Females",
     xlim=c(0,20), ylim=c(45,85))

par(mfrow=c(1,1))
plot(Age, Height, main='Title', axes=F)

# label axis
axis(side=1, at=c(7, mean(Age), 15), labels=c("sev", "mean", "15"))
axis(side=2, at=c(55, mean(Height), 75), labels=c("sev", "mean", "75"))
box()

