function grevdelete -a serviceName -a revisionName -a regionName --description 'alias grevdelete=gcloud run revisions delete serviceName revisionName --region regionName'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: grevdelete serviceName revisionName regionName"
    return 1
  end

  # Run command
  set REVISION_NAME $revisionName
  set SERVICE_NAME  $serviceName
  set REGION_NAME   (_gcloud_select_region_name $regionName)

  echo "Running 'gcloud run revisions delete $SERVICE_NAME --region $REGION_NAME $REVISION_NAME' ..."
  gcloud run revisions delete $SERVICE_NAME --region $REGION_NAME $REVISION_NAME;
end
