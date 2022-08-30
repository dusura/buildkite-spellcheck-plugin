#!/bin/bash

printenv

PATTERN="$BUILDKITE_PLUGIN_SPELL_CHECKER_PATTERN"
echo $PATTERN

docker run --rm -ti -v $(pwd):/workdir tmaier/markdown-spellcheck:latest --report "$PATTERN"

# image exits with 1 when there are errors
exit 0
