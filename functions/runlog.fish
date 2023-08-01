function runlog -a serviceName --description 'alias runlog=gcloud logging read "resource.type=cloud_run_revision" --format json'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: runshow serviceName regionName"
    return 1
  end

  # Run command
  set SERVICE_NAME $serviceName

  gcloud logging read \
    "resource.type=cloud_run_revision AND resource.labels.service_name=$SERVICE_NAME" \
    --format json $argv;
end

function _has_over_one_arguments
  test (count $argv) -gt 0; and true; or false;
end
