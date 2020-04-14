library(Deriv)
library(data.table)

## derivdas em R
f <- function(x) x^2
Deriv(f)

## multiplicação de matriz por vetor
houses       <- c(2104,1416,1534,852)
dtHouses     <- data.table(c(1,1,1,1),houses)
matrizHouses <- as.matrix(dtHouses)

hipothesys       <- c(-40,0.25)   ## h = -40 + 0.25x
hipothesysMatrix <- as.matrix(hipothesys)

predicted   <- matrizHouses%*%hipothesysMatrix


v1 <- c(1,2,3)
v2 <- matrix(c(3,1,2,2,1,3,3,2,1), ncol = 3, byrow = TRUE)
v1 %*% t(v2)

## multiplicação de matriz por matriz
houses            <- c(2104,1416,1534,852)
dtHouses          <- data.table(c(1,1,1,1),houses)
matrizHouses      <- as.matrix(dtHouses)
hipothesysMatrix  <- matrix(c(-40,200,-150,0.25,0.1,0.4), ncol = 3, byrow = TRUE)
predicted         <- matrizHouses%*%hipothesysMatrix

# criar matriz identidade e tetstar
v1 <- c(1,2,3)
v2 <- matrix(c(3,1,2,2,1,3,3,2,1), ncol = 3, byrow = TRUE)
v1 %*% t(v2)

identity          <- diag(3)

testMult          <- v2%*%identity
testMult2         <- identity%*%v2

testMult==testMult2

# matriz inversa (multiplicação dá identidade)
inversa           <- solve(testMult)

testInv <- round(inversa%*%testMult)

# matriz transposta
transposta <- t(v2)








