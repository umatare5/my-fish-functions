function gactivate --wraps='gcloud config configurations activate' --description 'alias gactivate=gcloud config configurations activate'
    gcloud config configurations activate $argv
end
