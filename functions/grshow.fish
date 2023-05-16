function grshow -a serviceName -a regionName --description 'alias grshow=gcloud run services describe --service serviceName --region regionName'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: grshow serviceName regionName"
    return 1
  end

  # Run command
  set SERVICE_NAME $serviceName
  set REGION_NAME  (_gcloud_select_region_name $regionName)

  echo "Running 'gcloud run services describe $SERVICE_NAME --region $REGION_NAME' ..."
  gcloud run services describe $SERVICE_NAME --region $REGION_NAME;
end
