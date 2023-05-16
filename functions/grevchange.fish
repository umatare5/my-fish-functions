function grevchange -a serviceName -a revisionName -a regionName --description 'alias grevchange=gcloud run services update-traffic serviceName --region regionName --to-revisions revisionName=100'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: grevchange serviceName revisionName regionName"
    return 1
  end

  # Run command
  set REVISION_NAME $revisionName
  set SERVICE_NAME  $serviceName
  set REGION_NAME   (_gcloud_select_region_name $regionName)

  echo "Running 'gcloud run services update-traffic $SERVICE_NAME --region $REGION_NAME --to-revisions $REVISION_NAME=100' ..."
  gcloud run services update-traffic $SERVICE_NAME --region $REGION_NAME --to-revisions $REVISION_NAME=100;
end
