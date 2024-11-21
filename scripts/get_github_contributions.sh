#!/bin/bash
GITHUB_USER=$1

if [ -z $GITHUB_USER ]; then 
  echo "Error: a github user is required"
  exit 1
fi

CACHE_FILE=~/.config/nvim/cache/github-contributions-$GITHUB_USER.json
FIRST_CACHE="[ ! -f $CACHE_FILE ]"

fetch_data()
{
  # time in seconds, until the cache is stale
  STALE_TIME=86400

  CURTIME=$(date +%s)
  LAST_CHANGE=$(stat $CACHE_FILE -c %Y || echo 0)
  TIME_DIFF=$(expr $CURTIME - $LAST_CHANGE)

  if [ $TIME_DIFF -gt $STALE_TIME ] || $FIRST_CACHE; then
    curl -s "https://github-contributions-api.jogruber.de/v4/$GITHUB_USER?y=$(date -d "1 year ago" +%Y)&y=$(date +%Y)" \
      | jq --arg start $(date -d "1 year ago" +%Y-%m-%d) --arg end $(date +%Y-%m-%d) \
        '.contributions | [ .[] | select((.date >= $start) and (.date <= $end)) ] | sort_by(.date) | (.[0].date | strptime("%Y-%m-%d") | strftime("%w") | tonumber) as $wd | map(.level) | ([range(0, $wd) ] | map(0)) + . | . as $array | reduce range(0; length; 7) as $i ({}; . + {($i/7+1 | tostring): $array[$i:$i+7] })' \
      >| $CACHE_FILE 
  fi
}

fetch_data &

if $FIRST_CACHE; then
  wait
fi

cat $CACHE_FILE
