function grevlatest -a serviceName -a regionName --description 'alias grevlatest=gcloud run services update-traffic serviceName --region regionName --to-latest'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: grevlatest serviceName regionName"
    return 1
  end

  # Run command
  set SERVICE_NAME $serviceName
  set REGION_NAME  (_gcloud_select_region_name $regionName)

  echo "Running 'gcloud run services update-traffic $SERVICE_NAME --region $REGION_NAME --to-latest' ..."
  gcloud run services update-traffic $SERVICE_NAME --region $REGION_NAME --to-latest;
end
