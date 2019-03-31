## Workflow defines what we want to call a set of actions.
workflow "on pull request merge, delete the branch" {
  ## On pull_request defines that whenever a pull request event is fired this 
  ## workflow will be run.
  on = "pull_request"
  
  ## What is the ending action (or set of actions) that we are running. 
  ## Since we can set what actions "need" in our definition of an action,
  ## we only care about the last actions run here.
  resolves = ["verify build"]
}

## This is our action, you can have more than one but we just have this one for 
## our example.
action "verify build" {
  ## Uses defines what we are running, you can point to a repository like below 
  ## OR you can define a docker image.
  uses = "Muffo/actions_experiment@build"
}