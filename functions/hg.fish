function hg -a resourceName -a resourceKey --description 'alias hg=rg --color never --files-with-matches'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: hg resourceName resourceKey"
    return 1
  end

  # Run command
  set RESOURCE_NAME resourceName
  set RESOURCE_KEY  (_gcloud_select_region_name $resourceKey)

  for filename in (rg --color never --files-with-matches "resource \"$RESOURCE_NAME\"")
    for resource_id in (cat $filename | hcledit block list)

    test $RESOURCE_KEY == "";
      cat $filename | hcledit attribute get $resource_id$RESOURCE_KEY
      cat $filename | hcledit block get $resource_id

    end
  end
end

function _hclgrep_select_resource_key -a regionName
  test $resourceKey; and echo ".$resourceKey"; or echo "";
end

function _has_over_one_arguments
  test (count $argv) -gt 0; and true; or false;
end
