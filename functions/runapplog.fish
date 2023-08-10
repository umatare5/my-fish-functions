function runapplog -a serviceName -a limit --description 'alias runapplog=gcloud logging read "resource.type=cloud_run_revision" --format json --limit'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: runapplog serviceName"
    return 1
  end

  # Run command
  set SERVICE_NAME $serviceName

  set LOGS (
    gcloud logging read \
    "resource.type: cloud_run_revision AND resource.labels.service_name: $SERVICE_NAME AND jsonPayload.message: *" \
    --limit (_gcloud_select_limit $limit) \
    --format json
  )

  echo $LOGS | jq -r '.[] | "\\(.jsonPayload.timestamp)\t\\(.jsonPayload.severity)\t\\(.jsonPayload.hostname) \\(.jsonPayload.message)"' | sort | grep -v "^\$"
end

function _has_over_one_arguments
  test (count $argv) -gt 0; and true; or false;
end

function _gcloud_select_limit -a limit
  test $limit; and echo $limit; or echo 10;
end