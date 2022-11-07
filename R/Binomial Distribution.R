# Binomial Distributions
df <- read.csv("LungCapData.csv", sep='\t')
head(df)

attach(df)

# dbinom 
# P(X=3)
# probability of 3 successes in 20 trials of rolling a die
dbinom(x=3, size=20, prob=1/6)

# P(X=0) & P(X=1) & ... & P(X=3)
dbinom(x=0:3, size=20, prob=1/6)

# 3 or fewer successes
sum(dbinom(x=0:3, size=20, prob=1/6))

# or you can use pbinom, less than or equal to 3 successes
pbinom(q=3, size=20, prob=1/6, lower.tail=T)

# random sample from a binomial distribution
