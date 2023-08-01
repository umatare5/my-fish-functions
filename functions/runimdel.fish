function runimdel -a projectId -a serviceName -a shaDigest -a locationName --description 'alias runimdel=gcloud container images delete locationName/projectId/serviceName@sha256:shaDigest'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: runimdel projectId serviceName shaDigest locationName"
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

function _has_over_two_arguments
  test (count $argv) -gt 1; and true; or false;
end

function _gcloud_select_gcr_location_name -a locationName
  test $locationName; and echo $locationName; or echo "asia-northeast1-docker.pkg.dev";
end
