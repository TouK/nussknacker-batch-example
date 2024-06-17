#!/bin/sh

DESIGNER_URL="http://designer:8080"

# Auth header with default admin/admin credentials
AUTHORIZATION_HEADER="authorization: Basic YWRtaW46YWRtaW4="

create_and_save_scenario() {
  SCENARIO_NAME=$1
  SCENARIO_FILENAME=$2

  echo "1. Creating empty scenario..."
  scenario_creation_response_code=$(
    curl -X POST \
      --header "$AUTHORIZATION_HEADER" --header "Content-type: application/json" \
      --data "{\"name\": \"$SCENARIO_NAME\", \"processingMode\": \"Bounded-Stream\", \"engineSetupName\": \"Flink\", \"isFragment\": false }" \
      --silent \
      --write-out "%{http_code}" \
      -o /dev/null \
      "$DESIGNER_URL/api/processes"
  )
  if [ "$scenario_creation_response_code" = "201" ]; then
    echo "Empty scenario created successfully."
  elif [ "$scenario_creation_response_code" = "400" ]; then
    echo "Scenario with name ${SCENARIO_NAME} already exists. Exiting."
    exit 1
  else
    echo "Scenario creation failed with $scenario_creation_response_code. Exiting"
    exit 1
  fi

  echo "2. Obtaining scenario to save..."
  scenario_import_response=$(
    curl -X POST \
      --header "$AUTHORIZATION_HEADER" -H 'Accept: application/json' \
      -F "process=@$SCENARIO_FILENAME" \
      --silent \
      --write-out "\n%{http_code}" \
      "$DESIGNER_URL/api/processes/import/$SCENARIO_NAME"
  )
  scenario_import_response_code=$(echo "$scenario_import_response" | tail -n 1)
  if [ "$scenario_import_response_code" != "200" ]; then
    echo "Failed to import scenario. Exiting."
    exit 1
  fi

  echo "3. Saving scenario graph..."
  saveable_scenario_json=$(echo "$scenario_import_response" | sed \$d | jq .scenarioGraph)
  designer_save_response=$(
    curl -X PUT \
      --header "$AUTHORIZATION_HEADER" -H 'Accept: application/json' \
      -H 'Content-Type: application/json' \
      --data-raw "{\"scenarioGraph\": $saveable_scenario_json, \"comment\": \"\"}" \
      --silent \
      --write-out "%{http_code}" \
      -o /dev/null \
      "$DESIGNER_URL/api/processes/$SCENARIO_NAME"
  )
  if [ "$designer_save_response" != "200" ]; then
    echo "Failed to save scenario. Exiting."
    exit 1
  fi

  echo "Successfully saved scenario \"${SCENARIO_NAME}\" from file \"${SCENARIO_FILENAME}\"."
}

create_and_save_scenario "SumTransactions" "SumTransactions.json"
create_and_save_scenario "GenerateTransactions" "GenerateTransactions.json"
