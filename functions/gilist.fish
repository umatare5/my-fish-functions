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

  echo "Running 'gcloud container images list-tags $LOCATION_NAME/$PROJECT_ID/$IMAGE_NAME' ..."
  gcloud container images list-tags $LOCATION_NAME/$PROJECT_ID/$IMAGE_NAME;
end
