#!/bin/bash

# Define the file path based on the user's choice of file type
prompt_for_file_type() {
    local typeoffile
    while true; do
        echo -n "Enter your type of file (homo/hetero): "
        read typeoffile

        case $typeoffile in
            "homo")
                echo "You chose homogeneous."
                echo "../../../JSON/Ingesting/ruiping/ruiping_homo_data.txt"
                return
                ;;
            "hetero")
                echo "You chose heterogeneous."
                echo "../../../JSON/Ingesting/ruiping/ruiping_hetero_data.txt"
                return
                ;;
            *)
                echo "Invalid input. Please enter 'homo' or 'hetero'."
                ;;
        esac
    done
}

FILE=$(prompt_for_file_type)

# Create the directory structure if it doesn't exist
mkdir -p "query_results/${typeoffile}geneous_results"

# Function to perform search queries
perform_search_queries() {
    echo "Search query 1"
    jq -c 'select(.ts=="2018-03-24T17:15:21.196410Z")' "$FILE" > "query_results/${typeoffile}geneous_results/search1.ndjson"

    echo "Search query 2"
    jq -c 'select(._path=="http")' "$FILE" > "query_results/${typeoffile}geneous_results/search2.ndjson"

    echo "Search query 3"
    jq -c 'select(.[] | tostring | contains("10.47.5.155"))' "$FILE" > "query_results/${typeoffile}geneous_results/search3.ndjson"
}

# Function to perform analytical queries
perform_analytical_queries() {
    echo "Analytical query 1"
    jq -c '._path' "$FILE" | sort -u > "query_results/${typeoffile}geneous_results/analytical1.txt"

    echo "Analytical query 2"
    jq -c 'select(.["_path"] != null) | .["_path"]' "$FILE" | sort | uniq -c > "query_results/${typeoffile}geneous_results/analytical2.txt"

    echo "Analytical query 3"
    jq -c -s 'map(select(.response_body_len != null).response_body_len) | add/length' "$FILE" > "query_results/${typeoffile}geneous_results/analytical3.txt"
}

# Execute search and analytical queries
perform_search_queries
perform_analytical_queries