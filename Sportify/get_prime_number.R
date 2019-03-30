##get all prime number less than or equal to the given number
##brutal force----
get_prime_number <- function(num){
  list_of_prime <- c()
  for (i in 2:num){
    counter = 0
    for (j in 2:num){ if (i %% j == 0) {counter = counter + 1} }
    if (counter == 1) {list_of_prime = c(list_of_prime, i)}
  }
  return(list_of_prime)
}

##optimized Sieve of Eratosthenes----
get_prime_number_2 <- function(num){
  mark_list = c()
  all_num <- 2:num
  for (i in 2:num){
    if (i %in% mark_list){next}
    else{ 
         j = 0
         while (i * (i+j) <= num){
               mark_list = c(mark_list, i * (i+j))
               j = j+1
        }
    }
  }
  return(all_num[!all_num %in% mark_list])
}
