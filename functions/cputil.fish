function cputil -a procName --wraps='ps -eo %cpu,comm | grep' --description 'alias cputil=ps -eo %cpu,comm | grep'
    if ! _has_over_one_arguments $argv
        set_color red
        echo "Syntax failed: cputil procName"
        return 1
    end

    # Run command
    set PROC_NAME $procName

    ps -eo %cpu,comm | grep "$PROC_NAME" | awk -F / '{print $1 " " $NF}'
end
