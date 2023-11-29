function logfmt -a source
    switch $source

        # runapplog
        case runapplog
            jq -r '.[] | "\\(.timestamp)\t\\(.severity)\t\\(.textPayload)"' | sort

            # runsyslog
        case runsyslog
            jq -r '.[] | "\\(.timestamp)\t\\(.severity)\t\\(.protoPayload.status.message)"' | sort

            # runconlog
        case runconlog
            jq -c '.[].jsonPayload.app_name + ":" + .[].jsonPayload.message' | jq -r . | grep -v "^\$" | uniq | jq -r '. | "\\(.timestampSeconds)\t\\(.severity)\t\\(.message)"' | grep -v "^\$" | sort
    end
end
