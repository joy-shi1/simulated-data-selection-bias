#-------------------------------------------------------
#----- HarvardX: Simulated Data for Selection Bias -----
#-------------------------------------------------------
#
# By: Joy Shi
# Last modified: July 19, 2019

#--------------
#--- Set-up ---
#--------------

set.seed(8763)
n <- 25000

#-------------
#--- DAG 1 ---
#-------------

A <- rnorm(n)
Y <- rnorm(n)
logit.C <- 0.5 + 3*A + 3*Y
C <- rbinom(n, 1, exp(logit.C)/(1+exp(logit.C)))

Simulated_DAG1 <- data.frame(A, Y, C)
write.csv(Simulated_DAG1, "Simulated_DAG1.csv")

#-------------
#--- DAG 2 ---
#-------------

A <- rnorm(n)
U <- rbinom(n, 1, 0.5)
L <- rbinom(n, 1, 0.25 + 0.5*U)
logit.C <- 0.5 + 3*A + 3*L
C <- rbinom(n, 1, exp(logit.C)/(1+exp(logit.C)))
Y <- 3*U + rnorm(n)

Simulated_DAG2 <- data.frame(A, Y, C, L, U)
write.csv(Simulated_DAG2, "Simulated_DAG2.csv")

#-------------
#--- DAG 3 ---
#-------------

A <- rnorm(n)
U <- rbinom(n, 1, 0.5)
logit.L <- 0.5 + 3*A + 3*U
L <- rbinom(n, 1, exp(logit.L)/(1+exp(logit.L)))
logit.C <- 0.5 + 5*L
C <- rbinom(n, 1, exp(logit.C)/(1+exp(logit.C)))
Y <- 3*U + rnorm(n)

Simulated_DAG3 <- data.frame(A, Y, C, L, U)
write.csv(Simulated_DAG3, "Simulated_DAG3.csv")

#-------------
#--- DAG 4 ---
#-------------

W <- rbinom(n, 1, 0.5)
U <- rbinom(n, 1, 0.5)
A <- 4*W + rnorm(n)
L <- rbinom(n, 1, 0.1 + 0.85*U)
C <- rbinom(n, 1, 0.1 + 0.4*L + 0.4*W)
Y <- 3*U + rnorm(n)

Simulated_DAG4 <- data.frame(A, Y, C, W, L, U)
write.csv(Simulated_DAG4, "Simulated_DAG4.csv")

#-------------
#--- DAG 5 ---
#-------------

W <- rbinom(n, 1, 0.5)
U <- rbinom(n, 1, 0.5)
A <- 5*W + rnorm(n)
logit.L <- -2 + 5*W + 5*U
L <- rbinom(n, 1, exp(logit.L)/(1+exp(logit.L)))
C <- rbinom(n, 1, 0.1 + 0.85*L)
Y <- 5*U + rnorm(n)

Simulated_DAG5 <- data.frame(A, Y, C, L, U)
write.csv(Simulated_DAG5, "Simulated_DAG5.csv")