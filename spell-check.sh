#!/bin/bash

docker run --rm -ti -v $(pwd):/workdir tmaier/markdown-spellcheck:latest --report "**/*.md" \
  | sed -e '0s/$/```term\n/' \
  | sed -e '$s/$/\n```/' \
  | buildkite-agent annotate

# image exits with 1 when there are errors
exit 0
