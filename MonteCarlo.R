library(ggplot2)

NumbSims <- 2e4

pop1=runif(NumbSims, min=20, max=30)
pop2=rpois(NumbSims, lambda = 35)
pop3=rnorm(NumbSims, 15, 4)
pop4=sample(c(10,10,10,30,30,30,30,30,40), NumbSims, replace = TRUE)

combined = pop1 + pop2 + pop3

simDF = data.frame(pop1,pop2,pop3,pop4,combined)

plt= ggplot(data.frame(data=c(combined, pop1, pop2, pop3), labels=rep(c("combined", "pop1", "pop2", "pop3"), rep(NumbSims,4))), aes(x=data)) +
  stat_bin(aes(fill=labels), position="identity", binwidth=0.25, alpha=0.5) +
  theme_bw()
plt
