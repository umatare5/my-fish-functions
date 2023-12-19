function runsyslog -a serviceName -a limit --description 'alias runsyslog=gcloud logging read "resource.type=cloud_run_revision" --format json --limit'

    # Validation
    if ! _has_over_one_arguments $argv
        set_color red
        echo "Syntax failed: runsyslog serviceName"
        return 1
    end

    # Run command
    set GCP_PROJECT_ID (gcloud config get-value project)
    set SERVICE_NAME $serviceName

    gcloud logging read " \
      resource.type=cloud_run_revision AND \
      resource.labels.service_name=$SERVICE_NAME AND \
      logName=projects/$GCP_PROJECT_ID/logs/run.googleapis.com%2Fvarlog%2Fsystem \
    " --limit (_gcloud_select_limit $limit) --format json \
        | jq -r '.[] | "\(.timestamp)\\t\(.severity)\\t\(.textPayload)"' \
        | sort
end

function _has_over_one_arguments
    test (count $argv) -gt 0; and true; or false
end

function _gcloud_select_limit -a limit
    test $limit; and echo $limit; or echo 10
end
