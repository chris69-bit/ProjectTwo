#!/bin/bash

# URL of the deployed application (production environment)
BASE_URL="http://production-server-url/api/calculator"

# Function to check HTTP status and output result
function check() {
    if [ "$1" == "$2" ]; then
        echo "$3: PASS"
    else
        echo "$3: FAIL"
        exit 1
    fi
}

# Test that the app is reachable
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL")
check "$RESPONSE" "200" "Application is reachable"

# Test Addition
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/add?a=1&b=1")
check "$RESPONSE" "200" "Addition endpoint"

echo "Smoke test passed!"

