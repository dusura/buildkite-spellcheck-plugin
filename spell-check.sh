#!/bin/bash
LOCAL_VOLUME=$1

docker run --rm -ti -v $LOCAL_VOLUME:/workdir tmaier/markdown-spellcheck:latest --report "**/*.md" \
  | sed '1s/^/```term\n/' \
  | sed '$s/$/\n```/' \
  | buildkite-agent annotate

# image exits with 1 when there are errors
exit 0
