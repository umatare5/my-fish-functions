function _has_over_one_arguments
  test (count $argv) -gt 0; and true; or false;
end

function _has_over_two_arguments
  test (count $argv) -gt 1; and true; or false;
end

function _gcloud_select_region_name -a regionName
  test $regionName; and echo $regionName; or echo "asia-northeast1";
end

function _gcloud_select_gcr_location_name -a locationName
  test $locationName; and echo $locationName; or echo "asia.gcr.io";
end
