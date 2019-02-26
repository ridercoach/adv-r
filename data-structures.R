
library(tidyverse)

#------------------- begin helper functions ------------------------

prt_vec_hdrs <- function() {
  print(sprintf(" vec    typeof     class    is.chr is.dbl is.int is.log is.atm is.num"))
  print(sprintf("----- ---------- ---------- ------ ------ ------ ------ ------ ------"))
}

prt_vec_info <- function(v_name, v) {
  print(sprintf("%-5s %-10s %-10s %-6s %-6s %-6s %-6s %-6s %-6s", 
    v_name, typeof(v), class(v), is.character(v), 
    is.double(v), is.integer(v), is.logical(v), is_atomic(v), is.numeric(v)))
}

#-------------------- end helper functions -------------------------

# Vectors: can be either atomic vectors, in which every element 
# must be the same type, or lists, which can hold different types, 
# including other lists;
# three functions that can be used on both vectors and lists:
# typeof(), length(), and attributes()

# atomic vectors can hold 6 types of data:
v_log <- c(TRUE, FALSE, TRUE) # logical
v_int <- c(1L, 2L, 3L) # integer
v_dbl <- c(1.2, 2.3, 3.4) # double (often called numeric)
v_chr <- c("aa", "bb", "cc") # character
v_cmp <- c(1+2i, 3-2i, 4-3i) # complex
v_raw <- as.raw(c(0x12, 0xFA, 0xCE)) # raw

prt_vec_hdrs()
prt_vec_info("v_log", v_log)
prt_vec_info("v_int", v_int)
prt_vec_info("v_dbl", v_dbl)
prt_vec_info("v_chr", v_chr)
prt_vec_info("v_cmp", v_cmp)
prt_vec_info("v_raw", v_raw)
print(" ")

# atomic vectors are always flat:
v01 <- c(1, c(2, c(3, 4)))
print(v01)
print(" ")

# when you combine different types in an atomic vector, 
# they will be coerced to the most flexible type, which is, 
# from least to most flexible: logical, integer, double, character;
v02 <- c(TRUE, 3L, 4.1, "aa")
v03 <- c(TRUE, 3L, 4.1)
v04 <- c(TRUE, 3L)
v05 <- c(TRUE)
print(v02)
print(v03)
print(v04)
print(v05)
print(" ")


