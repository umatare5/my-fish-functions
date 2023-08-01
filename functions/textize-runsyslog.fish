function textize-runsyslog --description 'alias textize-runsyslog=gcloud logging read "resource.type=cloud_run_revision" --format json --limit'
  jq -r '.[] | "\\(.timestamp)\t\\(.severity)\t\\(.protoPayload.status.message)"' | sort
end
