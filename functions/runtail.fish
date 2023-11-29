function runtail -a serviceName -a logFilter --description 'alias runtail=gcloud beta run services logs tail --region asia-northeast1 serviceName --log-filter logFilter'

    # Validation
    if ! _has_over_one_arguments $argv
        set_color red
        echo "Syntax failed: runtail serviceName"
        return 1
    end

    if $logFilter
        set LOG_FILTER ("--log-filter $logFilter")
    end

    # Run command
    set SERVICE_NAME $serviceName
    set REGION_NAME asia-northeast1

    gcloud beta run services logs tail $SERVICE_NAME --region $REGION_NAME $LOG_FILTER
end

function _has_over_one_arguments
    test (count $argv) -gt 0; and true; or false
end
