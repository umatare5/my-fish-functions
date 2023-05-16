function grevlist -a serviceName -a regionName --description 'alias grevlist=gcloud run revisions list --service serviceName --region regionName'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: grevlist serviceName regionName"
    return 1
  end

  # Run command
  set SERVICE_NAME $serviceName
  set REGION_NAME  (_gcloud_select_region_name $regionName)

  echo "Running 'gcloud run revisions list --service $SERVICE_NAME --region $REGION_NAME' ..."
  gcloud run revisions list --service $SERVICE_NAME --region $REGION_NAME;
end
