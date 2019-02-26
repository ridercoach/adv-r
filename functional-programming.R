
library(tidyverse)
library(plyr)

missing_fixer <- function(na_value) {
  fix_missing <- function(x) {
    x[x == na_value] <- NA
    x
  }
}


set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, rep = TRUE)))
names(df) <- letters[1:6]
print(df)

df[] <- lapply(df, missing_fixer(-99))

print(df)

print(missing_fixer(-999)(c(-99, -999)))

summary <- function(x) {
  funs <- c(mean, median, sd, mad, IQR)
  lapply(funs, function(f) f(x, na.rm = TRUE))
  #print(c(mean(x, na.rm = TRUE), 
  #  median(x, na.rm = TRUE), 
  #  sd(x, na.rm = TRUE), 
  #  mad(x, na.rm = TRUE), 
  #  IQR(x, na.rm = TRUE)))
}

lapply(df, summary)

dothis <- function(l) {
  sum(as.numeric(l))
}

new_counter <- function() {
  i <- 0
  function() {
    i <<- i + 1
    i
  }
}

counter_one <- new_counter()
counter_two <- new_counter()

moment <- function(i) {
  function(x) {
    sum((x - mean(x)) ^ i) / length(x)
  }
}

m1 <- moment(1)
m2 <- moment(2)

midpoint <- function(f, a, b) {
  (b - a) * f((a + b) / 2)
}

trapezoid <- function(f, a, b) {
  (b - a) * (f(a) + f(b)) / 2
}

simpson <- function(f, a, b) {
  (b - a) * (f(a) + 4 * f((a + b) / 2) + f(b)) / 6
}

boole <- function(f, a, b) {
  pos <- function(i) a + i * (b - a) / 4
  fi <- function(i) f(pos(i))
  
  (b - a) * (7 * fi(0) + 32 * fi(1) + 12 * fi(2) + 32 * fi(3) + 7 * fi(4)) / 90
}

composite <- function(f, a, b, n = 10, rule) {
  points <- seq(a, b, length = n + 1)

  area <- 0
  for (i in seq_len(n)) {
    area <- area + rule(f, points[i], points[i + 1])
  }
  area
}

print(composite(sin, 0, pi, n = 100, midpoint))
print(composite(sin, 0, pi, n = 100, trapezoid))
print(composite(sin, 0, pi, n = 10, simpson))
print(composite(sin, 0, pi, n = 5, boole))

