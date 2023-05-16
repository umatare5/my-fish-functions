function grevdelete -a revisionName -a regionName --description 'alias grevdelete=gcloud run revisions delete revisionName --region regionName'

  # Validation
  if ! _has_over_two_arguments $argv
    set_color red; echo "Syntax failed: grevdelete revisionName regionName"
    return 1
  end

  # Run command
  set REVISION_NAME $revisionName
  set REGION_NAME   (_gcloud_select_region_name $regionName)

  echo "Running 'gcloud run revisions delete $REVISION_NAME --region $REGION_NAME' ..."
  gcloud run revisions delete $REVISION_NAME --region $REGION_NAME;
end
