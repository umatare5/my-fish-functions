function textize-runapplog --description 'alias textize-runapplog=gcloud logging read "resource.type=cloud_run_revision" --format json --limit'
  jq -r '.[] | "\\(.timestamp)\t\\(.severity)\t\\(.textPayload)"' | sort
end
