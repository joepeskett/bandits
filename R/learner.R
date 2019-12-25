#' @title value_update
#' @description Update value of action
#' NewEst = OldEst + step(Target-OldEst)
#' @author Joe Peskett
#' @export
value_update <- function(OldEst, Target, Step_size){
  NewEst <- OldEst+1/(Step_size+1)*(Target - OldEst)
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
  values <- list(Q = rep(0, n_bandit), 
                 N = rep(0, n_bandit))
  return(function(bandit, print_values = F){
    print(values$Q)
    print(values$N)
    #TODO: fix the random choice generator for the epsilon user defined value
    random_choice <- sample(x = c(1, rep(0, (1/exploration) - 1)),size = 1)
    print(random_choice)
    if(random_choice == 1){
      action = sample.int(n_bandit, 1)
    }else{
      action = which.max(values$Q)
    }
    bandit_output <- bandit(action)
    Updated <- value_update(OldEst = values$Q[action], 
                           Target = bandit_output,
                           Step_size = values$N[action])
    values$Q[action] <<- Updated
    values$N[action] <<- values$N[action]+1
    print(Updated)
    print(values$Q)
    print(values$N)
    if(print_values == TRUE){
      output <- list(Vals = values, reward = bandit_output, arm = action)
    }else{
      output <- list(reward = bandit_output, arm = action)
    }
    return(output)
  })
}

#To control the state we could instead have these passed in as parameters to the function

#' @title experiment
#' @description takes a multiarm bandit and a learner and runs through the training process. 
#' @author Joe Peskett
#' @export
experiment <- function(simple_learner, bandit number_of_runs, save_logs = F){
  output <- sapply(paste0("run", seq_len(number_of_runs)), function(x) assingn(x, simple_learner(bandit)))
  return(output)
}




