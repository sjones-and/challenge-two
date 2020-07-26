#!/bin/bash

MAXLEN=32

WORDS=$(cat input.txt | sed "s/[[:space:]]+/ /g" | sed "s/-/- /g" | tr ' ' '\n' | sed "s/\([^-]\)$/\1 /g")
LINE=""
OUTPUT=""

while IFS= read -r WORD; do
  LINELEN=${#LINE}
  WORDLEN=${#WORD}
  if [ $(($LINELEN + $WORDLEN)) -gt "$MAXLEN" ]; then
    OUTPUT="$OUTPUT"$'\n'"$LINE"
    LINE=""
  fi

  LINE="$LINE$WORD"
done <<< "$WORDS"

OUTPUT="$OUTPUT"$'\n'"$LINE"

echo "$OUTPUT"

echo "$OUTPUT" | awk '{print length}' | grep "^$MAXLEN$" | wc -l | sed -E "s/[[:space:]]//g"
