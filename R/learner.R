# learner

#' @title learner
#' @description Function for creating a learner that will interact with the multiarm bandit
#' @author Joe Peskett
#' @export
#' 
make_learner <- function(exploration_probability = 0.1){
  #returns a function that will interact with a multibandit object
  function(bandit){
    bandit_n <- bandit(1, T)$n_bandit
    exploration <- exploration_probability
    bandit(sample.int(bandit_n, 1))
  }
}



#' @title experiment
#' @description takes a multiarm bandit and a learner and runs through the training process. 
#' @author Joe Peskett
#' @export
experiment <- function(bandit, learner, runs, print_logs = F){
  return(logs)  
}