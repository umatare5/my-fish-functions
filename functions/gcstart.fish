function gcstart --wraps='gcloud compute instances start' --description 'alias gcstart=gcloud compute instances start'
  gcloud compute instances start $argv;
end
