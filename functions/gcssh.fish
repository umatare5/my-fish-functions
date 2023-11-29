function gcssh --wraps='gcloud compute ssh --tunnel-through-iap' --description 'alias gcssh=gcloud compute ssh --tunnel-through-iap'
    gcloud compute ssh $argv --tunnel-through-iap -- -A
end
