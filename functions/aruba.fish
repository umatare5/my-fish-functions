function aruba -a subcommand --description "Describe configuration in Aruba Central"
  _validate_aruba_function_preset_envvars

  set -x CENTRAL_CREDENTIAL_PATH
  set -x CENTRAL_ACCESS_TOKEN    (cat $CENTRAL_CREDENTIAL_PATH | jq -r .access_token)
  set -x CENTRAL_REFRESH_TOKEN   (cat $CENTRAL_CREDENTIAL_PATH | jq -r .refresh_token)
  set -x CENTRAL_API_BASE_URL
  set -x CENTRAL_GROUP
  set -x CENTRAL_API_OFFSET      "0"
  set -x CENTRAL_API_LIMIT       "1000"

  switch $subcommand

    # list-group returns group list.
    case "list-groups"
      set -x CENTRAL_API_ENDPOINT "configuration/v2/groups"
      _get_aruba_central_generic_api

    # list-aps returns access point list.
    case "list-aps"
      set -x CENTRAL_API_ENDPOINT "monitoring/v2/aps"
      _get_aruba_central_aps_api

    # list-wlan returns wlan list.
    case "list-wlans"
      set -x CENTRAL_API_ENDPOINT "configuration/full_wlan"
      _get_aruba_central_generic_api_with_group_path

    # list-clients returns client list.
    case "list-clients"
      set -x CENTRAL_API_ENDPOINT "monitoring/v1/clients/wireless"
      _get_aruba_central_generic_api_with_group_param

    # refresh-token is a special subcommand to refresh the access token.
    case "refresh-token"
      set CENTRAL_API_ENDPOINT "oauth2/token"
      _post_aruba_central_token_api
  end
end

function _get_aruba_central_generic_api
    curl -sS -X GET --header "Content-Type: application/json" --header "Authorization: Bearer $CENTRAL_ACCESS_TOKEN" \
        "$CENTRAL_API_BASE_URL/$CENTRAL_API_ENDPOINT?offset=$CENTRAL_API_OFFSET&limit=$CENTRAL_API_LIMIT"
end

function _get_aruba_central_generic_api_with_group_path
    curl -sS -X GET --header "Content-Type: application/json" --header "Authorization: Bearer $CENTRAL_ACCESS_TOKEN" \
        "$CENTRAL_API_BASE_URL/$CENTRAL_API_ENDPOINT/$CENTRAL_GROUP?offset=$CENTRAL_API_OFFSET&limit=$CENTRAL_API_LIMIT" \
        | jq -r . | jq .
end

function _get_aruba_central_generic_api_with_group_param
    curl -sS -X GET --header "Content-Type: application/json" --header "Authorization: Bearer $CENTRAL_ACCESS_TOKEN" \
        "$CENTRAL_API_BASE_URL/$CENTRAL_API_ENDPOINT?group=$CENTRAL_GROUP&offset=$CENTRAL_API_OFFSET&limit=$CENTRAL_API_LIMIT" \
        | jq -r . | jq .
end

function _get_aruba_central_aps_api

    set DETAILED_ACCESS_POINT (
      for serial in (
        curl -sS -X GET --header "Content-Type: application/json" --header "Authorization: Bearer $CENTRAL_ACCESS_TOKEN" \
        "$CENTRAL_API_BASE_URL/$CENTRAL_API_ENDPOINT" | jq -r '.aps[] | .serial'
      );
        curl -sS -X GET --header "Content-Type: application/json" --header "Authorization: Bearer $CENTRAL_ACCESS_TOKEN" \
        "$CENTRAL_API_BASE_URL/monitoring/v1/aps/$serial"
      ; end
    )

    echo $DETAILED_ACCESS_POINT | jq -s .
end

function _post_aruba_central_token_api
    curl -sS -X POST --header "Content-Type: application/json" --header "Authorization: Bearer $CENTRAL_ACCESS_TOKEN" \
        "$CENTRAL_API_BASE_URL/$CENTRAL_API_ENDPOINT?client_id=$CENTRAL_CLIENT_ID&client_secret=$CENTRAL_CLIENT_SECRET&grant_type=refresh_token&refresh_token=$CENTRAL_REFRESH_TOKEN" \
        > $CENTRAL_CREDENTIAL_PATH

    echo "Refreshed. Please check $CENTRAL_CREDENTIAL_PATH. The token expires in" (cat $CENTRAL_CREDENTIAL_PATH | jq .expires_in) "seconds."
end

function _validate_aruba_function_preset_envvars
  if ! test $CENTRAL_CLIENT_ID
    echo "Missing environment variable CENTRAL_CLIENT_ID. Please set it."
    continue
  end

  if ! test $CENTRAL_CLIENT_SECRET
    echo "Missing environment variable CENTRAL_CLIENT_SECRET. Please set it."
    continue
  end

  if ! test $CENTRAL_API_BASE_URL
    echo "Missing environment variable CENTRAL_API_BASE_URL. Please set it."
    continue
  end

  if ! test $CENTRAL_GROUP
    echo "Missing environment variable CENTRAL_GROUP. Please set it."
    continue
  end

  if ! test -f $CENTRAL_CREDENTIAL_PATH
    echo "Missing $CENTRAL_CREDENTIAL_PATH. Please put it."
    continue
  end
end

