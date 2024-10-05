#!/bin/bash

# URL of the deployed application (staging environment)
BASE_URL="http://staging-server-url/api/calculator"

# Function to check HTTP status and output result
function check() {
    if [ "$1" == "$2" ]; then
        echo "$3: PASS"
    else
        echo "$3: FAIL"
        exit 1
    fi
}

# Test Addition
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/add?a=2&b=3")
check "$RESPONSE" "200" "Addition endpoint"

# Test Subtraction
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/subtract?a=5&b=2")
check "$RESPONSE" "200" "Subtraction endpoint"

# Test Multiplication
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/multiply?a=4&b=2")
check "$RESPONSE" "200" "Multiplication endpoint"

# Test Division
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/divide?a=10&b=2")
check "$RESPONSE" "200" "Division endpoint"

echo "All acceptance tests passed!"

