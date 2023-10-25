function hg -a resourceName -a resourceKey --description 'alias hg=rg --color never --files-with-matches'

  # Validation
  if ! _has_over_one_arguments $argv
    set_color red; echo "Syntax failed: hg resourceName resourceKey"
    return 1
  end

  # Run command
  set RESOURCE_NAME resourceName
  set RESOURCE_KEY  resourceKey

  for filename in (rg --color never --files-with-matches "resource \"$RESOURCE_NAME\"")
    for resource_id in (cat $filename | hcledit block list)
      cat $filename | hcledit attribute get $resource_id$RESOURCE_KEY
    end
  end
end

function _gcloud_select_region_name -a regionName
  test $resourceKey; and echo ".$resourceKey"; or echo "";
end

function _has_over_one_arguments
  test (count $argv) -gt 0; and true; or false;
end
