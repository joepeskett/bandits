#' @title value_update
#' @description Update value of action
#' NewEst = OldEst + step(Target-OldEst)
#' @author Joe Peskett
#' @export
value_update <- function(OldEst, Target, Step_size){
  NewEst <- OldEst+1/step_size*(Target - OldEst)
  return(NewEst)
}

# We will now need an implementation of this incremental formula for each of the arms in our problem

#' @title simple_learner
#' @description function to return a learner given the problem passed to it and learning implementation
#' @param n_bandit a number to pass to the multiarm bandit function
#' @param bandit the function to create the multiarm bandit
#' @param exploration the probability of a random value being selected
#' @author Joe Peskett
#' @export

# The disered behaviour will be to set up a learner with an exploration value and a multiarm bandit setup. 

simple_learner <- function(n_bandit, exploration){
  if(exploration >= 1){
    stop("Exploration must be number between 0 and 1")
  }
  n_bandit <- length(n_bandit)
  values <- list(Q = rep(0, n_bandit), 
                 N = rep(0, n_bandit))
  return(function(bandit, print_values = F){
    random_choice <- sample(x = c(1, rep(0, (1/exploration) - 1)))
    if(random_choice == 1){
      action = sample.int(seq_len(n_bandit), 1)
    }else{
      action = which.max(values$Q)
    }
    reward <- value_update(OldEst = values$Q[action], 
                           Targer = #What is our target in this instance?
                           Step_size = values$n[action])
    values$Q[action] <- reward
    values$N[action] <- values$N[action]+1
    if(print_values == TRUE){
      output <- list(Vals = values, reward = reward)
    }else{
      output <- reward
    }
    return(output)
  })
}

#' @title decision_function
#' @description A function that will control how the agent chooses the optimal action given the environmental context
#' combined with the prior experience of the learner

#' @title experiment
#' @description takes a multiarm bandit and a learner and runs through the training process. 
#' @author Joe Peskett
#' @export
experiment <- function(simple_learner, number_of_runs, save_logs = F){
  output <- sapply(paste0("run", seq_len(number_of_runs)), simple_learner)
  return(output)
}




