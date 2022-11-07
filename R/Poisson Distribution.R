# Poisson Distribution

# X follows a POISSON distribution with a known
# rate of lambda = 7

# X ~ POISSON(lambda=7)

# Probability x=4
dpois(x=4, lambda=7)

# P(X=0) & P(X=1) & ... & P(X=4)
dpois(x=0:4, lambda=7)

# P(X<=4)
sum(dpois(x=0:4, lambda=7))
# OR
ppois(q=4, lambda=7, lower.tail=T)

# P (X>=12)
ppois(q=12, lambda=7, lower.tail=F)
