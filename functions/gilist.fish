function gilist -a projectId -a serviceName -a locationName --description 'alias gilist=gcloud container images list-tags locationName/projectId/serviceName'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: gilist projectId serviceName locationName"
    return 1
  end

  # Run command
  set PROJECT_ID    $projectId
  set IMAGE_NAME    $serviceName
  set LOCATION_NAME (_gcloud_select_gcr_location_name $locationName)

  gcloud container images list-tags $LOCATION_NAME/$PROJECT_ID/$IMAGE_NAME;
end

function _has_over_two_arguments
  test (count $argv) -gt 1; and true; or false;
end

function _gcloud_select_gcr_location_name -a locationName
  test $locationName; and echo $locationName; or echo "asia.gcr.io";
end
