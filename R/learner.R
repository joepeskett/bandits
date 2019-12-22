# learner

#' @title learner
#' @description Function for creating a learner that will interact with the multiarm bandit
#' @author Joe Peskett
#' @export
#' 
make_learner <- function(exploration_probability = 0.1, verbose = F){
  #returns a function that will interact with a multibandit object
  return(
  function(bandit){
    bandit_n <- bandit(1, T)$n_bandit
    act <- sample.int(bandit_n, 1)
    if (verbose == T){
    print(act)
    }
    exploration <- exploration_probability
    if (exploration == TRUE){
      #discard the function to select the optimum action in this context
    }
    bandit(act)
    return(list(reward = , choice = act, expolration = #bool()
                  )
           )
    }
  )
}

# Now I need a function to output the probability, the action decision 

#' @title decision_function
#' @description A function that will control how the agent chooses the optimal action given the environmental context
#' combined with the prior experience of the learner

#' @title experiment
#' @description takes a multiarm bandit and a learner and runs through the training process. 
#' @author Joe Peskett
#' @export
experiment <- function(bandit, learner, runs, print_logs = F){
  
}

