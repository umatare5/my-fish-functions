function gcstop --wraps='gcloud compute instances stop' --description 'alias gcstop=gcloud compute instances stop'
  gcloud compute instances stop $argv;
end
