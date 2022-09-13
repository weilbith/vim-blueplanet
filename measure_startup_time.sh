#!/usr/bin/bash
#
# Starts Neovim a number of times and measure its startup time until the first
# buffer has been loaded. It persists the measured times and finally calculates
# the average time to get a more accurate value.
#
# Takes no parameter.

MEASUREMENT_COUNT=100
LOG_FILE="./log"
SESSION_FILE="./test.vim"
TIMES_FILE="./times"

function finish() {
  rm --force $LOG_FILE $SESSION_FILE $TIMES_FILE
}

function measure_startup_time() {
  echo "autocmd VimEnter * qall" > $SESSION_FILE
  nvim --startuptime $LOG_FILE -S $SESSION_FILE
  tail --lines=1 $LOG_FILE | awk NF=1 >> $TIMES_FILE
  rm $LOG_FILE $SESSION_FILE
}

function calculate_average_time() {
  total_time=$(paste -sd+ $TIMES_FILE | bc | awk -F. '{print $1}')
  average_time=$((total_time / MEASUREMENT_COUNT))
  echo "${average_time}ms"
}

trap finish EXIT

for i in $(seq 1 $MEASUREMENT_COUNT); do
 measure_startup_time
done

calculate_average_time
