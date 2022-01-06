function glogin --wraps='gcloud auth login && gcloud auth application-default login' --description 'alias glogin=gcloud auth login && gcloud auth application-default login'
  gcloud auth login && gcloud auth application-default login $argv; 
end
