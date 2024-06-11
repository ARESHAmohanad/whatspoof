#!/bin/bash

# build exploit
go get && go build 

#paths
DATA_PATH="data"
DB_PATH="db"
HISTORY_PATH="history"

# create paths if not exist
if [ ! -d "$DATA_PATH" ]; then
  mkdir -p $DATA_PATH
fi
if [ ! -d "$DB_PATH" ]; then
  mkdir -p $DB_PATH
fi
if [ ! -d "$HISTORY_PATH" ]; then
  mkdir -p $HISTORY_PATH
fi
