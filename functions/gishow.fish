function gishow -a projectId -a imageName -a shaDigest -a locationName --description 'alias gishow=gcloud container images describe locationName/projectId/imageName@sha256:shaDigest'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: gishow projectId imageName shaDigest locationName"
    return 1
  end

  # Run command
  set PROJECT_ID    $projectId
  set IMAGE_NAME    $imageName
  set SHA_DIGEST    $shaDigest
  set LOCATION_NAME (_gcloud_select_gcr_location_name $locationName)

  echo \
    "Running 'gcloud container images describe $LOCATION_NAME/$PROJECT_ID/$IMAGE_NAME@sha256:$SHA_DIGEST' ..."

  gcloud container images describe \
    $LOCATION_NAME/$PROJECT_ID/$IMAGE_NAME@sha256:$SHA_DIGEST;
end
