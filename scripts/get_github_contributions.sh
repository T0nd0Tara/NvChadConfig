#!/bin/bash
USER=$1

if [ -z $USER ]; then 
  exit 1
fi

CACHE_FILE=~/.config/nvim/cache/github-contributions-$USER.txt

# time in seconds, until the cache is stale
STALE_TIME=86400


CURTIME=$(date +%s)
LAST_CHANGE=$(stat $CACHE_FILE -c %Y >> /dev/null || echo 0)
TIME_DIFF=$(expr $CURTIME - $LAST_CHANGE)

if [ $TIME_DIFF -gt $STALE_TIME ] || [ ! -f $CACHE_FILE ]; then
  API_CONTRIBUTIONS=$(curl -s "https://github-contributions-api.jogruber.de/v4/$USER?y=$(date -d "1 year ago" +%Y)&y=$(date +%Y)" | jq '.contributions' | jq --arg start $(date -d "1 year ago" +%Y-%m-%d) --arg end $(date +%Y-%m-%d) '.[] | select((.date >= $start) and (.date <= $end))' | jq -s 'sort_by(.date) | map(.level) | . as $array | reduce range(0; length; 7) as $i ({}; . + {($i/7+1 | tostring): $array[$i:$i+7] })')

  echo $API_CONTRIBUTIONS > $CACHE_FILE
fi




cat $CACHE_FILE

