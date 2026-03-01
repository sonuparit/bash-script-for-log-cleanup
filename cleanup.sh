#!/bin/bash

source config.env

echo "Running log cleanup for environment: $ENVIRONMENT"

if [ "$ENVIRONMENT" == "development" ]; then
    find $LOG_DIR -type f -name "*.log" -mtime +3 -delete
    echo "Development logs older than 3 days removed"

elif [ "$ENVIRONMENT" == "production" ]; then
    find $LOG_DIR -type f -name "*.log" -mtime +30 -delete
    echo "Production logs older than 30 days removed"

else
    echo "Unknown environment"
fi
