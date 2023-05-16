function gidelete -a projectId -a serviceName -a shaDigest -a locationName --description 'alias gidelete=gcloud container images delete locationName/projectId/serviceName@sha256:shaDigest'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: gidelete projectId serviceName shaDigest locationName"
    return 1
  end

  # Run command
  set PROJECT_ID    $projectId
  set IMAGE_NAME    $serviceName
  set SHA_DIGEST    $shaDigest
  set LOCATION_NAME (_gcloud_select_gcr_location_name $locationName)

  gcloud container images delete \
    $LOCATION_NAME/$PROJECT_ID/$IMAGE_NAME@sha256:$SHA_DIGEST \
    --force-delete-tags;
end
